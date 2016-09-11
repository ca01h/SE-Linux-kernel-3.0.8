/*
 *   这个文件里面包含文件系统里面新增的所有模块
 */

#include <linux/crypto.h>
#include <linux/scatterlist.h>
#include <linux/slab.h>
#include <linux/highmem.h>
#include <linux/fs.h>
#include <asm/uaccess.h>
#include <asm-generic/bug.h>
#include <linux/list.h>
#include <linux/namei.h>
#include <linux/linux_crypt.h>
#include <linux/kprobes.h>
#include <asm/traps.h>
#include <linux/syscalls.h>
#include "yaffs_crypt.h"

/*链表用来存储配置文件中的内容*/
extern struct dir_storage dir_list_head;
struct dir_storage dir_list_head = {
	.list = LIST_HEAD_INIT(dir_list_head.list),
}; 

#if 0
int write_config_file_to_nand_flash(char config_buf[MAX_CONFIG_LENTH + 1])
{
	struct file *fp;
	mm_segment_t fs;
	loff_t pos = 0;
	int size;

	printk("*******write config file to nand flash begin********\n");
	fp = filp_open("/config_file.txt", O_RDWR | O_CREAT, 0711);
	printk("*******open file end********\n");
	if (IS_ERR(fp)) {
		printk("*******create file error********\n");
		return -1;
	}

	fs = get_fs();
	set_fs(get_ds());

	size = vfs_write(fp, config_buf, sizeof(config_buf), &pos);
	if(size < 0){
		printk("*******write file error********\n");
		return -1;	
	}
	
	filp_close(fp, NULL);

	set_fs(fs);

	return 0;
}

int read_config_file_from_nand_flash(char config_buf[MAX_CONFIG_LENTH + 1])
{
	long fd;
	mm_segment_t fs;
	int data_size = 36;
	int size;

	fs = get_fs();
	set_fs(get_ds());

	printk("*******read config file from nand flash begin********\n");
	fd = sys_open("/config_file.txt", O_RDWR | O_CREAT, 0711);
	printk("*******open file end********\n");
	if (fd < 0) {
		printk("*******create file error fd = %ld********\n", fd);
		return -1;
	}

	size = sys_read(fd, config_buf,data_size);
	if(size <= 0){
		printk("*******read config file error********\n");
		return -1;	
	}
	
	sys_close(fd);

	set_fs(fs);

	return 0;
}
#endif 

void dir_list_storage(char config_buf[MAX_CONFIG_LENTH + 1])
{
	int i = 0;	
	int j = 0;
	char  name_buf[YAFFS_MAX_NAME_LENGTH + 1];
	struct dir_storage *new_dir_name;

	while(config_buf[i] != '\n')
	{
		while(config_buf[i] != '\t'  &&  config_buf[i] != '\n')
		{
			name_buf[j]  =  config_buf[i];
			i++;	j++;
		}

		new_dir_name = kmalloc(sizeof(*new_dir_name), GFP_KERNEL);
		if (!new_dir_name)
			panic("can't allocate new_dir_name buffer");
		memcpy(new_dir_name->dir_name, name_buf, YAFFS_MAX_NAME_LENGTH + 1);
		new_dir_name->dir_length = j;
		list_add(&new_dir_name->list, &dir_list_head.list);
		j = 0;
		i++;
	}
}

int read_config_file_directly(void)
{
	long config_data_offset = 1024;
	int data_size = 33;
	const char *dev = "/dev/block/mmcblk0p1";//pathname of SD in /dev
	long fd;
	int size;
	char config_buf[MAX_CONFIG_LENTH + 1] = {'1','2','3','4'};//storge the config file info
	mm_segment_t fs;
	
	/* open it */
	fs = get_fs();
	set_fs(get_ds());
	
	fd = sys_open(dev, O_RDONLY, 0);
	if(fd < 0)
	{
		printk("#######(config)open %s failed, fd = %ld\n", dev, fd);
		return -1;
	}
	
	/* seek it */
	sys_lseek(fd, 0, 0);
	if(sys_lseek(fd, -config_data_offset, 2) > 0)
	{	
		printk ("#######seek to -%ld failed\n", config_data_offset);
		return -1;
	}
	
	/* read it */
	size = sys_read(fd, config_buf, data_size);
	if(size <= 0)
	{
		printk("#########read data failed\n");
		return -1;
	}	

	sys_close(fd);

	printk("********read the config : %s\n", config_buf);
	
	set_fs(fs);

	//write_config_file_to_nand_flash(config_buf);	
	dir_list_storage(config_buf);
	return 0;
}

