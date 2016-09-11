  /*
  * include/linux/linux _crypt.h
  *���ļ������ں˲�Ŀ¼�жϡ���ȡ
  *Ŀ¼�������ļ��Լ�SD  ��ʶ����
  */
#ifndef _LINUX_YAFFS_CRYPT
#define _LINUX_YAFFS_CRYPT

#include <linux/fs.h>

#define MAX_CONFIG_LENTH 64
#define YAFFS_MAX_NAME_LENGTH 255

struct dir_storage{
	char dir_name[YAFFS_MAX_NAME_LENGTH + 1];
	int dir_length;
	struct list_head list;
};
int is_crypt_dir(struct file *f);
void dir_list_storage(char config_buf[MAX_CONFIG_LENTH + 1]);
int read_config_file_from_sd (void);
int is_need_crypt(struct file *f);
int read_aes_key_from_sd (char *key);
int is_accepted_sd(u32 *cid);
#endif
