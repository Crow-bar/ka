/*
kamod.c - kernel access module
Copyright (C) 2022 Sergey Galushko

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
*/

#include <pspsdk.h>
#include <pspkernel.h>
#include <pspsysevent.h>

PSP_MODULE_INFO("kernelAccess", 0x1006, 1, 0);

int sceGeEdramSetSize(int);
int sceGeEdramGetHwSize(void);

int kaGeEdramSetSize(int size)
{
	int res = 0;
	int k1 = pspSdkSetK1(0);
	res = sceGeEdramSetSize(size);
	pspSdkSetK1(k1);
	return res;
}

int kaGeEdramGetHwSize(void)
{
	int res = 0;
	int k1 = pspSdkSetK1(0);
	res = sceGeEdramGetHwSize();
	pspSdkSetK1(k1);
	return res;
}

int module_start(SceSize args, void *argp)
{
	return 0;
}

int module_stop(SceSize args, void *argp)
{
	return 0;
}
