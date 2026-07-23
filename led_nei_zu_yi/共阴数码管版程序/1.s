	@@ 单片机PY32F002AF15P6TU
	@电池內阻测试仪
	@时间：2025-01-06
	@编译器：ARM-NONE-EABI
	@共阴数码管版程序
	@按键2功能已修改为显示电池电压
	.thumb
	.syntax unified
	.section .text
vectors:	
	.word STACKINIT
	.word _start + 1
        .int 0x12345678	@f_chuchang_r,                
	.int 0x12345678	@f_chuchang_i,               
	.int 0x12345678	@f_jiaodu_r,                 
	.int 0x12345678	@f_jiaodu_i,                 
	.int 0x12345678	@f_r,                        
	.int 0x12345678	@f_mr,                     
	.word 0
	.word 0
	.word 0
	.word _svc_handler +1
	.word 0
	.word 0
	.word _pendsv_handler +1
	.word _systickzhongduan +1           @ 15
	.word aaa +1     @ _wwdg +1          @ 0
	.word aaa +1     @_pvd +1            @ 1
	.word aaa +1     @_rtc +1            @ 2
	.word aaa +1     @_flash +1          @ 3
	.word aaa +1    @ _rcc + 1           @ 4
	.word aaa +1      @_exti0_1  +1      @ 5
	.word aaa +1      @ _exti2_3 +1      @ 6
	.word aaa +1       @_exti4_15 +1     @ 7
	.word aaa +1                         @ 8
	.word aaa +1    @__dma_wan  +1       @ 9
	.word aaa +1    @_dma1_2_3 +1        @ 10
	.word aaa +1       @_dma1_4_5 +1     @ 11
	.word aaa +1     @_adc1 +1           @ 12
	.word aaa +1       @_tim1_brk_up +1  @ 13
	.word aaa +1        @ _tim1_cc +1    @ 14
	.word aaa +1         @_tim2 +1       @ 15
	.word aaa +1          @_tim3 +1      @ 16
	.word aaa +1     @LPTIM1               @ 17
	.word aaa +1                         @ 18
	.word aaa +1    @_tim14 +1           @ 19
	.word aaa +1                         @ 20
	.word aaa +1         @_tim16 +1      @ 21
	.word aaa +1         @_tim17 +1      @ 22
	.word aaa +1          @_i2c   +1     @ 23
	.word aaa +1                         @ 24
	.word aaa +1           @_spi1  +1    @ 25
	.word aaa +1           @_spi2  +1    @ 26
	.word aaa +1         @_usart1 +1     @ 27
	.word aaa +1	@_usart2 +1	     @ 28
	.word aaa +1				@29
	.word aaa +1	@led			@30
	.word aaa +1				@31
	.word 0
	.word 0
	.word 0
	.word 0
        .word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
xiang_liang_biao:
	.word STACKINIT
	.word _start + 1
	.word _nmi_handler + 1
	.word _hard_fault  + 1
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word _svc_handler +1
	.word 0
	.word 0
	.word _pendsv_handler +1
	.word _systickzhongduan +1           @ 15
	.word aaa +1     @ _wwdg +1          @ 0
	.word aaa +1     @_pvd +1            @ 1
	.word aaa +1     @_rtc +1            @ 2
	.word aaa +1     @_flash +1          @ 3
	.word aaa +1    @ _rcc + 1           @ 4
	.word aaa +1      @_exti0_1  +1      @ 5
	.word aaa +1      @ _exti2_3 +1      @ 6
	.word aaa +1       @_exti4_15 +1     @ 7
	.word aaa +1                         @ 8
	.word aaa +1    @__dma_wan  +1       @ 9
	.word aaa +1    @_dma1_2_3 +1        @ 10
	.word aaa +1       @_dma1_4_5 +1     @ 11
	.word aaa +1     @_adc1 +1           @ 12
	.word aaa +1       @_tim1_brk_up +1  @ 13
	.word aaa +1        @ _tim1_cc +1    @ 14
	.word aaa +1         @_tim2 +1       @ 15
	.word aaa +1          @_tim3 +1      @ 16
	.word aaa +1     @LPTIM1               @ 17
	.word aaa +1                         @ 18
	.word aaa +1    @_tim14 +1           @ 19
	.word aaa +1                         @ 20
	.word aaa +1         @_tim16 +1      @ 21
	.word aaa +1         @_tim17 +1      @ 22
	.word aaa +1          @_i2c   +1     @ 23
	.word aaa +1                         @ 24
	.word aaa +1           @_spi1  +1    @ 25
	.word aaa +1           @_spi2  +1    @ 26
	.word aaa +1         @_usart1 +1     @ 27
	.word aaa +1    @_usart2 +1          @ 28
	.word aaa +1                            @29
	.word aaa +1    @led                    @30
	.word aaa +1                            @31
	

