/***************************************************************************
 *             __________               __   ___.
 *   Open      \______   \ ____   ____ |  | _\_ |__   _______  ___
 *   Source     |       _//  _ \_/ ___\|  |/ /| __ \ /  _ \  \/  /
 *   Jukebox    |    |   (  <_> )  \___|    < | \_\ (  <_> > <  <
 *   Firmware   |____|_  /\____/ \___  >__|_ \|___  /\____/__/\_ \
 *                     \/            \/     \/    \/            \/
 *
 * Copyright (C) 2002 by Linus Nielsen Feltzing
 *
 * All files in this archive are subject to the GNU General Public License.
 * See the file COPYING in the source tree root for full license agreement.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 ****************************************************************************/

#ifndef CF_FILE_H
#define CF_FILE_H


#include <stdio.h>
#include <stdbool.h>
#include <fcntl.h>
#include "fat.h"

#define READ false
#define WRITE true

#define MAX_PATH 260

#define O_RDONLY 0
#define O_WRONLY 1
#define O_RDWR   2
#define O_CREAT  4
#define O_APPEND 8
#define O_TRUNC  0x10


struct dirent {
    unsigned char d_name[MAX_PATH];
    int attribute;
    long size;
    long startcluster;
    unsigned short wrtdate; /*  Last write date */
    unsigned short wrttime; /*  Last write time */
};


typedef struct {
#ifndef SIMULATOR
    bool busy;
    long startcluster;
    struct fat_dir fatdir;
    struct fat_dir parent_dir;
    struct dirent theent;
#ifdef HAVE_MULTIVOLUME
    int volumecounter; /* running counter for faked volume entries */
#endif
#else
    /* simulator: */
    void *dir; /* actually a DIR* dir */
    char *name;
#endif
} DIR;

struct partinfo {
    unsigned long start; /* first sector (LBA) */
    unsigned long size;  /* number of sectors */
    unsigned char type;
};

struct dirent* readdir(DIR* dir);
struct partinfo* disk_init(IF_MV_NONVOID(int drive));
//static
int ide_open(const char* pathname, int flags);
int ide_close(int fd);
int disk_mount_all(void);
int ide_fstat( int fd, struct stat *st );
int ide_fsync(int fd);
off_t ide_lseek(int fd, off_t offset, int whence);
int ide_ftruncate(int fd, off_t size);
int ide_init( void );
int ide_list( char* pathname, char* buf );
ssize_t ide_read(int fd, void* buf, size_t count);
ssize_t ide_write(int fd, const void* buf, size_t count);
int ide_creat(const char *pathname, mode_t mode);
int ide_mkdir(const char *name, int mode);
int ide_rmdir(const char* name);
int ide_remove(const char* name);
int ide_rename(const char* path, const char* newpath);
DIR* ide_opendir(const char* name);
int ide_closedir(DIR* dir);
off_t ide_filesize(int fd);





#endif

