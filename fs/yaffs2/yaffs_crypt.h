/*
*这个头文件里面包括了aes加解密函数和
*
*yaffs层目录判断函数
*/
#ifndef __YAFFS_CRYPT_H__
#define __YAFFS_CRYPT_H__

#include "yaffs_guts.h"

int aes_encrypt(const u8 *buffer , u8 *encrypt_buf , int nbytes ,struct yaffs_dev *dev);
int aes_decrypt(const u8 *buffer , u8 *decrypt_buf , int nbytes ,struct yaffs_dev *dev);
int yaffs_is_crypt_dir(struct yaffs_obj *in);
int yaffs_is_need_crypt(struct yaffs_obj *in );
#endif