_start:
@	bkpt # 0
	ldr r0, = 0xe000ed08
	ldr r1, = xiang_liang_biao
	str r1, [r0]	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	
shizhong:
	ldr r2, = 0x40022000   @FLASH访问控制
	movs r1, # 1
	str r1, [r2]          @0:flash没等待，1:flash等待
	ldr r0, = 0x40021000 @ rcc
	ldr r1, = 0x20008
	str r1, [r0, # 0x10]	@外部晶振选择
	ldr r1, [r0]
	ldr r2, = 0x10000
	orrs r1, r1, r2
	str r1, [r0]		@开外部振荡器
denghse:
	ldr r1, [r0]
	lsls r1, r1, # 14
	bpl denghse		@等外部振荡器
	
	ldr r1, = 0x01
	str r1, [r0, # 0x0c]	@PLL配置
	ldr r2, [r0]
	ldr r1, = 0x1000000
	orrs r1, r1, r2
	str r1, [r0]		@开PLL

dengpll:
	ldr r1, [r0]
	lsls r1, # 6
	bpl dengpll		@等PLL
	movs r1, # 0x02
	str r1, [r0, # 0x08]	@选择系统时钟
	
_neicunqingling:
	ldr r0, = 0x20001000
	ldr r2, = 0x20000000
	movs r1, # 0
_neicunqinglingxunhuan:
	subs r0, r0, # 4
	str r1, [r0]
	cmp r0, r2
	bne _neicunqinglingxunhuan
	
__wai_she_shi_zhong:
	@0x34
	@0=PA、1=PB、5=PF
	ldr r0, = 0x40021000
	movs r1, # 0x23
	str r1, [r0, # 0x34]	@IO时钟
	
	@0X38 复位值0x300
	@0=DMA，8=FLASH，12=CRC
	ldr r1, = 0x301
	str r1, [r0, # 0x38]

	@0X3C
	@1=TIM3,10=RTC，11=WWDG，14=SPI2,17=USART2,21=I2C，28=PWR，31=LPTIM
	movs r1, # 0x02
	str r1, [r0, # 0x3c]
	@0X40
	@0SYSCFG，11=TIM1,12=SPI1,14=USART1,15=TIM14,17=TIM16,18=TIM17,20=ADC
	@21=COMP1,22=COMP2,23=LED
	ldr r1, = 0x101801
	str r1, [r0, # 0x40]   
	str r1, [r0, # 0x30]
	movs r1, # 0
	str r1, [r0, # 0x30]
		
__io_she_zhi:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	@pa=0x50000000,pb=0x50000400,pf=0x50001400
	@0xebffffff	0xffffffff	0xfffffcff
	@00=输入，01=通用输出，10=复用，11=模拟
	@0x04, 0=推挽，1=开漏
	@0x08, 00=非常低，01=低速，10=高速，11=非常高
	@PA=0X0C000000
	@0x0c, 00=无上拉下拉，01=上拉，10=下拉
	@PA=0X24000000,PB=0，PF=0X200
	@0x10=输入数据寄存器
	@0x14=输出数据寄存器
	@0X18，0-15 IO开，16-31 IO关
	@0X28, 0-15 IO关
	@0x20=复用功能低
	@0x24=复用功能高
	@0=AF0, 1=AF1，2=AF2，3=AF3，4=AF4, 5=AF5, 6=AF6, 7=AF7
	@8=AF8, 9=AF9, A=AF10,B=AF11,C=AF12,D=AF13,E=AF14,F=AF15
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	ldr r0, = 0x50000000
	ldr r1, = 0x2800890f
	str r1, [r0]
	movs r1, # 0x0c
	str r1, [r0, # 0x04]
	ldr r1, = 0x0c000050
	str r1, [r0, # 0x0c]
	ldr r1, = 0x0c000000
	str r1, [r0, # 0x08]
	ldr r0, = 0x50000400
	ldr r1, = 0xffffffbd
	str r1, [r0]
	movs r1, # 0xc0
	str r1, [r0, # 0x08]
	ldr r1, = 0x1000
	str r1, [r0, # 0x20]


@	movs r1, # 0x01
@	str r1, [r0, # 0x018]
	

spi_chushihua:
	ldr r0, = 0x40013000
	ldr r1, = 0xf00
	str r1, [r0, # 0x04]
	ldr r1, = 0xc07c
	str r1, [r0]

__adc_dma:
	ldr r0, = 0x40020000
	ldr r1, = 0x40012440    @外设地址
	str r1, [r0, # 0x10]
	ldr r1, = 0x20000160    @储存器地址
	str r1, [r0, # 0x14]
	ldr r1, = 1000          @传输数量
	str r1, [r0, # 0x0c]
	ldr r1, = 0x35a1 @  0x583        @ 5a1  @传输模式
	str r1, [r0, # 0x08]

_adcchushihua:
	ldr r0, = 0x40012400  @ adc基地址
	ldr r1, = 0x80000000
	str r1, [r0, # 0x08]  @ ADC 控制寄存器 (ADC_CR)  @adc校准
_dengadcjiaozhun:
	ldr r1, [r0, # 0x08]
	movs r1, r1
	bmi _dengadcjiaozhun   @ 等ADC校准
_tongdaoxuanze:
	ldr r1, = 0x20000000
	str r1, [r0, # 0x10]    @时钟分频
	movs r1, # 0x03
	str r1, [r0, # 0x28]    @ 通道选择寄存器 (ADC_CHSELR)
	ldr r1, = 0x8c3         @0x3003         @连续0x2003 @触发0x8c3 @ 0xc43         @TIM3 0x8c3 @0x2003 @0x8c3
	str r1, [r0, # 0x0c]    @ 配置寄存器 1 (ADC_CFGR1)
	movs r1, # 0
	str r1, [r0, # 0x14]    @ ADC 采样时间寄存器 (ADC_SMPR)
	ldr r1, = 0x05         @ 开始转换
	str r1, [r0, # 0x08]    @ 控制寄存器 (ADC_CR)
	str r1, [r0, # 0x08]
	
	@__tim1_dma:
	@       ldr r0, = 0x40010000
	@       ldr r1, = 0x1000
	@       str r1, [r0, # 0x1c]
	@
	@       ldr r0, = 0x40020000
	@       ldr r1, = 0x40012c38    @外设地址
	@       str r1, [r0, # 0x24]
	@       ldr r1, =  zheng_xian_1khz @ 储存器地址
	@       str r1, [r0, # 0x28]
	@       ldr r1, = 200           @传输数量
	@       str r1, [r0, # 0x20]
	@       ldr r1, = 0x31b1        @传输模式
	@       str r1, [r0, # 0x1c]
	@
	@tim3chushihua:
	ldr r3, = 0x40000400 @ tim3_cr1
	ldr r2, = 0
	str r2, [r3, # 0x28] @ psc
	ldr r2, = 959
	str r2, [r3, # 0x2c] @ ARR
	movs r2, # 0x20
	str r2, [r3, # 0x04] @ TRGO

	@tim1chushiha:
	ldr r0, = 0x40012c00 @ tim1_cr1
	movs r1, # 0
	str r1, [r0, # 0x28] @ psc
	ldr r1, = 47999
	str r1, [r0, # 0x2c] @ ARR
	@       movs r1, # 0x20
	@       str r1, [r0, # 0x04] @ TRGO
	ldr r1, = 0x6800
	str r1, [r0, # 0x18] @ ccmr1  CC2
	ldr r1, = 0x10    @  CC2
	str r1, [r0, # 0x20] @ ccer
	ldr r1, = 0x8000
	str r1, [r0, # 0x44] @ BDTR
	@       ldr r1, = 0x100 @ CC2 DMA
	@       str r1, [r0, # 0x0c] @ DIER
	ldr r1, = 24000
	str r1, [r0, # 0x38]
	ldr r1, = 0x81
	str r1, [r0]
	str r1, [r3]
	ldr r4, = 0xe000e010
	ldr r3, = 479999
	str r3, [r4, # 4]
	str r3, [r4, # 8]
	movs r3, # 0x07
	str r3, [r4]    @systick 开

	ldr r0, = lvbo_changdu
	ldr r1, = lvbo_youyi
	movs r2, # 200
	str r2, [r0]
	movs r2, # 14
	str r2, [r1]

	ldr r0, = cossin
	ldr r1, = cos_sin_biao_1k
	str r1, [r0]


__huifu_chuchang:	
	ldr r0, = 0x08
	ldr r1, [r0]
	ldr r2, = 0x12345678
	cmp r2, r1
	bne __tiaoguo_chuchang_chushihua
__hui_fu_chu_chang:
	ldr r0, = chuchang_dianzu
	ldr r1, [r0]
	ldr r2, [r0, # 0x04]
	ldr r3, [r0, # 0x08]
	ldr r4, [r0, # 0x0c]
	ldr r5, [r0, # 0x10]
	ldr r6, [r0, # 0x14]
	ldr r7, [r0, # 0x18]
	ldr r0, = chuchang_r
	str r1, [r0]
	str r2, [r0, # 0x04]
	str r3, [r0, # 0x08]
	str r4, [r0, # 0x0c]
	str r5, [r0, # 0x10]
	str r6, [r0, # 0x14]
	str r7, [r0, # 0x18]
	bl __xie_flash
__tiaoguo_chuchang_chushihua:
	
__anjian0:
	b ting
	.ltorg
__anjian1:
__dangwei_jia_deng_songshou:
	bl __an_jian
	cmp r0, # 3
	beq __anjian3
	cmp r0, # 0
	beq __dangwei_jia_le
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
        ldr r1, = f_r
	ldr r2, = f_chuchang_r
	bl __xianshi_neizu
	b __dangwei_jia_deng_songshou
__dangwei_jia_le:
	ldr r0, = liangcheng
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	bne __anjian1_fanhui
	movs r1, # 0
	str r1, [r0]

__anjian1_fanhui:
	b __ren_wu_diao_du
	.ltorg
	
__anjian2:
__xianshi_dianyuan:
	@按键2功能：显示PA6采集的电池电压
	@分压：10k/240k，参考电压3.3V
	@计算公式：V = ADC_VALUE * 3.3 * 250 / (4095 * 240) = ADC_VALUE * 3.357 / 1000
	@显示格式：X.XX V (保留2位小数)
	
	@读取ADC值（DMA传输到0x20000160）
	ldr r0, = 0x20000160    @DMA存储地址
	ldr r1, [r0]            @读取ADC值
	
	@计算电压值: r1 * 3357 / 1000000 (单位V)
	@实际显示: (r1 * 3357 / 1000000) * 100 = r1 * 3357 / 10000 (单位0.01V)
	ldr r2, = 3357
	muls r1, r1, r2         @r1 = ADC_VALUE * 3357
	ldr r2, = 10000
	udiv r1, r1, r2         @r1 = (ADC_VALUE * 3357) / 10000，单位0.01V
	
	@限制范围：最大值对应3.3V约11056 * 0.01V = 110.56
	ldr r2, = 4095          @12位ADC最大值
	ldr r3, = 3357
	muls r2, r2, r3
	ldr r3, = 10000
	udiv r2, r2, r3         @r2 = 最大电压值(0.01V单位) = 1368
	cmp r1, r2
	ble __dianyuan_shifan_ok
	mov r1, r2              @限制最大值
__dianyuan_shifan_ok:
	
	@存储显示值
	ldr r2, = dianyuan_xianshi
	str r1, [r2]
	
	@调用数码管显示函数，显示4位数字(百位、十位、小数点、个位)
	movs r1, # 3            @显示3位数字 + 小数点
	bl _zhuanshumaguanma
	bl _xieshumaguan
	b __ren_wu_diao_du
	
__anjian3:
	bl __xianshi_jiaozhun_caidan
        bl __an_jian
	cmp r0, # 3
	beq __anjian3
	cmp r0, # 0
	bne __anjian3
__anjian3_xunhuan:
	ldr r0, = jiaozhun_deng
	movs r1, # 0x20
	str r1, [r0]
        bl __xianshi_jiaozhun_caidan
	bl __an_jian
	cmp r0, # 1
	beq __jiaozhun_caidan_jia_deng_songshou
	cmp r0, # 2
	beq __jinru_jiaozhun_caidan_deng_songshou
	b __anjian3_xunhuan	
__jiaozhun_caidan_jia_deng_songshou:
	bl __an_jian
	cmp r0, # 3
	beq __tiaochu_anjian3
	cmp r0, # 0
	beq __jiaozhun_caidan_jia_le
	bl __xianshi_jiaozhun_caidan
	b __jiaozhun_caidan_jia_deng_songshou
__jiaozhun_caidan_jia_le:
	ldr r0, = jiaozhun_bianhao
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 4
	bne __anjian3_fanhui
	movs r1, # 0
	str r1, [r0]
__anjian3_fanhui:	
	b __anjian3_xunhuan
__tiaochu_anjian3:
        ldr r7, = 0x2fff
__yy1:
	ldr r0, = wan
	ldr r1, = shumaguanma
	ldr r0, [r0]
	str r0, [r1]
	bl _xieshumaguan

	subs r7, r7, # 1
	bne __yy1
	b ting
__xianshi_jiaozhun_caidan:
	push {r0-r2,lr}
	ldr r0, = shumaguanma
	ldr r2, = jiaozhun_bianhao
	ldr r1, = p0
	ldrb r2, [r2]
	lsls r2, r2, # 2
	ldr r1, [r1, r2]
	str r1, [r0]
	bl _xieshumaguan
	pop {r0-r2,pc}

__jinru_jiaozhun_caidan_deng_songshou:
	bl __an_jian
	cmp r0, # 3
	beq __anjian3
	cmp r0, # 0
	beq __jinru_jiaozhun_caidan
	bl __xianshi_jiaozhun_caidan
	b __jinru_jiaozhun_caidan_deng_songshou
	
__jinru_jiaozhun_caidan:
	ldr r0, = jiaozhun_bianhao
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = jiaozhun_biao
	ldr r2, [r1, r0]
	mov pc, r2
	
__qingling:
	bl __du_jiaozhunbiao
	ldr r0, = liangcheng
	movs r1, # 0
	str r1, [r0]
__duanlu_qingling:
	bl __duanlu_qingling_xianshi
	bl __an_jian
	cmp r0, # 1
	beq __qingling_jia
	cmp r0, # 2
	beq __qingling_jian
	b __duanlu_qingling
__qingling_jia:
	bl __an_jian
	cmp r0, # 3
	beq __qingling_baocun
	cmp r0, # 0
	beq __qingling_jiale
	bl __duanlu_qingling_xianshi
	b __qingling_jia
__qingling_jiale:
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = r
	ldr r2, [r1, r0]
	adds r2, r2, # 1
	str r2, [r1, r0]
	b __duanlu_qingling
__qingling_jian:
	bl __an_jian
	cmp r0, # 3
	beq __qingling_baocun
	cmp r0, # 0
	beq __qingling_jianle
	bl __duanlu_qingling_xianshi
	b __qingling_jian
__qingling_jianle:
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = r
	ldr r2, [r1, r0]
	subs r2, r2, # 1
	str r2, [r1, r0]
	b __duanlu_qingling

__qingling_baocun:
	ldr r0, = liangcheng
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	bne __duanlu_qingling
__duanlu_qingling_wan:
	movs r1, # 0
	str r1, [r0]

	ldr r7, = 0x2fff
__yy:
	ldr r0, = wan
	ldr r1, = shumaguanma
	ldr r0, [r0]
	str r0, [r1]
	bl _xieshumaguan
	
	subs r7, r7, # 1
	bne __yy
	bl __xie_flash
	bkpt # 1

__duanlu_qingling_xianshi:
	push {r0-r1,lr}
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
	ldr r1, = r
	ldr r2, = chuchang_r
	bl __xianshi_neizu
	pop {r0-r1,pc}

__xiangwei:
	bl __du_jiaozhunbiao
	ldr r0, = liangcheng
	movs r1, # 0
	str r1, [r0]
	
__shezhi_jiaodu:
	bl __shezhi_jiaodu_xianshi
	bl __an_jian
	cmp r0, # 1
	beq __jiaodu_jia
	cmp r0, # 2
	beq __jiaodu_jian
	b __shezhi_jiaodu
__jiaodu_jia:
	bl __an_jian
	cmp r0, # 3
	beq __jiaodu_shezhi_wan
	cmp r0, # 0
	beq __jiaodu_jiale
	bl __shezhi_jiaodu_xianshi
	b __jiaodu_jia
__jiaodu_jiale:
	ldr r1, = qiwang_jiaodu
	ldr r2, [r1, r0]
	adds r2, r2, # 1
	str r2, [r1, r0]
	b __shezhi_jiaodu
__jiaodu_jian:
	bl __an_jian
	cmp r0, # 3
	beq __jiaodu_shezhi_wan
	cmp r0, # 0
	beq __jiaodu_jianle
	bl __shezhi_jiaodu_xianshi
	b __jiaodu_jian
__jiaodu_jianle:
	ldr r1, = qiwang_jiaodu
	ldr r2, [r1]
	subs r2, r2, # 1
	str r2, [r1]
	b __shezhi_jiaodu

__jiaodu_shezhi_wan:
	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r0, [r0]
	ldr r1, [r1]
	bl __atan2_ji_suan
	asrs r0, r0, # 15
	ldr r1, = qiwang_jiaodu
	ldr r1, [r1]
	subs r0, r0, r1
	bl __jisuan_cos_sin
	ldr r2, = jiaodu_r
	ldr r3, = jiaodu_i
	str r0, [r2]
	str r1, [r3]
	ldr r7, = 0x2fff
__yy2:
	ldr r0, = wan
	ldr r1, = shumaguanma
	ldr r0, [r0]
	str r0, [r1]
	bl _xieshumaguan

	subs r7, r7, # 1
	bne __yy2
	bl __xie_flash
	bkpt # 1

__shezhi_jiaodu_xianshi:
	push {r0-r1,lr}
	ldr r0, = qiwang_jiaodu
	ldr r0, [r0]
	ldr r1, = danwei
	ldr r2, [r1]
	lsrs r2, r2, # 1
	lsls r2, r2, # 1
	str r2, [r1]
	movs r0, r0
	bpl __xian_shi_jiao_du
	mvns r0, r0
	adds r0, r0, # 1
	ldr r1, = danwei
	ldr r2, [r1]
	lsrs r2, r2, # 1
	lsls r2, r2, # 1
	adds r2, r2, # 1
	str r2, [r1]
__xian_shi_jiao_du:
	movs r1, # 2
	bl _zhuanshumaguanma
	bl _xieshumaguan
	pop {r0-r1,pc}

	__z_r:
	bl __du_jiaozhunbiao
	ldr r0, = liangcheng
	movs r1, # 0
	str r1, [r0]
__shezhi_z_r:
	bl __shezhi_z_r_xianshi
	bl __an_jian
	cmp r0, # 1
	beq __shezhi_z_r_jia
	cmp r0, # 2
	beq __shezhi_z_r_jian
	b __shezhi_z_r
__shezhi_z_r_jia:
	bl __an_jian
	cmp r0, # 3
	beq __shezhi_z_r_baocun
	cmp r0, # 0
	beq __shezhi_z_r_jiale
	bl __shezhi_z_r_xianshi
	ldr r0, = anjian_leijia_yanshi
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	ldr r2, = 0xfff
	cmp r1,  r2
	bne __shezhi_z_r_jia
	movs r1, # 0
	str r1, [r0]
__shezhi_z_r_jiale_xunhuan:
	bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi

        ldr r0, = liangcheng
        ldr r0, [r0]
        lsls r0, r0, # 2
        ldr r1, = chuchang_r
        ldr r2, [r1, r0]
        adds r2, r2, # 1
        str r2, [r1, r0]
	bl __an_jian
        cmp r0, # 1
	beq __shezhi_z_r_jiale_xunhuan
	b __shezhi_z_r


__shezhi_z_r_baocun:
        b __shezhi_z_r_bao_cun



	
__shezhi_z_r_jiale:
	ldr r0, = anjian_leijia_yanshi
	movs r1, # 0
	str r1, [r0]
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = chuchang_r
	ldr r2, [r1, r0]
	adds r2, r2, # 1
	str r2, [r1, r0]
	b __shezhi_z_r
__shezhi_z_r_jian:
	bl __an_jian
	cmp r0, # 3
	beq __shezhi_z_r_baocun
	cmp r0, # 0
	beq __shezhi_z_r_jianle
	bl __shezhi_z_r_xianshi
        ldr r0, = anjian_leijia_yanshi
        ldr r1, [r0]
        adds r1, r1, # 1
        str r1, [r0]

	ldr r2, = 0xfff
        cmp r1,  r2
	bne __shezhi_z_r_jian
	movs r1, # 0
	str r1, [r0]
__shezhi_z_r_jianle_xunhuan:
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
        bl __shezhi_z_r_xianshi
	ldr r0, = liangcheng
	ldr r0, [r0]
        lsls r0, r0, # 2
	ldr r1, = chuchang_r
	ldr r2, [r1, r0]
        subs r2, r2, # 1
	str r2, [r1, r0]
	bl __an_jian
	cmp r0, # 2
        beq __shezhi_z_r_jianle_xunhuan
	b __shezhi_z_r


	
__shezhi_z_r_jianle:
        ldr r0, = anjian_leijia_yanshi
        movs r1, # 0
        str r1, [r0]

	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = chuchang_r
	ldr r2, [r1, r0]
	subs r2, r2, # 1
	str r2, [r1, r0]
	b __shezhi_z_r

__shezhi_z_r_bao_cun:
	ldr r0, = liangcheng
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	beq __shezhi_z_r_wan
	b __shezhi_z_r
__shezhi_z_r_wan:
	movs r1, # 0
	str r1, [r0]

	ldr r7, = 0x2fff
__yy3:
	ldr r0, = wan
	ldr r1, = shumaguanma
	ldr r0, [r0]
	str r0, [r1]
	bl _xieshumaguan

	subs r7, r7, # 1
	bne __yy3
	bl __xie_flash
	bkpt # 1

__shezhi_z_r_xianshi:
	push {r0-r1,lr}
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
        ldr r1, = r
	ldr r2, = chuchang_r
	bl __xianshi_neizu
	pop {r0-r1,pc}

@	movs r0, # 3
@	movs r1, # 0xff
@	bl _zhuanshumaguanma
@	bl _xieshumaguan
	b __ren_wu_diao_du
__ren_wu_diao_du:
	bl __an_jian
	lsls r0, r0, # 2
	ldr r1, = an_jian_biao
	ldr r2, [r1, r0]
	mov pc, r2


	
ting:
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
	ldr r1, = f_r
	ldr r2, = f_chuchang_r
	bl __xianshi_neizu
	b __ren_wu_diao_du
	.ltorg

__du_jiaozhunbiao:
	ldr r0, = 0x8000008
	ldr r1, [r0]
	ldr r2, [r0, # 0x04]
	ldr r3, [r0, # 0x08]
	ldr r4, [r0, # 0x0c]
	ldr r5, [r0, # 0x10]
	ldr r6, [r0, # 0x14]
	ldr r7, [r0, # 0x18]
	ldr r0, = chuchang_r
	str r1, [r0]
	str r2, [r0, # 0x04]
	str r3, [r0, # 0x08]
	str r4, [r0, # 0x0c]
	str r5, [r0, # 0x10]
	str r6, [r0, # 0x14]
	str r7, [r0, # 0x18]
	bx lr



	
__xie_flash:
	ldr r0, = 0x40021000
	ldr r2, = 0x1fff0f00
	ldr r2, [r2, # 0x10]
	lsls r2, r2, # 0x13
	lsrs r2, r2, # 0x13
	str r2, [r0, # 0x04]
	movs r2, # 0x00
	str r2, [r0, # 0x08]
__deng_shizhong:
	ldr r1, [r0]
	lsls r1, r1, # 21
	bpl __deng_shizhong
	ldr r2, = 0x40022000   @FLASH访问控制
	ldr r1, = 0x45670123
	str r1, [r2, # 0x08]
	ldr r1, = 0xcdef89ab
	str r1, [r2, # 0x08]

	ldr r0, = 0x1fff0f00
	adds r0, r0, # 64
	ldr r1, [r0, # 0x2c]
	uxtb r3, r1
	ldr r1, = 0x40022100
	str r3, [r1]
	ldr r3, [r0, # 0x2c]
	lsls r3, r3, # 7
	lsrs r3, r3, # 23
	str r3, [r1, # 0x04]
	ldr r3, [r0, # 0x2c]
	lsls r3, r3, # 16
	lsrs r3, r3, # 24
	str r3, [r1, # 0x10]
	ldr r3, [r0, # 0x30]
	uxtb r3, r3
	str r3, [r1, # 0x08]
	ldr r3, [r0, # 0x30]
	lsls r3, r3, # 5
	lsrs r3, r3, # 21
	str r3, [r1, # 0x0c]
	ldr r3, [r0, # 0x34]
	lsls r3, r3, # 15
	lsrs r3, r3, # 15
	str r3, [r0, # 0x34]
	ldr r3, [r0, # 0x38]
	lsls r3, r3, # 15
	lsrs r3, r3, # 15
	str r3, [r1, # 0x18]
	ldr r3, [r0, # 0x3c]
	uxth r3, r3
	str r3, [r1, # 0x1c]
	ldr r0, [r0, # 0x3c]
	lsls r0, r0, # 2
	lsrs r0, r0, # 18
	str r0, [r1, # 0x20]
@	bkpt # 77

	

	ldr r0, = 0x1000002
	ldr r1, [r2, # 0x14]
	orrs r0, r0, r1
	str r0, [r2, # 0x14]
	bl __flash_mang
	ldr r3, = 0x8000000
	ldr r1, = 0xffffffff
	str r1, [r3]
	bl __flash_mang
@	bkpt # 66
	movs r1, # 1
	str r1, [r2, # 0x10]
	ldr r0, = 0x1000001
	str r0, [r2, # 0x14]
	bl __flash_mang

	ldr r3, = 0x8000000
	ldr r1, = 0x20000160
	str r1, [r3]
	bl __flash_mang
	adds r3, r3, # 4
	ldr r1, = _start
	adds r1, r1, # 1
	str r1, [r3]
	bl __flash_mang
	adds r3, r3, # 4
	ldr r1, = chuchang_r
	movs r4, # 0
__xie_flash_xunhuan:
	ldr r0, [r1, r4]
	str r0, [r3, r4]
	bl __flash_mang
	adds r4, r4, # 4
	cmp r4, # 24
	bne __xie_flash_xunhuan
	ldr r1, = 0xffffffff
__xie_flash_xunhuan1:
	str r1, [r3, r4]
	bl __flash_mang
	adds r4, r4, # 4
	cmp r4, # 0x74
	bne __xie_flash_xunhuan1
	ldr r1, = 0
	str r1, [r2, # 0x14]
	bl __flash_mang
	bx lr

__flash_mang:
	ldr r0, = 0x40022000
	ldr r1, [r0, # 0x04]
	lsls r1, r1, # 1
	bcc __flash_mang
	bx lr

dianyuan_xianshi:
	.word 0                 @电压显示值(单位0.01V)

aaa:
	bx lr

_nmi_handler:
	bx lr
_hard_fault:
	bx lr
_svc_handler:
	bx lr
_pendsv_handler:
	bx lr

_systickzhongduan:
	push {r0,r1}
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
	ldr r1, = f_r
	ldr r2, = f_chuchang_r
	bl __xianshi_neizu
	pop {r0,r1}
	bx lr

.section .ram
an_jian_biao:
	.word __anjian0
	.word __anjian1
	.word __anjian2
	.word __anjian3
	
p0:
	.word  0x48c99                @对应0
	.word  0x48c11                @对应1
	.word  0x48c88                @对应2
	.word  0x48c80                @对应3
	.word  0x48c44                @对应4
	
	.end
