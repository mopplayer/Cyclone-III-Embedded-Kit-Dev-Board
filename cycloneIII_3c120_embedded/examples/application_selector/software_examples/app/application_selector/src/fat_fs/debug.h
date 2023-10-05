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

#ifndef DEBUG_H
#define DEBUG_H

#define RE_ALIGN_LOW_LEVEL
#undef RE_ALIGN_HIGHER_LEVEL

#define DEBUG 0


#if DEBUG
#define DEBUGF(x,...) printf(x,##__VA_ARGS__)
#define LDEBUGF(x,...) printf(x,##__VA_ARGS__)
#else
#define DEBUGF(x,...)
#define LDEBUGF(x,...)
#endif

#define panicf printf

#endif