/*
 *get the AES key value from disk which stored in the sdcard.
 */
int read_aes_key_directly(char *key)
{
	long key_data_offset = 511;
	int data_size = 16;
	const char *dev = "/dev/block/mmcblk0p1";//pathname of SD in /dev
	long fd;
	int size;
	mm_segment_t fs;
	char key_buf[17]={'1','2','3','4'};

	/* open it*/
	fs = get_fs();
	set_fs(get_ds());
	
	fd = sys_open(dev, O_RDONLY, 0);
	if(fd < 0)
	{
		printk("#######(aes_key)open %s failed, fd = %ld\n", dev, fd);
		return -1;
	}	

	/* seek it */
	sys_lseek(fd, 0, 0);
	if(sys_lseek(fd, -key_data_offset, 2) > 0)
	{	
		printk ("#######seek to -%ld failed\n", key_data_offset);
		return -1;
	}	
	
	/* read it */
	size = sys_read(fd, key_buf, data_size);
	if(size <= 0)
	{
		printk("#########read data failed\n");
		return -1;
	}	

	sys_close(fd);

	memcpy(key, key_buf, 16);	
	
	set_fs(fs);
	return 0;
}


/*
 * AES function used to encrypt/decrypt data buffer...
 */

int aes_encrypt(const u8 *buffer , u8 *encrypt_buf , int nbytes ,struct yaffs_dev *dev)
{
	struct crypto_blkcipher *tfm;
	static struct blkcipher_desc desc;
	unsigned int ret = 0;
	struct scatterlist sg_input;//散集序列，存储明文
	struct scatterlist sg_encrypt;//散集序列，加密输出

	char *key = "0123456789abcdef";//AES-key 16 bytes
	//char key[17]={0};
	//read_aes_key_directly(key);
	char *iv = "1234567887654321";//设置iv值


	char * encryptcode = NULL;//using it just to test kernel
	int i = 0;

	//u8 tmp_buf[nbytes]={0};
	u8 *tmp_buffer = yaffs_get_temp_buffer(dev);
	//memset(tmp_buffer,0,nbytes);

	tfm = crypto_alloc_blkcipher("cbc(aes)", 0, CRYPTO_ALG_ASYNC);	
	desc.tfm = tfm;
	desc.flags = 0;

	crypto_blkcipher_setkey(tfm,key,16);//设置key
	crypto_blkcipher_set_iv(tfm,iv,16);//设置iv

    	sg_init_one(&sg_input,buffer,nbytes);
	sg_init_one(&sg_encrypt,tmp_buffer,nbytes);

	//加密
	ret = crypto_blkcipher_encrypt(&desc,&sg_encrypt,&sg_input,sg_input.length);
	if (!ret) {
		printk("########AES encrypt successful\n");
		encryptcode = kmap(sg_page(&sg_encrypt))+sg_encrypt.offset;
        printk("the encrypt code is:\n");
        for(i = 0;i<10;i++){
              printk("%d_",encryptcode[i]);
        }
		printk("\n########AES encrypt finish\n");
		printk("----------------\n");
		memcpy(encrypt_buf,encryptcode,nbytes);
		yaffs_release_temp_buffer(dev, tmp_buffer);
		crypto_free_blkcipher(tfm); 	

		return 0;
	}
	else
	{
		printk("encrypt process is failed\n");
		crypto_free_blkcipher(tfm);
		yaffs_release_temp_buffer(dev, tmp_buffer);
		return -1;
	}
}



int aes_decrypt(const u8 *buffer , u8 *decrypt_buf , int nbytes ,struct yaffs_dev *dev)
{
	struct crypto_blkcipher *tfm;
	static struct blkcipher_desc desc;
	unsigned int ret = 0;
	struct scatterlist sg_encrypt;//散集序列，存储加密后的明文
	struct scatterlist sg_decrypt;//散集序列，加密输出
	
	char *key = "0123456789abcdef";//AES-key 16 bytes
	//char key[17]={0};
	char *iv = "1234567887654321";//设置iv值


	char * decryptcode = NULL;//using it just to test kernel
	int i=0;

	u8 *tmp_buffer = yaffs_get_temp_buffer(dev);

	tfm = crypto_alloc_blkcipher("cbc(aes)", 0, CRYPTO_ALG_ASYNC);	
	desc.tfm = tfm;
	desc.flags = 0;

	/*ret = read_aes_key_directly(key);
	if(ret == -1)
	{
		printk("########read aes_key failed");
		return -1;
	}*/

	crypto_blkcipher_setkey(tfm,key,16);//设置key
	crypto_blkcipher_set_iv(tfm,iv,16);//设置iv

    	sg_init_one(&sg_decrypt,tmp_buffer,nbytes);
	sg_init_one(&sg_encrypt,buffer,nbytes);

	//解密
	ret = crypto_blkcipher_decrypt(&desc,&sg_decrypt,&sg_encrypt,sg_encrypt.length);
	if (!ret) {
		printk("########AES decrypt successful\n");
		decryptcode = kmap(sg_page(&sg_decrypt))+sg_decrypt.offset;
        printk("the decrypt code is:\n");
        for(i = 0;i<10;i++){
                printk("%d_",decryptcode[i]);
        }
		printk("\n########AES decrypt finish\n");
		printk("----------------\n");
		memcpy(decrypt_buf,decryptcode,nbytes);
		yaffs_release_temp_buffer(dev, tmp_buffer);
		crypto_free_blkcipher(tfm);
		return 0;
	}
	else
	{
		printk("decrypt process is failed\n");
		yaffs_release_temp_buffer(dev, tmp_buffer);
		crypto_free_blkcipher(tfm); 
		return -1;
	}
}



int is_accepted_sd(u32 *cid)
{
	u32 accepted_cid[4] = {   55788627,
							1429223495,
							2147685674,
							3355491328 };
	/*
	 * use as our key sdcard cid:3534453 55303847 8003152A C800BC00(08X%).
	 */
	 if (memcmp(cid, accepted_cid, sizeof(cid)) != 0)
		 return -1;
	 else
		 return 0;

}


//##############yaffs##################################

int yaffs_is_need_crypt(struct yaffs_obj *in )
{
	int ret;
	
	if(list_empty(&dir_list_head.list)){
		//printk("##########config_file_list is empty\n");
		ret = read_config_file_directly();
		if(ret == 0){
			ret = yaffs_is_crypt_dir(in);
			return ret;
		}else{
			/*char config_buf[MAX_CONFIG_LENTH + 1];
			ret = read_config_file_from_nand_flash(config_buf);
			if(ret == -1)
				return ret;
			dir_list_storage(config_buf);
			ret = yaffs_is_crypt_dir(in);*/
			return -1;
		}
	}
	else{	
		//printk("##########config_file_list is not empty\n");
		ret = yaffs_is_crypt_dir(in);
		return ret;
	}
	
}

int yaffs_is_crypt_dir(struct yaffs_obj *in)
{
	int ret = -1;

	char present_name[YAFFS_MAX_NAME_LENGTH + 1];
	struct yaffs_obj *present_file = NULL;
	struct dir_storage *pos;

	present_file = in;
	
	do{
		yaffs_get_obj_name(present_file, present_name, YAFFS_MAX_NAME_LENGTH + 1);
		list_for_each_entry(pos,&dir_list_head.list,list){
			ret = strncmp(present_name, pos->dir_name, pos->dir_length);
			if(ret == 0)
				return ret;
		}
		if(present_file->parent)
			present_file = present_file->parent;
	}while(present_name[0] != 'o' && present_name[1] != 'b' && present_name[2] != 'j' && present_name[3] != '1');
	return -1;
}
