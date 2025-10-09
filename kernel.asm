
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	5b013103          	ld	sp,1456(sp) # 8000b5b0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1d8060ef          	jal	ra,800061f4 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5RISCV14supervisorTrapEv>:

.align 4
.global _ZN5RISCV14supervisorTrapEv
.type _ZN5RISCV14supervisorTrapEv,@function
_ZN5RISCV14supervisorTrapEv:
        addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
        .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        sd x\index, \index*  8(sp)
        .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call _ZN5RISCV20handleSupervisorTrapEv
    80001084:	67c010ef          	jal	ra,80002700 <_ZN5RISCV20handleSupervisorTrapEv>


        .irp index 0,1,23,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        ld x\index, \index * 8(sp)
        .endr
    80001088:	00013003          	ld	zero,0(sp)
    8000108c:	00813083          	ld	ra,8(sp)
    80001090:	0b813b83          	ld	s7,184(sp)
    80001094:	02013203          	ld	tp,32(sp)
    80001098:	02813283          	ld	t0,40(sp)
    8000109c:	03013303          	ld	t1,48(sp)
    800010a0:	03813383          	ld	t2,56(sp)
    800010a4:	04013403          	ld	s0,64(sp)
    800010a8:	04813483          	ld	s1,72(sp)
    800010ac:	05013503          	ld	a0,80(sp)
    800010b0:	05813583          	ld	a1,88(sp)
    800010b4:	06013603          	ld	a2,96(sp)
    800010b8:	06813683          	ld	a3,104(sp)
    800010bc:	07013703          	ld	a4,112(sp)
    800010c0:	07813783          	ld	a5,120(sp)
    800010c4:	08013803          	ld	a6,128(sp)
    800010c8:	08813883          	ld	a7,136(sp)
    800010cc:	09013903          	ld	s2,144(sp)
    800010d0:	09813983          	ld	s3,152(sp)
    800010d4:	0a013a03          	ld	s4,160(sp)
    800010d8:	0a813a83          	ld	s5,168(sp)
    800010dc:	0b013b03          	ld	s6,176(sp)
    800010e0:	0b813b83          	ld	s7,184(sp)
    800010e4:	0c013c03          	ld	s8,192(sp)
    800010e8:	0c813c83          	ld	s9,200(sp)
    800010ec:	0d013d03          	ld	s10,208(sp)
    800010f0:	0d813d83          	ld	s11,216(sp)
    800010f4:	0e013e03          	ld	t3,224(sp)
    800010f8:	0e813e83          	ld	t4,232(sp)
    800010fc:	0f013f03          	ld	t5,240(sp)
    80001100:	0f813f83          	ld	t6,248(sp)
        addi sp, sp, 256
    80001104:	10010113          	addi	sp,sp,256


    80001108:	10200073          	sret
    8000110c:	0000                	unimp
	...

0000000080001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_,@function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    #a0 &old->context
    #a1 &running->context
    sd ra,0*8(a0)
    80001110:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp,1*8(a0)
    80001114:	00253423          	sd	sp,8(a0)


    ld ra,0*8(a1)
    80001118:	0005b083          	ld	ra,0(a1)
    ld sp,1*8(a1)
    8000111c:	0085b103          	ld	sp,8(a1)

    80001120:	00008067          	ret

0000000080001124 <_ZN5RISCV13pushRegistersEv>:
.global _ZN5RISCV13pushRegistersEv
.type _ZN5RISCV13pushRegistersEv,@function
_ZN5RISCV13pushRegistersEv:
    addi sp, sp, -256
    80001124:	f0010113          	addi	sp,sp,-256
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*  8(sp)
    .endr
    80001128:	00313c23          	sd	gp,24(sp)
    8000112c:	02413023          	sd	tp,32(sp)
    80001130:	02513423          	sd	t0,40(sp)
    80001134:	02613823          	sd	t1,48(sp)
    80001138:	02713c23          	sd	t2,56(sp)
    8000113c:	04813023          	sd	s0,64(sp)
    80001140:	04913423          	sd	s1,72(sp)
    80001144:	04a13823          	sd	a0,80(sp)
    80001148:	04b13c23          	sd	a1,88(sp)
    8000114c:	06c13023          	sd	a2,96(sp)
    80001150:	06d13423          	sd	a3,104(sp)
    80001154:	06e13823          	sd	a4,112(sp)
    80001158:	06f13c23          	sd	a5,120(sp)
    8000115c:	09013023          	sd	a6,128(sp)
    80001160:	09113423          	sd	a7,136(sp)
    80001164:	09213823          	sd	s2,144(sp)
    80001168:	09313c23          	sd	s3,152(sp)
    8000116c:	0b413023          	sd	s4,160(sp)
    80001170:	0b513423          	sd	s5,168(sp)
    80001174:	0b613823          	sd	s6,176(sp)
    80001178:	0b713c23          	sd	s7,184(sp)
    8000117c:	0d813023          	sd	s8,192(sp)
    80001180:	0d913423          	sd	s9,200(sp)
    80001184:	0da13823          	sd	s10,208(sp)
    80001188:	0db13c23          	sd	s11,216(sp)
    8000118c:	0fc13023          	sd	t3,224(sp)
    80001190:	0fd13423          	sd	t4,232(sp)
    80001194:	0fe13823          	sd	t5,240(sp)
    80001198:	0ff13c23          	sd	t6,248(sp)
    ret
    8000119c:	00008067          	ret

00000000800011a0 <_ZN5RISCV12popRegistersEv>:
.global _ZN5RISCV12popRegistersEv
.type _ZN5RISCV12popRegistersEv,@function
_ZN5RISCV12popRegistersEv:
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011a0:	01813183          	ld	gp,24(sp)
    800011a4:	02013203          	ld	tp,32(sp)
    800011a8:	02813283          	ld	t0,40(sp)
    800011ac:	03013303          	ld	t1,48(sp)
    800011b0:	03813383          	ld	t2,56(sp)
    800011b4:	04013403          	ld	s0,64(sp)
    800011b8:	04813483          	ld	s1,72(sp)
    800011bc:	05013503          	ld	a0,80(sp)
    800011c0:	05813583          	ld	a1,88(sp)
    800011c4:	06013603          	ld	a2,96(sp)
    800011c8:	06813683          	ld	a3,104(sp)
    800011cc:	07013703          	ld	a4,112(sp)
    800011d0:	07813783          	ld	a5,120(sp)
    800011d4:	08013803          	ld	a6,128(sp)
    800011d8:	08813883          	ld	a7,136(sp)
    800011dc:	09013903          	ld	s2,144(sp)
    800011e0:	09813983          	ld	s3,152(sp)
    800011e4:	0a013a03          	ld	s4,160(sp)
    800011e8:	0a813a83          	ld	s5,168(sp)
    800011ec:	0b013b03          	ld	s6,176(sp)
    800011f0:	0b813b83          	ld	s7,184(sp)
    800011f4:	0c013c03          	ld	s8,192(sp)
    800011f8:	0c813c83          	ld	s9,200(sp)
    800011fc:	0d013d03          	ld	s10,208(sp)
    80001200:	0d813d83          	ld	s11,216(sp)
    80001204:	0e013e03          	ld	t3,224(sp)
    80001208:	0e813e83          	ld	t4,232(sp)
    8000120c:	0f013f03          	ld	t5,240(sp)
    80001210:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001214:	10010113          	addi	sp,sp,256
    ret
    80001218:	00008067          	ret

000000008000121c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000121c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001220:	00b29a63          	bne	t0,a1,80001234 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001224:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001228:	fe029ae3          	bnez	t0,8000121c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000122c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001230:	00008067          	ret

0000000080001234 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001234:	00100513          	li	a0,1
    80001238:	00008067          	ret

000000008000123c <_Z10do_syscallmmmmmm>:
//
#include "../h/syscall_c.hpp"
#include "../h/RISCV.hpp"
#include "../lib/hw.h"

void do_syscall(size_t arg0, size_t arg1 = 0, size_t arg2 = 0, size_t arg3 = 0, size_t arg4 = 0, size_t arg5 = 0) {
    8000123c:	ff010113          	addi	sp,sp,-16
    80001240:	00813423          	sd	s0,8(sp)
    80001244:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");//NAUCITI STA JE OVO
    80001248:	00000073          	ecall
}
    8000124c:	00813403          	ld	s0,8(sp)
    80001250:	01010113          	addi	sp,sp,16
    80001254:	00008067          	ret

0000000080001258 <_Z9mem_allocm>:

void *mem_alloc(size_t sz) {
    if (sz<=0)return nullptr;
    80001258:	06050263          	beqz	a0,800012bc <_Z9mem_allocm+0x64>
void *mem_alloc(size_t sz) {
    8000125c:	fe010113          	addi	sp,sp,-32
    80001260:	00113c23          	sd	ra,24(sp)
    80001264:	00813823          	sd	s0,16(sp)
    80001268:	02010413          	addi	s0,sp,32
    size_t blcks=(sz/MEM_BLOCK_SIZE)+(sz%MEM_BLOCK_SIZE==0?0:1);
    8000126c:	00655593          	srli	a1,a0,0x6
    80001270:	03f57513          	andi	a0,a0,63
    80001274:	00a03533          	snez	a0,a0
    do_syscall(0x01,blcks);
    80001278:	00000793          	li	a5,0
    8000127c:	00000713          	li	a4,0
    80001280:	00000693          	li	a3,0
    80001284:	00000613          	li	a2,0
    80001288:	00a585b3          	add	a1,a1,a0
    8000128c:	00100513          	li	a0,1
    80001290:	00000097          	auipc	ra,0x0
    80001294:	fac080e7          	jalr	-84(ra) # 8000123c <_Z10do_syscallmmmmmm>
}

inline size_t RISCV::r_a0() {
    size_t volatile a0;
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    return a0;
    80001298:	00050793          	mv	a5,a0
    8000129c:	fef43023          	sd	a5,-32(s0)
}
    800012a0:	fe043783          	ld	a5,-32(s0)
    void *volatile ret=(void*)RISCV::r_a0();
    800012a4:	fef43423          	sd	a5,-24(s0)
    return ret;
    800012a8:	fe843503          	ld	a0,-24(s0)
}
    800012ac:	01813083          	ld	ra,24(sp)
    800012b0:	01013403          	ld	s0,16(sp)
    800012b4:	02010113          	addi	sp,sp,32
    800012b8:	00008067          	ret
    if (sz<=0)return nullptr;
    800012bc:	00000513          	li	a0,0
}
    800012c0:	00008067          	ret

00000000800012c4 <_Z8mem_freePv>:

int mem_free(void *addr) {
    if (addr==nullptr)return -1;
    800012c4:	06050063          	beqz	a0,80001324 <_Z8mem_freePv+0x60>
int mem_free(void *addr) {
    800012c8:	fe010113          	addi	sp,sp,-32
    800012cc:	00113c23          	sd	ra,24(sp)
    800012d0:	00813823          	sd	s0,16(sp)
    800012d4:	02010413          	addi	s0,sp,32
    800012d8:	00050593          	mv	a1,a0
    do_syscall(0x02,(uint64)addr);
    800012dc:	00000793          	li	a5,0
    800012e0:	00000713          	li	a4,0
    800012e4:	00000693          	li	a3,0
    800012e8:	00000613          	li	a2,0
    800012ec:	00200513          	li	a0,2
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	f4c080e7          	jalr	-180(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    800012f8:	00050793          	mv	a5,a0
    800012fc:	fef43023          	sd	a5,-32(s0)
}
    80001300:	fe043783          	ld	a5,-32(s0)
    int volatile ret=(int)RISCV::r_a0();
    80001304:	0007879b          	sext.w	a5,a5
    80001308:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000130c:	fec42503          	lw	a0,-20(s0)
    80001310:	0005051b          	sext.w	a0,a0
}
    80001314:	01813083          	ld	ra,24(sp)
    80001318:	01013403          	ld	s0,16(sp)
    8000131c:	02010113          	addi	sp,sp,32
    80001320:	00008067          	ret
    if (addr==nullptr)return -1;
    80001324:	fff00513          	li	a0,-1
}
    80001328:	00008067          	ret

000000008000132c <_Z18mem_get_free_spacev>:
size_t mem_get_free_space() {
    8000132c:	fe010113          	addi	sp,sp,-32
    80001330:	00113c23          	sd	ra,24(sp)
    80001334:	00813823          	sd	s0,16(sp)
    80001338:	02010413          	addi	s0,sp,32
    do_syscall(0x03);
    8000133c:	00000793          	li	a5,0
    80001340:	00000713          	li	a4,0
    80001344:	00000693          	li	a3,0
    80001348:	00000613          	li	a2,0
    8000134c:	00000593          	li	a1,0
    80001350:	00300513          	li	a0,3
    80001354:	00000097          	auipc	ra,0x0
    80001358:	ee8080e7          	jalr	-280(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    8000135c:	00050793          	mv	a5,a0
    80001360:	fef43023          	sd	a5,-32(s0)
}
    80001364:	fe043783          	ld	a5,-32(s0)
    size_t volatile ret = (size_t)RISCV::r_a0();
    80001368:	fef43423          	sd	a5,-24(s0)
    return ret;
    8000136c:	fe843503          	ld	a0,-24(s0)
}
    80001370:	01813083          	ld	ra,24(sp)
    80001374:	01013403          	ld	s0,16(sp)
    80001378:	02010113          	addi	sp,sp,32
    8000137c:	00008067          	ret

0000000080001380 <_Z26mem_get_largest_free_blockv>:

size_t mem_get_largest_free_block() {
    80001380:	fe010113          	addi	sp,sp,-32
    80001384:	00113c23          	sd	ra,24(sp)
    80001388:	00813823          	sd	s0,16(sp)
    8000138c:	02010413          	addi	s0,sp,32
    do_syscall(0x04);
    80001390:	00000793          	li	a5,0
    80001394:	00000713          	li	a4,0
    80001398:	00000693          	li	a3,0
    8000139c:	00000613          	li	a2,0
    800013a0:	00000593          	li	a1,0
    800013a4:	00400513          	li	a0,4
    800013a8:	00000097          	auipc	ra,0x0
    800013ac:	e94080e7          	jalr	-364(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    800013b0:	00050793          	mv	a5,a0
    800013b4:	fef43023          	sd	a5,-32(s0)
}
    800013b8:	fe043783          	ld	a5,-32(s0)
    size_t volatile ret = (size_t)RISCV::r_a0();
    800013bc:	fef43423          	sd	a5,-24(s0)
    return ret;
    800013c0:	fe843503          	ld	a0,-24(s0)
}
    800013c4:	01813083          	ld	ra,24(sp)
    800013c8:	01013403          	ld	s0,16(sp)
    800013cc:	02010113          	addi	sp,sp,32
    800013d0:	00008067          	ret

00000000800013d4 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg) {
    if(handle==nullptr)return -1;
    800013d4:	0a050063          	beqz	a0,80001474 <_Z13thread_createPP3TCBPFvPvES2_+0xa0>
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg) {
    800013d8:	fc010113          	addi	sp,sp,-64
    800013dc:	02113c23          	sd	ra,56(sp)
    800013e0:	02813823          	sd	s0,48(sp)
    800013e4:	02913423          	sd	s1,40(sp)
    800013e8:	03213023          	sd	s2,32(sp)
    800013ec:	01313c23          	sd	s3,24(sp)
    800013f0:	04010413          	addi	s0,sp,64
    800013f4:	00050493          	mv	s1,a0
    800013f8:	00058913          	mv	s2,a1
    800013fc:	00060993          	mv	s3,a2
    void *stack=nullptr;
    if(start_routine){
    80001400:	06058663          	beqz	a1,8000146c <_Z13thread_createPP3TCBPFvPvES2_+0x98>
    stack=mem_alloc(DEFAULT_STACK_SIZE);
    80001404:	00001537          	lui	a0,0x1
    80001408:	00000097          	auipc	ra,0x0
    8000140c:	e50080e7          	jalr	-432(ra) # 80001258 <_Z9mem_allocm>
    80001410:	00050713          	mv	a4,a0
    if(stack==nullptr)return -1;
    80001414:	06050463          	beqz	a0,8000147c <_Z13thread_createPP3TCBPFvPvES2_+0xa8>
    }
    do_syscall(0x11, (size_t)handle, (size_t)start_routine, (size_t)arg, (size_t)stack);
    80001418:	00000793          	li	a5,0
    8000141c:	00098693          	mv	a3,s3
    80001420:	00090613          	mv	a2,s2
    80001424:	00048593          	mv	a1,s1
    80001428:	01100513          	li	a0,17
    8000142c:	00000097          	auipc	ra,0x0
    80001430:	e10080e7          	jalr	-496(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    80001434:	00050793          	mv	a5,a0
    80001438:	fcf43023          	sd	a5,-64(s0)
}
    8000143c:	fc043783          	ld	a5,-64(s0)
    int volatile ret=(int)RISCV::r_a0();
    80001440:	0007879b          	sext.w	a5,a5
    80001444:	fcf42623          	sw	a5,-52(s0)
    return ret;
    80001448:	fcc42503          	lw	a0,-52(s0)
    8000144c:	0005051b          	sext.w	a0,a0
}
    80001450:	03813083          	ld	ra,56(sp)
    80001454:	03013403          	ld	s0,48(sp)
    80001458:	02813483          	ld	s1,40(sp)
    8000145c:	02013903          	ld	s2,32(sp)
    80001460:	01813983          	ld	s3,24(sp)
    80001464:	04010113          	addi	sp,sp,64
    80001468:	00008067          	ret
    void *stack=nullptr;
    8000146c:	00000713          	li	a4,0
    80001470:	fa9ff06f          	j	80001418 <_Z13thread_createPP3TCBPFvPvES2_+0x44>
    if(handle==nullptr)return -1;
    80001474:	fff00513          	li	a0,-1
}
    80001478:	00008067          	ret
    if(stack==nullptr)return -1;
    8000147c:	fff00513          	li	a0,-1
    80001480:	fd1ff06f          	j	80001450 <_Z13thread_createPP3TCBPFvPvES2_+0x7c>

0000000080001484 <_Z11thread_exitv>:

int thread_exit(){
    80001484:	fe010113          	addi	sp,sp,-32
    80001488:	00113c23          	sd	ra,24(sp)
    8000148c:	00813823          	sd	s0,16(sp)
    80001490:	02010413          	addi	s0,sp,32
    do_syscall(0x12);
    80001494:	00000793          	li	a5,0
    80001498:	00000713          	li	a4,0
    8000149c:	00000693          	li	a3,0
    800014a0:	00000613          	li	a2,0
    800014a4:	00000593          	li	a1,0
    800014a8:	01200513          	li	a0,18
    800014ac:	00000097          	auipc	ra,0x0
    800014b0:	d90080e7          	jalr	-624(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    800014b4:	00050793          	mv	a5,a0
    800014b8:	fef43023          	sd	a5,-32(s0)
}
    800014bc:	fe043783          	ld	a5,-32(s0)
    int volatile ret=(int)RISCV::r_a0();
    800014c0:	0007879b          	sext.w	a5,a5
    800014c4:	fef42623          	sw	a5,-20(s0)
    return ret;
    800014c8:	fec42503          	lw	a0,-20(s0)
}
    800014cc:	0005051b          	sext.w	a0,a0
    800014d0:	01813083          	ld	ra,24(sp)
    800014d4:	01013403          	ld	s0,16(sp)
    800014d8:	02010113          	addi	sp,sp,32
    800014dc:	00008067          	ret

00000000800014e0 <_Z15thread_dispatchv>:

void thread_dispatch(){
    800014e0:	ff010113          	addi	sp,sp,-16
    800014e4:	00113423          	sd	ra,8(sp)
    800014e8:	00813023          	sd	s0,0(sp)
    800014ec:	01010413          	addi	s0,sp,16
    do_syscall(0x13);
    800014f0:	00000793          	li	a5,0
    800014f4:	00000713          	li	a4,0
    800014f8:	00000693          	li	a3,0
    800014fc:	00000613          	li	a2,0
    80001500:	00000593          	li	a1,0
    80001504:	01300513          	li	a0,19
    80001508:	00000097          	auipc	ra,0x0
    8000150c:	d34080e7          	jalr	-716(ra) # 8000123c <_Z10do_syscallmmmmmm>
}
    80001510:	00813083          	ld	ra,8(sp)
    80001514:	00013403          	ld	s0,0(sp)
    80001518:	01010113          	addi	sp,sp,16
    8000151c:	00008067          	ret

0000000080001520 <_Z8sem_openPP3Semj>:

int sem_open(sem_t *handle,unsigned init){
    if(handle==nullptr)return -1;
    80001520:	06050263          	beqz	a0,80001584 <_Z8sem_openPP3Semj+0x64>
int sem_open(sem_t *handle,unsigned init){
    80001524:	fe010113          	addi	sp,sp,-32
    80001528:	00113c23          	sd	ra,24(sp)
    8000152c:	00813823          	sd	s0,16(sp)
    80001530:	02010413          	addi	s0,sp,32
    do_syscall(0x21,(uint64)handle,init);
    80001534:	00000793          	li	a5,0
    80001538:	00000713          	li	a4,0
    8000153c:	00000693          	li	a3,0
    80001540:	02059613          	slli	a2,a1,0x20
    80001544:	02065613          	srli	a2,a2,0x20
    80001548:	00050593          	mv	a1,a0
    8000154c:	02100513          	li	a0,33
    80001550:	00000097          	auipc	ra,0x0
    80001554:	cec080e7          	jalr	-788(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    80001558:	00050793          	mv	a5,a0
    8000155c:	fef43023          	sd	a5,-32(s0)
}
    80001560:	fe043783          	ld	a5,-32(s0)
    int volatile ret=(int)RISCV::r_a0();
    80001564:	0007879b          	sext.w	a5,a5
    80001568:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000156c:	fec42503          	lw	a0,-20(s0)
    80001570:	0005051b          	sext.w	a0,a0
}
    80001574:	01813083          	ld	ra,24(sp)
    80001578:	01013403          	ld	s0,16(sp)
    8000157c:	02010113          	addi	sp,sp,32
    80001580:	00008067          	ret
    if(handle==nullptr)return -1;
    80001584:	fff00513          	li	a0,-1
}
    80001588:	00008067          	ret

000000008000158c <_Z9sem_closeP3Sem>:

int sem_close(sem_t handle){
    if(handle==nullptr)return -1;
    8000158c:	06050063          	beqz	a0,800015ec <_Z9sem_closeP3Sem+0x60>
int sem_close(sem_t handle){
    80001590:	fe010113          	addi	sp,sp,-32
    80001594:	00113c23          	sd	ra,24(sp)
    80001598:	00813823          	sd	s0,16(sp)
    8000159c:	02010413          	addi	s0,sp,32
    800015a0:	00050593          	mv	a1,a0
    do_syscall(0x22,(uint64)handle);
    800015a4:	00000793          	li	a5,0
    800015a8:	00000713          	li	a4,0
    800015ac:	00000693          	li	a3,0
    800015b0:	00000613          	li	a2,0
    800015b4:	02200513          	li	a0,34
    800015b8:	00000097          	auipc	ra,0x0
    800015bc:	c84080e7          	jalr	-892(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    800015c0:	00050793          	mv	a5,a0
    800015c4:	fef43023          	sd	a5,-32(s0)
}
    800015c8:	fe043783          	ld	a5,-32(s0)
    int volatile ret=(int)RISCV::r_a0();
    800015cc:	0007879b          	sext.w	a5,a5
    800015d0:	fef42623          	sw	a5,-20(s0)
    return ret;
    800015d4:	fec42503          	lw	a0,-20(s0)
    800015d8:	0005051b          	sext.w	a0,a0
}
    800015dc:	01813083          	ld	ra,24(sp)
    800015e0:	01013403          	ld	s0,16(sp)
    800015e4:	02010113          	addi	sp,sp,32
    800015e8:	00008067          	ret
    if(handle==nullptr)return -1;
    800015ec:	fff00513          	li	a0,-1
}
    800015f0:	00008067          	ret

00000000800015f4 <_Z8sem_waitP3Sem>:

int sem_wait(sem_t id){
    if(id==nullptr)return -1;
    800015f4:	06050063          	beqz	a0,80001654 <_Z8sem_waitP3Sem+0x60>
int sem_wait(sem_t id){
    800015f8:	fe010113          	addi	sp,sp,-32
    800015fc:	00113c23          	sd	ra,24(sp)
    80001600:	00813823          	sd	s0,16(sp)
    80001604:	02010413          	addi	s0,sp,32
    80001608:	00050593          	mv	a1,a0
    do_syscall(0x23,(uint64)id);
    8000160c:	00000793          	li	a5,0
    80001610:	00000713          	li	a4,0
    80001614:	00000693          	li	a3,0
    80001618:	00000613          	li	a2,0
    8000161c:	02300513          	li	a0,35
    80001620:	00000097          	auipc	ra,0x0
    80001624:	c1c080e7          	jalr	-996(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    80001628:	00050793          	mv	a5,a0
    8000162c:	fef43023          	sd	a5,-32(s0)
}
    80001630:	fe043783          	ld	a5,-32(s0)
    int volatile ret=(int)RISCV::r_a0();
    80001634:	0007879b          	sext.w	a5,a5
    80001638:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000163c:	fec42503          	lw	a0,-20(s0)
    80001640:	0005051b          	sext.w	a0,a0
}
    80001644:	01813083          	ld	ra,24(sp)
    80001648:	01013403          	ld	s0,16(sp)
    8000164c:	02010113          	addi	sp,sp,32
    80001650:	00008067          	ret
    if(id==nullptr)return -1;
    80001654:	fff00513          	li	a0,-1
}
    80001658:	00008067          	ret

000000008000165c <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id){
    if(id==nullptr)return -1;
    8000165c:	06050063          	beqz	a0,800016bc <_Z10sem_signalP3Sem+0x60>
int sem_signal(sem_t id){
    80001660:	fe010113          	addi	sp,sp,-32
    80001664:	00113c23          	sd	ra,24(sp)
    80001668:	00813823          	sd	s0,16(sp)
    8000166c:	02010413          	addi	s0,sp,32
    80001670:	00050593          	mv	a1,a0
    do_syscall(0x24,(uint64)id);
    80001674:	00000793          	li	a5,0
    80001678:	00000713          	li	a4,0
    8000167c:	00000693          	li	a3,0
    80001680:	00000613          	li	a2,0
    80001684:	02400513          	li	a0,36
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	bb4080e7          	jalr	-1100(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    80001690:	00050793          	mv	a5,a0
    80001694:	fef43023          	sd	a5,-32(s0)
}
    80001698:	fe043783          	ld	a5,-32(s0)
    int volatile ret=(int)RISCV::r_a0();
    8000169c:	0007879b          	sext.w	a5,a5
    800016a0:	fef42623          	sw	a5,-20(s0)
    return ret;
    800016a4:	fec42503          	lw	a0,-20(s0)
    800016a8:	0005051b          	sext.w	a0,a0
}
    800016ac:	01813083          	ld	ra,24(sp)
    800016b0:	01013403          	ld	s0,16(sp)
    800016b4:	02010113          	addi	sp,sp,32
    800016b8:	00008067          	ret
    if(id==nullptr)return -1;
    800016bc:	fff00513          	li	a0,-1
}
    800016c0:	00008067          	ret

00000000800016c4 <_Z10time_sleepm>:

int time_sleep(time_t time){
    if(time<=0)return -1;
    800016c4:	04050463          	beqz	a0,8000170c <_Z10time_sleepm+0x48>
int time_sleep(time_t time){
    800016c8:	ff010113          	addi	sp,sp,-16
    800016cc:	00113423          	sd	ra,8(sp)
    800016d0:	00813023          	sd	s0,0(sp)
    800016d4:	01010413          	addi	s0,sp,16
    800016d8:	00050593          	mv	a1,a0
    do_syscall(0x31,(size_t)time);
    800016dc:	00000793          	li	a5,0
    800016e0:	00000713          	li	a4,0
    800016e4:	00000693          	li	a3,0
    800016e8:	00000613          	li	a2,0
    800016ec:	03100513          	li	a0,49
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	b4c080e7          	jalr	-1204(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return 0;
    800016f8:	00000513          	li	a0,0
}
    800016fc:	00813083          	ld	ra,8(sp)
    80001700:	00013403          	ld	s0,0(sp)
    80001704:	01010113          	addi	sp,sp,16
    80001708:	00008067          	ret
    if(time<=0)return -1;
    8000170c:	fff00513          	li	a0,-1
}
    80001710:	00008067          	ret

0000000080001714 <_Z4getcv>:

char getc(){
    80001714:	fe010113          	addi	sp,sp,-32
    80001718:	00113c23          	sd	ra,24(sp)
    8000171c:	00813823          	sd	s0,16(sp)
    80001720:	02010413          	addi	s0,sp,32
    do_syscall(0x41);
    80001724:	00000793          	li	a5,0
    80001728:	00000713          	li	a4,0
    8000172c:	00000693          	li	a3,0
    80001730:	00000613          	li	a2,0
    80001734:	00000593          	li	a1,0
    80001738:	04100513          	li	a0,65
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	b00080e7          	jalr	-1280(ra) # 8000123c <_Z10do_syscallmmmmmm>
    return a0;
    80001744:	00050793          	mv	a5,a0
    80001748:	fef43023          	sd	a5,-32(s0)
}
    8000174c:	fe043783          	ld	a5,-32(s0)
    char volatile ret=(char)RISCV::r_a0();
    80001750:	0ff7f793          	andi	a5,a5,255
    80001754:	fef407a3          	sb	a5,-17(s0)
    return ret;
    80001758:	fef44503          	lbu	a0,-17(s0)
}
    8000175c:	0ff57513          	andi	a0,a0,255
    80001760:	01813083          	ld	ra,24(sp)
    80001764:	01013403          	ld	s0,16(sp)
    80001768:	02010113          	addi	sp,sp,32
    8000176c:	00008067          	ret

0000000080001770 <_Z4putcc>:
void putc(char c){
    80001770:	ff010113          	addi	sp,sp,-16
    80001774:	00113423          	sd	ra,8(sp)
    80001778:	00813023          	sd	s0,0(sp)
    8000177c:	01010413          	addi	s0,sp,16
    80001780:	00050593          	mv	a1,a0
    do_syscall(0x42,c);
    80001784:	00000793          	li	a5,0
    80001788:	00000713          	li	a4,0
    8000178c:	00000693          	li	a3,0
    80001790:	00000613          	li	a2,0
    80001794:	04200513          	li	a0,66
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	aa4080e7          	jalr	-1372(ra) # 8000123c <_Z10do_syscallmmmmmm>
    800017a0:	00813083          	ld	ra,8(sp)
    800017a4:	00013403          	ld	s0,0(sp)
    800017a8:	01010113          	addi	sp,sp,16
    800017ac:	00008067          	ret

00000000800017b0 <_ZL9fibonaccim>:
//#include "../h/syscall_c.h"
#include  "../lib/console.h"
#include "../h/print.hpp"

static uint64 fibonacci(uint64 n)
{
    800017b0:	fe010113          	addi	sp,sp,-32
    800017b4:	00113c23          	sd	ra,24(sp)
    800017b8:	00813823          	sd	s0,16(sp)
    800017bc:	00913423          	sd	s1,8(sp)
    800017c0:	01213023          	sd	s2,0(sp)
    800017c4:	02010413          	addi	s0,sp,32
    800017c8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800017cc:	00100793          	li	a5,1
    800017d0:	02a7f863          	bgeu	a5,a0,80001800 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) {
    800017d4:	00a00793          	li	a5,10
    800017d8:	02f577b3          	remu	a5,a0,a5
    800017dc:	02078e63          	beqz	a5,80001818 <_ZL9fibonaccim+0x68>
        TCB::yield();
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
    800017e0:	fff48513          	addi	a0,s1,-1
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	fcc080e7          	jalr	-52(ra) # 800017b0 <_ZL9fibonaccim>
    800017ec:	00050913          	mv	s2,a0
    800017f0:	ffe48513          	addi	a0,s1,-2
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	fbc080e7          	jalr	-68(ra) # 800017b0 <_ZL9fibonaccim>
    800017fc:	00a90533          	add	a0,s2,a0
}
    80001800:	01813083          	ld	ra,24(sp)
    80001804:	01013403          	ld	s0,16(sp)
    80001808:	00813483          	ld	s1,8(sp)
    8000180c:	00013903          	ld	s2,0(sp)
    80001810:	02010113          	addi	sp,sp,32
    80001814:	00008067          	ret
        TCB::yield();
    80001818:	00001097          	auipc	ra,0x1
    8000181c:	0f4080e7          	jalr	244(ra) # 8000290c <_ZN3TCB5yieldEv>
    80001820:	fc1ff06f          	j	800017e0 <_ZL9fibonaccim+0x30>

0000000080001824 <_Z11workerBodyAv>:
void workerBodyA() {
    80001824:	fe010113          	addi	sp,sp,-32
    80001828:	00113c23          	sd	ra,24(sp)
    8000182c:	00813823          	sd	s0,16(sp)
    80001830:	00913423          	sd	s1,8(sp)
    80001834:	02010413          	addi	s0,sp,32
    for (uint64 i=0;i<10;i++) {
    80001838:	00000493          	li	s1,0
    8000183c:	0300006f          	j	8000186c <_Z11workerBodyAv+0x48>
        printStringS("A=");
        printIntS(i);
        printStringS("\n");
        for (uint64 j=10;j<10000;j++) {
    80001840:	00168693          	addi	a3,a3,1
    80001844:	000027b7          	lui	a5,0x2
    80001848:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000184c:	00d7ee63          	bltu	a5,a3,80001868 <_Z11workerBodyAv+0x44>
            for (uint64 k=0;k<30000;k++) {
    80001850:	00000713          	li	a4,0
    80001854:	000077b7          	lui	a5,0x7
    80001858:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000185c:	fee7e2e3          	bltu	a5,a4,80001840 <_Z11workerBodyAv+0x1c>
    80001860:	00170713          	addi	a4,a4,1
    80001864:	ff1ff06f          	j	80001854 <_Z11workerBodyAv+0x30>
    for (uint64 i=0;i<10;i++) {
    80001868:	00148493          	addi	s1,s1,1
    8000186c:	00900793          	li	a5,9
    80001870:	0297ec63          	bltu	a5,s1,800018a8 <_Z11workerBodyAv+0x84>
        printStringS("A=");
    80001874:	00007517          	auipc	a0,0x7
    80001878:	7ac50513          	addi	a0,a0,1964 # 80009020 <CONSOLE_STATUS+0x10>
    8000187c:	00001097          	auipc	ra,0x1
    80001880:	16c080e7          	jalr	364(ra) # 800029e8 <_Z12printStringSPKc>
        printIntS(i);
    80001884:	00048513          	mv	a0,s1
    80001888:	00001097          	auipc	ra,0x1
    8000188c:	1d0080e7          	jalr	464(ra) # 80002a58 <_Z9printIntSm>
        printStringS("\n");
    80001890:	00008517          	auipc	a0,0x8
    80001894:	97850513          	addi	a0,a0,-1672 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001898:	00001097          	auipc	ra,0x1
    8000189c:	150080e7          	jalr	336(ra) # 800029e8 <_Z12printStringSPKc>
        for (uint64 j=10;j<10000;j++) {
    800018a0:	00a00693          	li	a3,10
    800018a4:	fa1ff06f          	j	80001844 <_Z11workerBodyAv+0x20>
                //busy wait
            }
            //TCB:yield();
        }
    }
}
    800018a8:	01813083          	ld	ra,24(sp)
    800018ac:	01013403          	ld	s0,16(sp)
    800018b0:	00813483          	ld	s1,8(sp)
    800018b4:	02010113          	addi	sp,sp,32
    800018b8:	00008067          	ret

00000000800018bc <_Z11workerBodyBv>:
void workerBodyB() {
    800018bc:	fe010113          	addi	sp,sp,-32
    800018c0:	00113c23          	sd	ra,24(sp)
    800018c4:	00813823          	sd	s0,16(sp)
    800018c8:	00913423          	sd	s1,8(sp)
    800018cc:	02010413          	addi	s0,sp,32
    for (uint64 i=0;i<16;i++) {
    800018d0:	00000493          	li	s1,0
    800018d4:	0300006f          	j	80001904 <_Z11workerBodyBv+0x48>
        printStringS("B=");
        printIntS(i);
        printStringS("\n");
        for (uint64 j=0;j<10000;j++) {
    800018d8:	00168693          	addi	a3,a3,1
    800018dc:	000027b7          	lui	a5,0x2
    800018e0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800018e4:	00d7ee63          	bltu	a5,a3,80001900 <_Z11workerBodyBv+0x44>
            for (uint64 k=0;k<30000;k++) {
    800018e8:	00000713          	li	a4,0
    800018ec:	000077b7          	lui	a5,0x7
    800018f0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800018f4:	fee7e2e3          	bltu	a5,a4,800018d8 <_Z11workerBodyBv+0x1c>
    800018f8:	00170713          	addi	a4,a4,1
    800018fc:	ff1ff06f          	j	800018ec <_Z11workerBodyBv+0x30>
    for (uint64 i=0;i<16;i++) {
    80001900:	00148493          	addi	s1,s1,1
    80001904:	00f00793          	li	a5,15
    80001908:	0297ec63          	bltu	a5,s1,80001940 <_Z11workerBodyBv+0x84>
        printStringS("B=");
    8000190c:	00007517          	auipc	a0,0x7
    80001910:	71c50513          	addi	a0,a0,1820 # 80009028 <CONSOLE_STATUS+0x18>
    80001914:	00001097          	auipc	ra,0x1
    80001918:	0d4080e7          	jalr	212(ra) # 800029e8 <_Z12printStringSPKc>
        printIntS(i);
    8000191c:	00048513          	mv	a0,s1
    80001920:	00001097          	auipc	ra,0x1
    80001924:	138080e7          	jalr	312(ra) # 80002a58 <_Z9printIntSm>
        printStringS("\n");
    80001928:	00008517          	auipc	a0,0x8
    8000192c:	8e050513          	addi	a0,a0,-1824 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001930:	00001097          	auipc	ra,0x1
    80001934:	0b8080e7          	jalr	184(ra) # 800029e8 <_Z12printStringSPKc>
        for (uint64 j=0;j<10000;j++) {
    80001938:	00000693          	li	a3,0
    8000193c:	fa1ff06f          	j	800018dc <_Z11workerBodyBv+0x20>
                //busy wait
            }
            //TCB:yield();
        }
    }
}
    80001940:	01813083          	ld	ra,24(sp)
    80001944:	01013403          	ld	s0,16(sp)
    80001948:	00813483          	ld	s1,8(sp)
    8000194c:	02010113          	addi	sp,sp,32
    80001950:	00008067          	ret

0000000080001954 <_Z11workerBodyCv>:
void workerBodyC()
{
    80001954:	fe010113          	addi	sp,sp,-32
    80001958:	00113c23          	sd	ra,24(sp)
    8000195c:	00813823          	sd	s0,16(sp)
    80001960:	00913423          	sd	s1,8(sp)
    80001964:	01213023          	sd	s2,0(sp)
    80001968:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000196c:	00000493          	li	s1,0
    80001970:	0380006f          	j	800019a8 <_Z11workerBodyCv+0x54>
    for (; i < 3; i++)
    {

        printStringS("C: i=");
    80001974:	00007517          	auipc	a0,0x7
    80001978:	6bc50513          	addi	a0,a0,1724 # 80009030 <CONSOLE_STATUS+0x20>
    8000197c:	00001097          	auipc	ra,0x1
    80001980:	06c080e7          	jalr	108(ra) # 800029e8 <_Z12printStringSPKc>
        printIntS(i);
    80001984:	00048513          	mv	a0,s1
    80001988:	00001097          	auipc	ra,0x1
    8000198c:	0d0080e7          	jalr	208(ra) # 80002a58 <_Z9printIntSm>
        printStringS("\n");
    80001990:	00008517          	auipc	a0,0x8
    80001994:	87850513          	addi	a0,a0,-1928 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001998:	00001097          	auipc	ra,0x1
    8000199c:	050080e7          	jalr	80(ra) # 800029e8 <_Z12printStringSPKc>
    for (; i < 3; i++)
    800019a0:	0014849b          	addiw	s1,s1,1
    800019a4:	0ff4f493          	andi	s1,s1,255
    800019a8:	00200793          	li	a5,2
    800019ac:	fc97f4e3          	bgeu	a5,s1,80001974 <_Z11workerBodyCv+0x20>

    }
    printStringS("c: yield\n");
    800019b0:	00007517          	auipc	a0,0x7
    800019b4:	68850513          	addi	a0,a0,1672 # 80009038 <CONSOLE_STATUS+0x28>
    800019b8:	00001097          	auipc	ra,0x1
    800019bc:	030080e7          	jalr	48(ra) # 800029e8 <_Z12printStringSPKc>

    __asm__ ("li t1, 7");
    800019c0:	00700313          	li	t1,7
  //  TCB::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800019c4:	00030913          	mv	s2,t1

    printStringS("c: t1=");
    800019c8:	00007517          	auipc	a0,0x7
    800019cc:	68050513          	addi	a0,a0,1664 # 80009048 <CONSOLE_STATUS+0x38>
    800019d0:	00001097          	auipc	ra,0x1
    800019d4:	018080e7          	jalr	24(ra) # 800029e8 <_Z12printStringSPKc>
    printIntS(t1);
    800019d8:	00090513          	mv	a0,s2
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	07c080e7          	jalr	124(ra) # 80002a58 <_Z9printIntSm>
    printStringS("\n");
    800019e4:	00008517          	auipc	a0,0x8
    800019e8:	82450513          	addi	a0,a0,-2012 # 80009208 <CONSOLE_STATUS+0x1f8>
    800019ec:	00001097          	auipc	ra,0x1
    800019f0:	ffc080e7          	jalr	-4(ra) # 800029e8 <_Z12printStringSPKc>




    uint64 result = fibonacci(20);
    800019f4:	01400513          	li	a0,20
    800019f8:	00000097          	auipc	ra,0x0
    800019fc:	db8080e7          	jalr	-584(ra) # 800017b0 <_ZL9fibonaccim>
    80001a00:	00050913          	mv	s2,a0
    printStringS("c: fibonaci=");
    80001a04:	00007517          	auipc	a0,0x7
    80001a08:	64c50513          	addi	a0,a0,1612 # 80009050 <CONSOLE_STATUS+0x40>
    80001a0c:	00001097          	auipc	ra,0x1
    80001a10:	fdc080e7          	jalr	-36(ra) # 800029e8 <_Z12printStringSPKc>
    printIntS(result);
    80001a14:	00090513          	mv	a0,s2
    80001a18:	00001097          	auipc	ra,0x1
    80001a1c:	040080e7          	jalr	64(ra) # 80002a58 <_Z9printIntSm>
    printStringS("\n");
    80001a20:	00007517          	auipc	a0,0x7
    80001a24:	7e850513          	addi	a0,a0,2024 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001a28:	00001097          	auipc	ra,0x1
    80001a2c:	fc0080e7          	jalr	-64(ra) # 800029e8 <_Z12printStringSPKc>
    80001a30:	0380006f          	j	80001a68 <_Z11workerBodyCv+0x114>

    for (; i < 6; i++)
    {
        printStringS("C: i=");
    80001a34:	00007517          	auipc	a0,0x7
    80001a38:	5fc50513          	addi	a0,a0,1532 # 80009030 <CONSOLE_STATUS+0x20>
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	fac080e7          	jalr	-84(ra) # 800029e8 <_Z12printStringSPKc>
        printIntS(i);
    80001a44:	00048513          	mv	a0,s1
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	010080e7          	jalr	16(ra) # 80002a58 <_Z9printIntSm>
       printStringS("\n");
    80001a50:	00007517          	auipc	a0,0x7
    80001a54:	7b850513          	addi	a0,a0,1976 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001a58:	00001097          	auipc	ra,0x1
    80001a5c:	f90080e7          	jalr	-112(ra) # 800029e8 <_Z12printStringSPKc>
    for (; i < 6; i++)
    80001a60:	0014849b          	addiw	s1,s1,1
    80001a64:	0ff4f493          	andi	s1,s1,255
    80001a68:	00500793          	li	a5,5
    80001a6c:	fc97f4e3          	bgeu	a5,s1,80001a34 <_Z11workerBodyCv+0xe0>
    }

  //  TCB::running->setFinished(true);
  //  TCB::yield();
}
    80001a70:	01813083          	ld	ra,24(sp)
    80001a74:	01013403          	ld	s0,16(sp)
    80001a78:	00813483          	ld	s1,8(sp)
    80001a7c:	00013903          	ld	s2,0(sp)
    80001a80:	02010113          	addi	sp,sp,32
    80001a84:	00008067          	ret

0000000080001a88 <_Z11workerBodyDv>:

void workerBodyD()
{
    80001a88:	fe010113          	addi	sp,sp,-32
    80001a8c:	00113c23          	sd	ra,24(sp)
    80001a90:	00813823          	sd	s0,16(sp)
    80001a94:	00913423          	sd	s1,8(sp)
    80001a98:	01213023          	sd	s2,0(sp)
    80001a9c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001aa0:	00a00493          	li	s1,10
    80001aa4:	0380006f          	j	80001adc <_Z11workerBodyDv+0x54>
    //thread_join((thread_t) arg);
    for (; i < 13; i++)
    {

        printStringS("d: i=");
    80001aa8:	00007517          	auipc	a0,0x7
    80001aac:	5b850513          	addi	a0,a0,1464 # 80009060 <CONSOLE_STATUS+0x50>
    80001ab0:	00001097          	auipc	ra,0x1
    80001ab4:	f38080e7          	jalr	-200(ra) # 800029e8 <_Z12printStringSPKc>
        printIntS(i);
    80001ab8:	00048513          	mv	a0,s1
    80001abc:	00001097          	auipc	ra,0x1
    80001ac0:	f9c080e7          	jalr	-100(ra) # 80002a58 <_Z9printIntSm>
        printStringS("\n");
    80001ac4:	00007517          	auipc	a0,0x7
    80001ac8:	74450513          	addi	a0,a0,1860 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001acc:	00001097          	auipc	ra,0x1
    80001ad0:	f1c080e7          	jalr	-228(ra) # 800029e8 <_Z12printStringSPKc>
    for (; i < 13; i++)
    80001ad4:	0014849b          	addiw	s1,s1,1
    80001ad8:	0ff4f493          	andi	s1,s1,255
    80001adc:	00c00793          	li	a5,12
    80001ae0:	fc97f4e3          	bgeu	a5,s1,80001aa8 <_Z11workerBodyDv+0x20>
    }

    printStringS("d: yield\n");
    80001ae4:	00007517          	auipc	a0,0x7
    80001ae8:	58450513          	addi	a0,a0,1412 # 80009068 <CONSOLE_STATUS+0x58>
    80001aec:	00001097          	auipc	ra,0x1
    80001af0:	efc080e7          	jalr	-260(ra) # 800029e8 <_Z12printStringSPKc>

    __asm__ ("li t1, 5");
    80001af4:	00500313          	li	t1,5
   // TCB::yield();

    uint64 result = fibonacci(23);printStringS("D: fibonaci=");
    80001af8:	01700513          	li	a0,23
    80001afc:	00000097          	auipc	ra,0x0
    80001b00:	cb4080e7          	jalr	-844(ra) # 800017b0 <_ZL9fibonaccim>
    80001b04:	00050913          	mv	s2,a0
    80001b08:	00007517          	auipc	a0,0x7
    80001b0c:	57050513          	addi	a0,a0,1392 # 80009078 <CONSOLE_STATUS+0x68>
    80001b10:	00001097          	auipc	ra,0x1
    80001b14:	ed8080e7          	jalr	-296(ra) # 800029e8 <_Z12printStringSPKc>
  printIntS(result);
    80001b18:	00090513          	mv	a0,s2
    80001b1c:	00001097          	auipc	ra,0x1
    80001b20:	f3c080e7          	jalr	-196(ra) # 80002a58 <_Z9printIntSm>
  printStringS("\n");
    80001b24:	00007517          	auipc	a0,0x7
    80001b28:	6e450513          	addi	a0,a0,1764 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001b2c:	00001097          	auipc	ra,0x1
    80001b30:	ebc080e7          	jalr	-324(ra) # 800029e8 <_Z12printStringSPKc>
    80001b34:	0380006f          	j	80001b6c <_Z11workerBodyDv+0xe4>

    for (; i < 16; i++)
    {
        printStringS("d: i=");
    80001b38:	00007517          	auipc	a0,0x7
    80001b3c:	52850513          	addi	a0,a0,1320 # 80009060 <CONSOLE_STATUS+0x50>
    80001b40:	00001097          	auipc	ra,0x1
    80001b44:	ea8080e7          	jalr	-344(ra) # 800029e8 <_Z12printStringSPKc>
        printIntS(i);
    80001b48:	00048513          	mv	a0,s1
    80001b4c:	00001097          	auipc	ra,0x1
    80001b50:	f0c080e7          	jalr	-244(ra) # 80002a58 <_Z9printIntSm>
        printStringS("\n");
    80001b54:	00007517          	auipc	a0,0x7
    80001b58:	6b450513          	addi	a0,a0,1716 # 80009208 <CONSOLE_STATUS+0x1f8>
    80001b5c:	00001097          	auipc	ra,0x1
    80001b60:	e8c080e7          	jalr	-372(ra) # 800029e8 <_Z12printStringSPKc>
    for (; i < 16; i++)
    80001b64:	0014849b          	addiw	s1,s1,1
    80001b68:	0ff4f493          	andi	s1,s1,255
    80001b6c:	00f00793          	li	a5,15
    80001b70:	fc97f4e3          	bgeu	a5,s1,80001b38 <_Z11workerBodyDv+0xb0>
    }

  //  TCB::running->setFinished(true);
    //TCB::yield();
}
    80001b74:	01813083          	ld	ra,24(sp)
    80001b78:	01013403          	ld	s0,16(sp)
    80001b7c:	00813483          	ld	s1,8(sp)
    80001b80:	00013903          	ld	s2,0(sp)
    80001b84:	02010113          	addi	sp,sp,32
    80001b88:	00008067          	ret

0000000080001b8c <_Z8userMainv>:
#include "../h/print.hpp"

void userMain() {
    80001b8c:	fe010113          	addi	sp,sp,-32
    80001b90:	00113c23          	sd	ra,24(sp)
    80001b94:	00813823          	sd	s0,16(sp)
    80001b98:	00913423          	sd	s1,8(sp)
    80001b9c:	02010413          	addi	s0,sp,32
    for (int i = 0; i < 10; i++) {
    80001ba0:	00000493          	li	s1,0
    80001ba4:	00900793          	li	a5,9
    80001ba8:	0097ce63          	blt	a5,s1,80001bc4 <_Z8userMainv+0x38>
        printStringS("This is just a test for user flow of control.\n");
    80001bac:	00007517          	auipc	a0,0x7
    80001bb0:	4dc50513          	addi	a0,a0,1244 # 80009088 <CONSOLE_STATUS+0x78>
    80001bb4:	00001097          	auipc	ra,0x1
    80001bb8:	e34080e7          	jalr	-460(ra) # 800029e8 <_Z12printStringSPKc>
    for (int i = 0; i < 10; i++) {
    80001bbc:	0014849b          	addiw	s1,s1,1
    80001bc0:	fe5ff06f          	j	80001ba4 <_Z8userMainv+0x18>
    }
    80001bc4:	01813083          	ld	ra,24(sp)
    80001bc8:	01013403          	ld	s0,16(sp)
    80001bcc:	00813483          	ld	s1,8(sp)
    80001bd0:	02010113          	addi	sp,sp,32
    80001bd4:	00008067          	ret

0000000080001bd8 <_Z41__static_initialization_and_destruction_0ii>:
void Scheduler::put(TCB *ccb) {
    readyCoroutineQueue.addLast(ccb);
}
TCB* Scheduler::peekFirst() {
    return readyCoroutineQueue.peekFirst();
}
    80001bd8:	ff010113          	addi	sp,sp,-16
    80001bdc:	00813423          	sd	s0,8(sp)
    80001be0:	01010413          	addi	s0,sp,16
    80001be4:	00100793          	li	a5,1
    80001be8:	00f50863          	beq	a0,a5,80001bf8 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001bec:	00813403          	ld	s0,8(sp)
    80001bf0:	01010113          	addi	sp,sp,16
    80001bf4:	00008067          	ret
    80001bf8:	000107b7          	lui	a5,0x10
    80001bfc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001c00:	fef596e3          	bne	a1,a5,80001bec <_Z41__static_initialization_and_destruction_0ii+0x14>
            MemoryAllocator::mem_free(ptr);
        }
    };
    Elem *head,*tail,*curr,*prev;
public:
    List() : head(0), tail(0), curr(0), prev(0) {}
    80001c04:	0000a797          	auipc	a5,0xa
    80001c08:	a1c78793          	addi	a5,a5,-1508 # 8000b620 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c0c:	0007b023          	sd	zero,0(a5)
    80001c10:	0007b423          	sd	zero,8(a5)
    80001c14:	0007b823          	sd	zero,16(a5)
    80001c18:	0007bc23          	sd	zero,24(a5)
    80001c1c:	fd1ff06f          	j	80001bec <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001c20 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001c20:	fe010113          	addi	sp,sp,-32
    80001c24:	00113c23          	sd	ra,24(sp)
    80001c28:	00813823          	sd	s0,16(sp)
    80001c2c:	00913423          	sd	s1,8(sp)
    80001c30:	02010413          	addi	s0,sp,32
        else {
            head=tail=el;
        }
    }
    T *removeFIrst() {
        if (!head) return 0;
    80001c34:	0000a517          	auipc	a0,0xa
    80001c38:	9ec53503          	ld	a0,-1556(a0) # 8000b620 <_ZN9Scheduler19readyCoroutineQueueE>
    80001c3c:	04050263          	beqz	a0,80001c80 <_ZN9Scheduler3getEv+0x60>

        Elem *el=head;
        head=head->next;
    80001c40:	00853783          	ld	a5,8(a0)
    80001c44:	0000a717          	auipc	a4,0xa
    80001c48:	9cf73e23          	sd	a5,-1572(a4) # 8000b620 <_ZN9Scheduler19readyCoroutineQueueE>
        if (!head) tail=0;
    80001c4c:	02078463          	beqz	a5,80001c74 <_ZN9Scheduler3getEv+0x54>

        T *ret=el->data;
    80001c50:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	3c8080e7          	jalr	968(ra) # 8000201c <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001c5c:	00048513          	mv	a0,s1
    80001c60:	01813083          	ld	ra,24(sp)
    80001c64:	01013403          	ld	s0,16(sp)
    80001c68:	00813483          	ld	s1,8(sp)
    80001c6c:	02010113          	addi	sp,sp,32
    80001c70:	00008067          	ret
        if (!head) tail=0;
    80001c74:	0000a797          	auipc	a5,0xa
    80001c78:	9a07ba23          	sd	zero,-1612(a5) # 8000b628 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001c7c:	fd5ff06f          	j	80001c50 <_ZN9Scheduler3getEv+0x30>
        if (!head) return 0;
    80001c80:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFIrst();
    80001c84:	fd9ff06f          	j	80001c5c <_ZN9Scheduler3getEv+0x3c>

0000000080001c88 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *ccb) {
    80001c88:	fe010113          	addi	sp,sp,-32
    80001c8c:	00113c23          	sd	ra,24(sp)
    80001c90:	00813823          	sd	s0,16(sp)
    80001c94:	00913423          	sd	s1,8(sp)
    80001c98:	02010413          	addi	s0,sp,32
    80001c9c:	00050493          	mv	s1,a0
            return MemoryAllocator::mem_alloc(size);
    80001ca0:	01000513          	li	a0,16
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	218080e7          	jalr	536(ra) # 80001ebc <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next):data(data),next(next){}
    80001cac:	00953023          	sd	s1,0(a0)
    80001cb0:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001cb4:	0000a797          	auipc	a5,0xa
    80001cb8:	9747b783          	ld	a5,-1676(a5) # 8000b628 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    80001cbc:	02078263          	beqz	a5,80001ce0 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next=el;
    80001cc0:	00a7b423          	sd	a0,8(a5)
            tail=el;
    80001cc4:	0000a797          	auipc	a5,0xa
    80001cc8:	96a7b223          	sd	a0,-1692(a5) # 8000b628 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
}
    80001ccc:	01813083          	ld	ra,24(sp)
    80001cd0:	01013403          	ld	s0,16(sp)
    80001cd4:	00813483          	ld	s1,8(sp)
    80001cd8:	02010113          	addi	sp,sp,32
    80001cdc:	00008067          	ret
            head=tail=el;
    80001ce0:	0000a797          	auipc	a5,0xa
    80001ce4:	94078793          	addi	a5,a5,-1728 # 8000b620 <_ZN9Scheduler19readyCoroutineQueueE>
    80001ce8:	00a7b423          	sd	a0,8(a5)
    80001cec:	00a7b023          	sd	a0,0(a5)
    80001cf0:	fddff06f          	j	80001ccc <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001cf4 <_ZN9Scheduler9peekFirstEv>:
TCB* Scheduler::peekFirst() {
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00813423          	sd	s0,8(sp)
    80001cfc:	01010413          	addi	s0,sp,16
        delete el;
        return ret;
    }

    T *peekFirst() {
        if (!head)return  0;
    80001d00:	0000a517          	auipc	a0,0xa
    80001d04:	92053503          	ld	a0,-1760(a0) # 8000b620 <_ZN9Scheduler19readyCoroutineQueueE>
    80001d08:	00050463          	beqz	a0,80001d10 <_ZN9Scheduler9peekFirstEv+0x1c>
        return head->data;
    80001d0c:	00053503          	ld	a0,0(a0)
}
    80001d10:	00813403          	ld	s0,8(sp)
    80001d14:	01010113          	addi	sp,sp,16
    80001d18:	00008067          	ret

0000000080001d1c <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    80001d1c:	ff010113          	addi	sp,sp,-16
    80001d20:	00113423          	sd	ra,8(sp)
    80001d24:	00813023          	sd	s0,0(sp)
    80001d28:	01010413          	addi	s0,sp,16
    80001d2c:	000105b7          	lui	a1,0x10
    80001d30:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001d34:	00100513          	li	a0,1
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	ea0080e7          	jalr	-352(ra) # 80001bd8 <_Z41__static_initialization_and_destruction_0ii>
    80001d40:	00813083          	ld	ra,8(sp)
    80001d44:	00013403          	ld	s0,0(sp)
    80001d48:	01010113          	addi	sp,sp,16
    80001d4c:	00008067          	ret

0000000080001d50 <_Z15userMainWrapperPv>:

void userMain();

void userMainTests();

void userMainWrapper(void* arg) {
    80001d50:	ff010113          	addi	sp,sp,-16
    80001d54:	00113423          	sd	ra,8(sp)
    80001d58:	00813023          	sd	s0,0(sp)
    80001d5c:	01010413          	addi	s0,sp,16
    //    userMain();
    userMainTests();
    80001d60:	00001097          	auipc	ra,0x1
    80001d64:	dcc080e7          	jalr	-564(ra) # 80002b2c <_Z13userMainTestsv>
}
    80001d68:	00813083          	ld	ra,8(sp)
    80001d6c:	00013403          	ld	s0,0(sp)
    80001d70:	01010113          	addi	sp,sp,16
    80001d74:	00008067          	ret

0000000080001d78 <main>:

void main() {
    80001d78:	fc010113          	addi	sp,sp,-64
    80001d7c:	02113c23          	sd	ra,56(sp)
    80001d80:	02813823          	sd	s0,48(sp)
    80001d84:	02913423          	sd	s1,40(sp)
    80001d88:	03213023          	sd	s2,32(sp)
    80001d8c:	04010413          	addi	s0,sp,64
    // initialize the kernel
    MemoryAllocator::Initialize();
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	0e0080e7          	jalr	224(ra) # 80001e70 <_ZN15MemoryAllocator10InitializeEv>
    RISCV::w_stvec((size_t)(&RISCV::supervisorTrap));
    80001d98:	0000a797          	auipc	a5,0xa
    80001d9c:	8207b783          	ld	a5,-2016(a5) # 8000b5b8 <_GLOBAL_OFFSET_TABLE_+0x20>
    __asm__ volatile("csrw stvec, %[stvec]" : : [stvec] "r" (stvec));
    80001da0:	10579073          	csrw	stvec,a5

    thread_t threads[4];
    thread_create(&threads[0], nullptr, nullptr);
    80001da4:	00000613          	li	a2,0
    80001da8:	00000593          	li	a1,0
    80001dac:	fc040513          	addi	a0,s0,-64
    80001db0:	fffff097          	auipc	ra,0xfffff
    80001db4:	624080e7          	jalr	1572(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = threads[0]; // must be init. imm. after we create a thread for main
    80001db8:	fc043703          	ld	a4,-64(s0)
    80001dbc:	0000a797          	auipc	a5,0xa
    80001dc0:	8047b783          	ld	a5,-2044(a5) # 8000b5c0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001dc4:	00e7b023          	sd	a4,0(a5)

    // terminal thread for putc and initialize buffer for getc
  //  Cons::setGetcBuffer();
  //  Cons::startPutcThr(&threads[2]);

    thread_create(&threads[1], &userMainWrapper, nullptr);
    80001dc8:	00000613          	li	a2,0
    80001dcc:	00000597          	auipc	a1,0x0
    80001dd0:	f8458593          	addi	a1,a1,-124 # 80001d50 <_Z15userMainWrapperPv>
    80001dd4:	fc840513          	addi	a0,s0,-56
    80001dd8:	fffff097          	auipc	ra,0xfffff
    80001ddc:	5fc080e7          	jalr	1532(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
inline void RISCV::mc_sstatus(size_t mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void RISCV::ms_sstatus(size_t mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
    80001de0:	00200793          	li	a5,2
    80001de4:	1007a073          	csrs	sstatus,a5
}
    80001de8:	00c0006f          	j	80001df4 <main+0x7c>

    RISCV::ms_sstatus(RISCV::SSTATUS_SIE);

    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
        thread_dispatch();
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	6f4080e7          	jalr	1780(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
    80001df4:	fc843783          	ld	a5,-56(s0)

    static int exitTCB();

    static TCB *createThread( Body b);

    bool isFinished() const {return finished;}
    80001df8:	0287c783          	lbu	a5,40(a5)
    80001dfc:	fe0788e3          	beqz	a5,80001dec <main+0x74>
    80001e00:	00001097          	auipc	ra,0x1
    80001e04:	ae0080e7          	jalr	-1312(ra) # 800028e0 <_ZN3TCB16schedulerIsEmptyEv>
    80001e08:	fe0502e3          	beqz	a0,80001dec <main+0x74>
    80001e0c:	fc040493          	addi	s1,s0,-64
    80001e10:	0140006f          	j	80001e24 <main+0xac>
    void* operator new[](size_t size) {
        return MemoryAllocator::mem_alloc(size);
    }

    void operator delete(void *ptr) {
        MemoryAllocator::mem_free(ptr);
    80001e14:	00090513          	mv	a0,s2
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	204080e7          	jalr	516(ra) # 8000201c <_ZN15MemoryAllocator8mem_freeEPv>
    }

    for (auto &thread : threads) {
    80001e20:	00848493          	addi	s1,s1,8
    80001e24:	fe040793          	addi	a5,s0,-32
    80001e28:	02f48063          	beq	s1,a5,80001e48 <main+0xd0>
        delete thread;
    80001e2c:	0004b903          	ld	s2,0(s1)
    80001e30:	fe0908e3          	beqz	s2,80001e20 <main+0xa8>
    ~TCB(){delete[] stack;}
    80001e34:	00893503          	ld	a0,8(s2)
    80001e38:	fc050ee3          	beqz	a0,80001e14 <main+0x9c>
    80001e3c:	00000097          	auipc	ra,0x0
    80001e40:	480080e7          	jalr	1152(ra) # 800022bc <_ZdaPv>
    80001e44:	fd1ff06f          	j	80001e14 <main+0x9c>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    __asm__ volatile ("sw t0, 80(x8)");
}

inline void RISCV::halt() {
    __asm__ volatile("li t0, 0x5555");
    80001e48:	000052b7          	lui	t0,0x5
    80001e4c:	5552829b          	addiw	t0,t0,1365
    __asm__ volatile("li t1, 0x100000");
    80001e50:	00100337          	lui	t1,0x100
    __asm__ volatile("sw t0, 0(t1)");
    80001e54:	00532023          	sw	t0,0(t1) # 100000 <_entry-0x7ff00000>
    }

    RISCV::halt();
    80001e58:	03813083          	ld	ra,56(sp)
    80001e5c:	03013403          	ld	s0,48(sp)
    80001e60:	02813483          	ld	s1,40(sp)
    80001e64:	02013903          	ld	s2,32(sp)
    80001e68:	04010113          	addi	sp,sp,64
    80001e6c:	00008067          	ret

0000000080001e70 <_ZN15MemoryAllocator10InitializeEv>:
//

#include "../h/memoryAllocator.hpp"

MemoryAllocator::FreeMemBlk* MemoryAllocator::freeMemHead = nullptr;
void MemoryAllocator::Initialize() {
    80001e70:	ff010113          	addi	sp,sp,-16
    80001e74:	00813423          	sd	s0,8(sp)
    80001e78:	01010413          	addi	s0,sp,16
    freeMemHead = (FreeMemBlk*)HEAP_START_ADDR;
    80001e7c:	00009797          	auipc	a5,0x9
    80001e80:	7247b783          	ld	a5,1828(a5) # 8000b5a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e84:	0007b703          	ld	a4,0(a5)
    80001e88:	00009797          	auipc	a5,0x9
    80001e8c:	7ae7bc23          	sd	a4,1976(a5) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
    *freeMemHead = {
            nullptr,
            ((size_t)(HEAP_END_ADDR) - (size_t)(HEAP_START_ADDR) - sizeof(FreeMemBlk)) / MEM_BLOCK_SIZE
    80001e90:	00009797          	auipc	a5,0x9
    80001e94:	7387b783          	ld	a5,1848(a5) # 8000b5c8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001e98:	0007b783          	ld	a5,0(a5)
    80001e9c:	40e787b3          	sub	a5,a5,a4
    80001ea0:	ff078793          	addi	a5,a5,-16
    80001ea4:	0067d793          	srli	a5,a5,0x6
    *freeMemHead = {
    80001ea8:	00073023          	sd	zero,0(a4)
    80001eac:	00f73423          	sd	a5,8(a4)
    };
}
    80001eb0:	00813403          	ld	s0,8(sp)
    80001eb4:	01010113          	addi	sp,sp,16
    80001eb8:	00008067          	ret

0000000080001ebc <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80001ebc:	ff010113          	addi	sp,sp,-16
    80001ec0:	00813423          	sd	s0,8(sp)
    80001ec4:	01010413          	addi	s0,sp,16
    void* new_blk = nullptr;

    size_t needed_size = size + sizeof(FreeMemBlk);
    80001ec8:	01050513          	addi	a0,a0,16
    size_t size_in_blk = (needed_size / MEM_BLOCK_SIZE) + (needed_size % MEM_BLOCK_SIZE == 0 ? 0 : 1);
    80001ecc:	00655713          	srli	a4,a0,0x6
    80001ed0:	03f57513          	andi	a0,a0,63
    80001ed4:	00a03533          	snez	a0,a0
    80001ed8:	00a70733          	add	a4,a4,a0
    
    
    if (!freeMemHead) return nullptr;
    80001edc:	00009617          	auipc	a2,0x9
    80001ee0:	76463603          	ld	a2,1892(a2) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
    80001ee4:	0e060263          	beqz	a2,80001fc8 <_ZN15MemoryAllocator9mem_allocEm+0x10c>

    
    FreeMemBlk* prev = nullptr;
    FreeMemBlk* curr = freeMemHead;
    80001ee8:	00060513          	mv	a0,a2
    FreeMemBlk* prev = nullptr;
    80001eec:	00000693          	li	a3,0

    //First-fit
    while (curr) {
    80001ef0:	04050663          	beqz	a0,80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if (curr->size >= size_in_blk) {  //Found a big enough fragment
    80001ef4:	00853783          	ld	a5,8(a0)
    80001ef8:	00e7f863          	bgeu	a5,a4,80001f08 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                }
                new_blk = curr;
            }
            break;
        }
        prev = curr;
    80001efc:	00050693          	mv	a3,a0
        curr = curr->next;
    80001f00:	00053503          	ld	a0,0(a0)
    while (curr) {
    80001f04:	fedff06f          	j	80001ef0 <_ZN15MemoryAllocator9mem_allocEm+0x34>
            if (!prev) { //It's the first element in the list
    80001f08:	04068463          	beqz	a3,80001f50 <_ZN15MemoryAllocator9mem_allocEm+0x94>
            else if (!curr->next) { //It's the last element in the list
    80001f0c:	00053603          	ld	a2,0(a0)
    80001f10:	06060e63          	beqz	a2,80001f8c <_ZN15MemoryAllocator9mem_allocEm+0xd0>
                if (curr->size - size_in_blk > 0) {
    80001f14:	0ae78663          	beq	a5,a4,80001fc0 <_ZN15MemoryAllocator9mem_allocEm+0x104>
                    FreeMemBlk* newFreeFragmentAddr = curr + size_in_blk * MEM_BLOCK_SIZE;
    80001f18:	00a71793          	slli	a5,a4,0xa
    80001f1c:	00f507b3          	add	a5,a0,a5
                    prev->next = newFreeFragmentAddr;
    80001f20:	00f6b023          	sd	a5,0(a3)
                    newFreeFragmentAddr->size = curr->size - size_in_blk;
    80001f24:	00853683          	ld	a3,8(a0)
    80001f28:	40e686b3          	sub	a3,a3,a4
    80001f2c:	00d7b423          	sd	a3,8(a5)
                    newFreeFragmentAddr->next = curr->next;
    80001f30:	00053683          	ld	a3,0(a0)
    80001f34:	00d7b023          	sd	a3,0(a5)
                    curr->size = size_in_blk; // update the allocated fragment size
    80001f38:	00e53423          	sd	a4,8(a0)
    }

    return (new_blk ? ((FreeMemBlk*)new_blk + 1) : nullptr);
    80001f3c:	00050463          	beqz	a0,80001f44 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80001f40:	01050513          	addi	a0,a0,16
}
    80001f44:	00813403          	ld	s0,8(sp)
    80001f48:	01010113          	addi	sp,sp,16
    80001f4c:	00008067          	ret
                if (curr->size - size_in_blk > 0) {
    80001f50:	02e78663          	beq	a5,a4,80001f7c <_ZN15MemoryAllocator9mem_allocEm+0xc0>
                    freeMemHead = curr + size_in_blk * MEM_BLOCK_SIZE;
    80001f54:	00a71693          	slli	a3,a4,0xa
    80001f58:	00d506b3          	add	a3,a0,a3
    80001f5c:	00009617          	auipc	a2,0x9
    80001f60:	6ed63223          	sd	a3,1764(a2) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
                    freeMemHead->size = curr->size - size_in_blk;
    80001f64:	40e787b3          	sub	a5,a5,a4
    80001f68:	00f6b423          	sd	a5,8(a3)
                    freeMemHead->next = curr->next;
    80001f6c:	00053783          	ld	a5,0(a0)
    80001f70:	00f6b023          	sd	a5,0(a3)
                    curr->size = size_in_blk; //Update the new fragment size
    80001f74:	00e53423          	sd	a4,8(a0)
    80001f78:	fc5ff06f          	j	80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    freeMemHead = freeMemHead->next;
    80001f7c:	00063783          	ld	a5,0(a2)
    80001f80:	00009717          	auipc	a4,0x9
    80001f84:	6cf73023          	sd	a5,1728(a4) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
    80001f88:	fb5ff06f          	j	80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x80>
                if (curr->size - size_in_blk > 0) {
    80001f8c:	02e78663          	beq	a5,a4,80001fb8 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
                    FreeMemBlk* newFreeFragmentAddr = curr + size_in_blk * MEM_BLOCK_SIZE;
    80001f90:	00a71793          	slli	a5,a4,0xa
    80001f94:	00f507b3          	add	a5,a0,a5
                    prev->next = newFreeFragmentAddr;
    80001f98:	00f6b023          	sd	a5,0(a3)
                    newFreeFragmentAddr->size = curr->size - size_in_blk;
    80001f9c:	00853683          	ld	a3,8(a0)
    80001fa0:	40e686b3          	sub	a3,a3,a4
    80001fa4:	00d7b423          	sd	a3,8(a5)
                    newFreeFragmentAddr->next = curr->next;
    80001fa8:	00053683          	ld	a3,0(a0)
    80001fac:	00d7b023          	sd	a3,0(a5)
                    curr->size = size_in_blk; //Update the new fragment size
    80001fb0:	00e53423          	sd	a4,8(a0)
    80001fb4:	f89ff06f          	j	80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    prev->next = nullptr;
    80001fb8:	0006b023          	sd	zero,0(a3)
    80001fbc:	f81ff06f          	j	80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    prev->next = curr->next;
    80001fc0:	00c6b023          	sd	a2,0(a3)
    80001fc4:	f79ff06f          	j	80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x80>
    if (!freeMemHead) return nullptr;
    80001fc8:	00060513          	mv	a0,a2
    80001fcc:	f79ff06f          	j	80001f44 <_ZN15MemoryAllocator9mem_allocEm+0x88>

0000000080001fd0 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>:
    merge(prev);
    return 0;
}

//Implementation was taken from "OS1 KLK2 SEPT2015 2"
void MemoryAllocator::merge(FreeMemBlk* f) {
    80001fd0:	ff010113          	addi	sp,sp,-16
    80001fd4:	00813423          	sd	s0,8(sp)
    80001fd8:	01010413          	addi	s0,sp,16
    if (!f) return;
    80001fdc:	00050e63          	beqz	a0,80001ff8 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x28>
    if (f->next && (char*)f + f->size * MEM_BLOCK_SIZE == (char*)f->next) {
    80001fe0:	00053783          	ld	a5,0(a0)
    80001fe4:	00078a63          	beqz	a5,80001ff8 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x28>
    80001fe8:	00853683          	ld	a3,8(a0)
    80001fec:	00669713          	slli	a4,a3,0x6
    80001ff0:	00e50733          	add	a4,a0,a4
    80001ff4:	00e78863          	beq	a5,a4,80002004 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x34>
            // remove the fragment->next
            f->size += f->next->size;
            f->next = f->next->next;
    } else return;
}
    80001ff8:	00813403          	ld	s0,8(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret
            f->size += f->next->size;
    80002004:	0087b703          	ld	a4,8(a5)
    80002008:	00e686b3          	add	a3,a3,a4
    8000200c:	00d53423          	sd	a3,8(a0)
            f->next = f->next->next;
    80002010:	0007b783          	ld	a5,0(a5)
    80002014:	00f53023          	sd	a5,0(a0)
    80002018:	fe1ff06f          	j	80001ff8 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x28>

000000008000201c <_ZN15MemoryAllocator8mem_freeEPv>:
    if (!ptr) return -1;
    8000201c:	0e050663          	beqz	a0,80002108 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002020:	00050713          	mv	a4,a0
    FreeMemBlk* curr = freeMemHead;
    80002024:	00009797          	auipc	a5,0x9
    80002028:	61c7b783          	ld	a5,1564(a5) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
    FreeMemBlk* free_blk = (FreeMemBlk*)ptr - 1;
    8000202c:	ff050513          	addi	a0,a0,-16
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;
    80002030:	00009697          	auipc	a3,0x9
    80002034:	5706b683          	ld	a3,1392(a3) # 8000b5a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002038:	0006b683          	ld	a3,0(a3)
    8000203c:	0cd76a63          	bltu	a4,a3,80002110 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    80002040:	00009697          	auipc	a3,0x9
    80002044:	5886b683          	ld	a3,1416(a3) # 8000b5c8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002048:	0006b683          	ld	a3,0(a3)
    8000204c:	0cd77663          	bgeu	a4,a3,80002118 <_ZN15MemoryAllocator8mem_freeEPv+0xfc>
    if (!curr) {
    80002050:	02078a63          	beqz	a5,80002084 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
int MemoryAllocator::mem_free(void *ptr) {
    80002054:	fe010113          	addi	sp,sp,-32
    80002058:	00113c23          	sd	ra,24(sp)
    8000205c:	00813823          	sd	s0,16(sp)
    80002060:	00913423          	sd	s1,8(sp)
    80002064:	02010413          	addi	s0,sp,32
    if (free_blk < curr) {
    80002068:	02f56863          	bltu	a0,a5,80002098 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    FreeMemBlk* prev = nullptr;
    8000206c:	00000493          	li	s1,0
    while (curr != nullptr && free_blk > curr) {
    80002070:	04078263          	beqz	a5,800020b4 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    80002074:	04a7f063          	bgeu	a5,a0,800020b4 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
        prev = curr;
    80002078:	00078493          	mv	s1,a5
        curr = curr->next;
    8000207c:	0007b783          	ld	a5,0(a5)
    while (curr != nullptr && free_blk > curr) {
    80002080:	ff1ff06f          	j	80002070 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
        freeMemHead = free_blk;
    80002084:	00009797          	auipc	a5,0x9
    80002088:	5aa7be23          	sd	a0,1468(a5) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
        free_blk->next = nullptr;
    8000208c:	fe073823          	sd	zero,-16(a4)
        return 0;
    80002090:	00000513          	li	a0,0
    80002094:	00008067          	ret
        free_blk->next = freeMemHead;
    80002098:	fef73823          	sd	a5,-16(a4)
        freeMemHead = free_blk;
    8000209c:	00009797          	auipc	a5,0x9
    800020a0:	5aa7b223          	sd	a0,1444(a5) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
        merge(freeMemHead);
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	f2c080e7          	jalr	-212(ra) # 80001fd0 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
        return 0;
    800020ac:	00000513          	li	a0,0
    800020b0:	0280006f          	j	800020d8 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    if (curr == nullptr) {
    800020b4:	02078c63          	beqz	a5,800020ec <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    prev->next = free_blk;
    800020b8:	00a4b023          	sd	a0,0(s1)
    free_blk->next = curr;
    800020bc:	fef73823          	sd	a5,-16(a4)
    merge(free_blk);
    800020c0:	00000097          	auipc	ra,0x0
    800020c4:	f10080e7          	jalr	-240(ra) # 80001fd0 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
    merge(prev);
    800020c8:	00048513          	mv	a0,s1
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	f04080e7          	jalr	-252(ra) # 80001fd0 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
    return 0;
    800020d4:	00000513          	li	a0,0
}
    800020d8:	01813083          	ld	ra,24(sp)
    800020dc:	01013403          	ld	s0,16(sp)
    800020e0:	00813483          	ld	s1,8(sp)
    800020e4:	02010113          	addi	sp,sp,32
    800020e8:	00008067          	ret
        prev->next = free_blk;
    800020ec:	00a4b023          	sd	a0,0(s1)
        free_blk->next = nullptr;
    800020f0:	fe073823          	sd	zero,-16(a4)
        merge(prev);
    800020f4:	00048513          	mv	a0,s1
    800020f8:	00000097          	auipc	ra,0x0
    800020fc:	ed8080e7          	jalr	-296(ra) # 80001fd0 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
        return 0;
    80002100:	00000513          	li	a0,0
    80002104:	fd5ff06f          	j	800020d8 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    if (!ptr) return -1;
    80002108:	fff00513          	li	a0,-1
    8000210c:	00008067          	ret
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;
    80002110:	fff00513          	li	a0,-1
    80002114:	00008067          	ret
    80002118:	fff00513          	li	a0,-1
}
    8000211c:	00008067          	ret

0000000080002120 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv>:

size_t MemoryAllocator::mem_get_largest_free_block() {
    80002120:	ff010113          	addi	sp,sp,-16
    80002124:	00813423          	sd	s0,8(sp)
    80002128:	01010413          	addi	s0,sp,16
    FreeMemBlk *ptr=freeMemHead;
    8000212c:	00009797          	auipc	a5,0x9
    80002130:	5147b783          	ld	a5,1300(a5) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
    size_t max_size=0;
    80002134:	00000513          	li	a0,0
    80002138:	0080006f          	j	80002140 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x20>
    while (ptr) {
        if (ptr->size>max_size) {
            max_size=ptr->size;
        }
        ptr=ptr->next;
    8000213c:	0007b783          	ld	a5,0(a5)
    while (ptr) {
    80002140:	00078a63          	beqz	a5,80002154 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x34>
        if (ptr->size>max_size) {
    80002144:	0087b703          	ld	a4,8(a5)
    80002148:	fee57ae3          	bgeu	a0,a4,8000213c <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x1c>
            max_size=ptr->size;
    8000214c:	00070513          	mv	a0,a4
    80002150:	fedff06f          	j	8000213c <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x1c>
    }
    return max_size*MEM_BLOCK_SIZE;
}
    80002154:	00651513          	slli	a0,a0,0x6
    80002158:	00813403          	ld	s0,8(sp)
    8000215c:	01010113          	addi	sp,sp,16
    80002160:	00008067          	ret

0000000080002164 <_ZN15MemoryAllocator18mem_get_free_spaceEv>:
size_t MemoryAllocator::mem_get_free_space() {
    80002164:	ff010113          	addi	sp,sp,-16
    80002168:	00813423          	sd	s0,8(sp)
    8000216c:	01010413          	addi	s0,sp,16
    FreeMemBlk *ptr=freeMemHead;
    80002170:	00009797          	auipc	a5,0x9
    80002174:	4d07b783          	ld	a5,1232(a5) # 8000b640 <_ZN15MemoryAllocator11freeMemHeadE>
    size_t space=0;
    80002178:	00000513          	li	a0,0
    while (ptr) {
    8000217c:	00078a63          	beqz	a5,80002190 <_ZN15MemoryAllocator18mem_get_free_spaceEv+0x2c>
        space+=ptr->size;
    80002180:	0087b703          	ld	a4,8(a5)
    80002184:	00e50533          	add	a0,a0,a4
        ptr=ptr->next;
    80002188:	0007b783          	ld	a5,0(a5)
    while (ptr) {
    8000218c:	ff1ff06f          	j	8000217c <_ZN15MemoryAllocator18mem_get_free_spaceEv+0x18>
    }
    return space*MEM_BLOCK_SIZE;
    80002190:	00651513          	slli	a0,a0,0x6
    80002194:	00813403          	ld	s0,8(sp)
    80002198:	01010113          	addi	sp,sp,16
    8000219c:	00008067          	ret

00000000800021a0 <_ZN6Thread10runWrapperEPv>:

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

void Thread::runWrapper(void* thisObj) {
    800021a0:	ff010113          	addi	sp,sp,-16
    800021a4:	00113423          	sd	ra,8(sp)
    800021a8:	00813023          	sd	s0,0(sp)
    800021ac:	01010413          	addi	s0,sp,16
    ((Thread*)thisObj)->run();
    800021b0:	00053783          	ld	a5,0(a0)
    800021b4:	0107b783          	ld	a5,16(a5)
    800021b8:	000780e7          	jalr	a5
}
    800021bc:	00813083          	ld	ra,8(sp)
    800021c0:	00013403          	ld	s0,0(sp)
    800021c4:	01010113          	addi	sp,sp,16
    800021c8:	00008067          	ret

00000000800021cc <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore() {
    800021cc:	ff010113          	addi	sp,sp,-16
    800021d0:	00113423          	sd	ra,8(sp)
    800021d4:	00813023          	sd	s0,0(sp)
    800021d8:	01010413          	addi	s0,sp,16
    800021dc:	00009797          	auipc	a5,0x9
    800021e0:	1cc78793          	addi	a5,a5,460 # 8000b3a8 <_ZTV9Semaphore+0x10>
    800021e4:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800021e8:	00853503          	ld	a0,8(a0)
    800021ec:	fffff097          	auipc	ra,0xfffff
    800021f0:	3a0080e7          	jalr	928(ra) # 8000158c <_Z9sem_closeP3Sem>
}
    800021f4:	00813083          	ld	ra,8(sp)
    800021f8:	00013403          	ld	s0,0(sp)
    800021fc:	01010113          	addi	sp,sp,16
    80002200:	00008067          	ret

0000000080002204 <_Znwm>:
void *operator new(size_t size) {
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00113423          	sd	ra,8(sp)
    8000220c:	00813023          	sd	s0,0(sp)
    80002210:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002214:	fffff097          	auipc	ra,0xfffff
    80002218:	044080e7          	jalr	68(ra) # 80001258 <_Z9mem_allocm>
}
    8000221c:	00813083          	ld	ra,8(sp)
    80002220:	00013403          	ld	s0,0(sp)
    80002224:	01010113          	addi	sp,sp,16
    80002228:	00008067          	ret

000000008000222c <_Znam>:
void *operator new[](size_t size) {
    8000222c:	ff010113          	addi	sp,sp,-16
    80002230:	00113423          	sd	ra,8(sp)
    80002234:	00813023          	sd	s0,0(sp)
    80002238:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000223c:	fffff097          	auipc	ra,0xfffff
    80002240:	01c080e7          	jalr	28(ra) # 80001258 <_Z9mem_allocm>
}
    80002244:	00813083          	ld	ra,8(sp)
    80002248:	00013403          	ld	s0,0(sp)
    8000224c:	01010113          	addi	sp,sp,16
    80002250:	00008067          	ret

0000000080002254 <_ZdlPv>:
void operator delete(void *mem) noexcept {
    80002254:	ff010113          	addi	sp,sp,-16
    80002258:	00113423          	sd	ra,8(sp)
    8000225c:	00813023          	sd	s0,0(sp)
    80002260:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80002264:	fffff097          	auipc	ra,0xfffff
    80002268:	060080e7          	jalr	96(ra) # 800012c4 <_Z8mem_freePv>
}
    8000226c:	00813083          	ld	ra,8(sp)
    80002270:	00013403          	ld	s0,0(sp)
    80002274:	01010113          	addi	sp,sp,16
    80002278:	00008067          	ret

000000008000227c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000227c:	fe010113          	addi	sp,sp,-32
    80002280:	00113c23          	sd	ra,24(sp)
    80002284:	00813823          	sd	s0,16(sp)
    80002288:	00913423          	sd	s1,8(sp)
    8000228c:	02010413          	addi	s0,sp,32
    80002290:	00050493          	mv	s1,a0
}
    80002294:	00000097          	auipc	ra,0x0
    80002298:	f38080e7          	jalr	-200(ra) # 800021cc <_ZN9SemaphoreD1Ev>
    8000229c:	00048513          	mv	a0,s1
    800022a0:	00000097          	auipc	ra,0x0
    800022a4:	fb4080e7          	jalr	-76(ra) # 80002254 <_ZdlPv>
    800022a8:	01813083          	ld	ra,24(sp)
    800022ac:	01013403          	ld	s0,16(sp)
    800022b0:	00813483          	ld	s1,8(sp)
    800022b4:	02010113          	addi	sp,sp,32
    800022b8:	00008067          	ret

00000000800022bc <_ZdaPv>:
void operator delete[](void *mem) noexcept {
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00113423          	sd	ra,8(sp)
    800022c4:	00813023          	sd	s0,0(sp)
    800022c8:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800022cc:	fffff097          	auipc	ra,0xfffff
    800022d0:	ff8080e7          	jalr	-8(ra) # 800012c4 <_Z8mem_freePv>
}
    800022d4:	00813083          	ld	ra,8(sp)
    800022d8:	00013403          	ld	s0,0(sp)
    800022dc:	01010113          	addi	sp,sp,16
    800022e0:	00008067          	ret

00000000800022e4 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800022e4:	fe010113          	addi	sp,sp,-32
    800022e8:	00113c23          	sd	ra,24(sp)
    800022ec:	00813823          	sd	s0,16(sp)
    800022f0:	00913423          	sd	s1,8(sp)
    800022f4:	02010413          	addi	s0,sp,32
    800022f8:	00009797          	auipc	a5,0x9
    800022fc:	08878793          	addi	a5,a5,136 # 8000b380 <_ZTV6Thread+0x10>
    80002300:	00f53023          	sd	a5,0(a0)
    if (myHandle->isFinished()) delete myHandle;
    80002304:	00853483          	ld	s1,8(a0)
    bool isFinished() const {return finished;}
    80002308:	0284c783          	lbu	a5,40(s1)
    8000230c:	02078263          	beqz	a5,80002330 <_ZN6ThreadD1Ev+0x4c>
    80002310:	02048063          	beqz	s1,80002330 <_ZN6ThreadD1Ev+0x4c>
    ~TCB(){delete[] stack;}
    80002314:	0084b503          	ld	a0,8(s1)
    80002318:	00050663          	beqz	a0,80002324 <_ZN6ThreadD1Ev+0x40>
    8000231c:	00000097          	auipc	ra,0x0
    80002320:	fa0080e7          	jalr	-96(ra) # 800022bc <_ZdaPv>
    80002324:	00048513          	mv	a0,s1
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	f2c080e7          	jalr	-212(ra) # 80002254 <_ZdlPv>
}
    80002330:	01813083          	ld	ra,24(sp)
    80002334:	01013403          	ld	s0,16(sp)
    80002338:	00813483          	ld	s1,8(sp)
    8000233c:	02010113          	addi	sp,sp,32
    80002340:	00008067          	ret

0000000080002344 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002344:	fe010113          	addi	sp,sp,-32
    80002348:	00113c23          	sd	ra,24(sp)
    8000234c:	00813823          	sd	s0,16(sp)
    80002350:	00913423          	sd	s1,8(sp)
    80002354:	02010413          	addi	s0,sp,32
    80002358:	00050493          	mv	s1,a0
}
    8000235c:	00000097          	auipc	ra,0x0
    80002360:	f88080e7          	jalr	-120(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80002364:	00048513          	mv	a0,s1
    80002368:	00000097          	auipc	ra,0x0
    8000236c:	eec080e7          	jalr	-276(ra) # 80002254 <_ZdlPv>
    80002370:	01813083          	ld	ra,24(sp)
    80002374:	01013403          	ld	s0,16(sp)
    80002378:	00813483          	ld	s1,8(sp)
    8000237c:	02010113          	addi	sp,sp,32
    80002380:	00008067          	ret

0000000080002384 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002384:	ff010113          	addi	sp,sp,-16
    80002388:	00813423          	sd	s0,8(sp)
    8000238c:	01010413          	addi	s0,sp,16
    80002390:	00009797          	auipc	a5,0x9
    80002394:	ff078793          	addi	a5,a5,-16 # 8000b380 <_ZTV6Thread+0x10>
    80002398:	00f53023          	sd	a5,0(a0)
    this->body = body;
    8000239c:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800023a0:	00c53c23          	sd	a2,24(a0)
    this->myHandle = nullptr;
    800023a4:	00053423          	sd	zero,8(a0)
}
    800023a8:	00813403          	ld	s0,8(sp)
    800023ac:	01010113          	addi	sp,sp,16
    800023b0:	00008067          	ret

00000000800023b4 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800023b4:	ff010113          	addi	sp,sp,-16
    800023b8:	00813423          	sd	s0,8(sp)
    800023bc:	01010413          	addi	s0,sp,16
    800023c0:	00009797          	auipc	a5,0x9
    800023c4:	fc078793          	addi	a5,a5,-64 # 8000b380 <_ZTV6Thread+0x10>
    800023c8:	00f53023          	sd	a5,0(a0)
    this->body = runWrapper;
    800023cc:	00000797          	auipc	a5,0x0
    800023d0:	dd478793          	addi	a5,a5,-556 # 800021a0 <_ZN6Thread10runWrapperEPv>
    800023d4:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    800023d8:	00a53c23          	sd	a0,24(a0)
    this->myHandle = nullptr;
    800023dc:	00053423          	sd	zero,8(a0)
}
    800023e0:	00813403          	ld	s0,8(sp)
    800023e4:	01010113          	addi	sp,sp,16
    800023e8:	00008067          	ret

00000000800023ec <_ZN6Thread5startEv>:
int Thread::start() {
    800023ec:	fe010113          	addi	sp,sp,-32
    800023f0:	00113c23          	sd	ra,24(sp)
    800023f4:	00813823          	sd	s0,16(sp)
    800023f8:	00913423          	sd	s1,8(sp)
    800023fc:	02010413          	addi	s0,sp,32
    80002400:	00050493          	mv	s1,a0
    thread_create(&this->myHandle, this->body, this->arg);
    80002404:	01853603          	ld	a2,24(a0)
    80002408:	01053583          	ld	a1,16(a0)
    8000240c:	00850513          	addi	a0,a0,8
    80002410:	fffff097          	auipc	ra,0xfffff
    80002414:	fc4080e7          	jalr	-60(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    if (this->myHandle) return 0;
    80002418:	0084b783          	ld	a5,8(s1)
    8000241c:	00078e63          	beqz	a5,80002438 <_ZN6Thread5startEv+0x4c>
    80002420:	00000513          	li	a0,0
}
    80002424:	01813083          	ld	ra,24(sp)
    80002428:	01013403          	ld	s0,16(sp)
    8000242c:	00813483          	ld	s1,8(sp)
    80002430:	02010113          	addi	sp,sp,32
    80002434:	00008067          	ret
    else return -1;
    80002438:	fff00513          	li	a0,-1
    8000243c:	fe9ff06f          	j	80002424 <_ZN6Thread5startEv+0x38>

0000000080002440 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002440:	ff010113          	addi	sp,sp,-16
    80002444:	00113423          	sd	ra,8(sp)
    80002448:	00813023          	sd	s0,0(sp)
    8000244c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002450:	fffff097          	auipc	ra,0xfffff
    80002454:	090080e7          	jalr	144(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80002458:	00813083          	ld	ra,8(sp)
    8000245c:	00013403          	ld	s0,0(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00113423          	sd	ra,8(sp)
    80002470:	00813023          	sd	s0,0(sp)
    80002474:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	24c080e7          	jalr	588(ra) # 800016c4 <_Z10time_sleepm>
}
    80002480:	00813083          	ld	ra,8(sp)
    80002484:	00013403          	ld	s0,0(sp)
    80002488:	01010113          	addi	sp,sp,16
    8000248c:	00008067          	ret

0000000080002490 <_ZN14PeriodicThread3runEv>:

void PeriodicThread::terminate() {
    period = 0;
}

void PeriodicThread::run() {
    80002490:	fe010113          	addi	sp,sp,-32
    80002494:	00113c23          	sd	ra,24(sp)
    80002498:	00813823          	sd	s0,16(sp)
    8000249c:	00913423          	sd	s1,8(sp)
    800024a0:	02010413          	addi	s0,sp,32
    800024a4:	00050493          	mv	s1,a0
    while (period != 0) {
    800024a8:	0204b783          	ld	a5,32(s1)
    800024ac:	02078263          	beqz	a5,800024d0 <_ZN14PeriodicThread3runEv+0x40>
        periodicActivation();
    800024b0:	0004b783          	ld	a5,0(s1)
    800024b4:	0187b783          	ld	a5,24(a5)
    800024b8:	00048513          	mv	a0,s1
    800024bc:	000780e7          	jalr	a5
        if (Thread::sleep(period) < 0) break;
    800024c0:	0204b503          	ld	a0,32(s1)
    800024c4:	00000097          	auipc	ra,0x0
    800024c8:	fa4080e7          	jalr	-92(ra) # 80002468 <_ZN6Thread5sleepEm>
    800024cc:	fc055ee3          	bgez	a0,800024a8 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    800024d0:	01813083          	ld	ra,24(sp)
    800024d4:	01013403          	ld	s0,16(sp)
    800024d8:	00813483          	ld	s1,8(sp)
    800024dc:	02010113          	addi	sp,sp,32
    800024e0:	00008067          	ret

00000000800024e4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800024e4:	ff010113          	addi	sp,sp,-16
    800024e8:	00113423          	sd	ra,8(sp)
    800024ec:	00813023          	sd	s0,0(sp)
    800024f0:	01010413          	addi	s0,sp,16
    800024f4:	00009797          	auipc	a5,0x9
    800024f8:	eb478793          	addi	a5,a5,-332 # 8000b3a8 <_ZTV9Semaphore+0x10>
    800024fc:	00f53023          	sd	a5,0(a0)
    sem_open(&this->myHandle, init);
    80002500:	00850513          	addi	a0,a0,8
    80002504:	fffff097          	auipc	ra,0xfffff
    80002508:	01c080e7          	jalr	28(ra) # 80001520 <_Z8sem_openPP3Semj>
}
    8000250c:	00813083          	ld	ra,8(sp)
    80002510:	00013403          	ld	s0,0(sp)
    80002514:	01010113          	addi	sp,sp,16
    80002518:	00008067          	ret

000000008000251c <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    8000251c:	ff010113          	addi	sp,sp,-16
    80002520:	00113423          	sd	ra,8(sp)
    80002524:	00813023          	sd	s0,0(sp)
    80002528:	01010413          	addi	s0,sp,16
    return sem_wait(this->myHandle);
    8000252c:	00853503          	ld	a0,8(a0)
    80002530:	fffff097          	auipc	ra,0xfffff
    80002534:	0c4080e7          	jalr	196(ra) # 800015f4 <_Z8sem_waitP3Sem>
}
    80002538:	00813083          	ld	ra,8(sp)
    8000253c:	00013403          	ld	s0,0(sp)
    80002540:	01010113          	addi	sp,sp,16
    80002544:	00008067          	ret

0000000080002548 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002548:	ff010113          	addi	sp,sp,-16
    8000254c:	00113423          	sd	ra,8(sp)
    80002550:	00813023          	sd	s0,0(sp)
    80002554:	01010413          	addi	s0,sp,16
    return sem_signal(this->myHandle);
    80002558:	00853503          	ld	a0,8(a0)
    8000255c:	fffff097          	auipc	ra,0xfffff
    80002560:	100080e7          	jalr	256(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80002564:	00813083          	ld	ra,8(sp)
    80002568:	00013403          	ld	s0,0(sp)
    8000256c:	01010113          	addi	sp,sp,16
    80002570:	00008067          	ret

0000000080002574 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period): Thread() {
    80002574:	fe010113          	addi	sp,sp,-32
    80002578:	00113c23          	sd	ra,24(sp)
    8000257c:	00813823          	sd	s0,16(sp)
    80002580:	00913423          	sd	s1,8(sp)
    80002584:	01213023          	sd	s2,0(sp)
    80002588:	02010413          	addi	s0,sp,32
    8000258c:	00050493          	mv	s1,a0
    80002590:	00058913          	mv	s2,a1
    80002594:	00000097          	auipc	ra,0x0
    80002598:	e20080e7          	jalr	-480(ra) # 800023b4 <_ZN6ThreadC1Ev>
    8000259c:	00009797          	auipc	a5,0x9
    800025a0:	e2c78793          	addi	a5,a5,-468 # 8000b3c8 <_ZTV14PeriodicThread+0x10>
    800025a4:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    800025a8:	0324b023          	sd	s2,32(s1)
}
    800025ac:	01813083          	ld	ra,24(sp)
    800025b0:	01013403          	ld	s0,16(sp)
    800025b4:	00813483          	ld	s1,8(sp)
    800025b8:	00013903          	ld	s2,0(sp)
    800025bc:	02010113          	addi	sp,sp,32
    800025c0:	00008067          	ret

00000000800025c4 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    800025c4:	ff010113          	addi	sp,sp,-16
    800025c8:	00813423          	sd	s0,8(sp)
    800025cc:	01010413          	addi	s0,sp,16
    period = 0;
    800025d0:	02053023          	sd	zero,32(a0)
}
    800025d4:	00813403          	ld	s0,8(sp)
    800025d8:	01010113          	addi	sp,sp,16
    800025dc:	00008067          	ret

00000000800025e0 <_ZN7Console4getcEv>:

char Console::getc() {
    800025e0:	ff010113          	addi	sp,sp,-16
    800025e4:	00113423          	sd	ra,8(sp)
    800025e8:	00813023          	sd	s0,0(sp)
    800025ec:	01010413          	addi	s0,sp,16
    return ::getc();
    800025f0:	fffff097          	auipc	ra,0xfffff
    800025f4:	124080e7          	jalr	292(ra) # 80001714 <_Z4getcv>
}
    800025f8:	00813083          	ld	ra,8(sp)
    800025fc:	00013403          	ld	s0,0(sp)
    80002600:	01010113          	addi	sp,sp,16
    80002604:	00008067          	ret

0000000080002608 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002608:	ff010113          	addi	sp,sp,-16
    8000260c:	00113423          	sd	ra,8(sp)
    80002610:	00813023          	sd	s0,0(sp)
    80002614:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002618:	fffff097          	auipc	ra,0xfffff
    8000261c:	158080e7          	jalr	344(ra) # 80001770 <_Z4putcc>
}
    80002620:	00813083          	ld	ra,8(sp)
    80002624:	00013403          	ld	s0,0(sp)
    80002628:	01010113          	addi	sp,sp,16
    8000262c:	00008067          	ret

0000000080002630 <_ZN6Thread3runEv>:

    static void runWrapper(void*);
    thread_t getMyHandle() const { return myHandle; }
protected:
    Thread();
    virtual void run() {}
    80002630:	ff010113          	addi	sp,sp,-16
    80002634:	00813423          	sd	s0,8(sp)
    80002638:	01010413          	addi	s0,sp,16
    8000263c:	00813403          	ld	s0,8(sp)
    80002640:	01010113          	addi	sp,sp,16
    80002644:	00008067          	ret

0000000080002648 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate();

protected:
    PeriodicThread(time_t period);
    virtual void periodicActivation () {}
    80002648:	ff010113          	addi	sp,sp,-16
    8000264c:	00813423          	sd	s0,8(sp)
    80002650:	01010413          	addi	s0,sp,16
    80002654:	00813403          	ld	s0,8(sp)
    80002658:	01010113          	addi	sp,sp,16
    8000265c:	00008067          	ret

0000000080002660 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002660:	ff010113          	addi	sp,sp,-16
    80002664:	00113423          	sd	ra,8(sp)
    80002668:	00813023          	sd	s0,0(sp)
    8000266c:	01010413          	addi	s0,sp,16
    80002670:	00009797          	auipc	a5,0x9
    80002674:	d5878793          	addi	a5,a5,-680 # 8000b3c8 <_ZTV14PeriodicThread+0x10>
    80002678:	00f53023          	sd	a5,0(a0)
    8000267c:	00000097          	auipc	ra,0x0
    80002680:	c68080e7          	jalr	-920(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80002684:	00813083          	ld	ra,8(sp)
    80002688:	00013403          	ld	s0,0(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN14PeriodicThreadD0Ev>:
    80002694:	fe010113          	addi	sp,sp,-32
    80002698:	00113c23          	sd	ra,24(sp)
    8000269c:	00813823          	sd	s0,16(sp)
    800026a0:	00913423          	sd	s1,8(sp)
    800026a4:	02010413          	addi	s0,sp,32
    800026a8:	00050493          	mv	s1,a0
    800026ac:	00009797          	auipc	a5,0x9
    800026b0:	d1c78793          	addi	a5,a5,-740 # 8000b3c8 <_ZTV14PeriodicThread+0x10>
    800026b4:	00f53023          	sd	a5,0(a0)
    800026b8:	00000097          	auipc	ra,0x0
    800026bc:	c2c080e7          	jalr	-980(ra) # 800022e4 <_ZN6ThreadD1Ev>
    800026c0:	00048513          	mv	a0,s1
    800026c4:	00000097          	auipc	ra,0x0
    800026c8:	b90080e7          	jalr	-1136(ra) # 80002254 <_ZdlPv>
    800026cc:	01813083          	ld	ra,24(sp)
    800026d0:	01013403          	ld	s0,16(sp)
    800026d4:	00813483          	ld	s1,8(sp)
    800026d8:	02010113          	addi	sp,sp,32
    800026dc:	00008067          	ret

00000000800026e0 <_ZN5RISCV10popSppSpieEv>:
#include "../h/print.hpp"
#include "../h/Scheduler.hpp"
#include "../lib/console.h"


void RISCV::popSppSpie() {
    800026e0:	ff010113          	addi	sp,sp,-16
    800026e4:	00813423          	sd	s0,8(sp)
    800026e8:	01010413          	addi	s0,sp,16
    // mc_sstatus(SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    800026ec:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800026f0:	10200073          	sret
}
    800026f4:	00813403          	ld	s0,8(sp)
    800026f8:	01010113          	addi	sp,sp,16
    800026fc:	00008067          	ret

0000000080002700 <_ZN5RISCV20handleSupervisorTrapEv>:

/*void RISCV::systemPopSppSpie() {
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}*/
void RISCV::handleSupervisorTrap() {
    80002700:	fb010113          	addi	sp,sp,-80
    80002704:	04113423          	sd	ra,72(sp)
    80002708:	04813023          	sd	s0,64(sp)
    8000270c:	02913c23          	sd	s1,56(sp)
    80002710:	03213823          	sd	s2,48(sp)
    80002714:	05010413          	addi	s0,sp,80
    return scause;
    80002718:	142027f3          	csrr	a5,scause
    8000271c:	faf43c23          	sd	a5,-72(s0)
}
    80002720:	fb843703          	ld	a4,-72(s0)
    uint64  scause = r_scause();
    if (scause==0x0000000000000009UL) {
    80002724:	00900793          	li	a5,9
    80002728:	02f70e63          	beq	a4,a5,80002764 <_ZN5RISCV20handleSupervisorTrapEv+0x64>
        w_sstatus(sstatus);
        w_sepc(sepc);
        //w_scause(scause);
    }

    else if (scause == 0x8000000000000001UL) {
    8000272c:	fff00793          	li	a5,-1
    80002730:	03f79793          	slli	a5,a5,0x3f
    80002734:	00178793          	addi	a5,a5,1
    80002738:	06f70463          	beq	a4,a5,800027a0 <_ZN5RISCV20handleSupervisorTrapEv+0xa0>
        }
        mc_sip(SIP_SSIP);


    }
    else if (scause == 0x8000000000000009UL) {
    8000273c:	fff00793          	li	a5,-1
    80002740:	03f79793          	slli	a5,a5,0x3f
    80002744:	00978793          	addi	a5,a5,9
    80002748:	0cf70263          	beq	a4,a5,8000280c <_ZN5RISCV20handleSupervisorTrapEv+0x10c>
        //printIntS(scause);
       // printString("\n sepc: ");
        //printIntS(sepc);
       // while (true) {}
    }
}
    8000274c:	04813083          	ld	ra,72(sp)
    80002750:	04013403          	ld	s0,64(sp)
    80002754:	03813483          	ld	s1,56(sp)
    80002758:	03013903          	ld	s2,48(sp)
    8000275c:	05010113          	addi	sp,sp,80
    80002760:	00008067          	ret
    return sepc;
    80002764:	141027f3          	csrr	a5,sepc
    80002768:	fcf43423          	sd	a5,-56(s0)
}
    8000276c:	fc843483          	ld	s1,-56(s0)
        uint64  sepc = r_sepc()+4;
    80002770:	00448493          	addi	s1,s1,4
    return sstatus;
    80002774:	100027f3          	csrr	a5,sstatus
    80002778:	fcf43023          	sd	a5,-64(s0)
}
    8000277c:	fc043903          	ld	s2,-64(s0)
        TCB::timeSliceCounter = 0;
    80002780:	00009797          	auipc	a5,0x9
    80002784:	e287b783          	ld	a5,-472(a5) # 8000b5a8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002788:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    8000278c:	00000097          	auipc	ra,0x0
    80002790:	1f4080e7          	jalr	500(ra) # 80002980 <_ZN3TCB8dispatchEv>
}
    80002794:	10091073          	csrw	sstatus,s2
}
    80002798:	14149073          	csrw	sepc,s1

    8000279c:	fb1ff06f          	j	8000274c <_ZN5RISCV20handleSupervisorTrapEv+0x4c>
        TCB::timeSliceCounter++;
    800027a0:	00009717          	auipc	a4,0x9
    800027a4:	e0873703          	ld	a4,-504(a4) # 8000b5a8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800027a8:	00073783          	ld	a5,0(a4)
    800027ac:	00178793          	addi	a5,a5,1
    800027b0:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter>=TCB::running->time_slice()) {
    800027b4:	00009717          	auipc	a4,0x9
    800027b8:	e0c73703          	ld	a4,-500(a4) # 8000b5c0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800027bc:	00073703          	ld	a4,0(a4)
        return timeSlice;
    800027c0:	02073703          	ld	a4,32(a4)
    800027c4:	00e7f863          	bgeu	a5,a4,800027d4 <_ZN5RISCV20handleSupervisorTrapEv+0xd4>
}
    800027c8:	00200793          	li	a5,2
    800027cc:	1447b073          	csrc	sip,a5

    800027d0:	f7dff06f          	j	8000274c <_ZN5RISCV20handleSupervisorTrapEv+0x4c>
    return sepc;
    800027d4:	141027f3          	csrr	a5,sepc
    800027d8:	fcf43c23          	sd	a5,-40(s0)
}
    800027dc:	fd843483          	ld	s1,-40(s0)
    return sstatus;
    800027e0:	100027f3          	csrr	a5,sstatus
    800027e4:	fcf43823          	sd	a5,-48(s0)
}
    800027e8:	fd043903          	ld	s2,-48(s0)
            TCB::timeSliceCounter = 0;
    800027ec:	00009797          	auipc	a5,0x9
    800027f0:	dbc7b783          	ld	a5,-580(a5) # 8000b5a8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800027f4:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	188080e7          	jalr	392(ra) # 80002980 <_ZN3TCB8dispatchEv>
}
    80002800:	10091073          	csrw	sstatus,s2
}
    80002804:	14149073          	csrw	sepc,s1

    80002808:	fc1ff06f          	j	800027c8 <_ZN5RISCV20handleSupervisorTrapEv+0xc8>
        console_handler();
    8000280c:	00006097          	auipc	ra,0x6
    80002810:	b24080e7          	jalr	-1244(ra) # 80008330 <console_handler>
}
    80002814:	f39ff06f          	j	8000274c <_ZN5RISCV20handleSupervisorTrapEv+0x4c>

0000000080002818 <_ZN3TCB12createThreadEPFvvE>:

TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter=0;

// For original signature
TCB *TCB::createThread(Body body) {
    80002818:	fe010113          	addi	sp,sp,-32
    8000281c:	00113c23          	sd	ra,24(sp)
    80002820:	00813823          	sd	s0,16(sp)
    80002824:	00913423          	sd	s1,8(sp)
    80002828:	01213023          	sd	s2,0(sp)
    8000282c:	02010413          	addi	s0,sp,32
    80002830:	00050913          	mv	s2,a0
        return MemoryAllocator::mem_alloc(size);
    80002834:	03000513          	li	a0,48
    80002838:	fffff097          	auipc	ra,0xfffff
    8000283c:	684080e7          	jalr	1668(ra) # 80001ebc <_ZN15MemoryAllocator9mem_allocEm>
    80002840:	00050493          	mv	s1,a0
context({(uint64) &threadWrapper,
stack!=nullptr?(uint64)&stack[STACK_SIZE]:0,

}),
    timeSlice(timeSlice),
finished(false)
    80002844:	01253023          	sd	s2,0(a0)
    stack(body!=nullptr?new uint64[STACK_SIZE]:nullptr),
    80002848:	00090a63          	beqz	s2,8000285c <_ZN3TCB12createThreadEPFvvE+0x44>
    8000284c:	00002537          	lui	a0,0x2
    80002850:	00000097          	auipc	ra,0x0
    80002854:	9dc080e7          	jalr	-1572(ra) # 8000222c <_Znam>
    80002858:	0080006f          	j	80002860 <_ZN3TCB12createThreadEPFvvE+0x48>
    8000285c:	00000513          	li	a0,0
finished(false)
    80002860:	00a4b423          	sd	a0,8(s1)
    80002864:	00000797          	auipc	a5,0x0
    80002868:	0c478793          	addi	a5,a5,196 # 80002928 <_ZN3TCB13threadWrapperEv>
    8000286c:	00f4b823          	sd	a5,16(s1)
stack!=nullptr?(uint64)&stack[STACK_SIZE]:0,
    80002870:	02050863          	beqz	a0,800028a0 <_ZN3TCB12createThreadEPFvvE+0x88>
    80002874:	000027b7          	lui	a5,0x2
    80002878:	00f507b3          	add	a5,a0,a5
finished(false)
    8000287c:	00f4bc23          	sd	a5,24(s1)
    80002880:	00200793          	li	a5,2
    80002884:	02f4b023          	sd	a5,32(s1)
    80002888:	02048423          	sb	zero,40(s1)
{if(body!=nullptr) {
    8000288c:	02090c63          	beqz	s2,800028c4 <_ZN3TCB12createThreadEPFvvE+0xac>
Scheduler::put(this);
    80002890:	00048513          	mv	a0,s1
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	3f4080e7          	jalr	1012(ra) # 80001c88 <_ZN9Scheduler3putEP3TCB>
    8000289c:	0280006f          	j	800028c4 <_ZN3TCB12createThreadEPFvvE+0xac>
stack!=nullptr?(uint64)&stack[STACK_SIZE]:0,
    800028a0:	00000793          	li	a5,0
    800028a4:	fd9ff06f          	j	8000287c <_ZN3TCB12createThreadEPFvvE+0x64>
    800028a8:	00050913          	mv	s2,a0
        MemoryAllocator::mem_free(ptr);
    800028ac:	00048513          	mv	a0,s1
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	76c080e7          	jalr	1900(ra) # 8000201c <_ZN15MemoryAllocator8mem_freeEPv>
    800028b8:	00090513          	mv	a0,s2
    800028bc:	0000a097          	auipc	ra,0xa
    800028c0:	ebc080e7          	jalr	-324(ra) # 8000c778 <_Unwind_Resume>

    return new TCB(body,TIME_SLICE);
}
    800028c4:	00048513          	mv	a0,s1
    800028c8:	01813083          	ld	ra,24(sp)
    800028cc:	01013403          	ld	s0,16(sp)
    800028d0:	00813483          	ld	s1,8(sp)
    800028d4:	00013903          	ld	s2,0(sp)
    800028d8:	02010113          	addi	sp,sp,32
    800028dc:	00008067          	ret

00000000800028e0 <_ZN3TCB16schedulerIsEmptyEv>:

bool TCB::schedulerIsEmpty() {
    800028e0:	ff010113          	addi	sp,sp,-16
    800028e4:	00113423          	sd	ra,8(sp)
    800028e8:	00813023          	sd	s0,0(sp)
    800028ec:	01010413          	addi	s0,sp,16
    return Scheduler::peekFirst() == nullptr;
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	404080e7          	jalr	1028(ra) # 80001cf4 <_ZN9Scheduler9peekFirstEv>
}
    800028f8:	00153513          	seqz	a0,a0
    800028fc:	00813083          	ld	ra,8(sp)
    80002900:	00013403          	ld	s0,0(sp)
    80002904:	01010113          	addi	sp,sp,16
    80002908:	00008067          	ret

000000008000290c <_ZN3TCB5yieldEv>:

void TCB::yield(){
    8000290c:	ff010113          	addi	sp,sp,-16
    80002910:	00813423          	sd	s0,8(sp)
    80002914:	01010413          	addi	s0,sp,16

    __asm__ __volatile__("ecall");
    80002918:	00000073          	ecall

}
    8000291c:	00813403          	ld	s0,8(sp)
    80002920:	01010113          	addi	sp,sp,16
    80002924:	00008067          	ret

0000000080002928 <_ZN3TCB13threadWrapperEv>:
        Scheduler::put(old);
    }
    running=Scheduler::get();
    contextSwitch(&old->context,&running->context);
}
void TCB::threadWrapper() {
    80002928:	fe010113          	addi	sp,sp,-32
    8000292c:	00113c23          	sd	ra,24(sp)
    80002930:	00813823          	sd	s0,16(sp)
    80002934:	00913423          	sd	s1,8(sp)
    80002938:	02010413          	addi	s0,sp,32
    RISCV::popSppSpie();
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	da4080e7          	jalr	-604(ra) # 800026e0 <_ZN5RISCV10popSppSpieEv>
    running->body();
    80002944:	00009497          	auipc	s1,0x9
    80002948:	d0448493          	addi	s1,s1,-764 # 8000b648 <_ZN3TCB7runningE>
    8000294c:	0004b783          	ld	a5,0(s1)
    80002950:	0007b783          	ld	a5,0(a5) # 2000 <_entry-0x7fffe000>
    80002954:	000780e7          	jalr	a5
    running->setFinished(true);
    80002958:	0004b783          	ld	a5,0(s1)
    void setFinished(bool finished) {this->finished = finished;}
    8000295c:	00100713          	li	a4,1
    80002960:	02e78423          	sb	a4,40(a5)
    TCB::yield();
    80002964:	00000097          	auipc	ra,0x0
    80002968:	fa8080e7          	jalr	-88(ra) # 8000290c <_ZN3TCB5yieldEv>
}
    8000296c:	01813083          	ld	ra,24(sp)
    80002970:	01013403          	ld	s0,16(sp)
    80002974:	00813483          	ld	s1,8(sp)
    80002978:	02010113          	addi	sp,sp,32
    8000297c:	00008067          	ret

0000000080002980 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002980:	fe010113          	addi	sp,sp,-32
    80002984:	00113c23          	sd	ra,24(sp)
    80002988:	00813823          	sd	s0,16(sp)
    8000298c:	00913423          	sd	s1,8(sp)
    80002990:	02010413          	addi	s0,sp,32
    TCB *old=running;
    80002994:	00009497          	auipc	s1,0x9
    80002998:	cb44b483          	ld	s1,-844(s1) # 8000b648 <_ZN3TCB7runningE>
    bool isFinished() const {return finished;}
    8000299c:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() ) {
    800029a0:	02078c63          	beqz	a5,800029d8 <_ZN3TCB8dispatchEv+0x58>
    running=Scheduler::get();
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	27c080e7          	jalr	636(ra) # 80001c20 <_ZN9Scheduler3getEv>
    800029ac:	00009797          	auipc	a5,0x9
    800029b0:	c8a7be23          	sd	a0,-868(a5) # 8000b648 <_ZN3TCB7runningE>
    contextSwitch(&old->context,&running->context);
    800029b4:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    800029b8:	01048513          	addi	a0,s1,16
    800029bc:	ffffe097          	auipc	ra,0xffffe
    800029c0:	754080e7          	jalr	1876(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800029c4:	01813083          	ld	ra,24(sp)
    800029c8:	01013403          	ld	s0,16(sp)
    800029cc:	00813483          	ld	s1,8(sp)
    800029d0:	02010113          	addi	sp,sp,32
    800029d4:	00008067          	ret
        Scheduler::put(old);
    800029d8:	00048513          	mv	a0,s1
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	2ac080e7          	jalr	684(ra) # 80001c88 <_ZN9Scheduler3putEP3TCB>
    800029e4:	fc1ff06f          	j	800029a4 <_ZN3TCB8dispatchEv+0x24>

00000000800029e8 <_Z12printStringSPKc>:
#include "../h/print.hpp"

#include "../h/RISCV.hpp"
#include "../lib/console.h"
void printStringS(char const *string)
{
    800029e8:	fd010113          	addi	sp,sp,-48
    800029ec:	02113423          	sd	ra,40(sp)
    800029f0:	02813023          	sd	s0,32(sp)
    800029f4:	00913c23          	sd	s1,24(sp)
    800029f8:	01213823          	sd	s2,16(sp)
    800029fc:	03010413          	addi	s0,sp,48
    80002a00:	00050493          	mv	s1,a0
    return sstatus;
    80002a04:	100027f3          	csrr	a5,sstatus
    80002a08:	fcf43c23          	sd	a5,-40(s0)
}
    80002a0c:	fd843903          	ld	s2,-40(s0)
}
    80002a10:	00200793          	li	a5,2
    80002a14:	1007b073          	csrc	sstatus,a5
    uint64 sstatus=RISCV::r_sstatus();
    RISCV::mc_sstatus(RISCV::SSTATUS_SIE);
    while (*string != '\0')
    80002a18:	0004c503          	lbu	a0,0(s1)
    80002a1c:	00050a63          	beqz	a0,80002a30 <_Z12printStringSPKc+0x48>
    {
        __putc(*string);
    80002a20:	00006097          	auipc	ra,0x6
    80002a24:	89c080e7          	jalr	-1892(ra) # 800082bc <__putc>
        string++;
    80002a28:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002a2c:	fedff06f          	j	80002a18 <_Z12printStringSPKc+0x30>
    }
    RISCV::ms_sstatus(sstatus & RISCV::SSTATUS_SIE ? RISCV::SSTATUS_SIE : 0);
    80002a30:	0009091b          	sext.w	s2,s2
    80002a34:	00297913          	andi	s2,s2,2
    80002a38:	0009091b          	sext.w	s2,s2
}
    80002a3c:	10092073          	csrs	sstatus,s2
}
    80002a40:	02813083          	ld	ra,40(sp)
    80002a44:	02013403          	ld	s0,32(sp)
    80002a48:	01813483          	ld	s1,24(sp)
    80002a4c:	01013903          	ld	s2,16(sp)
    80002a50:	03010113          	addi	sp,sp,48
    80002a54:	00008067          	ret

0000000080002a58 <_Z9printIntSm>:

void printIntS(uint64 integer)
{
    80002a58:	fb010113          	addi	sp,sp,-80
    80002a5c:	04113423          	sd	ra,72(sp)
    80002a60:	04813023          	sd	s0,64(sp)
    80002a64:	02913c23          	sd	s1,56(sp)
    80002a68:	03213823          	sd	s2,48(sp)
    80002a6c:	05010413          	addi	s0,sp,80
    return sstatus;
    80002a70:	100027f3          	csrr	a5,sstatus
    80002a74:	faf43c23          	sd	a5,-72(s0)
}
    80002a78:	fb843903          	ld	s2,-72(s0)
}
    80002a7c:	00200793          	li	a5,2
    80002a80:	1007b073          	csrc	sstatus,a5
    uint64 sstatus=RISCV::r_sstatus();
    RISCV::mc_sstatus(RISCV::SSTATUS_SIE);
    char digits[] = "0123456789";
    80002a84:	00006797          	auipc	a5,0x6
    80002a88:	63478793          	addi	a5,a5,1588 # 800090b8 <CONSOLE_STATUS+0xa8>
    80002a8c:	0007b703          	ld	a4,0(a5)
    80002a90:	fce43823          	sd	a4,-48(s0)
    80002a94:	0087d703          	lhu	a4,8(a5)
    80002a98:	fce41c23          	sh	a4,-40(s0)
    80002a9c:	00a7c783          	lbu	a5,10(a5)
    80002aa0:	fcf40d23          	sb	a5,-38(s0)
    if(integer < 0){
        neg = 1;
        x = -integer;
    } else {

        x = integer;
    80002aa4:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002aa8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % 10];
    80002aac:	00a00693          	li	a3,10
    80002ab0:	02d5773b          	remuw	a4,a0,a3
    80002ab4:	02071713          	slli	a4,a4,0x20
    80002ab8:	02075713          	srli	a4,a4,0x20
    80002abc:	fe040613          	addi	a2,s0,-32
    80002ac0:	00e60733          	add	a4,a2,a4
    80002ac4:	ff074703          	lbu	a4,-16(a4)
    80002ac8:	009607b3          	add	a5,a2,s1
    80002acc:	0014849b          	addiw	s1,s1,1
    80002ad0:	fee78023          	sb	a4,-32(a5)
    }while((x /= 10) != 0);
    80002ad4:	0005071b          	sext.w	a4,a0
    80002ad8:	02d5553b          	divuw	a0,a0,a3
    80002adc:	00900793          	li	a5,9
    80002ae0:	fce7e6e3          	bltu	a5,a4,80002aac <_Z9printIntSm+0x54>
    if(neg)
        buf[i++] = '-';

    while(--i >= 0)
    80002ae4:	fff4849b          	addiw	s1,s1,-1
    80002ae8:	0004ce63          	bltz	s1,80002b04 <_Z9printIntSm+0xac>
        __putc(buf[i]);
    80002aec:	fe040793          	addi	a5,s0,-32
    80002af0:	009787b3          	add	a5,a5,s1
    80002af4:	fe07c503          	lbu	a0,-32(a5)
    80002af8:	00005097          	auipc	ra,0x5
    80002afc:	7c4080e7          	jalr	1988(ra) # 800082bc <__putc>
    80002b00:	fe5ff06f          	j	80002ae4 <_Z9printIntSm+0x8c>
    RISCV::ms_sstatus(sstatus&RISCV::SSTATUS_SIE ? RISCV::SSTATUS_SIE : 0);
    80002b04:	0009091b          	sext.w	s2,s2
    80002b08:	00297913          	andi	s2,s2,2
    80002b0c:	0009091b          	sext.w	s2,s2
}
    80002b10:	10092073          	csrs	sstatus,s2


    80002b14:	04813083          	ld	ra,72(sp)
    80002b18:	04013403          	ld	s0,64(sp)
    80002b1c:	03813483          	ld	s1,56(sp)
    80002b20:	03013903          	ld	s2,48(sp)
    80002b24:	05010113          	addi	sp,sp,80
    80002b28:	00008067          	ret

0000000080002b2c <_Z13userMainTestsv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"

#endif

void userMainTests() {
    80002b2c:	fe010113          	addi	sp,sp,-32
    80002b30:	00113c23          	sd	ra,24(sp)
    80002b34:	00813823          	sd	s0,16(sp)
    80002b38:	00913423          	sd	s1,8(sp)
    80002b3c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80002b40:	00006517          	auipc	a0,0x6
    80002b44:	58850513          	addi	a0,a0,1416 # 800090c8 <CONSOLE_STATUS+0xb8>
    80002b48:	00002097          	auipc	ra,0x2
    80002b4c:	5b0080e7          	jalr	1456(ra) # 800050f8 <_Z11printStringPKc>
    int test = getc() - '0';
    80002b50:	fffff097          	auipc	ra,0xfffff
    80002b54:	bc4080e7          	jalr	-1084(ra) # 80001714 <_Z4getcv>
    80002b58:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	bb8080e7          	jalr	-1096(ra) # 80001714 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80002b64:	00700793          	li	a5,7
    80002b68:	1097e263          	bltu	a5,s1,80002c6c <_Z13userMainTestsv+0x140>
    80002b6c:	00249493          	slli	s1,s1,0x2
    80002b70:	00006717          	auipc	a4,0x6
    80002b74:	7b070713          	addi	a4,a4,1968 # 80009320 <CONSOLE_STATUS+0x310>
    80002b78:	00e484b3          	add	s1,s1,a4
    80002b7c:	0004a783          	lw	a5,0(s1)
    80002b80:	00e787b3          	add	a5,a5,a4
    80002b84:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80002b88:	00002097          	auipc	ra,0x2
    80002b8c:	be8080e7          	jalr	-1048(ra) # 80004770 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80002b90:	00006517          	auipc	a0,0x6
    80002b94:	55850513          	addi	a0,a0,1368 # 800090e8 <CONSOLE_STATUS+0xd8>
    80002b98:	00002097          	auipc	ra,0x2
    80002b9c:	560080e7          	jalr	1376(ra) # 800050f8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80002ba0:	01813083          	ld	ra,24(sp)
    80002ba4:	01013403          	ld	s0,16(sp)
    80002ba8:	00813483          	ld	s1,8(sp)
    80002bac:	02010113          	addi	sp,sp,32
    80002bb0:	00008067          	ret
            Threads_CPP_API_test();
    80002bb4:	00001097          	auipc	ra,0x1
    80002bb8:	a9c080e7          	jalr	-1380(ra) # 80003650 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80002bbc:	00006517          	auipc	a0,0x6
    80002bc0:	56c50513          	addi	a0,a0,1388 # 80009128 <CONSOLE_STATUS+0x118>
    80002bc4:	00002097          	auipc	ra,0x2
    80002bc8:	534080e7          	jalr	1332(ra) # 800050f8 <_Z11printStringPKc>
            break;
    80002bcc:	fd5ff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>
            producerConsumer_C_API();
    80002bd0:	00000097          	auipc	ra,0x0
    80002bd4:	2d4080e7          	jalr	724(ra) # 80002ea4 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80002bd8:	00006517          	auipc	a0,0x6
    80002bdc:	59050513          	addi	a0,a0,1424 # 80009168 <CONSOLE_STATUS+0x158>
    80002be0:	00002097          	auipc	ra,0x2
    80002be4:	518080e7          	jalr	1304(ra) # 800050f8 <_Z11printStringPKc>
            break;
    80002be8:	fb9ff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>
            producerConsumer_CPP_Sync_API();
    80002bec:	00002097          	auipc	ra,0x2
    80002bf0:	ec8080e7          	jalr	-312(ra) # 80004ab4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80002bf4:	00006517          	auipc	a0,0x6
    80002bf8:	5c450513          	addi	a0,a0,1476 # 800091b8 <CONSOLE_STATUS+0x1a8>
    80002bfc:	00002097          	auipc	ra,0x2
    80002c00:	4fc080e7          	jalr	1276(ra) # 800050f8 <_Z11printStringPKc>
            break;
    80002c04:	f9dff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>
            testSleeping();
    80002c08:	00003097          	auipc	ra,0x3
    80002c0c:	c5c080e7          	jalr	-932(ra) # 80005864 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80002c10:	00006517          	auipc	a0,0x6
    80002c14:	60050513          	addi	a0,a0,1536 # 80009210 <CONSOLE_STATUS+0x200>
    80002c18:	00002097          	auipc	ra,0x2
    80002c1c:	4e0080e7          	jalr	1248(ra) # 800050f8 <_Z11printStringPKc>
            break;
    80002c20:	f81ff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>
            testConsumerProducer();
    80002c24:	00001097          	auipc	ra,0x1
    80002c28:	eec080e7          	jalr	-276(ra) # 80003b10 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80002c2c:	00006517          	auipc	a0,0x6
    80002c30:	61450513          	addi	a0,a0,1556 # 80009240 <CONSOLE_STATUS+0x230>
    80002c34:	00002097          	auipc	ra,0x2
    80002c38:	4c4080e7          	jalr	1220(ra) # 800050f8 <_Z11printStringPKc>
            break;
    80002c3c:	f65ff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>
            System_Mode_test();
    80002c40:	00003097          	auipc	ra,0x3
    80002c44:	198080e7          	jalr	408(ra) # 80005dd8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80002c48:	00006517          	auipc	a0,0x6
    80002c4c:	63850513          	addi	a0,a0,1592 # 80009280 <CONSOLE_STATUS+0x270>
    80002c50:	00002097          	auipc	ra,0x2
    80002c54:	4a8080e7          	jalr	1192(ra) # 800050f8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80002c58:	00006517          	auipc	a0,0x6
    80002c5c:	64850513          	addi	a0,a0,1608 # 800092a0 <CONSOLE_STATUS+0x290>
    80002c60:	00002097          	auipc	ra,0x2
    80002c64:	498080e7          	jalr	1176(ra) # 800050f8 <_Z11printStringPKc>
            break;
    80002c68:	f39ff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80002c6c:	00006517          	auipc	a0,0x6
    80002c70:	68c50513          	addi	a0,a0,1676 # 800092f8 <CONSOLE_STATUS+0x2e8>
    80002c74:	00002097          	auipc	ra,0x2
    80002c78:	484080e7          	jalr	1156(ra) # 800050f8 <_Z11printStringPKc>
    80002c7c:	f25ff06f          	j	80002ba0 <_Z13userMainTestsv+0x74>

0000000080002c80 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002c80:	fe010113          	addi	sp,sp,-32
    80002c84:	00113c23          	sd	ra,24(sp)
    80002c88:	00813823          	sd	s0,16(sp)
    80002c8c:	00913423          	sd	s1,8(sp)
    80002c90:	01213023          	sd	s2,0(sp)
    80002c94:	02010413          	addi	s0,sp,32
    80002c98:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002c9c:	00000913          	li	s2,0
    80002ca0:	00c0006f          	j	80002cac <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	83c080e7          	jalr	-1988(ra) # 800014e0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002cac:	fffff097          	auipc	ra,0xfffff
    80002cb0:	a68080e7          	jalr	-1432(ra) # 80001714 <_Z4getcv>
    80002cb4:	0005059b          	sext.w	a1,a0
    80002cb8:	01b00793          	li	a5,27
    80002cbc:	02f58a63          	beq	a1,a5,80002cf0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002cc0:	0084b503          	ld	a0,8(s1)
    80002cc4:	00003097          	auipc	ra,0x3
    80002cc8:	2ac080e7          	jalr	684(ra) # 80005f70 <_ZN6Buffer3putEi>
        i++;
    80002ccc:	0019071b          	addiw	a4,s2,1
    80002cd0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002cd4:	0004a683          	lw	a3,0(s1)
    80002cd8:	0026979b          	slliw	a5,a3,0x2
    80002cdc:	00d787bb          	addw	a5,a5,a3
    80002ce0:	0017979b          	slliw	a5,a5,0x1
    80002ce4:	02f767bb          	remw	a5,a4,a5
    80002ce8:	fc0792e3          	bnez	a5,80002cac <_ZL16producerKeyboardPv+0x2c>
    80002cec:	fb9ff06f          	j	80002ca4 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002cf0:	00100793          	li	a5,1
    80002cf4:	00009717          	auipc	a4,0x9
    80002cf8:	96f72223          	sw	a5,-1692(a4) # 8000b658 <_ZL9threadEnd>
    data->buffer->put('!');
    80002cfc:	02100593          	li	a1,33
    80002d00:	0084b503          	ld	a0,8(s1)
    80002d04:	00003097          	auipc	ra,0x3
    80002d08:	26c080e7          	jalr	620(ra) # 80005f70 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002d0c:	0104b503          	ld	a0,16(s1)
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	94c080e7          	jalr	-1716(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80002d18:	01813083          	ld	ra,24(sp)
    80002d1c:	01013403          	ld	s0,16(sp)
    80002d20:	00813483          	ld	s1,8(sp)
    80002d24:	00013903          	ld	s2,0(sp)
    80002d28:	02010113          	addi	sp,sp,32
    80002d2c:	00008067          	ret

0000000080002d30 <_ZL8producerPv>:

static void producer(void *arg) {
    80002d30:	fe010113          	addi	sp,sp,-32
    80002d34:	00113c23          	sd	ra,24(sp)
    80002d38:	00813823          	sd	s0,16(sp)
    80002d3c:	00913423          	sd	s1,8(sp)
    80002d40:	01213023          	sd	s2,0(sp)
    80002d44:	02010413          	addi	s0,sp,32
    80002d48:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002d4c:	00000913          	li	s2,0
    80002d50:	00c0006f          	j	80002d5c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002d54:	ffffe097          	auipc	ra,0xffffe
    80002d58:	78c080e7          	jalr	1932(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002d5c:	00009797          	auipc	a5,0x9
    80002d60:	8fc7a783          	lw	a5,-1796(a5) # 8000b658 <_ZL9threadEnd>
    80002d64:	02079e63          	bnez	a5,80002da0 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002d68:	0004a583          	lw	a1,0(s1)
    80002d6c:	0305859b          	addiw	a1,a1,48
    80002d70:	0084b503          	ld	a0,8(s1)
    80002d74:	00003097          	auipc	ra,0x3
    80002d78:	1fc080e7          	jalr	508(ra) # 80005f70 <_ZN6Buffer3putEi>
        i++;
    80002d7c:	0019071b          	addiw	a4,s2,1
    80002d80:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002d84:	0004a683          	lw	a3,0(s1)
    80002d88:	0026979b          	slliw	a5,a3,0x2
    80002d8c:	00d787bb          	addw	a5,a5,a3
    80002d90:	0017979b          	slliw	a5,a5,0x1
    80002d94:	02f767bb          	remw	a5,a4,a5
    80002d98:	fc0792e3          	bnez	a5,80002d5c <_ZL8producerPv+0x2c>
    80002d9c:	fb9ff06f          	j	80002d54 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002da0:	0104b503          	ld	a0,16(s1)
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	8b8080e7          	jalr	-1864(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80002dac:	01813083          	ld	ra,24(sp)
    80002db0:	01013403          	ld	s0,16(sp)
    80002db4:	00813483          	ld	s1,8(sp)
    80002db8:	00013903          	ld	s2,0(sp)
    80002dbc:	02010113          	addi	sp,sp,32
    80002dc0:	00008067          	ret

0000000080002dc4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002dc4:	fd010113          	addi	sp,sp,-48
    80002dc8:	02113423          	sd	ra,40(sp)
    80002dcc:	02813023          	sd	s0,32(sp)
    80002dd0:	00913c23          	sd	s1,24(sp)
    80002dd4:	01213823          	sd	s2,16(sp)
    80002dd8:	01313423          	sd	s3,8(sp)
    80002ddc:	03010413          	addi	s0,sp,48
    80002de0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002de4:	00000993          	li	s3,0
    80002de8:	01c0006f          	j	80002e04 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002dec:	ffffe097          	auipc	ra,0xffffe
    80002df0:	6f4080e7          	jalr	1780(ra) # 800014e0 <_Z15thread_dispatchv>
    80002df4:	0500006f          	j	80002e44 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002df8:	00a00513          	li	a0,10
    80002dfc:	fffff097          	auipc	ra,0xfffff
    80002e00:	974080e7          	jalr	-1676(ra) # 80001770 <_Z4putcc>
    while (!threadEnd) {
    80002e04:	00009797          	auipc	a5,0x9
    80002e08:	8547a783          	lw	a5,-1964(a5) # 8000b658 <_ZL9threadEnd>
    80002e0c:	06079063          	bnez	a5,80002e6c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80002e10:	00893503          	ld	a0,8(s2)
    80002e14:	00003097          	auipc	ra,0x3
    80002e18:	1ec080e7          	jalr	492(ra) # 80006000 <_ZN6Buffer3getEv>
        i++;
    80002e1c:	0019849b          	addiw	s1,s3,1
    80002e20:	0004899b          	sext.w	s3,s1
        putc(key);
    80002e24:	0ff57513          	andi	a0,a0,255
    80002e28:	fffff097          	auipc	ra,0xfffff
    80002e2c:	948080e7          	jalr	-1720(ra) # 80001770 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80002e30:	00092703          	lw	a4,0(s2)
    80002e34:	0027179b          	slliw	a5,a4,0x2
    80002e38:	00e787bb          	addw	a5,a5,a4
    80002e3c:	02f4e7bb          	remw	a5,s1,a5
    80002e40:	fa0786e3          	beqz	a5,80002dec <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80002e44:	05000793          	li	a5,80
    80002e48:	02f4e4bb          	remw	s1,s1,a5
    80002e4c:	fa049ce3          	bnez	s1,80002e04 <_ZL8consumerPv+0x40>
    80002e50:	fa9ff06f          	j	80002df8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002e54:	00893503          	ld	a0,8(s2)
    80002e58:	00003097          	auipc	ra,0x3
    80002e5c:	1a8080e7          	jalr	424(ra) # 80006000 <_ZN6Buffer3getEv>
        putc(key);
    80002e60:	0ff57513          	andi	a0,a0,255
    80002e64:	fffff097          	auipc	ra,0xfffff
    80002e68:	90c080e7          	jalr	-1780(ra) # 80001770 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002e6c:	00893503          	ld	a0,8(s2)
    80002e70:	00003097          	auipc	ra,0x3
    80002e74:	21c080e7          	jalr	540(ra) # 8000608c <_ZN6Buffer6getCntEv>
    80002e78:	fca04ee3          	bgtz	a0,80002e54 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002e7c:	01093503          	ld	a0,16(s2)
    80002e80:	ffffe097          	auipc	ra,0xffffe
    80002e84:	7dc080e7          	jalr	2012(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80002e88:	02813083          	ld	ra,40(sp)
    80002e8c:	02013403          	ld	s0,32(sp)
    80002e90:	01813483          	ld	s1,24(sp)
    80002e94:	01013903          	ld	s2,16(sp)
    80002e98:	00813983          	ld	s3,8(sp)
    80002e9c:	03010113          	addi	sp,sp,48
    80002ea0:	00008067          	ret

0000000080002ea4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002ea4:	f9010113          	addi	sp,sp,-112
    80002ea8:	06113423          	sd	ra,104(sp)
    80002eac:	06813023          	sd	s0,96(sp)
    80002eb0:	04913c23          	sd	s1,88(sp)
    80002eb4:	05213823          	sd	s2,80(sp)
    80002eb8:	05313423          	sd	s3,72(sp)
    80002ebc:	05413023          	sd	s4,64(sp)
    80002ec0:	03513c23          	sd	s5,56(sp)
    80002ec4:	03613823          	sd	s6,48(sp)
    80002ec8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002ecc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002ed0:	00006517          	auipc	a0,0x6
    80002ed4:	47050513          	addi	a0,a0,1136 # 80009340 <CONSOLE_STATUS+0x330>
    80002ed8:	00002097          	auipc	ra,0x2
    80002edc:	220080e7          	jalr	544(ra) # 800050f8 <_Z11printStringPKc>
    getString(input, 30);
    80002ee0:	01e00593          	li	a1,30
    80002ee4:	fa040493          	addi	s1,s0,-96
    80002ee8:	00048513          	mv	a0,s1
    80002eec:	00002097          	auipc	ra,0x2
    80002ef0:	294080e7          	jalr	660(ra) # 80005180 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002ef4:	00048513          	mv	a0,s1
    80002ef8:	00002097          	auipc	ra,0x2
    80002efc:	360080e7          	jalr	864(ra) # 80005258 <_Z11stringToIntPKc>
    80002f00:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002f04:	00006517          	auipc	a0,0x6
    80002f08:	45c50513          	addi	a0,a0,1116 # 80009360 <CONSOLE_STATUS+0x350>
    80002f0c:	00002097          	auipc	ra,0x2
    80002f10:	1ec080e7          	jalr	492(ra) # 800050f8 <_Z11printStringPKc>
    getString(input, 30);
    80002f14:	01e00593          	li	a1,30
    80002f18:	00048513          	mv	a0,s1
    80002f1c:	00002097          	auipc	ra,0x2
    80002f20:	264080e7          	jalr	612(ra) # 80005180 <_Z9getStringPci>
    n = stringToInt(input);
    80002f24:	00048513          	mv	a0,s1
    80002f28:	00002097          	auipc	ra,0x2
    80002f2c:	330080e7          	jalr	816(ra) # 80005258 <_Z11stringToIntPKc>
    80002f30:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002f34:	00006517          	auipc	a0,0x6
    80002f38:	44c50513          	addi	a0,a0,1100 # 80009380 <CONSOLE_STATUS+0x370>
    80002f3c:	00002097          	auipc	ra,0x2
    80002f40:	1bc080e7          	jalr	444(ra) # 800050f8 <_Z11printStringPKc>
    80002f44:	00000613          	li	a2,0
    80002f48:	00a00593          	li	a1,10
    80002f4c:	00090513          	mv	a0,s2
    80002f50:	00002097          	auipc	ra,0x2
    80002f54:	358080e7          	jalr	856(ra) # 800052a8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002f58:	00006517          	auipc	a0,0x6
    80002f5c:	44050513          	addi	a0,a0,1088 # 80009398 <CONSOLE_STATUS+0x388>
    80002f60:	00002097          	auipc	ra,0x2
    80002f64:	198080e7          	jalr	408(ra) # 800050f8 <_Z11printStringPKc>
    80002f68:	00000613          	li	a2,0
    80002f6c:	00a00593          	li	a1,10
    80002f70:	00048513          	mv	a0,s1
    80002f74:	00002097          	auipc	ra,0x2
    80002f78:	334080e7          	jalr	820(ra) # 800052a8 <_Z8printIntiii>
    printString(".\n");
    80002f7c:	00006517          	auipc	a0,0x6
    80002f80:	43450513          	addi	a0,a0,1076 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80002f84:	00002097          	auipc	ra,0x2
    80002f88:	174080e7          	jalr	372(ra) # 800050f8 <_Z11printStringPKc>
    if(threadNum > n) {
    80002f8c:	0324c463          	blt	s1,s2,80002fb4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002f90:	03205c63          	blez	s2,80002fc8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002f94:	03800513          	li	a0,56
    80002f98:	fffff097          	auipc	ra,0xfffff
    80002f9c:	26c080e7          	jalr	620(ra) # 80002204 <_Znwm>
    80002fa0:	00050a13          	mv	s4,a0
    80002fa4:	00048593          	mv	a1,s1
    80002fa8:	00003097          	auipc	ra,0x3
    80002fac:	f2c080e7          	jalr	-212(ra) # 80005ed4 <_ZN6BufferC1Ei>
    80002fb0:	0300006f          	j	80002fe0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002fb4:	00006517          	auipc	a0,0x6
    80002fb8:	40450513          	addi	a0,a0,1028 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80002fbc:	00002097          	auipc	ra,0x2
    80002fc0:	13c080e7          	jalr	316(ra) # 800050f8 <_Z11printStringPKc>
        return;
    80002fc4:	0140006f          	j	80002fd8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002fc8:	00006517          	auipc	a0,0x6
    80002fcc:	43050513          	addi	a0,a0,1072 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80002fd0:	00002097          	auipc	ra,0x2
    80002fd4:	128080e7          	jalr	296(ra) # 800050f8 <_Z11printStringPKc>
        return;
    80002fd8:	000b0113          	mv	sp,s6
    80002fdc:	1500006f          	j	8000312c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002fe0:	00000593          	li	a1,0
    80002fe4:	00008517          	auipc	a0,0x8
    80002fe8:	67c50513          	addi	a0,a0,1660 # 8000b660 <_ZL10waitForAll>
    80002fec:	ffffe097          	auipc	ra,0xffffe
    80002ff0:	534080e7          	jalr	1332(ra) # 80001520 <_Z8sem_openPP3Semj>
    thread_t threads[threadNum];
    80002ff4:	00391793          	slli	a5,s2,0x3
    80002ff8:	00f78793          	addi	a5,a5,15
    80002ffc:	ff07f793          	andi	a5,a5,-16
    80003000:	40f10133          	sub	sp,sp,a5
    80003004:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003008:	0019071b          	addiw	a4,s2,1
    8000300c:	00171793          	slli	a5,a4,0x1
    80003010:	00e787b3          	add	a5,a5,a4
    80003014:	00379793          	slli	a5,a5,0x3
    80003018:	00f78793          	addi	a5,a5,15
    8000301c:	ff07f793          	andi	a5,a5,-16
    80003020:	40f10133          	sub	sp,sp,a5
    80003024:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003028:	00191613          	slli	a2,s2,0x1
    8000302c:	012607b3          	add	a5,a2,s2
    80003030:	00379793          	slli	a5,a5,0x3
    80003034:	00f987b3          	add	a5,s3,a5
    80003038:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000303c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003040:	00008717          	auipc	a4,0x8
    80003044:	62073703          	ld	a4,1568(a4) # 8000b660 <_ZL10waitForAll>
    80003048:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000304c:	00078613          	mv	a2,a5
    80003050:	00000597          	auipc	a1,0x0
    80003054:	d7458593          	addi	a1,a1,-652 # 80002dc4 <_ZL8consumerPv>
    80003058:	f9840513          	addi	a0,s0,-104
    8000305c:	ffffe097          	auipc	ra,0xffffe
    80003060:	378080e7          	jalr	888(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003064:	00000493          	li	s1,0
    80003068:	0280006f          	j	80003090 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000306c:	00000597          	auipc	a1,0x0
    80003070:	c1458593          	addi	a1,a1,-1004 # 80002c80 <_ZL16producerKeyboardPv>
                      data + i);
    80003074:	00179613          	slli	a2,a5,0x1
    80003078:	00f60633          	add	a2,a2,a5
    8000307c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003080:	00c98633          	add	a2,s3,a2
    80003084:	ffffe097          	auipc	ra,0xffffe
    80003088:	350080e7          	jalr	848(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000308c:	0014849b          	addiw	s1,s1,1
    80003090:	0524d263          	bge	s1,s2,800030d4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003094:	00149793          	slli	a5,s1,0x1
    80003098:	009787b3          	add	a5,a5,s1
    8000309c:	00379793          	slli	a5,a5,0x3
    800030a0:	00f987b3          	add	a5,s3,a5
    800030a4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800030a8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800030ac:	00008717          	auipc	a4,0x8
    800030b0:	5b473703          	ld	a4,1460(a4) # 8000b660 <_ZL10waitForAll>
    800030b4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800030b8:	00048793          	mv	a5,s1
    800030bc:	00349513          	slli	a0,s1,0x3
    800030c0:	00aa8533          	add	a0,s5,a0
    800030c4:	fa9054e3          	blez	s1,8000306c <_Z22producerConsumer_C_APIv+0x1c8>
    800030c8:	00000597          	auipc	a1,0x0
    800030cc:	c6858593          	addi	a1,a1,-920 # 80002d30 <_ZL8producerPv>
    800030d0:	fa5ff06f          	j	80003074 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800030d4:	ffffe097          	auipc	ra,0xffffe
    800030d8:	40c080e7          	jalr	1036(ra) # 800014e0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800030dc:	00000493          	li	s1,0
    800030e0:	00994e63          	blt	s2,s1,800030fc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800030e4:	00008517          	auipc	a0,0x8
    800030e8:	57c53503          	ld	a0,1404(a0) # 8000b660 <_ZL10waitForAll>
    800030ec:	ffffe097          	auipc	ra,0xffffe
    800030f0:	508080e7          	jalr	1288(ra) # 800015f4 <_Z8sem_waitP3Sem>
    for (int i = 0; i <= threadNum; i++) {
    800030f4:	0014849b          	addiw	s1,s1,1
    800030f8:	fe9ff06f          	j	800030e0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800030fc:	00008517          	auipc	a0,0x8
    80003100:	56453503          	ld	a0,1380(a0) # 8000b660 <_ZL10waitForAll>
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	488080e7          	jalr	1160(ra) # 8000158c <_Z9sem_closeP3Sem>
    delete buffer;
    8000310c:	000a0e63          	beqz	s4,80003128 <_Z22producerConsumer_C_APIv+0x284>
    80003110:	000a0513          	mv	a0,s4
    80003114:	00003097          	auipc	ra,0x3
    80003118:	000080e7          	jalr	ra # 80006114 <_ZN6BufferD1Ev>
    8000311c:	000a0513          	mv	a0,s4
    80003120:	fffff097          	auipc	ra,0xfffff
    80003124:	134080e7          	jalr	308(ra) # 80002254 <_ZdlPv>
    80003128:	000b0113          	mv	sp,s6

}
    8000312c:	f9040113          	addi	sp,s0,-112
    80003130:	06813083          	ld	ra,104(sp)
    80003134:	06013403          	ld	s0,96(sp)
    80003138:	05813483          	ld	s1,88(sp)
    8000313c:	05013903          	ld	s2,80(sp)
    80003140:	04813983          	ld	s3,72(sp)
    80003144:	04013a03          	ld	s4,64(sp)
    80003148:	03813a83          	ld	s5,56(sp)
    8000314c:	03013b03          	ld	s6,48(sp)
    80003150:	07010113          	addi	sp,sp,112
    80003154:	00008067          	ret
    80003158:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000315c:	000a0513          	mv	a0,s4
    80003160:	fffff097          	auipc	ra,0xfffff
    80003164:	0f4080e7          	jalr	244(ra) # 80002254 <_ZdlPv>
    80003168:	00048513          	mv	a0,s1
    8000316c:	00009097          	auipc	ra,0x9
    80003170:	60c080e7          	jalr	1548(ra) # 8000c778 <_Unwind_Resume>

0000000080003174 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003174:	fe010113          	addi	sp,sp,-32
    80003178:	00113c23          	sd	ra,24(sp)
    8000317c:	00813823          	sd	s0,16(sp)
    80003180:	00913423          	sd	s1,8(sp)
    80003184:	01213023          	sd	s2,0(sp)
    80003188:	02010413          	addi	s0,sp,32
    8000318c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003190:	00100793          	li	a5,1
    80003194:	02a7f863          	bgeu	a5,a0,800031c4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003198:	00a00793          	li	a5,10
    8000319c:	02f577b3          	remu	a5,a0,a5
    800031a0:	02078e63          	beqz	a5,800031dc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800031a4:	fff48513          	addi	a0,s1,-1
    800031a8:	00000097          	auipc	ra,0x0
    800031ac:	fcc080e7          	jalr	-52(ra) # 80003174 <_ZL9fibonaccim>
    800031b0:	00050913          	mv	s2,a0
    800031b4:	ffe48513          	addi	a0,s1,-2
    800031b8:	00000097          	auipc	ra,0x0
    800031bc:	fbc080e7          	jalr	-68(ra) # 80003174 <_ZL9fibonaccim>
    800031c0:	00a90533          	add	a0,s2,a0
}
    800031c4:	01813083          	ld	ra,24(sp)
    800031c8:	01013403          	ld	s0,16(sp)
    800031cc:	00813483          	ld	s1,8(sp)
    800031d0:	00013903          	ld	s2,0(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800031dc:	ffffe097          	auipc	ra,0xffffe
    800031e0:	304080e7          	jalr	772(ra) # 800014e0 <_Z15thread_dispatchv>
    800031e4:	fc1ff06f          	j	800031a4 <_ZL9fibonaccim+0x30>

00000000800031e8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800031e8:	fe010113          	addi	sp,sp,-32
    800031ec:	00113c23          	sd	ra,24(sp)
    800031f0:	00813823          	sd	s0,16(sp)
    800031f4:	00913423          	sd	s1,8(sp)
    800031f8:	01213023          	sd	s2,0(sp)
    800031fc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003200:	00000913          	li	s2,0
    80003204:	0380006f          	j	8000323c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003208:	ffffe097          	auipc	ra,0xffffe
    8000320c:	2d8080e7          	jalr	728(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003210:	00148493          	addi	s1,s1,1
    80003214:	000027b7          	lui	a5,0x2
    80003218:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000321c:	0097ee63          	bltu	a5,s1,80003238 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003220:	00000713          	li	a4,0
    80003224:	000077b7          	lui	a5,0x7
    80003228:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000322c:	fce7eee3          	bltu	a5,a4,80003208 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003230:	00170713          	addi	a4,a4,1
    80003234:	ff1ff06f          	j	80003224 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003238:	00190913          	addi	s2,s2,1
    8000323c:	00900793          	li	a5,9
    80003240:	0527e063          	bltu	a5,s2,80003280 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003244:	00006517          	auipc	a0,0x6
    80003248:	1e450513          	addi	a0,a0,484 # 80009428 <CONSOLE_STATUS+0x418>
    8000324c:	00002097          	auipc	ra,0x2
    80003250:	eac080e7          	jalr	-340(ra) # 800050f8 <_Z11printStringPKc>
    80003254:	00000613          	li	a2,0
    80003258:	00a00593          	li	a1,10
    8000325c:	0009051b          	sext.w	a0,s2
    80003260:	00002097          	auipc	ra,0x2
    80003264:	048080e7          	jalr	72(ra) # 800052a8 <_Z8printIntiii>
    80003268:	00006517          	auipc	a0,0x6
    8000326c:	fa050513          	addi	a0,a0,-96 # 80009208 <CONSOLE_STATUS+0x1f8>
    80003270:	00002097          	auipc	ra,0x2
    80003274:	e88080e7          	jalr	-376(ra) # 800050f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003278:	00000493          	li	s1,0
    8000327c:	f99ff06f          	j	80003214 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003280:	00006517          	auipc	a0,0x6
    80003284:	1b050513          	addi	a0,a0,432 # 80009430 <CONSOLE_STATUS+0x420>
    80003288:	00002097          	auipc	ra,0x2
    8000328c:	e70080e7          	jalr	-400(ra) # 800050f8 <_Z11printStringPKc>
    finishedA = true;
    80003290:	00100793          	li	a5,1
    80003294:	00008717          	auipc	a4,0x8
    80003298:	3cf70a23          	sb	a5,980(a4) # 8000b668 <_ZL9finishedA>
}
    8000329c:	01813083          	ld	ra,24(sp)
    800032a0:	01013403          	ld	s0,16(sp)
    800032a4:	00813483          	ld	s1,8(sp)
    800032a8:	00013903          	ld	s2,0(sp)
    800032ac:	02010113          	addi	sp,sp,32
    800032b0:	00008067          	ret

00000000800032b4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800032b4:	fe010113          	addi	sp,sp,-32
    800032b8:	00113c23          	sd	ra,24(sp)
    800032bc:	00813823          	sd	s0,16(sp)
    800032c0:	00913423          	sd	s1,8(sp)
    800032c4:	01213023          	sd	s2,0(sp)
    800032c8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800032cc:	00000913          	li	s2,0
    800032d0:	0380006f          	j	80003308 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800032d4:	ffffe097          	auipc	ra,0xffffe
    800032d8:	20c080e7          	jalr	524(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800032dc:	00148493          	addi	s1,s1,1
    800032e0:	000027b7          	lui	a5,0x2
    800032e4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800032e8:	0097ee63          	bltu	a5,s1,80003304 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800032ec:	00000713          	li	a4,0
    800032f0:	000077b7          	lui	a5,0x7
    800032f4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800032f8:	fce7eee3          	bltu	a5,a4,800032d4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800032fc:	00170713          	addi	a4,a4,1
    80003300:	ff1ff06f          	j	800032f0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003304:	00190913          	addi	s2,s2,1
    80003308:	00f00793          	li	a5,15
    8000330c:	0527e063          	bltu	a5,s2,8000334c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003310:	00006517          	auipc	a0,0x6
    80003314:	13050513          	addi	a0,a0,304 # 80009440 <CONSOLE_STATUS+0x430>
    80003318:	00002097          	auipc	ra,0x2
    8000331c:	de0080e7          	jalr	-544(ra) # 800050f8 <_Z11printStringPKc>
    80003320:	00000613          	li	a2,0
    80003324:	00a00593          	li	a1,10
    80003328:	0009051b          	sext.w	a0,s2
    8000332c:	00002097          	auipc	ra,0x2
    80003330:	f7c080e7          	jalr	-132(ra) # 800052a8 <_Z8printIntiii>
    80003334:	00006517          	auipc	a0,0x6
    80003338:	ed450513          	addi	a0,a0,-300 # 80009208 <CONSOLE_STATUS+0x1f8>
    8000333c:	00002097          	auipc	ra,0x2
    80003340:	dbc080e7          	jalr	-580(ra) # 800050f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003344:	00000493          	li	s1,0
    80003348:	f99ff06f          	j	800032e0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000334c:	00006517          	auipc	a0,0x6
    80003350:	0fc50513          	addi	a0,a0,252 # 80009448 <CONSOLE_STATUS+0x438>
    80003354:	00002097          	auipc	ra,0x2
    80003358:	da4080e7          	jalr	-604(ra) # 800050f8 <_Z11printStringPKc>
    finishedB = true;
    8000335c:	00100793          	li	a5,1
    80003360:	00008717          	auipc	a4,0x8
    80003364:	30f704a3          	sb	a5,777(a4) # 8000b669 <_ZL9finishedB>
    thread_dispatch();
    80003368:	ffffe097          	auipc	ra,0xffffe
    8000336c:	178080e7          	jalr	376(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80003370:	01813083          	ld	ra,24(sp)
    80003374:	01013403          	ld	s0,16(sp)
    80003378:	00813483          	ld	s1,8(sp)
    8000337c:	00013903          	ld	s2,0(sp)
    80003380:	02010113          	addi	sp,sp,32
    80003384:	00008067          	ret

0000000080003388 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003388:	fe010113          	addi	sp,sp,-32
    8000338c:	00113c23          	sd	ra,24(sp)
    80003390:	00813823          	sd	s0,16(sp)
    80003394:	00913423          	sd	s1,8(sp)
    80003398:	01213023          	sd	s2,0(sp)
    8000339c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800033a0:	00000493          	li	s1,0
    800033a4:	0400006f          	j	800033e4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800033a8:	00006517          	auipc	a0,0x6
    800033ac:	c8850513          	addi	a0,a0,-888 # 80009030 <CONSOLE_STATUS+0x20>
    800033b0:	00002097          	auipc	ra,0x2
    800033b4:	d48080e7          	jalr	-696(ra) # 800050f8 <_Z11printStringPKc>
    800033b8:	00000613          	li	a2,0
    800033bc:	00a00593          	li	a1,10
    800033c0:	00048513          	mv	a0,s1
    800033c4:	00002097          	auipc	ra,0x2
    800033c8:	ee4080e7          	jalr	-284(ra) # 800052a8 <_Z8printIntiii>
    800033cc:	00006517          	auipc	a0,0x6
    800033d0:	e3c50513          	addi	a0,a0,-452 # 80009208 <CONSOLE_STATUS+0x1f8>
    800033d4:	00002097          	auipc	ra,0x2
    800033d8:	d24080e7          	jalr	-732(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800033dc:	0014849b          	addiw	s1,s1,1
    800033e0:	0ff4f493          	andi	s1,s1,255
    800033e4:	00200793          	li	a5,2
    800033e8:	fc97f0e3          	bgeu	a5,s1,800033a8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800033ec:	00006517          	auipc	a0,0x6
    800033f0:	06c50513          	addi	a0,a0,108 # 80009458 <CONSOLE_STATUS+0x448>
    800033f4:	00002097          	auipc	ra,0x2
    800033f8:	d04080e7          	jalr	-764(ra) # 800050f8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800033fc:	00700313          	li	t1,7
    thread_dispatch();
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	0e0080e7          	jalr	224(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003408:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000340c:	00006517          	auipc	a0,0x6
    80003410:	05c50513          	addi	a0,a0,92 # 80009468 <CONSOLE_STATUS+0x458>
    80003414:	00002097          	auipc	ra,0x2
    80003418:	ce4080e7          	jalr	-796(ra) # 800050f8 <_Z11printStringPKc>
    8000341c:	00000613          	li	a2,0
    80003420:	00a00593          	li	a1,10
    80003424:	0009051b          	sext.w	a0,s2
    80003428:	00002097          	auipc	ra,0x2
    8000342c:	e80080e7          	jalr	-384(ra) # 800052a8 <_Z8printIntiii>
    80003430:	00006517          	auipc	a0,0x6
    80003434:	dd850513          	addi	a0,a0,-552 # 80009208 <CONSOLE_STATUS+0x1f8>
    80003438:	00002097          	auipc	ra,0x2
    8000343c:	cc0080e7          	jalr	-832(ra) # 800050f8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003440:	00c00513          	li	a0,12
    80003444:	00000097          	auipc	ra,0x0
    80003448:	d30080e7          	jalr	-720(ra) # 80003174 <_ZL9fibonaccim>
    8000344c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003450:	00006517          	auipc	a0,0x6
    80003454:	02050513          	addi	a0,a0,32 # 80009470 <CONSOLE_STATUS+0x460>
    80003458:	00002097          	auipc	ra,0x2
    8000345c:	ca0080e7          	jalr	-864(ra) # 800050f8 <_Z11printStringPKc>
    80003460:	00000613          	li	a2,0
    80003464:	00a00593          	li	a1,10
    80003468:	0009051b          	sext.w	a0,s2
    8000346c:	00002097          	auipc	ra,0x2
    80003470:	e3c080e7          	jalr	-452(ra) # 800052a8 <_Z8printIntiii>
    80003474:	00006517          	auipc	a0,0x6
    80003478:	d9450513          	addi	a0,a0,-620 # 80009208 <CONSOLE_STATUS+0x1f8>
    8000347c:	00002097          	auipc	ra,0x2
    80003480:	c7c080e7          	jalr	-900(ra) # 800050f8 <_Z11printStringPKc>
    80003484:	0400006f          	j	800034c4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003488:	00006517          	auipc	a0,0x6
    8000348c:	ba850513          	addi	a0,a0,-1112 # 80009030 <CONSOLE_STATUS+0x20>
    80003490:	00002097          	auipc	ra,0x2
    80003494:	c68080e7          	jalr	-920(ra) # 800050f8 <_Z11printStringPKc>
    80003498:	00000613          	li	a2,0
    8000349c:	00a00593          	li	a1,10
    800034a0:	00048513          	mv	a0,s1
    800034a4:	00002097          	auipc	ra,0x2
    800034a8:	e04080e7          	jalr	-508(ra) # 800052a8 <_Z8printIntiii>
    800034ac:	00006517          	auipc	a0,0x6
    800034b0:	d5c50513          	addi	a0,a0,-676 # 80009208 <CONSOLE_STATUS+0x1f8>
    800034b4:	00002097          	auipc	ra,0x2
    800034b8:	c44080e7          	jalr	-956(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800034bc:	0014849b          	addiw	s1,s1,1
    800034c0:	0ff4f493          	andi	s1,s1,255
    800034c4:	00500793          	li	a5,5
    800034c8:	fc97f0e3          	bgeu	a5,s1,80003488 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800034cc:	00006517          	auipc	a0,0x6
    800034d0:	f6450513          	addi	a0,a0,-156 # 80009430 <CONSOLE_STATUS+0x420>
    800034d4:	00002097          	auipc	ra,0x2
    800034d8:	c24080e7          	jalr	-988(ra) # 800050f8 <_Z11printStringPKc>
    finishedC = true;
    800034dc:	00100793          	li	a5,1
    800034e0:	00008717          	auipc	a4,0x8
    800034e4:	18f70523          	sb	a5,394(a4) # 8000b66a <_ZL9finishedC>
    thread_dispatch();
    800034e8:	ffffe097          	auipc	ra,0xffffe
    800034ec:	ff8080e7          	jalr	-8(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800034f0:	01813083          	ld	ra,24(sp)
    800034f4:	01013403          	ld	s0,16(sp)
    800034f8:	00813483          	ld	s1,8(sp)
    800034fc:	00013903          	ld	s2,0(sp)
    80003500:	02010113          	addi	sp,sp,32
    80003504:	00008067          	ret

0000000080003508 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003508:	fe010113          	addi	sp,sp,-32
    8000350c:	00113c23          	sd	ra,24(sp)
    80003510:	00813823          	sd	s0,16(sp)
    80003514:	00913423          	sd	s1,8(sp)
    80003518:	01213023          	sd	s2,0(sp)
    8000351c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003520:	00a00493          	li	s1,10
    80003524:	0400006f          	j	80003564 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003528:	00006517          	auipc	a0,0x6
    8000352c:	f5850513          	addi	a0,a0,-168 # 80009480 <CONSOLE_STATUS+0x470>
    80003530:	00002097          	auipc	ra,0x2
    80003534:	bc8080e7          	jalr	-1080(ra) # 800050f8 <_Z11printStringPKc>
    80003538:	00000613          	li	a2,0
    8000353c:	00a00593          	li	a1,10
    80003540:	00048513          	mv	a0,s1
    80003544:	00002097          	auipc	ra,0x2
    80003548:	d64080e7          	jalr	-668(ra) # 800052a8 <_Z8printIntiii>
    8000354c:	00006517          	auipc	a0,0x6
    80003550:	cbc50513          	addi	a0,a0,-836 # 80009208 <CONSOLE_STATUS+0x1f8>
    80003554:	00002097          	auipc	ra,0x2
    80003558:	ba4080e7          	jalr	-1116(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000355c:	0014849b          	addiw	s1,s1,1
    80003560:	0ff4f493          	andi	s1,s1,255
    80003564:	00c00793          	li	a5,12
    80003568:	fc97f0e3          	bgeu	a5,s1,80003528 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000356c:	00006517          	auipc	a0,0x6
    80003570:	f1c50513          	addi	a0,a0,-228 # 80009488 <CONSOLE_STATUS+0x478>
    80003574:	00002097          	auipc	ra,0x2
    80003578:	b84080e7          	jalr	-1148(ra) # 800050f8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000357c:	00500313          	li	t1,5
    thread_dispatch();
    80003580:	ffffe097          	auipc	ra,0xffffe
    80003584:	f60080e7          	jalr	-160(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003588:	01000513          	li	a0,16
    8000358c:	00000097          	auipc	ra,0x0
    80003590:	be8080e7          	jalr	-1048(ra) # 80003174 <_ZL9fibonaccim>
    80003594:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003598:	00006517          	auipc	a0,0x6
    8000359c:	ae050513          	addi	a0,a0,-1312 # 80009078 <CONSOLE_STATUS+0x68>
    800035a0:	00002097          	auipc	ra,0x2
    800035a4:	b58080e7          	jalr	-1192(ra) # 800050f8 <_Z11printStringPKc>
    800035a8:	00000613          	li	a2,0
    800035ac:	00a00593          	li	a1,10
    800035b0:	0009051b          	sext.w	a0,s2
    800035b4:	00002097          	auipc	ra,0x2
    800035b8:	cf4080e7          	jalr	-780(ra) # 800052a8 <_Z8printIntiii>
    800035bc:	00006517          	auipc	a0,0x6
    800035c0:	c4c50513          	addi	a0,a0,-948 # 80009208 <CONSOLE_STATUS+0x1f8>
    800035c4:	00002097          	auipc	ra,0x2
    800035c8:	b34080e7          	jalr	-1228(ra) # 800050f8 <_Z11printStringPKc>
    800035cc:	0400006f          	j	8000360c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800035d0:	00006517          	auipc	a0,0x6
    800035d4:	eb050513          	addi	a0,a0,-336 # 80009480 <CONSOLE_STATUS+0x470>
    800035d8:	00002097          	auipc	ra,0x2
    800035dc:	b20080e7          	jalr	-1248(ra) # 800050f8 <_Z11printStringPKc>
    800035e0:	00000613          	li	a2,0
    800035e4:	00a00593          	li	a1,10
    800035e8:	00048513          	mv	a0,s1
    800035ec:	00002097          	auipc	ra,0x2
    800035f0:	cbc080e7          	jalr	-836(ra) # 800052a8 <_Z8printIntiii>
    800035f4:	00006517          	auipc	a0,0x6
    800035f8:	c1450513          	addi	a0,a0,-1004 # 80009208 <CONSOLE_STATUS+0x1f8>
    800035fc:	00002097          	auipc	ra,0x2
    80003600:	afc080e7          	jalr	-1284(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003604:	0014849b          	addiw	s1,s1,1
    80003608:	0ff4f493          	andi	s1,s1,255
    8000360c:	00f00793          	li	a5,15
    80003610:	fc97f0e3          	bgeu	a5,s1,800035d0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003614:	00006517          	auipc	a0,0x6
    80003618:	e8450513          	addi	a0,a0,-380 # 80009498 <CONSOLE_STATUS+0x488>
    8000361c:	00002097          	auipc	ra,0x2
    80003620:	adc080e7          	jalr	-1316(ra) # 800050f8 <_Z11printStringPKc>
    finishedD = true;
    80003624:	00100793          	li	a5,1
    80003628:	00008717          	auipc	a4,0x8
    8000362c:	04f701a3          	sb	a5,67(a4) # 8000b66b <_ZL9finishedD>
    thread_dispatch();
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	eb0080e7          	jalr	-336(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80003638:	01813083          	ld	ra,24(sp)
    8000363c:	01013403          	ld	s0,16(sp)
    80003640:	00813483          	ld	s1,8(sp)
    80003644:	00013903          	ld	s2,0(sp)
    80003648:	02010113          	addi	sp,sp,32
    8000364c:	00008067          	ret

0000000080003650 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003650:	fc010113          	addi	sp,sp,-64
    80003654:	02113c23          	sd	ra,56(sp)
    80003658:	02813823          	sd	s0,48(sp)
    8000365c:	02913423          	sd	s1,40(sp)
    80003660:	03213023          	sd	s2,32(sp)
    80003664:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003668:	02000513          	li	a0,32
    8000366c:	fffff097          	auipc	ra,0xfffff
    80003670:	b98080e7          	jalr	-1128(ra) # 80002204 <_Znwm>
    80003674:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003678:	fffff097          	auipc	ra,0xfffff
    8000367c:	d3c080e7          	jalr	-708(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80003680:	00008797          	auipc	a5,0x8
    80003684:	d8078793          	addi	a5,a5,-640 # 8000b400 <_ZTV7WorkerA+0x10>
    80003688:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000368c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003690:	00006517          	auipc	a0,0x6
    80003694:	e1850513          	addi	a0,a0,-488 # 800094a8 <CONSOLE_STATUS+0x498>
    80003698:	00002097          	auipc	ra,0x2
    8000369c:	a60080e7          	jalr	-1440(ra) # 800050f8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800036a0:	02000513          	li	a0,32
    800036a4:	fffff097          	auipc	ra,0xfffff
    800036a8:	b60080e7          	jalr	-1184(ra) # 80002204 <_Znwm>
    800036ac:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800036b0:	fffff097          	auipc	ra,0xfffff
    800036b4:	d04080e7          	jalr	-764(ra) # 800023b4 <_ZN6ThreadC1Ev>
    800036b8:	00008797          	auipc	a5,0x8
    800036bc:	d7078793          	addi	a5,a5,-656 # 8000b428 <_ZTV7WorkerB+0x10>
    800036c0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800036c4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800036c8:	00006517          	auipc	a0,0x6
    800036cc:	df850513          	addi	a0,a0,-520 # 800094c0 <CONSOLE_STATUS+0x4b0>
    800036d0:	00002097          	auipc	ra,0x2
    800036d4:	a28080e7          	jalr	-1496(ra) # 800050f8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800036d8:	02000513          	li	a0,32
    800036dc:	fffff097          	auipc	ra,0xfffff
    800036e0:	b28080e7          	jalr	-1240(ra) # 80002204 <_Znwm>
    800036e4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800036e8:	fffff097          	auipc	ra,0xfffff
    800036ec:	ccc080e7          	jalr	-820(ra) # 800023b4 <_ZN6ThreadC1Ev>
    800036f0:	00008797          	auipc	a5,0x8
    800036f4:	d6078793          	addi	a5,a5,-672 # 8000b450 <_ZTV7WorkerC+0x10>
    800036f8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800036fc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003700:	00006517          	auipc	a0,0x6
    80003704:	dd850513          	addi	a0,a0,-552 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80003708:	00002097          	auipc	ra,0x2
    8000370c:	9f0080e7          	jalr	-1552(ra) # 800050f8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003710:	02000513          	li	a0,32
    80003714:	fffff097          	auipc	ra,0xfffff
    80003718:	af0080e7          	jalr	-1296(ra) # 80002204 <_Znwm>
    8000371c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003720:	fffff097          	auipc	ra,0xfffff
    80003724:	c94080e7          	jalr	-876(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80003728:	00008797          	auipc	a5,0x8
    8000372c:	d5078793          	addi	a5,a5,-688 # 8000b478 <_ZTV7WorkerD+0x10>
    80003730:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003734:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003738:	00006517          	auipc	a0,0x6
    8000373c:	db850513          	addi	a0,a0,-584 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80003740:	00002097          	auipc	ra,0x2
    80003744:	9b8080e7          	jalr	-1608(ra) # 800050f8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003748:	00000493          	li	s1,0
    8000374c:	00300793          	li	a5,3
    80003750:	0297c663          	blt	a5,s1,8000377c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003754:	00349793          	slli	a5,s1,0x3
    80003758:	fe040713          	addi	a4,s0,-32
    8000375c:	00f707b3          	add	a5,a4,a5
    80003760:	fe07b503          	ld	a0,-32(a5)
    80003764:	fffff097          	auipc	ra,0xfffff
    80003768:	c88080e7          	jalr	-888(ra) # 800023ec <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000376c:	0014849b          	addiw	s1,s1,1
    80003770:	fddff06f          	j	8000374c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003774:	fffff097          	auipc	ra,0xfffff
    80003778:	ccc080e7          	jalr	-820(ra) # 80002440 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000377c:	00008797          	auipc	a5,0x8
    80003780:	eec7c783          	lbu	a5,-276(a5) # 8000b668 <_ZL9finishedA>
    80003784:	fe0788e3          	beqz	a5,80003774 <_Z20Threads_CPP_API_testv+0x124>
    80003788:	00008797          	auipc	a5,0x8
    8000378c:	ee17c783          	lbu	a5,-287(a5) # 8000b669 <_ZL9finishedB>
    80003790:	fe0782e3          	beqz	a5,80003774 <_Z20Threads_CPP_API_testv+0x124>
    80003794:	00008797          	auipc	a5,0x8
    80003798:	ed67c783          	lbu	a5,-298(a5) # 8000b66a <_ZL9finishedC>
    8000379c:	fc078ce3          	beqz	a5,80003774 <_Z20Threads_CPP_API_testv+0x124>
    800037a0:	00008797          	auipc	a5,0x8
    800037a4:	ecb7c783          	lbu	a5,-309(a5) # 8000b66b <_ZL9finishedD>
    800037a8:	fc0786e3          	beqz	a5,80003774 <_Z20Threads_CPP_API_testv+0x124>
    800037ac:	fc040493          	addi	s1,s0,-64
    800037b0:	0080006f          	j	800037b8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    800037b4:	00848493          	addi	s1,s1,8
    800037b8:	fe040793          	addi	a5,s0,-32
    800037bc:	08f48663          	beq	s1,a5,80003848 <_Z20Threads_CPP_API_testv+0x1f8>
    800037c0:	0004b503          	ld	a0,0(s1)
    800037c4:	fe0508e3          	beqz	a0,800037b4 <_Z20Threads_CPP_API_testv+0x164>
    800037c8:	00053783          	ld	a5,0(a0)
    800037cc:	0087b783          	ld	a5,8(a5)
    800037d0:	000780e7          	jalr	a5
    800037d4:	fe1ff06f          	j	800037b4 <_Z20Threads_CPP_API_testv+0x164>
    800037d8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800037dc:	00048513          	mv	a0,s1
    800037e0:	fffff097          	auipc	ra,0xfffff
    800037e4:	a74080e7          	jalr	-1420(ra) # 80002254 <_ZdlPv>
    800037e8:	00090513          	mv	a0,s2
    800037ec:	00009097          	auipc	ra,0x9
    800037f0:	f8c080e7          	jalr	-116(ra) # 8000c778 <_Unwind_Resume>
    800037f4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800037f8:	00048513          	mv	a0,s1
    800037fc:	fffff097          	auipc	ra,0xfffff
    80003800:	a58080e7          	jalr	-1448(ra) # 80002254 <_ZdlPv>
    80003804:	00090513          	mv	a0,s2
    80003808:	00009097          	auipc	ra,0x9
    8000380c:	f70080e7          	jalr	-144(ra) # 8000c778 <_Unwind_Resume>
    80003810:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003814:	00048513          	mv	a0,s1
    80003818:	fffff097          	auipc	ra,0xfffff
    8000381c:	a3c080e7          	jalr	-1476(ra) # 80002254 <_ZdlPv>
    80003820:	00090513          	mv	a0,s2
    80003824:	00009097          	auipc	ra,0x9
    80003828:	f54080e7          	jalr	-172(ra) # 8000c778 <_Unwind_Resume>
    8000382c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003830:	00048513          	mv	a0,s1
    80003834:	fffff097          	auipc	ra,0xfffff
    80003838:	a20080e7          	jalr	-1504(ra) # 80002254 <_ZdlPv>
    8000383c:	00090513          	mv	a0,s2
    80003840:	00009097          	auipc	ra,0x9
    80003844:	f38080e7          	jalr	-200(ra) # 8000c778 <_Unwind_Resume>
}
    80003848:	03813083          	ld	ra,56(sp)
    8000384c:	03013403          	ld	s0,48(sp)
    80003850:	02813483          	ld	s1,40(sp)
    80003854:	02013903          	ld	s2,32(sp)
    80003858:	04010113          	addi	sp,sp,64
    8000385c:	00008067          	ret

0000000080003860 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003860:	ff010113          	addi	sp,sp,-16
    80003864:	00113423          	sd	ra,8(sp)
    80003868:	00813023          	sd	s0,0(sp)
    8000386c:	01010413          	addi	s0,sp,16
    80003870:	00008797          	auipc	a5,0x8
    80003874:	b9078793          	addi	a5,a5,-1136 # 8000b400 <_ZTV7WorkerA+0x10>
    80003878:	00f53023          	sd	a5,0(a0)
    8000387c:	fffff097          	auipc	ra,0xfffff
    80003880:	a68080e7          	jalr	-1432(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80003884:	00813083          	ld	ra,8(sp)
    80003888:	00013403          	ld	s0,0(sp)
    8000388c:	01010113          	addi	sp,sp,16
    80003890:	00008067          	ret

0000000080003894 <_ZN7WorkerAD0Ev>:
    80003894:	fe010113          	addi	sp,sp,-32
    80003898:	00113c23          	sd	ra,24(sp)
    8000389c:	00813823          	sd	s0,16(sp)
    800038a0:	00913423          	sd	s1,8(sp)
    800038a4:	02010413          	addi	s0,sp,32
    800038a8:	00050493          	mv	s1,a0
    800038ac:	00008797          	auipc	a5,0x8
    800038b0:	b5478793          	addi	a5,a5,-1196 # 8000b400 <_ZTV7WorkerA+0x10>
    800038b4:	00f53023          	sd	a5,0(a0)
    800038b8:	fffff097          	auipc	ra,0xfffff
    800038bc:	a2c080e7          	jalr	-1492(ra) # 800022e4 <_ZN6ThreadD1Ev>
    800038c0:	00048513          	mv	a0,s1
    800038c4:	fffff097          	auipc	ra,0xfffff
    800038c8:	990080e7          	jalr	-1648(ra) # 80002254 <_ZdlPv>
    800038cc:	01813083          	ld	ra,24(sp)
    800038d0:	01013403          	ld	s0,16(sp)
    800038d4:	00813483          	ld	s1,8(sp)
    800038d8:	02010113          	addi	sp,sp,32
    800038dc:	00008067          	ret

00000000800038e0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800038e0:	ff010113          	addi	sp,sp,-16
    800038e4:	00113423          	sd	ra,8(sp)
    800038e8:	00813023          	sd	s0,0(sp)
    800038ec:	01010413          	addi	s0,sp,16
    800038f0:	00008797          	auipc	a5,0x8
    800038f4:	b3878793          	addi	a5,a5,-1224 # 8000b428 <_ZTV7WorkerB+0x10>
    800038f8:	00f53023          	sd	a5,0(a0)
    800038fc:	fffff097          	auipc	ra,0xfffff
    80003900:	9e8080e7          	jalr	-1560(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80003904:	00813083          	ld	ra,8(sp)
    80003908:	00013403          	ld	s0,0(sp)
    8000390c:	01010113          	addi	sp,sp,16
    80003910:	00008067          	ret

0000000080003914 <_ZN7WorkerBD0Ev>:
    80003914:	fe010113          	addi	sp,sp,-32
    80003918:	00113c23          	sd	ra,24(sp)
    8000391c:	00813823          	sd	s0,16(sp)
    80003920:	00913423          	sd	s1,8(sp)
    80003924:	02010413          	addi	s0,sp,32
    80003928:	00050493          	mv	s1,a0
    8000392c:	00008797          	auipc	a5,0x8
    80003930:	afc78793          	addi	a5,a5,-1284 # 8000b428 <_ZTV7WorkerB+0x10>
    80003934:	00f53023          	sd	a5,0(a0)
    80003938:	fffff097          	auipc	ra,0xfffff
    8000393c:	9ac080e7          	jalr	-1620(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80003940:	00048513          	mv	a0,s1
    80003944:	fffff097          	auipc	ra,0xfffff
    80003948:	910080e7          	jalr	-1776(ra) # 80002254 <_ZdlPv>
    8000394c:	01813083          	ld	ra,24(sp)
    80003950:	01013403          	ld	s0,16(sp)
    80003954:	00813483          	ld	s1,8(sp)
    80003958:	02010113          	addi	sp,sp,32
    8000395c:	00008067          	ret

0000000080003960 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003960:	ff010113          	addi	sp,sp,-16
    80003964:	00113423          	sd	ra,8(sp)
    80003968:	00813023          	sd	s0,0(sp)
    8000396c:	01010413          	addi	s0,sp,16
    80003970:	00008797          	auipc	a5,0x8
    80003974:	ae078793          	addi	a5,a5,-1312 # 8000b450 <_ZTV7WorkerC+0x10>
    80003978:	00f53023          	sd	a5,0(a0)
    8000397c:	fffff097          	auipc	ra,0xfffff
    80003980:	968080e7          	jalr	-1688(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80003984:	00813083          	ld	ra,8(sp)
    80003988:	00013403          	ld	s0,0(sp)
    8000398c:	01010113          	addi	sp,sp,16
    80003990:	00008067          	ret

0000000080003994 <_ZN7WorkerCD0Ev>:
    80003994:	fe010113          	addi	sp,sp,-32
    80003998:	00113c23          	sd	ra,24(sp)
    8000399c:	00813823          	sd	s0,16(sp)
    800039a0:	00913423          	sd	s1,8(sp)
    800039a4:	02010413          	addi	s0,sp,32
    800039a8:	00050493          	mv	s1,a0
    800039ac:	00008797          	auipc	a5,0x8
    800039b0:	aa478793          	addi	a5,a5,-1372 # 8000b450 <_ZTV7WorkerC+0x10>
    800039b4:	00f53023          	sd	a5,0(a0)
    800039b8:	fffff097          	auipc	ra,0xfffff
    800039bc:	92c080e7          	jalr	-1748(ra) # 800022e4 <_ZN6ThreadD1Ev>
    800039c0:	00048513          	mv	a0,s1
    800039c4:	fffff097          	auipc	ra,0xfffff
    800039c8:	890080e7          	jalr	-1904(ra) # 80002254 <_ZdlPv>
    800039cc:	01813083          	ld	ra,24(sp)
    800039d0:	01013403          	ld	s0,16(sp)
    800039d4:	00813483          	ld	s1,8(sp)
    800039d8:	02010113          	addi	sp,sp,32
    800039dc:	00008067          	ret

00000000800039e0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800039e0:	ff010113          	addi	sp,sp,-16
    800039e4:	00113423          	sd	ra,8(sp)
    800039e8:	00813023          	sd	s0,0(sp)
    800039ec:	01010413          	addi	s0,sp,16
    800039f0:	00008797          	auipc	a5,0x8
    800039f4:	a8878793          	addi	a5,a5,-1400 # 8000b478 <_ZTV7WorkerD+0x10>
    800039f8:	00f53023          	sd	a5,0(a0)
    800039fc:	fffff097          	auipc	ra,0xfffff
    80003a00:	8e8080e7          	jalr	-1816(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80003a04:	00813083          	ld	ra,8(sp)
    80003a08:	00013403          	ld	s0,0(sp)
    80003a0c:	01010113          	addi	sp,sp,16
    80003a10:	00008067          	ret

0000000080003a14 <_ZN7WorkerDD0Ev>:
    80003a14:	fe010113          	addi	sp,sp,-32
    80003a18:	00113c23          	sd	ra,24(sp)
    80003a1c:	00813823          	sd	s0,16(sp)
    80003a20:	00913423          	sd	s1,8(sp)
    80003a24:	02010413          	addi	s0,sp,32
    80003a28:	00050493          	mv	s1,a0
    80003a2c:	00008797          	auipc	a5,0x8
    80003a30:	a4c78793          	addi	a5,a5,-1460 # 8000b478 <_ZTV7WorkerD+0x10>
    80003a34:	00f53023          	sd	a5,0(a0)
    80003a38:	fffff097          	auipc	ra,0xfffff
    80003a3c:	8ac080e7          	jalr	-1876(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80003a40:	00048513          	mv	a0,s1
    80003a44:	fffff097          	auipc	ra,0xfffff
    80003a48:	810080e7          	jalr	-2032(ra) # 80002254 <_ZdlPv>
    80003a4c:	01813083          	ld	ra,24(sp)
    80003a50:	01013403          	ld	s0,16(sp)
    80003a54:	00813483          	ld	s1,8(sp)
    80003a58:	02010113          	addi	sp,sp,32
    80003a5c:	00008067          	ret

0000000080003a60 <_ZN7WorkerA3runEv>:
    void run() override {
    80003a60:	ff010113          	addi	sp,sp,-16
    80003a64:	00113423          	sd	ra,8(sp)
    80003a68:	00813023          	sd	s0,0(sp)
    80003a6c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003a70:	00000593          	li	a1,0
    80003a74:	fffff097          	auipc	ra,0xfffff
    80003a78:	774080e7          	jalr	1908(ra) # 800031e8 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003a7c:	00813083          	ld	ra,8(sp)
    80003a80:	00013403          	ld	s0,0(sp)
    80003a84:	01010113          	addi	sp,sp,16
    80003a88:	00008067          	ret

0000000080003a8c <_ZN7WorkerB3runEv>:
    void run() override {
    80003a8c:	ff010113          	addi	sp,sp,-16
    80003a90:	00113423          	sd	ra,8(sp)
    80003a94:	00813023          	sd	s0,0(sp)
    80003a98:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003a9c:	00000593          	li	a1,0
    80003aa0:	00000097          	auipc	ra,0x0
    80003aa4:	814080e7          	jalr	-2028(ra) # 800032b4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80003aa8:	00813083          	ld	ra,8(sp)
    80003aac:	00013403          	ld	s0,0(sp)
    80003ab0:	01010113          	addi	sp,sp,16
    80003ab4:	00008067          	ret

0000000080003ab8 <_ZN7WorkerC3runEv>:
    void run() override {
    80003ab8:	ff010113          	addi	sp,sp,-16
    80003abc:	00113423          	sd	ra,8(sp)
    80003ac0:	00813023          	sd	s0,0(sp)
    80003ac4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003ac8:	00000593          	li	a1,0
    80003acc:	00000097          	auipc	ra,0x0
    80003ad0:	8bc080e7          	jalr	-1860(ra) # 80003388 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003ad4:	00813083          	ld	ra,8(sp)
    80003ad8:	00013403          	ld	s0,0(sp)
    80003adc:	01010113          	addi	sp,sp,16
    80003ae0:	00008067          	ret

0000000080003ae4 <_ZN7WorkerD3runEv>:
    void run() override {
    80003ae4:	ff010113          	addi	sp,sp,-16
    80003ae8:	00113423          	sd	ra,8(sp)
    80003aec:	00813023          	sd	s0,0(sp)
    80003af0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003af4:	00000593          	li	a1,0
    80003af8:	00000097          	auipc	ra,0x0
    80003afc:	a10080e7          	jalr	-1520(ra) # 80003508 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003b00:	00813083          	ld	ra,8(sp)
    80003b04:	00013403          	ld	s0,0(sp)
    80003b08:	01010113          	addi	sp,sp,16
    80003b0c:	00008067          	ret

0000000080003b10 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80003b10:	f8010113          	addi	sp,sp,-128
    80003b14:	06113c23          	sd	ra,120(sp)
    80003b18:	06813823          	sd	s0,112(sp)
    80003b1c:	06913423          	sd	s1,104(sp)
    80003b20:	07213023          	sd	s2,96(sp)
    80003b24:	05313c23          	sd	s3,88(sp)
    80003b28:	05413823          	sd	s4,80(sp)
    80003b2c:	05513423          	sd	s5,72(sp)
    80003b30:	05613023          	sd	s6,64(sp)
    80003b34:	03713c23          	sd	s7,56(sp)
    80003b38:	03813823          	sd	s8,48(sp)
    80003b3c:	03913423          	sd	s9,40(sp)
    80003b40:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80003b44:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80003b48:	00005517          	auipc	a0,0x5
    80003b4c:	7f850513          	addi	a0,a0,2040 # 80009340 <CONSOLE_STATUS+0x330>
    80003b50:	00001097          	auipc	ra,0x1
    80003b54:	5a8080e7          	jalr	1448(ra) # 800050f8 <_Z11printStringPKc>
    getString(input, 30);
    80003b58:	01e00593          	li	a1,30
    80003b5c:	f8040493          	addi	s1,s0,-128
    80003b60:	00048513          	mv	a0,s1
    80003b64:	00001097          	auipc	ra,0x1
    80003b68:	61c080e7          	jalr	1564(ra) # 80005180 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003b6c:	00048513          	mv	a0,s1
    80003b70:	00001097          	auipc	ra,0x1
    80003b74:	6e8080e7          	jalr	1768(ra) # 80005258 <_Z11stringToIntPKc>
    80003b78:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003b7c:	00005517          	auipc	a0,0x5
    80003b80:	7e450513          	addi	a0,a0,2020 # 80009360 <CONSOLE_STATUS+0x350>
    80003b84:	00001097          	auipc	ra,0x1
    80003b88:	574080e7          	jalr	1396(ra) # 800050f8 <_Z11printStringPKc>
    getString(input, 30);
    80003b8c:	01e00593          	li	a1,30
    80003b90:	00048513          	mv	a0,s1
    80003b94:	00001097          	auipc	ra,0x1
    80003b98:	5ec080e7          	jalr	1516(ra) # 80005180 <_Z9getStringPci>
    n = stringToInt(input);
    80003b9c:	00048513          	mv	a0,s1
    80003ba0:	00001097          	auipc	ra,0x1
    80003ba4:	6b8080e7          	jalr	1720(ra) # 80005258 <_Z11stringToIntPKc>
    80003ba8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003bac:	00005517          	auipc	a0,0x5
    80003bb0:	7d450513          	addi	a0,a0,2004 # 80009380 <CONSOLE_STATUS+0x370>
    80003bb4:	00001097          	auipc	ra,0x1
    80003bb8:	544080e7          	jalr	1348(ra) # 800050f8 <_Z11printStringPKc>
    printInt(threadNum);
    80003bbc:	00000613          	li	a2,0
    80003bc0:	00a00593          	li	a1,10
    80003bc4:	00098513          	mv	a0,s3
    80003bc8:	00001097          	auipc	ra,0x1
    80003bcc:	6e0080e7          	jalr	1760(ra) # 800052a8 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003bd0:	00005517          	auipc	a0,0x5
    80003bd4:	7c850513          	addi	a0,a0,1992 # 80009398 <CONSOLE_STATUS+0x388>
    80003bd8:	00001097          	auipc	ra,0x1
    80003bdc:	520080e7          	jalr	1312(ra) # 800050f8 <_Z11printStringPKc>
    printInt(n);
    80003be0:	00000613          	li	a2,0
    80003be4:	00a00593          	li	a1,10
    80003be8:	00048513          	mv	a0,s1
    80003bec:	00001097          	auipc	ra,0x1
    80003bf0:	6bc080e7          	jalr	1724(ra) # 800052a8 <_Z8printIntiii>
    printString(".\n");
    80003bf4:	00005517          	auipc	a0,0x5
    80003bf8:	7bc50513          	addi	a0,a0,1980 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003bfc:	00001097          	auipc	ra,0x1
    80003c00:	4fc080e7          	jalr	1276(ra) # 800050f8 <_Z11printStringPKc>
    if (threadNum > n) {
    80003c04:	0334c463          	blt	s1,s3,80003c2c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80003c08:	03305c63          	blez	s3,80003c40 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003c0c:	03800513          	li	a0,56
    80003c10:	ffffe097          	auipc	ra,0xffffe
    80003c14:	5f4080e7          	jalr	1524(ra) # 80002204 <_Znwm>
    80003c18:	00050a93          	mv	s5,a0
    80003c1c:	00048593          	mv	a1,s1
    80003c20:	00001097          	auipc	ra,0x1
    80003c24:	7a8080e7          	jalr	1960(ra) # 800053c8 <_ZN9BufferCPPC1Ei>
    80003c28:	0300006f          	j	80003c58 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003c2c:	00005517          	auipc	a0,0x5
    80003c30:	78c50513          	addi	a0,a0,1932 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80003c34:	00001097          	auipc	ra,0x1
    80003c38:	4c4080e7          	jalr	1220(ra) # 800050f8 <_Z11printStringPKc>
        return;
    80003c3c:	0140006f          	j	80003c50 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003c40:	00005517          	auipc	a0,0x5
    80003c44:	7b850513          	addi	a0,a0,1976 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80003c48:	00001097          	auipc	ra,0x1
    80003c4c:	4b0080e7          	jalr	1200(ra) # 800050f8 <_Z11printStringPKc>
        return;
    80003c50:	000c0113          	mv	sp,s8
    80003c54:	2140006f          	j	80003e68 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80003c58:	01000513          	li	a0,16
    80003c5c:	ffffe097          	auipc	ra,0xffffe
    80003c60:	5a8080e7          	jalr	1448(ra) # 80002204 <_Znwm>
    80003c64:	00050913          	mv	s2,a0
    80003c68:	00000593          	li	a1,0
    80003c6c:	fffff097          	auipc	ra,0xfffff
    80003c70:	878080e7          	jalr	-1928(ra) # 800024e4 <_ZN9SemaphoreC1Ej>
    80003c74:	00008797          	auipc	a5,0x8
    80003c78:	a127b223          	sd	s2,-1532(a5) # 8000b678 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80003c7c:	00399793          	slli	a5,s3,0x3
    80003c80:	00f78793          	addi	a5,a5,15
    80003c84:	ff07f793          	andi	a5,a5,-16
    80003c88:	40f10133          	sub	sp,sp,a5
    80003c8c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80003c90:	0019871b          	addiw	a4,s3,1
    80003c94:	00171793          	slli	a5,a4,0x1
    80003c98:	00e787b3          	add	a5,a5,a4
    80003c9c:	00379793          	slli	a5,a5,0x3
    80003ca0:	00f78793          	addi	a5,a5,15
    80003ca4:	ff07f793          	andi	a5,a5,-16
    80003ca8:	40f10133          	sub	sp,sp,a5
    80003cac:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80003cb0:	00199493          	slli	s1,s3,0x1
    80003cb4:	013484b3          	add	s1,s1,s3
    80003cb8:	00349493          	slli	s1,s1,0x3
    80003cbc:	009b04b3          	add	s1,s6,s1
    80003cc0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80003cc4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80003cc8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003ccc:	02800513          	li	a0,40
    80003cd0:	ffffe097          	auipc	ra,0xffffe
    80003cd4:	534080e7          	jalr	1332(ra) # 80002204 <_Znwm>
    80003cd8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003cdc:	ffffe097          	auipc	ra,0xffffe
    80003ce0:	6d8080e7          	jalr	1752(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80003ce4:	00008797          	auipc	a5,0x8
    80003ce8:	80c78793          	addi	a5,a5,-2036 # 8000b4f0 <_ZTV8Consumer+0x10>
    80003cec:	00fbb023          	sd	a5,0(s7)
    80003cf0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80003cf4:	000b8513          	mv	a0,s7
    80003cf8:	ffffe097          	auipc	ra,0xffffe
    80003cfc:	6f4080e7          	jalr	1780(ra) # 800023ec <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80003d00:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80003d04:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80003d08:	00008797          	auipc	a5,0x8
    80003d0c:	9707b783          	ld	a5,-1680(a5) # 8000b678 <_ZL10waitForAll>
    80003d10:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003d14:	02800513          	li	a0,40
    80003d18:	ffffe097          	auipc	ra,0xffffe
    80003d1c:	4ec080e7          	jalr	1260(ra) # 80002204 <_Znwm>
    80003d20:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80003d24:	ffffe097          	auipc	ra,0xffffe
    80003d28:	690080e7          	jalr	1680(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80003d2c:	00007797          	auipc	a5,0x7
    80003d30:	77478793          	addi	a5,a5,1908 # 8000b4a0 <_ZTV16ProducerKeyborad+0x10>
    80003d34:	00f4b023          	sd	a5,0(s1)
    80003d38:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003d3c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80003d40:	00048513          	mv	a0,s1
    80003d44:	ffffe097          	auipc	ra,0xffffe
    80003d48:	6a8080e7          	jalr	1704(ra) # 800023ec <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003d4c:	00100913          	li	s2,1
    80003d50:	0300006f          	j	80003d80 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003d54:	00007797          	auipc	a5,0x7
    80003d58:	77478793          	addi	a5,a5,1908 # 8000b4c8 <_ZTV8Producer+0x10>
    80003d5c:	00fcb023          	sd	a5,0(s9)
    80003d60:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80003d64:	00391793          	slli	a5,s2,0x3
    80003d68:	00fa07b3          	add	a5,s4,a5
    80003d6c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80003d70:	000c8513          	mv	a0,s9
    80003d74:	ffffe097          	auipc	ra,0xffffe
    80003d78:	678080e7          	jalr	1656(ra) # 800023ec <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003d7c:	0019091b          	addiw	s2,s2,1
    80003d80:	05395263          	bge	s2,s3,80003dc4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80003d84:	00191493          	slli	s1,s2,0x1
    80003d88:	012484b3          	add	s1,s1,s2
    80003d8c:	00349493          	slli	s1,s1,0x3
    80003d90:	009b04b3          	add	s1,s6,s1
    80003d94:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80003d98:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80003d9c:	00008797          	auipc	a5,0x8
    80003da0:	8dc7b783          	ld	a5,-1828(a5) # 8000b678 <_ZL10waitForAll>
    80003da4:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80003da8:	02800513          	li	a0,40
    80003dac:	ffffe097          	auipc	ra,0xffffe
    80003db0:	458080e7          	jalr	1112(ra) # 80002204 <_Znwm>
    80003db4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003db8:	ffffe097          	auipc	ra,0xffffe
    80003dbc:	5fc080e7          	jalr	1532(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80003dc0:	f95ff06f          	j	80003d54 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80003dc4:	ffffe097          	auipc	ra,0xffffe
    80003dc8:	67c080e7          	jalr	1660(ra) # 80002440 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003dcc:	00000493          	li	s1,0
    80003dd0:	0099ce63          	blt	s3,s1,80003dec <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80003dd4:	00008517          	auipc	a0,0x8
    80003dd8:	8a453503          	ld	a0,-1884(a0) # 8000b678 <_ZL10waitForAll>
    80003ddc:	ffffe097          	auipc	ra,0xffffe
    80003de0:	740080e7          	jalr	1856(ra) # 8000251c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80003de4:	0014849b          	addiw	s1,s1,1
    80003de8:	fe9ff06f          	j	80003dd0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80003dec:	00008517          	auipc	a0,0x8
    80003df0:	88c53503          	ld	a0,-1908(a0) # 8000b678 <_ZL10waitForAll>
    80003df4:	00050863          	beqz	a0,80003e04 <_Z20testConsumerProducerv+0x2f4>
    80003df8:	00053783          	ld	a5,0(a0)
    80003dfc:	0087b783          	ld	a5,8(a5)
    80003e00:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80003e04:	00000493          	li	s1,0
    80003e08:	0080006f          	j	80003e10 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80003e0c:	0014849b          	addiw	s1,s1,1
    80003e10:	0334d263          	bge	s1,s3,80003e34 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80003e14:	00349793          	slli	a5,s1,0x3
    80003e18:	00fa07b3          	add	a5,s4,a5
    80003e1c:	0007b503          	ld	a0,0(a5)
    80003e20:	fe0506e3          	beqz	a0,80003e0c <_Z20testConsumerProducerv+0x2fc>
    80003e24:	00053783          	ld	a5,0(a0)
    80003e28:	0087b783          	ld	a5,8(a5)
    80003e2c:	000780e7          	jalr	a5
    80003e30:	fddff06f          	j	80003e0c <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80003e34:	000b8a63          	beqz	s7,80003e48 <_Z20testConsumerProducerv+0x338>
    80003e38:	000bb783          	ld	a5,0(s7)
    80003e3c:	0087b783          	ld	a5,8(a5)
    80003e40:	000b8513          	mv	a0,s7
    80003e44:	000780e7          	jalr	a5
    delete buffer;
    80003e48:	000a8e63          	beqz	s5,80003e64 <_Z20testConsumerProducerv+0x354>
    80003e4c:	000a8513          	mv	a0,s5
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	870080e7          	jalr	-1936(ra) # 800056c0 <_ZN9BufferCPPD1Ev>
    80003e58:	000a8513          	mv	a0,s5
    80003e5c:	ffffe097          	auipc	ra,0xffffe
    80003e60:	3f8080e7          	jalr	1016(ra) # 80002254 <_ZdlPv>
    80003e64:	000c0113          	mv	sp,s8
}
    80003e68:	f8040113          	addi	sp,s0,-128
    80003e6c:	07813083          	ld	ra,120(sp)
    80003e70:	07013403          	ld	s0,112(sp)
    80003e74:	06813483          	ld	s1,104(sp)
    80003e78:	06013903          	ld	s2,96(sp)
    80003e7c:	05813983          	ld	s3,88(sp)
    80003e80:	05013a03          	ld	s4,80(sp)
    80003e84:	04813a83          	ld	s5,72(sp)
    80003e88:	04013b03          	ld	s6,64(sp)
    80003e8c:	03813b83          	ld	s7,56(sp)
    80003e90:	03013c03          	ld	s8,48(sp)
    80003e94:	02813c83          	ld	s9,40(sp)
    80003e98:	08010113          	addi	sp,sp,128
    80003e9c:	00008067          	ret
    80003ea0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003ea4:	000a8513          	mv	a0,s5
    80003ea8:	ffffe097          	auipc	ra,0xffffe
    80003eac:	3ac080e7          	jalr	940(ra) # 80002254 <_ZdlPv>
    80003eb0:	00048513          	mv	a0,s1
    80003eb4:	00009097          	auipc	ra,0x9
    80003eb8:	8c4080e7          	jalr	-1852(ra) # 8000c778 <_Unwind_Resume>
    80003ebc:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80003ec0:	00090513          	mv	a0,s2
    80003ec4:	ffffe097          	auipc	ra,0xffffe
    80003ec8:	390080e7          	jalr	912(ra) # 80002254 <_ZdlPv>
    80003ecc:	00048513          	mv	a0,s1
    80003ed0:	00009097          	auipc	ra,0x9
    80003ed4:	8a8080e7          	jalr	-1880(ra) # 8000c778 <_Unwind_Resume>
    80003ed8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003edc:	000b8513          	mv	a0,s7
    80003ee0:	ffffe097          	auipc	ra,0xffffe
    80003ee4:	374080e7          	jalr	884(ra) # 80002254 <_ZdlPv>
    80003ee8:	00048513          	mv	a0,s1
    80003eec:	00009097          	auipc	ra,0x9
    80003ef0:	88c080e7          	jalr	-1908(ra) # 8000c778 <_Unwind_Resume>
    80003ef4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003ef8:	00048513          	mv	a0,s1
    80003efc:	ffffe097          	auipc	ra,0xffffe
    80003f00:	358080e7          	jalr	856(ra) # 80002254 <_ZdlPv>
    80003f04:	00090513          	mv	a0,s2
    80003f08:	00009097          	auipc	ra,0x9
    80003f0c:	870080e7          	jalr	-1936(ra) # 8000c778 <_Unwind_Resume>
    80003f10:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80003f14:	000c8513          	mv	a0,s9
    80003f18:	ffffe097          	auipc	ra,0xffffe
    80003f1c:	33c080e7          	jalr	828(ra) # 80002254 <_ZdlPv>
    80003f20:	00048513          	mv	a0,s1
    80003f24:	00009097          	auipc	ra,0x9
    80003f28:	854080e7          	jalr	-1964(ra) # 8000c778 <_Unwind_Resume>

0000000080003f2c <_ZN8Consumer3runEv>:
    void run() override {
    80003f2c:	fd010113          	addi	sp,sp,-48
    80003f30:	02113423          	sd	ra,40(sp)
    80003f34:	02813023          	sd	s0,32(sp)
    80003f38:	00913c23          	sd	s1,24(sp)
    80003f3c:	01213823          	sd	s2,16(sp)
    80003f40:	01313423          	sd	s3,8(sp)
    80003f44:	03010413          	addi	s0,sp,48
    80003f48:	00050913          	mv	s2,a0
        int i = 0;
    80003f4c:	00000993          	li	s3,0
    80003f50:	0100006f          	j	80003f60 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80003f54:	00a00513          	li	a0,10
    80003f58:	ffffe097          	auipc	ra,0xffffe
    80003f5c:	6b0080e7          	jalr	1712(ra) # 80002608 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80003f60:	00007797          	auipc	a5,0x7
    80003f64:	7107a783          	lw	a5,1808(a5) # 8000b670 <_ZL9threadEnd>
    80003f68:	04079a63          	bnez	a5,80003fbc <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80003f6c:	02093783          	ld	a5,32(s2)
    80003f70:	0087b503          	ld	a0,8(a5)
    80003f74:	00001097          	auipc	ra,0x1
    80003f78:	638080e7          	jalr	1592(ra) # 800055ac <_ZN9BufferCPP3getEv>
            i++;
    80003f7c:	0019849b          	addiw	s1,s3,1
    80003f80:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80003f84:	0ff57513          	andi	a0,a0,255
    80003f88:	ffffe097          	auipc	ra,0xffffe
    80003f8c:	680080e7          	jalr	1664(ra) # 80002608 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80003f90:	05000793          	li	a5,80
    80003f94:	02f4e4bb          	remw	s1,s1,a5
    80003f98:	fc0494e3          	bnez	s1,80003f60 <_ZN8Consumer3runEv+0x34>
    80003f9c:	fb9ff06f          	j	80003f54 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80003fa0:	02093783          	ld	a5,32(s2)
    80003fa4:	0087b503          	ld	a0,8(a5)
    80003fa8:	00001097          	auipc	ra,0x1
    80003fac:	604080e7          	jalr	1540(ra) # 800055ac <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80003fb0:	0ff57513          	andi	a0,a0,255
    80003fb4:	ffffe097          	auipc	ra,0xffffe
    80003fb8:	654080e7          	jalr	1620(ra) # 80002608 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80003fbc:	02093783          	ld	a5,32(s2)
    80003fc0:	0087b503          	ld	a0,8(a5)
    80003fc4:	00001097          	auipc	ra,0x1
    80003fc8:	674080e7          	jalr	1652(ra) # 80005638 <_ZN9BufferCPP6getCntEv>
    80003fcc:	fca04ae3          	bgtz	a0,80003fa0 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80003fd0:	02093783          	ld	a5,32(s2)
    80003fd4:	0107b503          	ld	a0,16(a5)
    80003fd8:	ffffe097          	auipc	ra,0xffffe
    80003fdc:	570080e7          	jalr	1392(ra) # 80002548 <_ZN9Semaphore6signalEv>
    }
    80003fe0:	02813083          	ld	ra,40(sp)
    80003fe4:	02013403          	ld	s0,32(sp)
    80003fe8:	01813483          	ld	s1,24(sp)
    80003fec:	01013903          	ld	s2,16(sp)
    80003ff0:	00813983          	ld	s3,8(sp)
    80003ff4:	03010113          	addi	sp,sp,48
    80003ff8:	00008067          	ret

0000000080003ffc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80003ffc:	ff010113          	addi	sp,sp,-16
    80004000:	00113423          	sd	ra,8(sp)
    80004004:	00813023          	sd	s0,0(sp)
    80004008:	01010413          	addi	s0,sp,16
    8000400c:	00007797          	auipc	a5,0x7
    80004010:	4e478793          	addi	a5,a5,1252 # 8000b4f0 <_ZTV8Consumer+0x10>
    80004014:	00f53023          	sd	a5,0(a0)
    80004018:	ffffe097          	auipc	ra,0xffffe
    8000401c:	2cc080e7          	jalr	716(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80004020:	00813083          	ld	ra,8(sp)
    80004024:	00013403          	ld	s0,0(sp)
    80004028:	01010113          	addi	sp,sp,16
    8000402c:	00008067          	ret

0000000080004030 <_ZN8ConsumerD0Ev>:
    80004030:	fe010113          	addi	sp,sp,-32
    80004034:	00113c23          	sd	ra,24(sp)
    80004038:	00813823          	sd	s0,16(sp)
    8000403c:	00913423          	sd	s1,8(sp)
    80004040:	02010413          	addi	s0,sp,32
    80004044:	00050493          	mv	s1,a0
    80004048:	00007797          	auipc	a5,0x7
    8000404c:	4a878793          	addi	a5,a5,1192 # 8000b4f0 <_ZTV8Consumer+0x10>
    80004050:	00f53023          	sd	a5,0(a0)
    80004054:	ffffe097          	auipc	ra,0xffffe
    80004058:	290080e7          	jalr	656(ra) # 800022e4 <_ZN6ThreadD1Ev>
    8000405c:	00048513          	mv	a0,s1
    80004060:	ffffe097          	auipc	ra,0xffffe
    80004064:	1f4080e7          	jalr	500(ra) # 80002254 <_ZdlPv>
    80004068:	01813083          	ld	ra,24(sp)
    8000406c:	01013403          	ld	s0,16(sp)
    80004070:	00813483          	ld	s1,8(sp)
    80004074:	02010113          	addi	sp,sp,32
    80004078:	00008067          	ret

000000008000407c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000407c:	ff010113          	addi	sp,sp,-16
    80004080:	00113423          	sd	ra,8(sp)
    80004084:	00813023          	sd	s0,0(sp)
    80004088:	01010413          	addi	s0,sp,16
    8000408c:	00007797          	auipc	a5,0x7
    80004090:	41478793          	addi	a5,a5,1044 # 8000b4a0 <_ZTV16ProducerKeyborad+0x10>
    80004094:	00f53023          	sd	a5,0(a0)
    80004098:	ffffe097          	auipc	ra,0xffffe
    8000409c:	24c080e7          	jalr	588(ra) # 800022e4 <_ZN6ThreadD1Ev>
    800040a0:	00813083          	ld	ra,8(sp)
    800040a4:	00013403          	ld	s0,0(sp)
    800040a8:	01010113          	addi	sp,sp,16
    800040ac:	00008067          	ret

00000000800040b0 <_ZN16ProducerKeyboradD0Ev>:
    800040b0:	fe010113          	addi	sp,sp,-32
    800040b4:	00113c23          	sd	ra,24(sp)
    800040b8:	00813823          	sd	s0,16(sp)
    800040bc:	00913423          	sd	s1,8(sp)
    800040c0:	02010413          	addi	s0,sp,32
    800040c4:	00050493          	mv	s1,a0
    800040c8:	00007797          	auipc	a5,0x7
    800040cc:	3d878793          	addi	a5,a5,984 # 8000b4a0 <_ZTV16ProducerKeyborad+0x10>
    800040d0:	00f53023          	sd	a5,0(a0)
    800040d4:	ffffe097          	auipc	ra,0xffffe
    800040d8:	210080e7          	jalr	528(ra) # 800022e4 <_ZN6ThreadD1Ev>
    800040dc:	00048513          	mv	a0,s1
    800040e0:	ffffe097          	auipc	ra,0xffffe
    800040e4:	174080e7          	jalr	372(ra) # 80002254 <_ZdlPv>
    800040e8:	01813083          	ld	ra,24(sp)
    800040ec:	01013403          	ld	s0,16(sp)
    800040f0:	00813483          	ld	s1,8(sp)
    800040f4:	02010113          	addi	sp,sp,32
    800040f8:	00008067          	ret

00000000800040fc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800040fc:	ff010113          	addi	sp,sp,-16
    80004100:	00113423          	sd	ra,8(sp)
    80004104:	00813023          	sd	s0,0(sp)
    80004108:	01010413          	addi	s0,sp,16
    8000410c:	00007797          	auipc	a5,0x7
    80004110:	3bc78793          	addi	a5,a5,956 # 8000b4c8 <_ZTV8Producer+0x10>
    80004114:	00f53023          	sd	a5,0(a0)
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	1cc080e7          	jalr	460(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80004120:	00813083          	ld	ra,8(sp)
    80004124:	00013403          	ld	s0,0(sp)
    80004128:	01010113          	addi	sp,sp,16
    8000412c:	00008067          	ret

0000000080004130 <_ZN8ProducerD0Ev>:
    80004130:	fe010113          	addi	sp,sp,-32
    80004134:	00113c23          	sd	ra,24(sp)
    80004138:	00813823          	sd	s0,16(sp)
    8000413c:	00913423          	sd	s1,8(sp)
    80004140:	02010413          	addi	s0,sp,32
    80004144:	00050493          	mv	s1,a0
    80004148:	00007797          	auipc	a5,0x7
    8000414c:	38078793          	addi	a5,a5,896 # 8000b4c8 <_ZTV8Producer+0x10>
    80004150:	00f53023          	sd	a5,0(a0)
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	190080e7          	jalr	400(ra) # 800022e4 <_ZN6ThreadD1Ev>
    8000415c:	00048513          	mv	a0,s1
    80004160:	ffffe097          	auipc	ra,0xffffe
    80004164:	0f4080e7          	jalr	244(ra) # 80002254 <_ZdlPv>
    80004168:	01813083          	ld	ra,24(sp)
    8000416c:	01013403          	ld	s0,16(sp)
    80004170:	00813483          	ld	s1,8(sp)
    80004174:	02010113          	addi	sp,sp,32
    80004178:	00008067          	ret

000000008000417c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    8000417c:	fe010113          	addi	sp,sp,-32
    80004180:	00113c23          	sd	ra,24(sp)
    80004184:	00813823          	sd	s0,16(sp)
    80004188:	00913423          	sd	s1,8(sp)
    8000418c:	02010413          	addi	s0,sp,32
    80004190:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004194:	ffffd097          	auipc	ra,0xffffd
    80004198:	580080e7          	jalr	1408(ra) # 80001714 <_Z4getcv>
    8000419c:	0005059b          	sext.w	a1,a0
    800041a0:	01b00793          	li	a5,27
    800041a4:	00f58c63          	beq	a1,a5,800041bc <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800041a8:	0204b783          	ld	a5,32(s1)
    800041ac:	0087b503          	ld	a0,8(a5)
    800041b0:	00001097          	auipc	ra,0x1
    800041b4:	36c080e7          	jalr	876(ra) # 8000551c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    800041b8:	fddff06f          	j	80004194 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    800041bc:	00100793          	li	a5,1
    800041c0:	00007717          	auipc	a4,0x7
    800041c4:	4af72823          	sw	a5,1200(a4) # 8000b670 <_ZL9threadEnd>
        td->buffer->put('!');
    800041c8:	0204b783          	ld	a5,32(s1)
    800041cc:	02100593          	li	a1,33
    800041d0:	0087b503          	ld	a0,8(a5)
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	348080e7          	jalr	840(ra) # 8000551c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800041dc:	0204b783          	ld	a5,32(s1)
    800041e0:	0107b503          	ld	a0,16(a5)
    800041e4:	ffffe097          	auipc	ra,0xffffe
    800041e8:	364080e7          	jalr	868(ra) # 80002548 <_ZN9Semaphore6signalEv>
    }
    800041ec:	01813083          	ld	ra,24(sp)
    800041f0:	01013403          	ld	s0,16(sp)
    800041f4:	00813483          	ld	s1,8(sp)
    800041f8:	02010113          	addi	sp,sp,32
    800041fc:	00008067          	ret

0000000080004200 <_ZN8Producer3runEv>:
    void run() override {
    80004200:	fe010113          	addi	sp,sp,-32
    80004204:	00113c23          	sd	ra,24(sp)
    80004208:	00813823          	sd	s0,16(sp)
    8000420c:	00913423          	sd	s1,8(sp)
    80004210:	01213023          	sd	s2,0(sp)
    80004214:	02010413          	addi	s0,sp,32
    80004218:	00050493          	mv	s1,a0
        int i = 0;
    8000421c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004220:	00007797          	auipc	a5,0x7
    80004224:	4507a783          	lw	a5,1104(a5) # 8000b670 <_ZL9threadEnd>
    80004228:	04079263          	bnez	a5,8000426c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    8000422c:	0204b783          	ld	a5,32(s1)
    80004230:	0007a583          	lw	a1,0(a5)
    80004234:	0305859b          	addiw	a1,a1,48
    80004238:	0087b503          	ld	a0,8(a5)
    8000423c:	00001097          	auipc	ra,0x1
    80004240:	2e0080e7          	jalr	736(ra) # 8000551c <_ZN9BufferCPP3putEi>
            i++;
    80004244:	0019071b          	addiw	a4,s2,1
    80004248:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    8000424c:	0204b783          	ld	a5,32(s1)
    80004250:	0007a783          	lw	a5,0(a5)
    80004254:	00e787bb          	addw	a5,a5,a4
    80004258:	00500513          	li	a0,5
    8000425c:	02a7e53b          	remw	a0,a5,a0
    80004260:	ffffe097          	auipc	ra,0xffffe
    80004264:	208080e7          	jalr	520(ra) # 80002468 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004268:	fb9ff06f          	j	80004220 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    8000426c:	0204b783          	ld	a5,32(s1)
    80004270:	0107b503          	ld	a0,16(a5)
    80004274:	ffffe097          	auipc	ra,0xffffe
    80004278:	2d4080e7          	jalr	724(ra) # 80002548 <_ZN9Semaphore6signalEv>
    }
    8000427c:	01813083          	ld	ra,24(sp)
    80004280:	01013403          	ld	s0,16(sp)
    80004284:	00813483          	ld	s1,8(sp)
    80004288:	00013903          	ld	s2,0(sp)
    8000428c:	02010113          	addi	sp,sp,32
    80004290:	00008067          	ret

0000000080004294 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004294:	fe010113          	addi	sp,sp,-32
    80004298:	00113c23          	sd	ra,24(sp)
    8000429c:	00813823          	sd	s0,16(sp)
    800042a0:	00913423          	sd	s1,8(sp)
    800042a4:	01213023          	sd	s2,0(sp)
    800042a8:	02010413          	addi	s0,sp,32
    800042ac:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800042b0:	00100793          	li	a5,1
    800042b4:	02a7f863          	bgeu	a5,a0,800042e4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800042b8:	00a00793          	li	a5,10
    800042bc:	02f577b3          	remu	a5,a0,a5
    800042c0:	02078e63          	beqz	a5,800042fc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800042c4:	fff48513          	addi	a0,s1,-1
    800042c8:	00000097          	auipc	ra,0x0
    800042cc:	fcc080e7          	jalr	-52(ra) # 80004294 <_ZL9fibonaccim>
    800042d0:	00050913          	mv	s2,a0
    800042d4:	ffe48513          	addi	a0,s1,-2
    800042d8:	00000097          	auipc	ra,0x0
    800042dc:	fbc080e7          	jalr	-68(ra) # 80004294 <_ZL9fibonaccim>
    800042e0:	00a90533          	add	a0,s2,a0
}
    800042e4:	01813083          	ld	ra,24(sp)
    800042e8:	01013403          	ld	s0,16(sp)
    800042ec:	00813483          	ld	s1,8(sp)
    800042f0:	00013903          	ld	s2,0(sp)
    800042f4:	02010113          	addi	sp,sp,32
    800042f8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800042fc:	ffffd097          	auipc	ra,0xffffd
    80004300:	1e4080e7          	jalr	484(ra) # 800014e0 <_Z15thread_dispatchv>
    80004304:	fc1ff06f          	j	800042c4 <_ZL9fibonaccim+0x30>

0000000080004308 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004308:	fe010113          	addi	sp,sp,-32
    8000430c:	00113c23          	sd	ra,24(sp)
    80004310:	00813823          	sd	s0,16(sp)
    80004314:	00913423          	sd	s1,8(sp)
    80004318:	01213023          	sd	s2,0(sp)
    8000431c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004320:	00a00493          	li	s1,10
    80004324:	0400006f          	j	80004364 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004328:	00005517          	auipc	a0,0x5
    8000432c:	15850513          	addi	a0,a0,344 # 80009480 <CONSOLE_STATUS+0x470>
    80004330:	00001097          	auipc	ra,0x1
    80004334:	dc8080e7          	jalr	-568(ra) # 800050f8 <_Z11printStringPKc>
    80004338:	00000613          	li	a2,0
    8000433c:	00a00593          	li	a1,10
    80004340:	00048513          	mv	a0,s1
    80004344:	00001097          	auipc	ra,0x1
    80004348:	f64080e7          	jalr	-156(ra) # 800052a8 <_Z8printIntiii>
    8000434c:	00005517          	auipc	a0,0x5
    80004350:	ebc50513          	addi	a0,a0,-324 # 80009208 <CONSOLE_STATUS+0x1f8>
    80004354:	00001097          	auipc	ra,0x1
    80004358:	da4080e7          	jalr	-604(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000435c:	0014849b          	addiw	s1,s1,1
    80004360:	0ff4f493          	andi	s1,s1,255
    80004364:	00c00793          	li	a5,12
    80004368:	fc97f0e3          	bgeu	a5,s1,80004328 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000436c:	00005517          	auipc	a0,0x5
    80004370:	11c50513          	addi	a0,a0,284 # 80009488 <CONSOLE_STATUS+0x478>
    80004374:	00001097          	auipc	ra,0x1
    80004378:	d84080e7          	jalr	-636(ra) # 800050f8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000437c:	00500313          	li	t1,5
    thread_dispatch();
    80004380:	ffffd097          	auipc	ra,0xffffd
    80004384:	160080e7          	jalr	352(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004388:	01000513          	li	a0,16
    8000438c:	00000097          	auipc	ra,0x0
    80004390:	f08080e7          	jalr	-248(ra) # 80004294 <_ZL9fibonaccim>
    80004394:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004398:	00005517          	auipc	a0,0x5
    8000439c:	ce050513          	addi	a0,a0,-800 # 80009078 <CONSOLE_STATUS+0x68>
    800043a0:	00001097          	auipc	ra,0x1
    800043a4:	d58080e7          	jalr	-680(ra) # 800050f8 <_Z11printStringPKc>
    800043a8:	00000613          	li	a2,0
    800043ac:	00a00593          	li	a1,10
    800043b0:	0009051b          	sext.w	a0,s2
    800043b4:	00001097          	auipc	ra,0x1
    800043b8:	ef4080e7          	jalr	-268(ra) # 800052a8 <_Z8printIntiii>
    800043bc:	00005517          	auipc	a0,0x5
    800043c0:	e4c50513          	addi	a0,a0,-436 # 80009208 <CONSOLE_STATUS+0x1f8>
    800043c4:	00001097          	auipc	ra,0x1
    800043c8:	d34080e7          	jalr	-716(ra) # 800050f8 <_Z11printStringPKc>
    800043cc:	0400006f          	j	8000440c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800043d0:	00005517          	auipc	a0,0x5
    800043d4:	0b050513          	addi	a0,a0,176 # 80009480 <CONSOLE_STATUS+0x470>
    800043d8:	00001097          	auipc	ra,0x1
    800043dc:	d20080e7          	jalr	-736(ra) # 800050f8 <_Z11printStringPKc>
    800043e0:	00000613          	li	a2,0
    800043e4:	00a00593          	li	a1,10
    800043e8:	00048513          	mv	a0,s1
    800043ec:	00001097          	auipc	ra,0x1
    800043f0:	ebc080e7          	jalr	-324(ra) # 800052a8 <_Z8printIntiii>
    800043f4:	00005517          	auipc	a0,0x5
    800043f8:	e1450513          	addi	a0,a0,-492 # 80009208 <CONSOLE_STATUS+0x1f8>
    800043fc:	00001097          	auipc	ra,0x1
    80004400:	cfc080e7          	jalr	-772(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004404:	0014849b          	addiw	s1,s1,1
    80004408:	0ff4f493          	andi	s1,s1,255
    8000440c:	00f00793          	li	a5,15
    80004410:	fc97f0e3          	bgeu	a5,s1,800043d0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004414:	00005517          	auipc	a0,0x5
    80004418:	08450513          	addi	a0,a0,132 # 80009498 <CONSOLE_STATUS+0x488>
    8000441c:	00001097          	auipc	ra,0x1
    80004420:	cdc080e7          	jalr	-804(ra) # 800050f8 <_Z11printStringPKc>
    finishedD = true;
    80004424:	00100793          	li	a5,1
    80004428:	00007717          	auipc	a4,0x7
    8000442c:	24f70c23          	sb	a5,600(a4) # 8000b680 <_ZL9finishedD>
    thread_dispatch();
    80004430:	ffffd097          	auipc	ra,0xffffd
    80004434:	0b0080e7          	jalr	176(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80004438:	01813083          	ld	ra,24(sp)
    8000443c:	01013403          	ld	s0,16(sp)
    80004440:	00813483          	ld	s1,8(sp)
    80004444:	00013903          	ld	s2,0(sp)
    80004448:	02010113          	addi	sp,sp,32
    8000444c:	00008067          	ret

0000000080004450 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004450:	fe010113          	addi	sp,sp,-32
    80004454:	00113c23          	sd	ra,24(sp)
    80004458:	00813823          	sd	s0,16(sp)
    8000445c:	00913423          	sd	s1,8(sp)
    80004460:	01213023          	sd	s2,0(sp)
    80004464:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004468:	00000493          	li	s1,0
    8000446c:	0400006f          	j	800044ac <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004470:	00005517          	auipc	a0,0x5
    80004474:	bc050513          	addi	a0,a0,-1088 # 80009030 <CONSOLE_STATUS+0x20>
    80004478:	00001097          	auipc	ra,0x1
    8000447c:	c80080e7          	jalr	-896(ra) # 800050f8 <_Z11printStringPKc>
    80004480:	00000613          	li	a2,0
    80004484:	00a00593          	li	a1,10
    80004488:	00048513          	mv	a0,s1
    8000448c:	00001097          	auipc	ra,0x1
    80004490:	e1c080e7          	jalr	-484(ra) # 800052a8 <_Z8printIntiii>
    80004494:	00005517          	auipc	a0,0x5
    80004498:	d7450513          	addi	a0,a0,-652 # 80009208 <CONSOLE_STATUS+0x1f8>
    8000449c:	00001097          	auipc	ra,0x1
    800044a0:	c5c080e7          	jalr	-932(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800044a4:	0014849b          	addiw	s1,s1,1
    800044a8:	0ff4f493          	andi	s1,s1,255
    800044ac:	00200793          	li	a5,2
    800044b0:	fc97f0e3          	bgeu	a5,s1,80004470 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800044b4:	00005517          	auipc	a0,0x5
    800044b8:	fa450513          	addi	a0,a0,-92 # 80009458 <CONSOLE_STATUS+0x448>
    800044bc:	00001097          	auipc	ra,0x1
    800044c0:	c3c080e7          	jalr	-964(ra) # 800050f8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800044c4:	00700313          	li	t1,7
    thread_dispatch();
    800044c8:	ffffd097          	auipc	ra,0xffffd
    800044cc:	018080e7          	jalr	24(ra) # 800014e0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800044d0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800044d4:	00005517          	auipc	a0,0x5
    800044d8:	f9450513          	addi	a0,a0,-108 # 80009468 <CONSOLE_STATUS+0x458>
    800044dc:	00001097          	auipc	ra,0x1
    800044e0:	c1c080e7          	jalr	-996(ra) # 800050f8 <_Z11printStringPKc>
    800044e4:	00000613          	li	a2,0
    800044e8:	00a00593          	li	a1,10
    800044ec:	0009051b          	sext.w	a0,s2
    800044f0:	00001097          	auipc	ra,0x1
    800044f4:	db8080e7          	jalr	-584(ra) # 800052a8 <_Z8printIntiii>
    800044f8:	00005517          	auipc	a0,0x5
    800044fc:	d1050513          	addi	a0,a0,-752 # 80009208 <CONSOLE_STATUS+0x1f8>
    80004500:	00001097          	auipc	ra,0x1
    80004504:	bf8080e7          	jalr	-1032(ra) # 800050f8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004508:	00c00513          	li	a0,12
    8000450c:	00000097          	auipc	ra,0x0
    80004510:	d88080e7          	jalr	-632(ra) # 80004294 <_ZL9fibonaccim>
    80004514:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004518:	00005517          	auipc	a0,0x5
    8000451c:	f5850513          	addi	a0,a0,-168 # 80009470 <CONSOLE_STATUS+0x460>
    80004520:	00001097          	auipc	ra,0x1
    80004524:	bd8080e7          	jalr	-1064(ra) # 800050f8 <_Z11printStringPKc>
    80004528:	00000613          	li	a2,0
    8000452c:	00a00593          	li	a1,10
    80004530:	0009051b          	sext.w	a0,s2
    80004534:	00001097          	auipc	ra,0x1
    80004538:	d74080e7          	jalr	-652(ra) # 800052a8 <_Z8printIntiii>
    8000453c:	00005517          	auipc	a0,0x5
    80004540:	ccc50513          	addi	a0,a0,-820 # 80009208 <CONSOLE_STATUS+0x1f8>
    80004544:	00001097          	auipc	ra,0x1
    80004548:	bb4080e7          	jalr	-1100(ra) # 800050f8 <_Z11printStringPKc>
    8000454c:	0400006f          	j	8000458c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004550:	00005517          	auipc	a0,0x5
    80004554:	ae050513          	addi	a0,a0,-1312 # 80009030 <CONSOLE_STATUS+0x20>
    80004558:	00001097          	auipc	ra,0x1
    8000455c:	ba0080e7          	jalr	-1120(ra) # 800050f8 <_Z11printStringPKc>
    80004560:	00000613          	li	a2,0
    80004564:	00a00593          	li	a1,10
    80004568:	00048513          	mv	a0,s1
    8000456c:	00001097          	auipc	ra,0x1
    80004570:	d3c080e7          	jalr	-708(ra) # 800052a8 <_Z8printIntiii>
    80004574:	00005517          	auipc	a0,0x5
    80004578:	c9450513          	addi	a0,a0,-876 # 80009208 <CONSOLE_STATUS+0x1f8>
    8000457c:	00001097          	auipc	ra,0x1
    80004580:	b7c080e7          	jalr	-1156(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004584:	0014849b          	addiw	s1,s1,1
    80004588:	0ff4f493          	andi	s1,s1,255
    8000458c:	00500793          	li	a5,5
    80004590:	fc97f0e3          	bgeu	a5,s1,80004550 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004594:	00005517          	auipc	a0,0x5
    80004598:	e9c50513          	addi	a0,a0,-356 # 80009430 <CONSOLE_STATUS+0x420>
    8000459c:	00001097          	auipc	ra,0x1
    800045a0:	b5c080e7          	jalr	-1188(ra) # 800050f8 <_Z11printStringPKc>
    finishedC = true;
    800045a4:	00100793          	li	a5,1
    800045a8:	00007717          	auipc	a4,0x7
    800045ac:	0cf70ca3          	sb	a5,217(a4) # 8000b681 <_ZL9finishedC>
    thread_dispatch();
    800045b0:	ffffd097          	auipc	ra,0xffffd
    800045b4:	f30080e7          	jalr	-208(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800045b8:	01813083          	ld	ra,24(sp)
    800045bc:	01013403          	ld	s0,16(sp)
    800045c0:	00813483          	ld	s1,8(sp)
    800045c4:	00013903          	ld	s2,0(sp)
    800045c8:	02010113          	addi	sp,sp,32
    800045cc:	00008067          	ret

00000000800045d0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800045d0:	fe010113          	addi	sp,sp,-32
    800045d4:	00113c23          	sd	ra,24(sp)
    800045d8:	00813823          	sd	s0,16(sp)
    800045dc:	00913423          	sd	s1,8(sp)
    800045e0:	01213023          	sd	s2,0(sp)
    800045e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800045e8:	00000913          	li	s2,0
    800045ec:	0380006f          	j	80004624 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	ef0080e7          	jalr	-272(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800045f8:	00148493          	addi	s1,s1,1
    800045fc:	000027b7          	lui	a5,0x2
    80004600:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004604:	0097ee63          	bltu	a5,s1,80004620 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004608:	00000713          	li	a4,0
    8000460c:	000077b7          	lui	a5,0x7
    80004610:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004614:	fce7eee3          	bltu	a5,a4,800045f0 <_ZL11workerBodyBPv+0x20>
    80004618:	00170713          	addi	a4,a4,1
    8000461c:	ff1ff06f          	j	8000460c <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004620:	00190913          	addi	s2,s2,1
    80004624:	00f00793          	li	a5,15
    80004628:	0527e063          	bltu	a5,s2,80004668 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000462c:	00005517          	auipc	a0,0x5
    80004630:	e1450513          	addi	a0,a0,-492 # 80009440 <CONSOLE_STATUS+0x430>
    80004634:	00001097          	auipc	ra,0x1
    80004638:	ac4080e7          	jalr	-1340(ra) # 800050f8 <_Z11printStringPKc>
    8000463c:	00000613          	li	a2,0
    80004640:	00a00593          	li	a1,10
    80004644:	0009051b          	sext.w	a0,s2
    80004648:	00001097          	auipc	ra,0x1
    8000464c:	c60080e7          	jalr	-928(ra) # 800052a8 <_Z8printIntiii>
    80004650:	00005517          	auipc	a0,0x5
    80004654:	bb850513          	addi	a0,a0,-1096 # 80009208 <CONSOLE_STATUS+0x1f8>
    80004658:	00001097          	auipc	ra,0x1
    8000465c:	aa0080e7          	jalr	-1376(ra) # 800050f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004660:	00000493          	li	s1,0
    80004664:	f99ff06f          	j	800045fc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004668:	00005517          	auipc	a0,0x5
    8000466c:	de050513          	addi	a0,a0,-544 # 80009448 <CONSOLE_STATUS+0x438>
    80004670:	00001097          	auipc	ra,0x1
    80004674:	a88080e7          	jalr	-1400(ra) # 800050f8 <_Z11printStringPKc>
    finishedB = true;
    80004678:	00100793          	li	a5,1
    8000467c:	00007717          	auipc	a4,0x7
    80004680:	00f70323          	sb	a5,6(a4) # 8000b682 <_ZL9finishedB>
    thread_dispatch();
    80004684:	ffffd097          	auipc	ra,0xffffd
    80004688:	e5c080e7          	jalr	-420(ra) # 800014e0 <_Z15thread_dispatchv>
}
    8000468c:	01813083          	ld	ra,24(sp)
    80004690:	01013403          	ld	s0,16(sp)
    80004694:	00813483          	ld	s1,8(sp)
    80004698:	00013903          	ld	s2,0(sp)
    8000469c:	02010113          	addi	sp,sp,32
    800046a0:	00008067          	ret

00000000800046a4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800046a4:	fe010113          	addi	sp,sp,-32
    800046a8:	00113c23          	sd	ra,24(sp)
    800046ac:	00813823          	sd	s0,16(sp)
    800046b0:	00913423          	sd	s1,8(sp)
    800046b4:	01213023          	sd	s2,0(sp)
    800046b8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800046bc:	00000913          	li	s2,0
    800046c0:	0380006f          	j	800046f8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800046c4:	ffffd097          	auipc	ra,0xffffd
    800046c8:	e1c080e7          	jalr	-484(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800046cc:	00148493          	addi	s1,s1,1
    800046d0:	000027b7          	lui	a5,0x2
    800046d4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800046d8:	0097ee63          	bltu	a5,s1,800046f4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800046dc:	00000713          	li	a4,0
    800046e0:	000077b7          	lui	a5,0x7
    800046e4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800046e8:	fce7eee3          	bltu	a5,a4,800046c4 <_ZL11workerBodyAPv+0x20>
    800046ec:	00170713          	addi	a4,a4,1
    800046f0:	ff1ff06f          	j	800046e0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800046f4:	00190913          	addi	s2,s2,1
    800046f8:	00900793          	li	a5,9
    800046fc:	0527e063          	bltu	a5,s2,8000473c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004700:	00005517          	auipc	a0,0x5
    80004704:	d2850513          	addi	a0,a0,-728 # 80009428 <CONSOLE_STATUS+0x418>
    80004708:	00001097          	auipc	ra,0x1
    8000470c:	9f0080e7          	jalr	-1552(ra) # 800050f8 <_Z11printStringPKc>
    80004710:	00000613          	li	a2,0
    80004714:	00a00593          	li	a1,10
    80004718:	0009051b          	sext.w	a0,s2
    8000471c:	00001097          	auipc	ra,0x1
    80004720:	b8c080e7          	jalr	-1140(ra) # 800052a8 <_Z8printIntiii>
    80004724:	00005517          	auipc	a0,0x5
    80004728:	ae450513          	addi	a0,a0,-1308 # 80009208 <CONSOLE_STATUS+0x1f8>
    8000472c:	00001097          	auipc	ra,0x1
    80004730:	9cc080e7          	jalr	-1588(ra) # 800050f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004734:	00000493          	li	s1,0
    80004738:	f99ff06f          	j	800046d0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000473c:	00005517          	auipc	a0,0x5
    80004740:	cf450513          	addi	a0,a0,-780 # 80009430 <CONSOLE_STATUS+0x420>
    80004744:	00001097          	auipc	ra,0x1
    80004748:	9b4080e7          	jalr	-1612(ra) # 800050f8 <_Z11printStringPKc>
    finishedA = true;
    8000474c:	00100793          	li	a5,1
    80004750:	00007717          	auipc	a4,0x7
    80004754:	f2f709a3          	sb	a5,-205(a4) # 8000b683 <_ZL9finishedA>
}
    80004758:	01813083          	ld	ra,24(sp)
    8000475c:	01013403          	ld	s0,16(sp)
    80004760:	00813483          	ld	s1,8(sp)
    80004764:	00013903          	ld	s2,0(sp)
    80004768:	02010113          	addi	sp,sp,32
    8000476c:	00008067          	ret

0000000080004770 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004770:	fd010113          	addi	sp,sp,-48
    80004774:	02113423          	sd	ra,40(sp)
    80004778:	02813023          	sd	s0,32(sp)
    8000477c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004780:	00000613          	li	a2,0
    80004784:	00000597          	auipc	a1,0x0
    80004788:	f2058593          	addi	a1,a1,-224 # 800046a4 <_ZL11workerBodyAPv>
    8000478c:	fd040513          	addi	a0,s0,-48
    80004790:	ffffd097          	auipc	ra,0xffffd
    80004794:	c44080e7          	jalr	-956(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004798:	00005517          	auipc	a0,0x5
    8000479c:	d1050513          	addi	a0,a0,-752 # 800094a8 <CONSOLE_STATUS+0x498>
    800047a0:	00001097          	auipc	ra,0x1
    800047a4:	958080e7          	jalr	-1704(ra) # 800050f8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800047a8:	00000613          	li	a2,0
    800047ac:	00000597          	auipc	a1,0x0
    800047b0:	e2458593          	addi	a1,a1,-476 # 800045d0 <_ZL11workerBodyBPv>
    800047b4:	fd840513          	addi	a0,s0,-40
    800047b8:	ffffd097          	auipc	ra,0xffffd
    800047bc:	c1c080e7          	jalr	-996(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800047c0:	00005517          	auipc	a0,0x5
    800047c4:	d0050513          	addi	a0,a0,-768 # 800094c0 <CONSOLE_STATUS+0x4b0>
    800047c8:	00001097          	auipc	ra,0x1
    800047cc:	930080e7          	jalr	-1744(ra) # 800050f8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800047d0:	00000613          	li	a2,0
    800047d4:	00000597          	auipc	a1,0x0
    800047d8:	c7c58593          	addi	a1,a1,-900 # 80004450 <_ZL11workerBodyCPv>
    800047dc:	fe040513          	addi	a0,s0,-32
    800047e0:	ffffd097          	auipc	ra,0xffffd
    800047e4:	bf4080e7          	jalr	-1036(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800047e8:	00005517          	auipc	a0,0x5
    800047ec:	cf050513          	addi	a0,a0,-784 # 800094d8 <CONSOLE_STATUS+0x4c8>
    800047f0:	00001097          	auipc	ra,0x1
    800047f4:	908080e7          	jalr	-1784(ra) # 800050f8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800047f8:	00000613          	li	a2,0
    800047fc:	00000597          	auipc	a1,0x0
    80004800:	b0c58593          	addi	a1,a1,-1268 # 80004308 <_ZL11workerBodyDPv>
    80004804:	fe840513          	addi	a0,s0,-24
    80004808:	ffffd097          	auipc	ra,0xffffd
    8000480c:	bcc080e7          	jalr	-1076(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004810:	00005517          	auipc	a0,0x5
    80004814:	ce050513          	addi	a0,a0,-800 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80004818:	00001097          	auipc	ra,0x1
    8000481c:	8e0080e7          	jalr	-1824(ra) # 800050f8 <_Z11printStringPKc>
    80004820:	00c0006f          	j	8000482c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004824:	ffffd097          	auipc	ra,0xffffd
    80004828:	cbc080e7          	jalr	-836(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000482c:	00007797          	auipc	a5,0x7
    80004830:	e577c783          	lbu	a5,-425(a5) # 8000b683 <_ZL9finishedA>
    80004834:	fe0788e3          	beqz	a5,80004824 <_Z18Threads_C_API_testv+0xb4>
    80004838:	00007797          	auipc	a5,0x7
    8000483c:	e4a7c783          	lbu	a5,-438(a5) # 8000b682 <_ZL9finishedB>
    80004840:	fe0782e3          	beqz	a5,80004824 <_Z18Threads_C_API_testv+0xb4>
    80004844:	00007797          	auipc	a5,0x7
    80004848:	e3d7c783          	lbu	a5,-451(a5) # 8000b681 <_ZL9finishedC>
    8000484c:	fc078ce3          	beqz	a5,80004824 <_Z18Threads_C_API_testv+0xb4>
    80004850:	00007797          	auipc	a5,0x7
    80004854:	e307c783          	lbu	a5,-464(a5) # 8000b680 <_ZL9finishedD>
    80004858:	fc0786e3          	beqz	a5,80004824 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000485c:	02813083          	ld	ra,40(sp)
    80004860:	02013403          	ld	s0,32(sp)
    80004864:	03010113          	addi	sp,sp,48
    80004868:	00008067          	ret

000000008000486c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000486c:	fd010113          	addi	sp,sp,-48
    80004870:	02113423          	sd	ra,40(sp)
    80004874:	02813023          	sd	s0,32(sp)
    80004878:	00913c23          	sd	s1,24(sp)
    8000487c:	01213823          	sd	s2,16(sp)
    80004880:	01313423          	sd	s3,8(sp)
    80004884:	03010413          	addi	s0,sp,48
    80004888:	00050993          	mv	s3,a0
    8000488c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004890:	00000913          	li	s2,0
    80004894:	00c0006f          	j	800048a0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004898:	ffffe097          	auipc	ra,0xffffe
    8000489c:	ba8080e7          	jalr	-1112(ra) # 80002440 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800048a0:	ffffd097          	auipc	ra,0xffffd
    800048a4:	e74080e7          	jalr	-396(ra) # 80001714 <_Z4getcv>
    800048a8:	0005059b          	sext.w	a1,a0
    800048ac:	01b00793          	li	a5,27
    800048b0:	02f58a63          	beq	a1,a5,800048e4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800048b4:	0084b503          	ld	a0,8(s1)
    800048b8:	00001097          	auipc	ra,0x1
    800048bc:	c64080e7          	jalr	-924(ra) # 8000551c <_ZN9BufferCPP3putEi>
        i++;
    800048c0:	0019071b          	addiw	a4,s2,1
    800048c4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800048c8:	0004a683          	lw	a3,0(s1)
    800048cc:	0026979b          	slliw	a5,a3,0x2
    800048d0:	00d787bb          	addw	a5,a5,a3
    800048d4:	0017979b          	slliw	a5,a5,0x1
    800048d8:	02f767bb          	remw	a5,a4,a5
    800048dc:	fc0792e3          	bnez	a5,800048a0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800048e0:	fb9ff06f          	j	80004898 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800048e4:	00100793          	li	a5,1
    800048e8:	00007717          	auipc	a4,0x7
    800048ec:	daf72023          	sw	a5,-608(a4) # 8000b688 <_ZL9threadEnd>
    td->buffer->put('!');
    800048f0:	0209b783          	ld	a5,32(s3)
    800048f4:	02100593          	li	a1,33
    800048f8:	0087b503          	ld	a0,8(a5)
    800048fc:	00001097          	auipc	ra,0x1
    80004900:	c20080e7          	jalr	-992(ra) # 8000551c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004904:	0104b503          	ld	a0,16(s1)
    80004908:	ffffe097          	auipc	ra,0xffffe
    8000490c:	c40080e7          	jalr	-960(ra) # 80002548 <_ZN9Semaphore6signalEv>
}
    80004910:	02813083          	ld	ra,40(sp)
    80004914:	02013403          	ld	s0,32(sp)
    80004918:	01813483          	ld	s1,24(sp)
    8000491c:	01013903          	ld	s2,16(sp)
    80004920:	00813983          	ld	s3,8(sp)
    80004924:	03010113          	addi	sp,sp,48
    80004928:	00008067          	ret

000000008000492c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000492c:	fe010113          	addi	sp,sp,-32
    80004930:	00113c23          	sd	ra,24(sp)
    80004934:	00813823          	sd	s0,16(sp)
    80004938:	00913423          	sd	s1,8(sp)
    8000493c:	01213023          	sd	s2,0(sp)
    80004940:	02010413          	addi	s0,sp,32
    80004944:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004948:	00000913          	li	s2,0
    8000494c:	00c0006f          	j	80004958 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004950:	ffffe097          	auipc	ra,0xffffe
    80004954:	af0080e7          	jalr	-1296(ra) # 80002440 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004958:	00007797          	auipc	a5,0x7
    8000495c:	d307a783          	lw	a5,-720(a5) # 8000b688 <_ZL9threadEnd>
    80004960:	02079e63          	bnez	a5,8000499c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004964:	0004a583          	lw	a1,0(s1)
    80004968:	0305859b          	addiw	a1,a1,48
    8000496c:	0084b503          	ld	a0,8(s1)
    80004970:	00001097          	auipc	ra,0x1
    80004974:	bac080e7          	jalr	-1108(ra) # 8000551c <_ZN9BufferCPP3putEi>
        i++;
    80004978:	0019071b          	addiw	a4,s2,1
    8000497c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004980:	0004a683          	lw	a3,0(s1)
    80004984:	0026979b          	slliw	a5,a3,0x2
    80004988:	00d787bb          	addw	a5,a5,a3
    8000498c:	0017979b          	slliw	a5,a5,0x1
    80004990:	02f767bb          	remw	a5,a4,a5
    80004994:	fc0792e3          	bnez	a5,80004958 <_ZN12ProducerSync8producerEPv+0x2c>
    80004998:	fb9ff06f          	j	80004950 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000499c:	0104b503          	ld	a0,16(s1)
    800049a0:	ffffe097          	auipc	ra,0xffffe
    800049a4:	ba8080e7          	jalr	-1112(ra) # 80002548 <_ZN9Semaphore6signalEv>
}
    800049a8:	01813083          	ld	ra,24(sp)
    800049ac:	01013403          	ld	s0,16(sp)
    800049b0:	00813483          	ld	s1,8(sp)
    800049b4:	00013903          	ld	s2,0(sp)
    800049b8:	02010113          	addi	sp,sp,32
    800049bc:	00008067          	ret

00000000800049c0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800049c0:	fd010113          	addi	sp,sp,-48
    800049c4:	02113423          	sd	ra,40(sp)
    800049c8:	02813023          	sd	s0,32(sp)
    800049cc:	00913c23          	sd	s1,24(sp)
    800049d0:	01213823          	sd	s2,16(sp)
    800049d4:	01313423          	sd	s3,8(sp)
    800049d8:	01413023          	sd	s4,0(sp)
    800049dc:	03010413          	addi	s0,sp,48
    800049e0:	00050993          	mv	s3,a0
    800049e4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800049e8:	00000a13          	li	s4,0
    800049ec:	01c0006f          	j	80004a08 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800049f0:	ffffe097          	auipc	ra,0xffffe
    800049f4:	a50080e7          	jalr	-1456(ra) # 80002440 <_ZN6Thread8dispatchEv>
    800049f8:	0500006f          	j	80004a48 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800049fc:	00a00513          	li	a0,10
    80004a00:	ffffd097          	auipc	ra,0xffffd
    80004a04:	d70080e7          	jalr	-656(ra) # 80001770 <_Z4putcc>
    while (!threadEnd) {
    80004a08:	00007797          	auipc	a5,0x7
    80004a0c:	c807a783          	lw	a5,-896(a5) # 8000b688 <_ZL9threadEnd>
    80004a10:	06079263          	bnez	a5,80004a74 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80004a14:	00893503          	ld	a0,8(s2)
    80004a18:	00001097          	auipc	ra,0x1
    80004a1c:	b94080e7          	jalr	-1132(ra) # 800055ac <_ZN9BufferCPP3getEv>
        i++;
    80004a20:	001a049b          	addiw	s1,s4,1
    80004a24:	00048a1b          	sext.w	s4,s1
        putc(key);
    80004a28:	0ff57513          	andi	a0,a0,255
    80004a2c:	ffffd097          	auipc	ra,0xffffd
    80004a30:	d44080e7          	jalr	-700(ra) # 80001770 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004a34:	00092703          	lw	a4,0(s2)
    80004a38:	0027179b          	slliw	a5,a4,0x2
    80004a3c:	00e787bb          	addw	a5,a5,a4
    80004a40:	02f4e7bb          	remw	a5,s1,a5
    80004a44:	fa0786e3          	beqz	a5,800049f0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80004a48:	05000793          	li	a5,80
    80004a4c:	02f4e4bb          	remw	s1,s1,a5
    80004a50:	fa049ce3          	bnez	s1,80004a08 <_ZN12ConsumerSync8consumerEPv+0x48>
    80004a54:	fa9ff06f          	j	800049fc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80004a58:	0209b783          	ld	a5,32(s3)
    80004a5c:	0087b503          	ld	a0,8(a5)
    80004a60:	00001097          	auipc	ra,0x1
    80004a64:	b4c080e7          	jalr	-1204(ra) # 800055ac <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004a68:	0ff57513          	andi	a0,a0,255
    80004a6c:	ffffe097          	auipc	ra,0xffffe
    80004a70:	b9c080e7          	jalr	-1124(ra) # 80002608 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004a74:	0209b783          	ld	a5,32(s3)
    80004a78:	0087b503          	ld	a0,8(a5)
    80004a7c:	00001097          	auipc	ra,0x1
    80004a80:	bbc080e7          	jalr	-1092(ra) # 80005638 <_ZN9BufferCPP6getCntEv>
    80004a84:	fca04ae3          	bgtz	a0,80004a58 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004a88:	01093503          	ld	a0,16(s2)
    80004a8c:	ffffe097          	auipc	ra,0xffffe
    80004a90:	abc080e7          	jalr	-1348(ra) # 80002548 <_ZN9Semaphore6signalEv>
}
    80004a94:	02813083          	ld	ra,40(sp)
    80004a98:	02013403          	ld	s0,32(sp)
    80004a9c:	01813483          	ld	s1,24(sp)
    80004aa0:	01013903          	ld	s2,16(sp)
    80004aa4:	00813983          	ld	s3,8(sp)
    80004aa8:	00013a03          	ld	s4,0(sp)
    80004aac:	03010113          	addi	sp,sp,48
    80004ab0:	00008067          	ret

0000000080004ab4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004ab4:	f8010113          	addi	sp,sp,-128
    80004ab8:	06113c23          	sd	ra,120(sp)
    80004abc:	06813823          	sd	s0,112(sp)
    80004ac0:	06913423          	sd	s1,104(sp)
    80004ac4:	07213023          	sd	s2,96(sp)
    80004ac8:	05313c23          	sd	s3,88(sp)
    80004acc:	05413823          	sd	s4,80(sp)
    80004ad0:	05513423          	sd	s5,72(sp)
    80004ad4:	05613023          	sd	s6,64(sp)
    80004ad8:	03713c23          	sd	s7,56(sp)
    80004adc:	03813823          	sd	s8,48(sp)
    80004ae0:	03913423          	sd	s9,40(sp)
    80004ae4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004ae8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004aec:	00005517          	auipc	a0,0x5
    80004af0:	85450513          	addi	a0,a0,-1964 # 80009340 <CONSOLE_STATUS+0x330>
    80004af4:	00000097          	auipc	ra,0x0
    80004af8:	604080e7          	jalr	1540(ra) # 800050f8 <_Z11printStringPKc>
    getString(input, 30);
    80004afc:	01e00593          	li	a1,30
    80004b00:	f8040493          	addi	s1,s0,-128
    80004b04:	00048513          	mv	a0,s1
    80004b08:	00000097          	auipc	ra,0x0
    80004b0c:	678080e7          	jalr	1656(ra) # 80005180 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004b10:	00048513          	mv	a0,s1
    80004b14:	00000097          	auipc	ra,0x0
    80004b18:	744080e7          	jalr	1860(ra) # 80005258 <_Z11stringToIntPKc>
    80004b1c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004b20:	00005517          	auipc	a0,0x5
    80004b24:	84050513          	addi	a0,a0,-1984 # 80009360 <CONSOLE_STATUS+0x350>
    80004b28:	00000097          	auipc	ra,0x0
    80004b2c:	5d0080e7          	jalr	1488(ra) # 800050f8 <_Z11printStringPKc>
    getString(input, 30);
    80004b30:	01e00593          	li	a1,30
    80004b34:	00048513          	mv	a0,s1
    80004b38:	00000097          	auipc	ra,0x0
    80004b3c:	648080e7          	jalr	1608(ra) # 80005180 <_Z9getStringPci>
    n = stringToInt(input);
    80004b40:	00048513          	mv	a0,s1
    80004b44:	00000097          	auipc	ra,0x0
    80004b48:	714080e7          	jalr	1812(ra) # 80005258 <_Z11stringToIntPKc>
    80004b4c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80004b50:	00005517          	auipc	a0,0x5
    80004b54:	83050513          	addi	a0,a0,-2000 # 80009380 <CONSOLE_STATUS+0x370>
    80004b58:	00000097          	auipc	ra,0x0
    80004b5c:	5a0080e7          	jalr	1440(ra) # 800050f8 <_Z11printStringPKc>
    80004b60:	00000613          	li	a2,0
    80004b64:	00a00593          	li	a1,10
    80004b68:	00090513          	mv	a0,s2
    80004b6c:	00000097          	auipc	ra,0x0
    80004b70:	73c080e7          	jalr	1852(ra) # 800052a8 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004b74:	00005517          	auipc	a0,0x5
    80004b78:	82450513          	addi	a0,a0,-2012 # 80009398 <CONSOLE_STATUS+0x388>
    80004b7c:	00000097          	auipc	ra,0x0
    80004b80:	57c080e7          	jalr	1404(ra) # 800050f8 <_Z11printStringPKc>
    80004b84:	00000613          	li	a2,0
    80004b88:	00a00593          	li	a1,10
    80004b8c:	00048513          	mv	a0,s1
    80004b90:	00000097          	auipc	ra,0x0
    80004b94:	718080e7          	jalr	1816(ra) # 800052a8 <_Z8printIntiii>
    printString(".\n");
    80004b98:	00005517          	auipc	a0,0x5
    80004b9c:	81850513          	addi	a0,a0,-2024 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004ba0:	00000097          	auipc	ra,0x0
    80004ba4:	558080e7          	jalr	1368(ra) # 800050f8 <_Z11printStringPKc>
    if(threadNum > n) {
    80004ba8:	0324c463          	blt	s1,s2,80004bd0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004bac:	03205c63          	blez	s2,80004be4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004bb0:	03800513          	li	a0,56
    80004bb4:	ffffd097          	auipc	ra,0xffffd
    80004bb8:	650080e7          	jalr	1616(ra) # 80002204 <_Znwm>
    80004bbc:	00050a93          	mv	s5,a0
    80004bc0:	00048593          	mv	a1,s1
    80004bc4:	00001097          	auipc	ra,0x1
    80004bc8:	804080e7          	jalr	-2044(ra) # 800053c8 <_ZN9BufferCPPC1Ei>
    80004bcc:	0300006f          	j	80004bfc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004bd0:	00004517          	auipc	a0,0x4
    80004bd4:	7e850513          	addi	a0,a0,2024 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80004bd8:	00000097          	auipc	ra,0x0
    80004bdc:	520080e7          	jalr	1312(ra) # 800050f8 <_Z11printStringPKc>
        return;
    80004be0:	0140006f          	j	80004bf4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004be4:	00005517          	auipc	a0,0x5
    80004be8:	81450513          	addi	a0,a0,-2028 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80004bec:	00000097          	auipc	ra,0x0
    80004bf0:	50c080e7          	jalr	1292(ra) # 800050f8 <_Z11printStringPKc>
        return;
    80004bf4:	000b8113          	mv	sp,s7
    80004bf8:	2380006f          	j	80004e30 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004bfc:	01000513          	li	a0,16
    80004c00:	ffffd097          	auipc	ra,0xffffd
    80004c04:	604080e7          	jalr	1540(ra) # 80002204 <_Znwm>
    80004c08:	00050493          	mv	s1,a0
    80004c0c:	00000593          	li	a1,0
    80004c10:	ffffe097          	auipc	ra,0xffffe
    80004c14:	8d4080e7          	jalr	-1836(ra) # 800024e4 <_ZN9SemaphoreC1Ej>
    80004c18:	00007797          	auipc	a5,0x7
    80004c1c:	a697bc23          	sd	s1,-1416(a5) # 8000b690 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004c20:	00391793          	slli	a5,s2,0x3
    80004c24:	00f78793          	addi	a5,a5,15
    80004c28:	ff07f793          	andi	a5,a5,-16
    80004c2c:	40f10133          	sub	sp,sp,a5
    80004c30:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80004c34:	0019071b          	addiw	a4,s2,1
    80004c38:	00171793          	slli	a5,a4,0x1
    80004c3c:	00e787b3          	add	a5,a5,a4
    80004c40:	00379793          	slli	a5,a5,0x3
    80004c44:	00f78793          	addi	a5,a5,15
    80004c48:	ff07f793          	andi	a5,a5,-16
    80004c4c:	40f10133          	sub	sp,sp,a5
    80004c50:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80004c54:	00191c13          	slli	s8,s2,0x1
    80004c58:	012c07b3          	add	a5,s8,s2
    80004c5c:	00379793          	slli	a5,a5,0x3
    80004c60:	00fa07b3          	add	a5,s4,a5
    80004c64:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004c68:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004c6c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004c70:	02800513          	li	a0,40
    80004c74:	ffffd097          	auipc	ra,0xffffd
    80004c78:	590080e7          	jalr	1424(ra) # 80002204 <_Znwm>
    80004c7c:	00050b13          	mv	s6,a0
    80004c80:	012c0c33          	add	s8,s8,s2
    80004c84:	003c1c13          	slli	s8,s8,0x3
    80004c88:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004c8c:	ffffd097          	auipc	ra,0xffffd
    80004c90:	728080e7          	jalr	1832(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80004c94:	00007797          	auipc	a5,0x7
    80004c98:	8d478793          	addi	a5,a5,-1836 # 8000b568 <_ZTV12ConsumerSync+0x10>
    80004c9c:	00fb3023          	sd	a5,0(s6)
    80004ca0:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80004ca4:	000b0513          	mv	a0,s6
    80004ca8:	ffffd097          	auipc	ra,0xffffd
    80004cac:	744080e7          	jalr	1860(ra) # 800023ec <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004cb0:	00000493          	li	s1,0
    80004cb4:	0380006f          	j	80004cec <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004cb8:	00007797          	auipc	a5,0x7
    80004cbc:	88878793          	addi	a5,a5,-1912 # 8000b540 <_ZTV12ProducerSync+0x10>
    80004cc0:	00fcb023          	sd	a5,0(s9)
    80004cc4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80004cc8:	00349793          	slli	a5,s1,0x3
    80004ccc:	00f987b3          	add	a5,s3,a5
    80004cd0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80004cd4:	00349793          	slli	a5,s1,0x3
    80004cd8:	00f987b3          	add	a5,s3,a5
    80004cdc:	0007b503          	ld	a0,0(a5)
    80004ce0:	ffffd097          	auipc	ra,0xffffd
    80004ce4:	70c080e7          	jalr	1804(ra) # 800023ec <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004ce8:	0014849b          	addiw	s1,s1,1
    80004cec:	0b24d063          	bge	s1,s2,80004d8c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004cf0:	00149793          	slli	a5,s1,0x1
    80004cf4:	009787b3          	add	a5,a5,s1
    80004cf8:	00379793          	slli	a5,a5,0x3
    80004cfc:	00fa07b3          	add	a5,s4,a5
    80004d00:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004d04:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80004d08:	00007717          	auipc	a4,0x7
    80004d0c:	98873703          	ld	a4,-1656(a4) # 8000b690 <_ZL10waitForAll>
    80004d10:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80004d14:	02905863          	blez	s1,80004d44 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80004d18:	02800513          	li	a0,40
    80004d1c:	ffffd097          	auipc	ra,0xffffd
    80004d20:	4e8080e7          	jalr	1256(ra) # 80002204 <_Znwm>
    80004d24:	00050c93          	mv	s9,a0
    80004d28:	00149c13          	slli	s8,s1,0x1
    80004d2c:	009c0c33          	add	s8,s8,s1
    80004d30:	003c1c13          	slli	s8,s8,0x3
    80004d34:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004d38:	ffffd097          	auipc	ra,0xffffd
    80004d3c:	67c080e7          	jalr	1660(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80004d40:	f79ff06f          	j	80004cb8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80004d44:	02800513          	li	a0,40
    80004d48:	ffffd097          	auipc	ra,0xffffd
    80004d4c:	4bc080e7          	jalr	1212(ra) # 80002204 <_Znwm>
    80004d50:	00050c93          	mv	s9,a0
    80004d54:	00149c13          	slli	s8,s1,0x1
    80004d58:	009c0c33          	add	s8,s8,s1
    80004d5c:	003c1c13          	slli	s8,s8,0x3
    80004d60:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80004d64:	ffffd097          	auipc	ra,0xffffd
    80004d68:	650080e7          	jalr	1616(ra) # 800023b4 <_ZN6ThreadC1Ev>
    80004d6c:	00006797          	auipc	a5,0x6
    80004d70:	7ac78793          	addi	a5,a5,1964 # 8000b518 <_ZTV16ProducerKeyboard+0x10>
    80004d74:	00fcb023          	sd	a5,0(s9)
    80004d78:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004d7c:	00349793          	slli	a5,s1,0x3
    80004d80:	00f987b3          	add	a5,s3,a5
    80004d84:	0197b023          	sd	s9,0(a5)
    80004d88:	f4dff06f          	j	80004cd4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004d8c:	ffffd097          	auipc	ra,0xffffd
    80004d90:	6b4080e7          	jalr	1716(ra) # 80002440 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004d94:	00000493          	li	s1,0
    80004d98:	00994e63          	blt	s2,s1,80004db4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004d9c:	00007517          	auipc	a0,0x7
    80004da0:	8f453503          	ld	a0,-1804(a0) # 8000b690 <_ZL10waitForAll>
    80004da4:	ffffd097          	auipc	ra,0xffffd
    80004da8:	778080e7          	jalr	1912(ra) # 8000251c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004dac:	0014849b          	addiw	s1,s1,1
    80004db0:	fe9ff06f          	j	80004d98 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80004db4:	00000493          	li	s1,0
    80004db8:	0080006f          	j	80004dc0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004dbc:	0014849b          	addiw	s1,s1,1
    80004dc0:	0324d263          	bge	s1,s2,80004de4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80004dc4:	00349793          	slli	a5,s1,0x3
    80004dc8:	00f987b3          	add	a5,s3,a5
    80004dcc:	0007b503          	ld	a0,0(a5)
    80004dd0:	fe0506e3          	beqz	a0,80004dbc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80004dd4:	00053783          	ld	a5,0(a0)
    80004dd8:	0087b783          	ld	a5,8(a5)
    80004ddc:	000780e7          	jalr	a5
    80004de0:	fddff06f          	j	80004dbc <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80004de4:	000b0a63          	beqz	s6,80004df8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80004de8:	000b3783          	ld	a5,0(s6)
    80004dec:	0087b783          	ld	a5,8(a5)
    80004df0:	000b0513          	mv	a0,s6
    80004df4:	000780e7          	jalr	a5
    delete waitForAll;
    80004df8:	00007517          	auipc	a0,0x7
    80004dfc:	89853503          	ld	a0,-1896(a0) # 8000b690 <_ZL10waitForAll>
    80004e00:	00050863          	beqz	a0,80004e10 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80004e04:	00053783          	ld	a5,0(a0)
    80004e08:	0087b783          	ld	a5,8(a5)
    80004e0c:	000780e7          	jalr	a5
    delete buffer;
    80004e10:	000a8e63          	beqz	s5,80004e2c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80004e14:	000a8513          	mv	a0,s5
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	8a8080e7          	jalr	-1880(ra) # 800056c0 <_ZN9BufferCPPD1Ev>
    80004e20:	000a8513          	mv	a0,s5
    80004e24:	ffffd097          	auipc	ra,0xffffd
    80004e28:	430080e7          	jalr	1072(ra) # 80002254 <_ZdlPv>
    80004e2c:	000b8113          	mv	sp,s7

}
    80004e30:	f8040113          	addi	sp,s0,-128
    80004e34:	07813083          	ld	ra,120(sp)
    80004e38:	07013403          	ld	s0,112(sp)
    80004e3c:	06813483          	ld	s1,104(sp)
    80004e40:	06013903          	ld	s2,96(sp)
    80004e44:	05813983          	ld	s3,88(sp)
    80004e48:	05013a03          	ld	s4,80(sp)
    80004e4c:	04813a83          	ld	s5,72(sp)
    80004e50:	04013b03          	ld	s6,64(sp)
    80004e54:	03813b83          	ld	s7,56(sp)
    80004e58:	03013c03          	ld	s8,48(sp)
    80004e5c:	02813c83          	ld	s9,40(sp)
    80004e60:	08010113          	addi	sp,sp,128
    80004e64:	00008067          	ret
    80004e68:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004e6c:	000a8513          	mv	a0,s5
    80004e70:	ffffd097          	auipc	ra,0xffffd
    80004e74:	3e4080e7          	jalr	996(ra) # 80002254 <_ZdlPv>
    80004e78:	00048513          	mv	a0,s1
    80004e7c:	00008097          	auipc	ra,0x8
    80004e80:	8fc080e7          	jalr	-1796(ra) # 8000c778 <_Unwind_Resume>
    80004e84:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004e88:	00048513          	mv	a0,s1
    80004e8c:	ffffd097          	auipc	ra,0xffffd
    80004e90:	3c8080e7          	jalr	968(ra) # 80002254 <_ZdlPv>
    80004e94:	00090513          	mv	a0,s2
    80004e98:	00008097          	auipc	ra,0x8
    80004e9c:	8e0080e7          	jalr	-1824(ra) # 8000c778 <_Unwind_Resume>
    80004ea0:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004ea4:	000b0513          	mv	a0,s6
    80004ea8:	ffffd097          	auipc	ra,0xffffd
    80004eac:	3ac080e7          	jalr	940(ra) # 80002254 <_ZdlPv>
    80004eb0:	00048513          	mv	a0,s1
    80004eb4:	00008097          	auipc	ra,0x8
    80004eb8:	8c4080e7          	jalr	-1852(ra) # 8000c778 <_Unwind_Resume>
    80004ebc:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004ec0:	000c8513          	mv	a0,s9
    80004ec4:	ffffd097          	auipc	ra,0xffffd
    80004ec8:	390080e7          	jalr	912(ra) # 80002254 <_ZdlPv>
    80004ecc:	00048513          	mv	a0,s1
    80004ed0:	00008097          	auipc	ra,0x8
    80004ed4:	8a8080e7          	jalr	-1880(ra) # 8000c778 <_Unwind_Resume>
    80004ed8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004edc:	000c8513          	mv	a0,s9
    80004ee0:	ffffd097          	auipc	ra,0xffffd
    80004ee4:	374080e7          	jalr	884(ra) # 80002254 <_ZdlPv>
    80004ee8:	00048513          	mv	a0,s1
    80004eec:	00008097          	auipc	ra,0x8
    80004ef0:	88c080e7          	jalr	-1908(ra) # 8000c778 <_Unwind_Resume>

0000000080004ef4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004ef4:	ff010113          	addi	sp,sp,-16
    80004ef8:	00113423          	sd	ra,8(sp)
    80004efc:	00813023          	sd	s0,0(sp)
    80004f00:	01010413          	addi	s0,sp,16
    80004f04:	00006797          	auipc	a5,0x6
    80004f08:	66478793          	addi	a5,a5,1636 # 8000b568 <_ZTV12ConsumerSync+0x10>
    80004f0c:	00f53023          	sd	a5,0(a0)
    80004f10:	ffffd097          	auipc	ra,0xffffd
    80004f14:	3d4080e7          	jalr	980(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80004f18:	00813083          	ld	ra,8(sp)
    80004f1c:	00013403          	ld	s0,0(sp)
    80004f20:	01010113          	addi	sp,sp,16
    80004f24:	00008067          	ret

0000000080004f28 <_ZN12ConsumerSyncD0Ev>:
    80004f28:	fe010113          	addi	sp,sp,-32
    80004f2c:	00113c23          	sd	ra,24(sp)
    80004f30:	00813823          	sd	s0,16(sp)
    80004f34:	00913423          	sd	s1,8(sp)
    80004f38:	02010413          	addi	s0,sp,32
    80004f3c:	00050493          	mv	s1,a0
    80004f40:	00006797          	auipc	a5,0x6
    80004f44:	62878793          	addi	a5,a5,1576 # 8000b568 <_ZTV12ConsumerSync+0x10>
    80004f48:	00f53023          	sd	a5,0(a0)
    80004f4c:	ffffd097          	auipc	ra,0xffffd
    80004f50:	398080e7          	jalr	920(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80004f54:	00048513          	mv	a0,s1
    80004f58:	ffffd097          	auipc	ra,0xffffd
    80004f5c:	2fc080e7          	jalr	764(ra) # 80002254 <_ZdlPv>
    80004f60:	01813083          	ld	ra,24(sp)
    80004f64:	01013403          	ld	s0,16(sp)
    80004f68:	00813483          	ld	s1,8(sp)
    80004f6c:	02010113          	addi	sp,sp,32
    80004f70:	00008067          	ret

0000000080004f74 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004f74:	ff010113          	addi	sp,sp,-16
    80004f78:	00113423          	sd	ra,8(sp)
    80004f7c:	00813023          	sd	s0,0(sp)
    80004f80:	01010413          	addi	s0,sp,16
    80004f84:	00006797          	auipc	a5,0x6
    80004f88:	5bc78793          	addi	a5,a5,1468 # 8000b540 <_ZTV12ProducerSync+0x10>
    80004f8c:	00f53023          	sd	a5,0(a0)
    80004f90:	ffffd097          	auipc	ra,0xffffd
    80004f94:	354080e7          	jalr	852(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80004f98:	00813083          	ld	ra,8(sp)
    80004f9c:	00013403          	ld	s0,0(sp)
    80004fa0:	01010113          	addi	sp,sp,16
    80004fa4:	00008067          	ret

0000000080004fa8 <_ZN12ProducerSyncD0Ev>:
    80004fa8:	fe010113          	addi	sp,sp,-32
    80004fac:	00113c23          	sd	ra,24(sp)
    80004fb0:	00813823          	sd	s0,16(sp)
    80004fb4:	00913423          	sd	s1,8(sp)
    80004fb8:	02010413          	addi	s0,sp,32
    80004fbc:	00050493          	mv	s1,a0
    80004fc0:	00006797          	auipc	a5,0x6
    80004fc4:	58078793          	addi	a5,a5,1408 # 8000b540 <_ZTV12ProducerSync+0x10>
    80004fc8:	00f53023          	sd	a5,0(a0)
    80004fcc:	ffffd097          	auipc	ra,0xffffd
    80004fd0:	318080e7          	jalr	792(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80004fd4:	00048513          	mv	a0,s1
    80004fd8:	ffffd097          	auipc	ra,0xffffd
    80004fdc:	27c080e7          	jalr	636(ra) # 80002254 <_ZdlPv>
    80004fe0:	01813083          	ld	ra,24(sp)
    80004fe4:	01013403          	ld	s0,16(sp)
    80004fe8:	00813483          	ld	s1,8(sp)
    80004fec:	02010113          	addi	sp,sp,32
    80004ff0:	00008067          	ret

0000000080004ff4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004ff4:	ff010113          	addi	sp,sp,-16
    80004ff8:	00113423          	sd	ra,8(sp)
    80004ffc:	00813023          	sd	s0,0(sp)
    80005000:	01010413          	addi	s0,sp,16
    80005004:	00006797          	auipc	a5,0x6
    80005008:	51478793          	addi	a5,a5,1300 # 8000b518 <_ZTV16ProducerKeyboard+0x10>
    8000500c:	00f53023          	sd	a5,0(a0)
    80005010:	ffffd097          	auipc	ra,0xffffd
    80005014:	2d4080e7          	jalr	724(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80005018:	00813083          	ld	ra,8(sp)
    8000501c:	00013403          	ld	s0,0(sp)
    80005020:	01010113          	addi	sp,sp,16
    80005024:	00008067          	ret

0000000080005028 <_ZN16ProducerKeyboardD0Ev>:
    80005028:	fe010113          	addi	sp,sp,-32
    8000502c:	00113c23          	sd	ra,24(sp)
    80005030:	00813823          	sd	s0,16(sp)
    80005034:	00913423          	sd	s1,8(sp)
    80005038:	02010413          	addi	s0,sp,32
    8000503c:	00050493          	mv	s1,a0
    80005040:	00006797          	auipc	a5,0x6
    80005044:	4d878793          	addi	a5,a5,1240 # 8000b518 <_ZTV16ProducerKeyboard+0x10>
    80005048:	00f53023          	sd	a5,0(a0)
    8000504c:	ffffd097          	auipc	ra,0xffffd
    80005050:	298080e7          	jalr	664(ra) # 800022e4 <_ZN6ThreadD1Ev>
    80005054:	00048513          	mv	a0,s1
    80005058:	ffffd097          	auipc	ra,0xffffd
    8000505c:	1fc080e7          	jalr	508(ra) # 80002254 <_ZdlPv>
    80005060:	01813083          	ld	ra,24(sp)
    80005064:	01013403          	ld	s0,16(sp)
    80005068:	00813483          	ld	s1,8(sp)
    8000506c:	02010113          	addi	sp,sp,32
    80005070:	00008067          	ret

0000000080005074 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005074:	ff010113          	addi	sp,sp,-16
    80005078:	00113423          	sd	ra,8(sp)
    8000507c:	00813023          	sd	s0,0(sp)
    80005080:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005084:	02053583          	ld	a1,32(a0)
    80005088:	fffff097          	auipc	ra,0xfffff
    8000508c:	7e4080e7          	jalr	2020(ra) # 8000486c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005090:	00813083          	ld	ra,8(sp)
    80005094:	00013403          	ld	s0,0(sp)
    80005098:	01010113          	addi	sp,sp,16
    8000509c:	00008067          	ret

00000000800050a0 <_ZN12ProducerSync3runEv>:
    void run() override {
    800050a0:	ff010113          	addi	sp,sp,-16
    800050a4:	00113423          	sd	ra,8(sp)
    800050a8:	00813023          	sd	s0,0(sp)
    800050ac:	01010413          	addi	s0,sp,16
        producer(td);
    800050b0:	02053583          	ld	a1,32(a0)
    800050b4:	00000097          	auipc	ra,0x0
    800050b8:	878080e7          	jalr	-1928(ra) # 8000492c <_ZN12ProducerSync8producerEPv>
    }
    800050bc:	00813083          	ld	ra,8(sp)
    800050c0:	00013403          	ld	s0,0(sp)
    800050c4:	01010113          	addi	sp,sp,16
    800050c8:	00008067          	ret

00000000800050cc <_ZN12ConsumerSync3runEv>:
    void run() override {
    800050cc:	ff010113          	addi	sp,sp,-16
    800050d0:	00113423          	sd	ra,8(sp)
    800050d4:	00813023          	sd	s0,0(sp)
    800050d8:	01010413          	addi	s0,sp,16
        consumer(td);
    800050dc:	02053583          	ld	a1,32(a0)
    800050e0:	00000097          	auipc	ra,0x0
    800050e4:	8e0080e7          	jalr	-1824(ra) # 800049c0 <_ZN12ConsumerSync8consumerEPv>
    }
    800050e8:	00813083          	ld	ra,8(sp)
    800050ec:	00013403          	ld	s0,0(sp)
    800050f0:	01010113          	addi	sp,sp,16
    800050f4:	00008067          	ret

00000000800050f8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800050f8:	fe010113          	addi	sp,sp,-32
    800050fc:	00113c23          	sd	ra,24(sp)
    80005100:	00813823          	sd	s0,16(sp)
    80005104:	00913423          	sd	s1,8(sp)
    80005108:	02010413          	addi	s0,sp,32
    8000510c:	00050493          	mv	s1,a0
    LOCK();
    80005110:	00100613          	li	a2,1
    80005114:	00000593          	li	a1,0
    80005118:	00006517          	auipc	a0,0x6
    8000511c:	58050513          	addi	a0,a0,1408 # 8000b698 <lockPrint>
    80005120:	ffffc097          	auipc	ra,0xffffc
    80005124:	0fc080e7          	jalr	252(ra) # 8000121c <copy_and_swap>
    80005128:	00050863          	beqz	a0,80005138 <_Z11printStringPKc+0x40>
    8000512c:	ffffc097          	auipc	ra,0xffffc
    80005130:	3b4080e7          	jalr	948(ra) # 800014e0 <_Z15thread_dispatchv>
    80005134:	fddff06f          	j	80005110 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005138:	0004c503          	lbu	a0,0(s1)
    8000513c:	00050a63          	beqz	a0,80005150 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005140:	ffffc097          	auipc	ra,0xffffc
    80005144:	630080e7          	jalr	1584(ra) # 80001770 <_Z4putcc>
        string++;
    80005148:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000514c:	fedff06f          	j	80005138 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005150:	00000613          	li	a2,0
    80005154:	00100593          	li	a1,1
    80005158:	00006517          	auipc	a0,0x6
    8000515c:	54050513          	addi	a0,a0,1344 # 8000b698 <lockPrint>
    80005160:	ffffc097          	auipc	ra,0xffffc
    80005164:	0bc080e7          	jalr	188(ra) # 8000121c <copy_and_swap>
    80005168:	fe0514e3          	bnez	a0,80005150 <_Z11printStringPKc+0x58>
}
    8000516c:	01813083          	ld	ra,24(sp)
    80005170:	01013403          	ld	s0,16(sp)
    80005174:	00813483          	ld	s1,8(sp)
    80005178:	02010113          	addi	sp,sp,32
    8000517c:	00008067          	ret

0000000080005180 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005180:	fd010113          	addi	sp,sp,-48
    80005184:	02113423          	sd	ra,40(sp)
    80005188:	02813023          	sd	s0,32(sp)
    8000518c:	00913c23          	sd	s1,24(sp)
    80005190:	01213823          	sd	s2,16(sp)
    80005194:	01313423          	sd	s3,8(sp)
    80005198:	01413023          	sd	s4,0(sp)
    8000519c:	03010413          	addi	s0,sp,48
    800051a0:	00050993          	mv	s3,a0
    800051a4:	00058a13          	mv	s4,a1
    LOCK();
    800051a8:	00100613          	li	a2,1
    800051ac:	00000593          	li	a1,0
    800051b0:	00006517          	auipc	a0,0x6
    800051b4:	4e850513          	addi	a0,a0,1256 # 8000b698 <lockPrint>
    800051b8:	ffffc097          	auipc	ra,0xffffc
    800051bc:	064080e7          	jalr	100(ra) # 8000121c <copy_and_swap>
    800051c0:	00050863          	beqz	a0,800051d0 <_Z9getStringPci+0x50>
    800051c4:	ffffc097          	auipc	ra,0xffffc
    800051c8:	31c080e7          	jalr	796(ra) # 800014e0 <_Z15thread_dispatchv>
    800051cc:	fddff06f          	j	800051a8 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800051d0:	00000913          	li	s2,0
    800051d4:	00090493          	mv	s1,s2
    800051d8:	0019091b          	addiw	s2,s2,1
    800051dc:	03495a63          	bge	s2,s4,80005210 <_Z9getStringPci+0x90>
        cc = getc();
    800051e0:	ffffc097          	auipc	ra,0xffffc
    800051e4:	534080e7          	jalr	1332(ra) # 80001714 <_Z4getcv>
        if(cc < 1)
    800051e8:	02050463          	beqz	a0,80005210 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800051ec:	009984b3          	add	s1,s3,s1
    800051f0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800051f4:	00a00793          	li	a5,10
    800051f8:	00f50a63          	beq	a0,a5,8000520c <_Z9getStringPci+0x8c>
    800051fc:	00d00793          	li	a5,13
    80005200:	fcf51ae3          	bne	a0,a5,800051d4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005204:	00090493          	mv	s1,s2
    80005208:	0080006f          	j	80005210 <_Z9getStringPci+0x90>
    8000520c:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005210:	009984b3          	add	s1,s3,s1
    80005214:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005218:	00000613          	li	a2,0
    8000521c:	00100593          	li	a1,1
    80005220:	00006517          	auipc	a0,0x6
    80005224:	47850513          	addi	a0,a0,1144 # 8000b698 <lockPrint>
    80005228:	ffffc097          	auipc	ra,0xffffc
    8000522c:	ff4080e7          	jalr	-12(ra) # 8000121c <copy_and_swap>
    80005230:	fe0514e3          	bnez	a0,80005218 <_Z9getStringPci+0x98>
    return buf;
}
    80005234:	00098513          	mv	a0,s3
    80005238:	02813083          	ld	ra,40(sp)
    8000523c:	02013403          	ld	s0,32(sp)
    80005240:	01813483          	ld	s1,24(sp)
    80005244:	01013903          	ld	s2,16(sp)
    80005248:	00813983          	ld	s3,8(sp)
    8000524c:	00013a03          	ld	s4,0(sp)
    80005250:	03010113          	addi	sp,sp,48
    80005254:	00008067          	ret

0000000080005258 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005258:	ff010113          	addi	sp,sp,-16
    8000525c:	00813423          	sd	s0,8(sp)
    80005260:	01010413          	addi	s0,sp,16
    80005264:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005268:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000526c:	0006c603          	lbu	a2,0(a3)
    80005270:	fd06071b          	addiw	a4,a2,-48
    80005274:	0ff77713          	andi	a4,a4,255
    80005278:	00900793          	li	a5,9
    8000527c:	02e7e063          	bltu	a5,a4,8000529c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005280:	0025179b          	slliw	a5,a0,0x2
    80005284:	00a787bb          	addw	a5,a5,a0
    80005288:	0017979b          	slliw	a5,a5,0x1
    8000528c:	00168693          	addi	a3,a3,1
    80005290:	00c787bb          	addw	a5,a5,a2
    80005294:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005298:	fd5ff06f          	j	8000526c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000529c:	00813403          	ld	s0,8(sp)
    800052a0:	01010113          	addi	sp,sp,16
    800052a4:	00008067          	ret

00000000800052a8 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800052a8:	fc010113          	addi	sp,sp,-64
    800052ac:	02113c23          	sd	ra,56(sp)
    800052b0:	02813823          	sd	s0,48(sp)
    800052b4:	02913423          	sd	s1,40(sp)
    800052b8:	03213023          	sd	s2,32(sp)
    800052bc:	01313c23          	sd	s3,24(sp)
    800052c0:	04010413          	addi	s0,sp,64
    800052c4:	00050493          	mv	s1,a0
    800052c8:	00058913          	mv	s2,a1
    800052cc:	00060993          	mv	s3,a2
    LOCK();
    800052d0:	00100613          	li	a2,1
    800052d4:	00000593          	li	a1,0
    800052d8:	00006517          	auipc	a0,0x6
    800052dc:	3c050513          	addi	a0,a0,960 # 8000b698 <lockPrint>
    800052e0:	ffffc097          	auipc	ra,0xffffc
    800052e4:	f3c080e7          	jalr	-196(ra) # 8000121c <copy_and_swap>
    800052e8:	00050863          	beqz	a0,800052f8 <_Z8printIntiii+0x50>
    800052ec:	ffffc097          	auipc	ra,0xffffc
    800052f0:	1f4080e7          	jalr	500(ra) # 800014e0 <_Z15thread_dispatchv>
    800052f4:	fddff06f          	j	800052d0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800052f8:	00098463          	beqz	s3,80005300 <_Z8printIntiii+0x58>
    800052fc:	0804c463          	bltz	s1,80005384 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005300:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005304:	00000593          	li	a1,0
    }

    i = 0;
    80005308:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000530c:	0009079b          	sext.w	a5,s2
    80005310:	0325773b          	remuw	a4,a0,s2
    80005314:	00048613          	mv	a2,s1
    80005318:	0014849b          	addiw	s1,s1,1
    8000531c:	02071693          	slli	a3,a4,0x20
    80005320:	0206d693          	srli	a3,a3,0x20
    80005324:	00006717          	auipc	a4,0x6
    80005328:	25c70713          	addi	a4,a4,604 # 8000b580 <digits>
    8000532c:	00d70733          	add	a4,a4,a3
    80005330:	00074683          	lbu	a3,0(a4)
    80005334:	fd040713          	addi	a4,s0,-48
    80005338:	00c70733          	add	a4,a4,a2
    8000533c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005340:	0005071b          	sext.w	a4,a0
    80005344:	0325553b          	divuw	a0,a0,s2
    80005348:	fcf772e3          	bgeu	a4,a5,8000530c <_Z8printIntiii+0x64>
    if(neg)
    8000534c:	00058c63          	beqz	a1,80005364 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005350:	fd040793          	addi	a5,s0,-48
    80005354:	009784b3          	add	s1,a5,s1
    80005358:	02d00793          	li	a5,45
    8000535c:	fef48823          	sb	a5,-16(s1)
    80005360:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005364:	fff4849b          	addiw	s1,s1,-1
    80005368:	0204c463          	bltz	s1,80005390 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    8000536c:	fd040793          	addi	a5,s0,-48
    80005370:	009787b3          	add	a5,a5,s1
    80005374:	ff07c503          	lbu	a0,-16(a5)
    80005378:	ffffc097          	auipc	ra,0xffffc
    8000537c:	3f8080e7          	jalr	1016(ra) # 80001770 <_Z4putcc>
    80005380:	fe5ff06f          	j	80005364 <_Z8printIntiii+0xbc>
        x = -xx;
    80005384:	4090053b          	negw	a0,s1
        neg = 1;
    80005388:	00100593          	li	a1,1
        x = -xx;
    8000538c:	f7dff06f          	j	80005308 <_Z8printIntiii+0x60>

    UNLOCK();
    80005390:	00000613          	li	a2,0
    80005394:	00100593          	li	a1,1
    80005398:	00006517          	auipc	a0,0x6
    8000539c:	30050513          	addi	a0,a0,768 # 8000b698 <lockPrint>
    800053a0:	ffffc097          	auipc	ra,0xffffc
    800053a4:	e7c080e7          	jalr	-388(ra) # 8000121c <copy_and_swap>
    800053a8:	fe0514e3          	bnez	a0,80005390 <_Z8printIntiii+0xe8>
    800053ac:	03813083          	ld	ra,56(sp)
    800053b0:	03013403          	ld	s0,48(sp)
    800053b4:	02813483          	ld	s1,40(sp)
    800053b8:	02013903          	ld	s2,32(sp)
    800053bc:	01813983          	ld	s3,24(sp)
    800053c0:	04010113          	addi	sp,sp,64
    800053c4:	00008067          	ret

00000000800053c8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800053c8:	fd010113          	addi	sp,sp,-48
    800053cc:	02113423          	sd	ra,40(sp)
    800053d0:	02813023          	sd	s0,32(sp)
    800053d4:	00913c23          	sd	s1,24(sp)
    800053d8:	01213823          	sd	s2,16(sp)
    800053dc:	01313423          	sd	s3,8(sp)
    800053e0:	03010413          	addi	s0,sp,48
    800053e4:	00050493          	mv	s1,a0
    800053e8:	00058913          	mv	s2,a1
    800053ec:	0015879b          	addiw	a5,a1,1
    800053f0:	0007851b          	sext.w	a0,a5
    800053f4:	00f4a023          	sw	a5,0(s1)
    800053f8:	0004a823          	sw	zero,16(s1)
    800053fc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005400:	00251513          	slli	a0,a0,0x2
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	e54080e7          	jalr	-428(ra) # 80001258 <_Z9mem_allocm>
    8000540c:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005410:	01000513          	li	a0,16
    80005414:	ffffd097          	auipc	ra,0xffffd
    80005418:	df0080e7          	jalr	-528(ra) # 80002204 <_Znwm>
    8000541c:	00050993          	mv	s3,a0
    80005420:	00000593          	li	a1,0
    80005424:	ffffd097          	auipc	ra,0xffffd
    80005428:	0c0080e7          	jalr	192(ra) # 800024e4 <_ZN9SemaphoreC1Ej>
    8000542c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005430:	01000513          	li	a0,16
    80005434:	ffffd097          	auipc	ra,0xffffd
    80005438:	dd0080e7          	jalr	-560(ra) # 80002204 <_Znwm>
    8000543c:	00050993          	mv	s3,a0
    80005440:	00090593          	mv	a1,s2
    80005444:	ffffd097          	auipc	ra,0xffffd
    80005448:	0a0080e7          	jalr	160(ra) # 800024e4 <_ZN9SemaphoreC1Ej>
    8000544c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005450:	01000513          	li	a0,16
    80005454:	ffffd097          	auipc	ra,0xffffd
    80005458:	db0080e7          	jalr	-592(ra) # 80002204 <_Znwm>
    8000545c:	00050913          	mv	s2,a0
    80005460:	00100593          	li	a1,1
    80005464:	ffffd097          	auipc	ra,0xffffd
    80005468:	080080e7          	jalr	128(ra) # 800024e4 <_ZN9SemaphoreC1Ej>
    8000546c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005470:	01000513          	li	a0,16
    80005474:	ffffd097          	auipc	ra,0xffffd
    80005478:	d90080e7          	jalr	-624(ra) # 80002204 <_Znwm>
    8000547c:	00050913          	mv	s2,a0
    80005480:	00100593          	li	a1,1
    80005484:	ffffd097          	auipc	ra,0xffffd
    80005488:	060080e7          	jalr	96(ra) # 800024e4 <_ZN9SemaphoreC1Ej>
    8000548c:	0324b823          	sd	s2,48(s1)
}
    80005490:	02813083          	ld	ra,40(sp)
    80005494:	02013403          	ld	s0,32(sp)
    80005498:	01813483          	ld	s1,24(sp)
    8000549c:	01013903          	ld	s2,16(sp)
    800054a0:	00813983          	ld	s3,8(sp)
    800054a4:	03010113          	addi	sp,sp,48
    800054a8:	00008067          	ret
    800054ac:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800054b0:	00098513          	mv	a0,s3
    800054b4:	ffffd097          	auipc	ra,0xffffd
    800054b8:	da0080e7          	jalr	-608(ra) # 80002254 <_ZdlPv>
    800054bc:	00048513          	mv	a0,s1
    800054c0:	00007097          	auipc	ra,0x7
    800054c4:	2b8080e7          	jalr	696(ra) # 8000c778 <_Unwind_Resume>
    800054c8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800054cc:	00098513          	mv	a0,s3
    800054d0:	ffffd097          	auipc	ra,0xffffd
    800054d4:	d84080e7          	jalr	-636(ra) # 80002254 <_ZdlPv>
    800054d8:	00048513          	mv	a0,s1
    800054dc:	00007097          	auipc	ra,0x7
    800054e0:	29c080e7          	jalr	668(ra) # 8000c778 <_Unwind_Resume>
    800054e4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800054e8:	00090513          	mv	a0,s2
    800054ec:	ffffd097          	auipc	ra,0xffffd
    800054f0:	d68080e7          	jalr	-664(ra) # 80002254 <_ZdlPv>
    800054f4:	00048513          	mv	a0,s1
    800054f8:	00007097          	auipc	ra,0x7
    800054fc:	280080e7          	jalr	640(ra) # 8000c778 <_Unwind_Resume>
    80005500:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005504:	00090513          	mv	a0,s2
    80005508:	ffffd097          	auipc	ra,0xffffd
    8000550c:	d4c080e7          	jalr	-692(ra) # 80002254 <_ZdlPv>
    80005510:	00048513          	mv	a0,s1
    80005514:	00007097          	auipc	ra,0x7
    80005518:	264080e7          	jalr	612(ra) # 8000c778 <_Unwind_Resume>

000000008000551c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    8000551c:	fe010113          	addi	sp,sp,-32
    80005520:	00113c23          	sd	ra,24(sp)
    80005524:	00813823          	sd	s0,16(sp)
    80005528:	00913423          	sd	s1,8(sp)
    8000552c:	01213023          	sd	s2,0(sp)
    80005530:	02010413          	addi	s0,sp,32
    80005534:	00050493          	mv	s1,a0
    80005538:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000553c:	01853503          	ld	a0,24(a0)
    80005540:	ffffd097          	auipc	ra,0xffffd
    80005544:	fdc080e7          	jalr	-36(ra) # 8000251c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005548:	0304b503          	ld	a0,48(s1)
    8000554c:	ffffd097          	auipc	ra,0xffffd
    80005550:	fd0080e7          	jalr	-48(ra) # 8000251c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005554:	0084b783          	ld	a5,8(s1)
    80005558:	0144a703          	lw	a4,20(s1)
    8000555c:	00271713          	slli	a4,a4,0x2
    80005560:	00e787b3          	add	a5,a5,a4
    80005564:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005568:	0144a783          	lw	a5,20(s1)
    8000556c:	0017879b          	addiw	a5,a5,1
    80005570:	0004a703          	lw	a4,0(s1)
    80005574:	02e7e7bb          	remw	a5,a5,a4
    80005578:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000557c:	0304b503          	ld	a0,48(s1)
    80005580:	ffffd097          	auipc	ra,0xffffd
    80005584:	fc8080e7          	jalr	-56(ra) # 80002548 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005588:	0204b503          	ld	a0,32(s1)
    8000558c:	ffffd097          	auipc	ra,0xffffd
    80005590:	fbc080e7          	jalr	-68(ra) # 80002548 <_ZN9Semaphore6signalEv>

}
    80005594:	01813083          	ld	ra,24(sp)
    80005598:	01013403          	ld	s0,16(sp)
    8000559c:	00813483          	ld	s1,8(sp)
    800055a0:	00013903          	ld	s2,0(sp)
    800055a4:	02010113          	addi	sp,sp,32
    800055a8:	00008067          	ret

00000000800055ac <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800055ac:	fe010113          	addi	sp,sp,-32
    800055b0:	00113c23          	sd	ra,24(sp)
    800055b4:	00813823          	sd	s0,16(sp)
    800055b8:	00913423          	sd	s1,8(sp)
    800055bc:	01213023          	sd	s2,0(sp)
    800055c0:	02010413          	addi	s0,sp,32
    800055c4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800055c8:	02053503          	ld	a0,32(a0)
    800055cc:	ffffd097          	auipc	ra,0xffffd
    800055d0:	f50080e7          	jalr	-176(ra) # 8000251c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800055d4:	0284b503          	ld	a0,40(s1)
    800055d8:	ffffd097          	auipc	ra,0xffffd
    800055dc:	f44080e7          	jalr	-188(ra) # 8000251c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800055e0:	0084b703          	ld	a4,8(s1)
    800055e4:	0104a783          	lw	a5,16(s1)
    800055e8:	00279693          	slli	a3,a5,0x2
    800055ec:	00d70733          	add	a4,a4,a3
    800055f0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800055f4:	0017879b          	addiw	a5,a5,1
    800055f8:	0004a703          	lw	a4,0(s1)
    800055fc:	02e7e7bb          	remw	a5,a5,a4
    80005600:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005604:	0284b503          	ld	a0,40(s1)
    80005608:	ffffd097          	auipc	ra,0xffffd
    8000560c:	f40080e7          	jalr	-192(ra) # 80002548 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005610:	0184b503          	ld	a0,24(s1)
    80005614:	ffffd097          	auipc	ra,0xffffd
    80005618:	f34080e7          	jalr	-204(ra) # 80002548 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000561c:	00090513          	mv	a0,s2
    80005620:	01813083          	ld	ra,24(sp)
    80005624:	01013403          	ld	s0,16(sp)
    80005628:	00813483          	ld	s1,8(sp)
    8000562c:	00013903          	ld	s2,0(sp)
    80005630:	02010113          	addi	sp,sp,32
    80005634:	00008067          	ret

0000000080005638 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005638:	fe010113          	addi	sp,sp,-32
    8000563c:	00113c23          	sd	ra,24(sp)
    80005640:	00813823          	sd	s0,16(sp)
    80005644:	00913423          	sd	s1,8(sp)
    80005648:	01213023          	sd	s2,0(sp)
    8000564c:	02010413          	addi	s0,sp,32
    80005650:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005654:	02853503          	ld	a0,40(a0)
    80005658:	ffffd097          	auipc	ra,0xffffd
    8000565c:	ec4080e7          	jalr	-316(ra) # 8000251c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005660:	0304b503          	ld	a0,48(s1)
    80005664:	ffffd097          	auipc	ra,0xffffd
    80005668:	eb8080e7          	jalr	-328(ra) # 8000251c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000566c:	0144a783          	lw	a5,20(s1)
    80005670:	0104a903          	lw	s2,16(s1)
    80005674:	0327ce63          	blt	a5,s2,800056b0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005678:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000567c:	0304b503          	ld	a0,48(s1)
    80005680:	ffffd097          	auipc	ra,0xffffd
    80005684:	ec8080e7          	jalr	-312(ra) # 80002548 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005688:	0284b503          	ld	a0,40(s1)
    8000568c:	ffffd097          	auipc	ra,0xffffd
    80005690:	ebc080e7          	jalr	-324(ra) # 80002548 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005694:	00090513          	mv	a0,s2
    80005698:	01813083          	ld	ra,24(sp)
    8000569c:	01013403          	ld	s0,16(sp)
    800056a0:	00813483          	ld	s1,8(sp)
    800056a4:	00013903          	ld	s2,0(sp)
    800056a8:	02010113          	addi	sp,sp,32
    800056ac:	00008067          	ret
        ret = cap - head + tail;
    800056b0:	0004a703          	lw	a4,0(s1)
    800056b4:	4127093b          	subw	s2,a4,s2
    800056b8:	00f9093b          	addw	s2,s2,a5
    800056bc:	fc1ff06f          	j	8000567c <_ZN9BufferCPP6getCntEv+0x44>

00000000800056c0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800056c0:	fe010113          	addi	sp,sp,-32
    800056c4:	00113c23          	sd	ra,24(sp)
    800056c8:	00813823          	sd	s0,16(sp)
    800056cc:	00913423          	sd	s1,8(sp)
    800056d0:	02010413          	addi	s0,sp,32
    800056d4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800056d8:	00a00513          	li	a0,10
    800056dc:	ffffd097          	auipc	ra,0xffffd
    800056e0:	f2c080e7          	jalr	-212(ra) # 80002608 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800056e4:	00004517          	auipc	a0,0x4
    800056e8:	e2450513          	addi	a0,a0,-476 # 80009508 <CONSOLE_STATUS+0x4f8>
    800056ec:	00000097          	auipc	ra,0x0
    800056f0:	a0c080e7          	jalr	-1524(ra) # 800050f8 <_Z11printStringPKc>
    while (getCnt()) {
    800056f4:	00048513          	mv	a0,s1
    800056f8:	00000097          	auipc	ra,0x0
    800056fc:	f40080e7          	jalr	-192(ra) # 80005638 <_ZN9BufferCPP6getCntEv>
    80005700:	02050c63          	beqz	a0,80005738 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005704:	0084b783          	ld	a5,8(s1)
    80005708:	0104a703          	lw	a4,16(s1)
    8000570c:	00271713          	slli	a4,a4,0x2
    80005710:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005714:	0007c503          	lbu	a0,0(a5)
    80005718:	ffffd097          	auipc	ra,0xffffd
    8000571c:	ef0080e7          	jalr	-272(ra) # 80002608 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005720:	0104a783          	lw	a5,16(s1)
    80005724:	0017879b          	addiw	a5,a5,1
    80005728:	0004a703          	lw	a4,0(s1)
    8000572c:	02e7e7bb          	remw	a5,a5,a4
    80005730:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005734:	fc1ff06f          	j	800056f4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005738:	02100513          	li	a0,33
    8000573c:	ffffd097          	auipc	ra,0xffffd
    80005740:	ecc080e7          	jalr	-308(ra) # 80002608 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005744:	00a00513          	li	a0,10
    80005748:	ffffd097          	auipc	ra,0xffffd
    8000574c:	ec0080e7          	jalr	-320(ra) # 80002608 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005750:	0084b503          	ld	a0,8(s1)
    80005754:	ffffc097          	auipc	ra,0xffffc
    80005758:	b70080e7          	jalr	-1168(ra) # 800012c4 <_Z8mem_freePv>
    delete itemAvailable;
    8000575c:	0204b503          	ld	a0,32(s1)
    80005760:	00050863          	beqz	a0,80005770 <_ZN9BufferCPPD1Ev+0xb0>
    80005764:	00053783          	ld	a5,0(a0)
    80005768:	0087b783          	ld	a5,8(a5)
    8000576c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005770:	0184b503          	ld	a0,24(s1)
    80005774:	00050863          	beqz	a0,80005784 <_ZN9BufferCPPD1Ev+0xc4>
    80005778:	00053783          	ld	a5,0(a0)
    8000577c:	0087b783          	ld	a5,8(a5)
    80005780:	000780e7          	jalr	a5
    delete mutexTail;
    80005784:	0304b503          	ld	a0,48(s1)
    80005788:	00050863          	beqz	a0,80005798 <_ZN9BufferCPPD1Ev+0xd8>
    8000578c:	00053783          	ld	a5,0(a0)
    80005790:	0087b783          	ld	a5,8(a5)
    80005794:	000780e7          	jalr	a5
    delete mutexHead;
    80005798:	0284b503          	ld	a0,40(s1)
    8000579c:	00050863          	beqz	a0,800057ac <_ZN9BufferCPPD1Ev+0xec>
    800057a0:	00053783          	ld	a5,0(a0)
    800057a4:	0087b783          	ld	a5,8(a5)
    800057a8:	000780e7          	jalr	a5
}
    800057ac:	01813083          	ld	ra,24(sp)
    800057b0:	01013403          	ld	s0,16(sp)
    800057b4:	00813483          	ld	s1,8(sp)
    800057b8:	02010113          	addi	sp,sp,32
    800057bc:	00008067          	ret

00000000800057c0 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800057c0:	fe010113          	addi	sp,sp,-32
    800057c4:	00113c23          	sd	ra,24(sp)
    800057c8:	00813823          	sd	s0,16(sp)
    800057cc:	00913423          	sd	s1,8(sp)
    800057d0:	01213023          	sd	s2,0(sp)
    800057d4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800057d8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800057dc:	00600493          	li	s1,6
    while (--i > 0) {
    800057e0:	fff4849b          	addiw	s1,s1,-1
    800057e4:	04905463          	blez	s1,8000582c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800057e8:	00004517          	auipc	a0,0x4
    800057ec:	d3850513          	addi	a0,a0,-712 # 80009520 <CONSOLE_STATUS+0x510>
    800057f0:	00000097          	auipc	ra,0x0
    800057f4:	908080e7          	jalr	-1784(ra) # 800050f8 <_Z11printStringPKc>
        printInt(sleep_time);
    800057f8:	00000613          	li	a2,0
    800057fc:	00a00593          	li	a1,10
    80005800:	0009051b          	sext.w	a0,s2
    80005804:	00000097          	auipc	ra,0x0
    80005808:	aa4080e7          	jalr	-1372(ra) # 800052a8 <_Z8printIntiii>
        printString(" !\n");
    8000580c:	00004517          	auipc	a0,0x4
    80005810:	d1c50513          	addi	a0,a0,-740 # 80009528 <CONSOLE_STATUS+0x518>
    80005814:	00000097          	auipc	ra,0x0
    80005818:	8e4080e7          	jalr	-1820(ra) # 800050f8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000581c:	00090513          	mv	a0,s2
    80005820:	ffffc097          	auipc	ra,0xffffc
    80005824:	ea4080e7          	jalr	-348(ra) # 800016c4 <_Z10time_sleepm>
    while (--i > 0) {
    80005828:	fb9ff06f          	j	800057e0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000582c:	00a00793          	li	a5,10
    80005830:	02f95933          	divu	s2,s2,a5
    80005834:	fff90913          	addi	s2,s2,-1
    80005838:	00006797          	auipc	a5,0x6
    8000583c:	e6878793          	addi	a5,a5,-408 # 8000b6a0 <_ZL8finished>
    80005840:	01278933          	add	s2,a5,s2
    80005844:	00100793          	li	a5,1
    80005848:	00f90023          	sb	a5,0(s2)
}
    8000584c:	01813083          	ld	ra,24(sp)
    80005850:	01013403          	ld	s0,16(sp)
    80005854:	00813483          	ld	s1,8(sp)
    80005858:	00013903          	ld	s2,0(sp)
    8000585c:	02010113          	addi	sp,sp,32
    80005860:	00008067          	ret

0000000080005864 <_Z12testSleepingv>:

void testSleeping() {
    80005864:	fc010113          	addi	sp,sp,-64
    80005868:	02113c23          	sd	ra,56(sp)
    8000586c:	02813823          	sd	s0,48(sp)
    80005870:	02913423          	sd	s1,40(sp)
    80005874:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005878:	00a00793          	li	a5,10
    8000587c:	fcf43823          	sd	a5,-48(s0)
    80005880:	01400793          	li	a5,20
    80005884:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005888:	00000493          	li	s1,0
    8000588c:	02c0006f          	j	800058b8 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005890:	00349793          	slli	a5,s1,0x3
    80005894:	fd040613          	addi	a2,s0,-48
    80005898:	00f60633          	add	a2,a2,a5
    8000589c:	00000597          	auipc	a1,0x0
    800058a0:	f2458593          	addi	a1,a1,-220 # 800057c0 <_ZL9sleepyRunPv>
    800058a4:	fc040513          	addi	a0,s0,-64
    800058a8:	00f50533          	add	a0,a0,a5
    800058ac:	ffffc097          	auipc	ra,0xffffc
    800058b0:	b28080e7          	jalr	-1240(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800058b4:	0014849b          	addiw	s1,s1,1
    800058b8:	00100793          	li	a5,1
    800058bc:	fc97dae3          	bge	a5,s1,80005890 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800058c0:	00006797          	auipc	a5,0x6
    800058c4:	de07c783          	lbu	a5,-544(a5) # 8000b6a0 <_ZL8finished>
    800058c8:	fe078ce3          	beqz	a5,800058c0 <_Z12testSleepingv+0x5c>
    800058cc:	00006797          	auipc	a5,0x6
    800058d0:	dd57c783          	lbu	a5,-555(a5) # 8000b6a1 <_ZL8finished+0x1>
    800058d4:	fe0786e3          	beqz	a5,800058c0 <_Z12testSleepingv+0x5c>
}
    800058d8:	03813083          	ld	ra,56(sp)
    800058dc:	03013403          	ld	s0,48(sp)
    800058e0:	02813483          	ld	s1,40(sp)
    800058e4:	04010113          	addi	sp,sp,64
    800058e8:	00008067          	ret

00000000800058ec <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800058ec:	fe010113          	addi	sp,sp,-32
    800058f0:	00113c23          	sd	ra,24(sp)
    800058f4:	00813823          	sd	s0,16(sp)
    800058f8:	00913423          	sd	s1,8(sp)
    800058fc:	01213023          	sd	s2,0(sp)
    80005900:	02010413          	addi	s0,sp,32
    80005904:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005908:	00100793          	li	a5,1
    8000590c:	02a7f863          	bgeu	a5,a0,8000593c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005910:	00a00793          	li	a5,10
    80005914:	02f577b3          	remu	a5,a0,a5
    80005918:	02078e63          	beqz	a5,80005954 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000591c:	fff48513          	addi	a0,s1,-1
    80005920:	00000097          	auipc	ra,0x0
    80005924:	fcc080e7          	jalr	-52(ra) # 800058ec <_ZL9fibonaccim>
    80005928:	00050913          	mv	s2,a0
    8000592c:	ffe48513          	addi	a0,s1,-2
    80005930:	00000097          	auipc	ra,0x0
    80005934:	fbc080e7          	jalr	-68(ra) # 800058ec <_ZL9fibonaccim>
    80005938:	00a90533          	add	a0,s2,a0
}
    8000593c:	01813083          	ld	ra,24(sp)
    80005940:	01013403          	ld	s0,16(sp)
    80005944:	00813483          	ld	s1,8(sp)
    80005948:	00013903          	ld	s2,0(sp)
    8000594c:	02010113          	addi	sp,sp,32
    80005950:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005954:	ffffc097          	auipc	ra,0xffffc
    80005958:	b8c080e7          	jalr	-1140(ra) # 800014e0 <_Z15thread_dispatchv>
    8000595c:	fc1ff06f          	j	8000591c <_ZL9fibonaccim+0x30>

0000000080005960 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005960:	fe010113          	addi	sp,sp,-32
    80005964:	00113c23          	sd	ra,24(sp)
    80005968:	00813823          	sd	s0,16(sp)
    8000596c:	00913423          	sd	s1,8(sp)
    80005970:	01213023          	sd	s2,0(sp)
    80005974:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005978:	00a00493          	li	s1,10
    8000597c:	0400006f          	j	800059bc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005980:	00004517          	auipc	a0,0x4
    80005984:	b0050513          	addi	a0,a0,-1280 # 80009480 <CONSOLE_STATUS+0x470>
    80005988:	fffff097          	auipc	ra,0xfffff
    8000598c:	770080e7          	jalr	1904(ra) # 800050f8 <_Z11printStringPKc>
    80005990:	00000613          	li	a2,0
    80005994:	00a00593          	li	a1,10
    80005998:	00048513          	mv	a0,s1
    8000599c:	00000097          	auipc	ra,0x0
    800059a0:	90c080e7          	jalr	-1780(ra) # 800052a8 <_Z8printIntiii>
    800059a4:	00004517          	auipc	a0,0x4
    800059a8:	86450513          	addi	a0,a0,-1948 # 80009208 <CONSOLE_STATUS+0x1f8>
    800059ac:	fffff097          	auipc	ra,0xfffff
    800059b0:	74c080e7          	jalr	1868(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800059b4:	0014849b          	addiw	s1,s1,1
    800059b8:	0ff4f493          	andi	s1,s1,255
    800059bc:	00c00793          	li	a5,12
    800059c0:	fc97f0e3          	bgeu	a5,s1,80005980 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800059c4:	00004517          	auipc	a0,0x4
    800059c8:	ac450513          	addi	a0,a0,-1340 # 80009488 <CONSOLE_STATUS+0x478>
    800059cc:	fffff097          	auipc	ra,0xfffff
    800059d0:	72c080e7          	jalr	1836(ra) # 800050f8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800059d4:	00500313          	li	t1,5
    thread_dispatch();
    800059d8:	ffffc097          	auipc	ra,0xffffc
    800059dc:	b08080e7          	jalr	-1272(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800059e0:	01000513          	li	a0,16
    800059e4:	00000097          	auipc	ra,0x0
    800059e8:	f08080e7          	jalr	-248(ra) # 800058ec <_ZL9fibonaccim>
    800059ec:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800059f0:	00003517          	auipc	a0,0x3
    800059f4:	68850513          	addi	a0,a0,1672 # 80009078 <CONSOLE_STATUS+0x68>
    800059f8:	fffff097          	auipc	ra,0xfffff
    800059fc:	700080e7          	jalr	1792(ra) # 800050f8 <_Z11printStringPKc>
    80005a00:	00000613          	li	a2,0
    80005a04:	00a00593          	li	a1,10
    80005a08:	0009051b          	sext.w	a0,s2
    80005a0c:	00000097          	auipc	ra,0x0
    80005a10:	89c080e7          	jalr	-1892(ra) # 800052a8 <_Z8printIntiii>
    80005a14:	00003517          	auipc	a0,0x3
    80005a18:	7f450513          	addi	a0,a0,2036 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005a1c:	fffff097          	auipc	ra,0xfffff
    80005a20:	6dc080e7          	jalr	1756(ra) # 800050f8 <_Z11printStringPKc>
    80005a24:	0400006f          	j	80005a64 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005a28:	00004517          	auipc	a0,0x4
    80005a2c:	a5850513          	addi	a0,a0,-1448 # 80009480 <CONSOLE_STATUS+0x470>
    80005a30:	fffff097          	auipc	ra,0xfffff
    80005a34:	6c8080e7          	jalr	1736(ra) # 800050f8 <_Z11printStringPKc>
    80005a38:	00000613          	li	a2,0
    80005a3c:	00a00593          	li	a1,10
    80005a40:	00048513          	mv	a0,s1
    80005a44:	00000097          	auipc	ra,0x0
    80005a48:	864080e7          	jalr	-1948(ra) # 800052a8 <_Z8printIntiii>
    80005a4c:	00003517          	auipc	a0,0x3
    80005a50:	7bc50513          	addi	a0,a0,1980 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005a54:	fffff097          	auipc	ra,0xfffff
    80005a58:	6a4080e7          	jalr	1700(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005a5c:	0014849b          	addiw	s1,s1,1
    80005a60:	0ff4f493          	andi	s1,s1,255
    80005a64:	00f00793          	li	a5,15
    80005a68:	fc97f0e3          	bgeu	a5,s1,80005a28 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005a6c:	00004517          	auipc	a0,0x4
    80005a70:	a2c50513          	addi	a0,a0,-1492 # 80009498 <CONSOLE_STATUS+0x488>
    80005a74:	fffff097          	auipc	ra,0xfffff
    80005a78:	684080e7          	jalr	1668(ra) # 800050f8 <_Z11printStringPKc>
    finishedD = true;
    80005a7c:	00100793          	li	a5,1
    80005a80:	00006717          	auipc	a4,0x6
    80005a84:	c2f70123          	sb	a5,-990(a4) # 8000b6a2 <_ZL9finishedD>
    thread_dispatch();
    80005a88:	ffffc097          	auipc	ra,0xffffc
    80005a8c:	a58080e7          	jalr	-1448(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005a90:	01813083          	ld	ra,24(sp)
    80005a94:	01013403          	ld	s0,16(sp)
    80005a98:	00813483          	ld	s1,8(sp)
    80005a9c:	00013903          	ld	s2,0(sp)
    80005aa0:	02010113          	addi	sp,sp,32
    80005aa4:	00008067          	ret

0000000080005aa8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005aa8:	fe010113          	addi	sp,sp,-32
    80005aac:	00113c23          	sd	ra,24(sp)
    80005ab0:	00813823          	sd	s0,16(sp)
    80005ab4:	00913423          	sd	s1,8(sp)
    80005ab8:	01213023          	sd	s2,0(sp)
    80005abc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005ac0:	00000493          	li	s1,0
    80005ac4:	0400006f          	j	80005b04 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005ac8:	00003517          	auipc	a0,0x3
    80005acc:	56850513          	addi	a0,a0,1384 # 80009030 <CONSOLE_STATUS+0x20>
    80005ad0:	fffff097          	auipc	ra,0xfffff
    80005ad4:	628080e7          	jalr	1576(ra) # 800050f8 <_Z11printStringPKc>
    80005ad8:	00000613          	li	a2,0
    80005adc:	00a00593          	li	a1,10
    80005ae0:	00048513          	mv	a0,s1
    80005ae4:	fffff097          	auipc	ra,0xfffff
    80005ae8:	7c4080e7          	jalr	1988(ra) # 800052a8 <_Z8printIntiii>
    80005aec:	00003517          	auipc	a0,0x3
    80005af0:	71c50513          	addi	a0,a0,1820 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005af4:	fffff097          	auipc	ra,0xfffff
    80005af8:	604080e7          	jalr	1540(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005afc:	0014849b          	addiw	s1,s1,1
    80005b00:	0ff4f493          	andi	s1,s1,255
    80005b04:	00200793          	li	a5,2
    80005b08:	fc97f0e3          	bgeu	a5,s1,80005ac8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005b0c:	00004517          	auipc	a0,0x4
    80005b10:	94c50513          	addi	a0,a0,-1716 # 80009458 <CONSOLE_STATUS+0x448>
    80005b14:	fffff097          	auipc	ra,0xfffff
    80005b18:	5e4080e7          	jalr	1508(ra) # 800050f8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005b1c:	00700313          	li	t1,7
    thread_dispatch();
    80005b20:	ffffc097          	auipc	ra,0xffffc
    80005b24:	9c0080e7          	jalr	-1600(ra) # 800014e0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005b28:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005b2c:	00004517          	auipc	a0,0x4
    80005b30:	93c50513          	addi	a0,a0,-1732 # 80009468 <CONSOLE_STATUS+0x458>
    80005b34:	fffff097          	auipc	ra,0xfffff
    80005b38:	5c4080e7          	jalr	1476(ra) # 800050f8 <_Z11printStringPKc>
    80005b3c:	00000613          	li	a2,0
    80005b40:	00a00593          	li	a1,10
    80005b44:	0009051b          	sext.w	a0,s2
    80005b48:	fffff097          	auipc	ra,0xfffff
    80005b4c:	760080e7          	jalr	1888(ra) # 800052a8 <_Z8printIntiii>
    80005b50:	00003517          	auipc	a0,0x3
    80005b54:	6b850513          	addi	a0,a0,1720 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005b58:	fffff097          	auipc	ra,0xfffff
    80005b5c:	5a0080e7          	jalr	1440(ra) # 800050f8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005b60:	00c00513          	li	a0,12
    80005b64:	00000097          	auipc	ra,0x0
    80005b68:	d88080e7          	jalr	-632(ra) # 800058ec <_ZL9fibonaccim>
    80005b6c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005b70:	00004517          	auipc	a0,0x4
    80005b74:	90050513          	addi	a0,a0,-1792 # 80009470 <CONSOLE_STATUS+0x460>
    80005b78:	fffff097          	auipc	ra,0xfffff
    80005b7c:	580080e7          	jalr	1408(ra) # 800050f8 <_Z11printStringPKc>
    80005b80:	00000613          	li	a2,0
    80005b84:	00a00593          	li	a1,10
    80005b88:	0009051b          	sext.w	a0,s2
    80005b8c:	fffff097          	auipc	ra,0xfffff
    80005b90:	71c080e7          	jalr	1820(ra) # 800052a8 <_Z8printIntiii>
    80005b94:	00003517          	auipc	a0,0x3
    80005b98:	67450513          	addi	a0,a0,1652 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005b9c:	fffff097          	auipc	ra,0xfffff
    80005ba0:	55c080e7          	jalr	1372(ra) # 800050f8 <_Z11printStringPKc>
    80005ba4:	0400006f          	j	80005be4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005ba8:	00003517          	auipc	a0,0x3
    80005bac:	48850513          	addi	a0,a0,1160 # 80009030 <CONSOLE_STATUS+0x20>
    80005bb0:	fffff097          	auipc	ra,0xfffff
    80005bb4:	548080e7          	jalr	1352(ra) # 800050f8 <_Z11printStringPKc>
    80005bb8:	00000613          	li	a2,0
    80005bbc:	00a00593          	li	a1,10
    80005bc0:	00048513          	mv	a0,s1
    80005bc4:	fffff097          	auipc	ra,0xfffff
    80005bc8:	6e4080e7          	jalr	1764(ra) # 800052a8 <_Z8printIntiii>
    80005bcc:	00003517          	auipc	a0,0x3
    80005bd0:	63c50513          	addi	a0,a0,1596 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005bd4:	fffff097          	auipc	ra,0xfffff
    80005bd8:	524080e7          	jalr	1316(ra) # 800050f8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005bdc:	0014849b          	addiw	s1,s1,1
    80005be0:	0ff4f493          	andi	s1,s1,255
    80005be4:	00500793          	li	a5,5
    80005be8:	fc97f0e3          	bgeu	a5,s1,80005ba8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005bec:	00004517          	auipc	a0,0x4
    80005bf0:	84450513          	addi	a0,a0,-1980 # 80009430 <CONSOLE_STATUS+0x420>
    80005bf4:	fffff097          	auipc	ra,0xfffff
    80005bf8:	504080e7          	jalr	1284(ra) # 800050f8 <_Z11printStringPKc>
    finishedC = true;
    80005bfc:	00100793          	li	a5,1
    80005c00:	00006717          	auipc	a4,0x6
    80005c04:	aaf701a3          	sb	a5,-1373(a4) # 8000b6a3 <_ZL9finishedC>
    thread_dispatch();
    80005c08:	ffffc097          	auipc	ra,0xffffc
    80005c0c:	8d8080e7          	jalr	-1832(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005c10:	01813083          	ld	ra,24(sp)
    80005c14:	01013403          	ld	s0,16(sp)
    80005c18:	00813483          	ld	s1,8(sp)
    80005c1c:	00013903          	ld	s2,0(sp)
    80005c20:	02010113          	addi	sp,sp,32
    80005c24:	00008067          	ret

0000000080005c28 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005c28:	fe010113          	addi	sp,sp,-32
    80005c2c:	00113c23          	sd	ra,24(sp)
    80005c30:	00813823          	sd	s0,16(sp)
    80005c34:	00913423          	sd	s1,8(sp)
    80005c38:	01213023          	sd	s2,0(sp)
    80005c3c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005c40:	00000913          	li	s2,0
    80005c44:	0400006f          	j	80005c84 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005c48:	ffffc097          	auipc	ra,0xffffc
    80005c4c:	898080e7          	jalr	-1896(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005c50:	00148493          	addi	s1,s1,1
    80005c54:	000027b7          	lui	a5,0x2
    80005c58:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005c5c:	0097ee63          	bltu	a5,s1,80005c78 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005c60:	00000713          	li	a4,0
    80005c64:	000077b7          	lui	a5,0x7
    80005c68:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005c6c:	fce7eee3          	bltu	a5,a4,80005c48 <_ZL11workerBodyBPv+0x20>
    80005c70:	00170713          	addi	a4,a4,1
    80005c74:	ff1ff06f          	j	80005c64 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005c78:	00a00793          	li	a5,10
    80005c7c:	04f90663          	beq	s2,a5,80005cc8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005c80:	00190913          	addi	s2,s2,1
    80005c84:	00f00793          	li	a5,15
    80005c88:	0527e463          	bltu	a5,s2,80005cd0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005c8c:	00003517          	auipc	a0,0x3
    80005c90:	7b450513          	addi	a0,a0,1972 # 80009440 <CONSOLE_STATUS+0x430>
    80005c94:	fffff097          	auipc	ra,0xfffff
    80005c98:	464080e7          	jalr	1124(ra) # 800050f8 <_Z11printStringPKc>
    80005c9c:	00000613          	li	a2,0
    80005ca0:	00a00593          	li	a1,10
    80005ca4:	0009051b          	sext.w	a0,s2
    80005ca8:	fffff097          	auipc	ra,0xfffff
    80005cac:	600080e7          	jalr	1536(ra) # 800052a8 <_Z8printIntiii>
    80005cb0:	00003517          	auipc	a0,0x3
    80005cb4:	55850513          	addi	a0,a0,1368 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005cb8:	fffff097          	auipc	ra,0xfffff
    80005cbc:	440080e7          	jalr	1088(ra) # 800050f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005cc0:	00000493          	li	s1,0
    80005cc4:	f91ff06f          	j	80005c54 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80005cc8:	14102ff3          	csrr	t6,sepc
    80005ccc:	fb5ff06f          	j	80005c80 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005cd0:	00003517          	auipc	a0,0x3
    80005cd4:	77850513          	addi	a0,a0,1912 # 80009448 <CONSOLE_STATUS+0x438>
    80005cd8:	fffff097          	auipc	ra,0xfffff
    80005cdc:	420080e7          	jalr	1056(ra) # 800050f8 <_Z11printStringPKc>
    finishedB = true;
    80005ce0:	00100793          	li	a5,1
    80005ce4:	00006717          	auipc	a4,0x6
    80005ce8:	9cf70023          	sb	a5,-1600(a4) # 8000b6a4 <_ZL9finishedB>
    thread_dispatch();
    80005cec:	ffffb097          	auipc	ra,0xffffb
    80005cf0:	7f4080e7          	jalr	2036(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005cf4:	01813083          	ld	ra,24(sp)
    80005cf8:	01013403          	ld	s0,16(sp)
    80005cfc:	00813483          	ld	s1,8(sp)
    80005d00:	00013903          	ld	s2,0(sp)
    80005d04:	02010113          	addi	sp,sp,32
    80005d08:	00008067          	ret

0000000080005d0c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005d0c:	fe010113          	addi	sp,sp,-32
    80005d10:	00113c23          	sd	ra,24(sp)
    80005d14:	00813823          	sd	s0,16(sp)
    80005d18:	00913423          	sd	s1,8(sp)
    80005d1c:	01213023          	sd	s2,0(sp)
    80005d20:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005d24:	00000913          	li	s2,0
    80005d28:	0380006f          	j	80005d60 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005d2c:	ffffb097          	auipc	ra,0xffffb
    80005d30:	7b4080e7          	jalr	1972(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005d34:	00148493          	addi	s1,s1,1
    80005d38:	000027b7          	lui	a5,0x2
    80005d3c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005d40:	0097ee63          	bltu	a5,s1,80005d5c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005d44:	00000713          	li	a4,0
    80005d48:	000077b7          	lui	a5,0x7
    80005d4c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005d50:	fce7eee3          	bltu	a5,a4,80005d2c <_ZL11workerBodyAPv+0x20>
    80005d54:	00170713          	addi	a4,a4,1
    80005d58:	ff1ff06f          	j	80005d48 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005d5c:	00190913          	addi	s2,s2,1
    80005d60:	00900793          	li	a5,9
    80005d64:	0527e063          	bltu	a5,s2,80005da4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005d68:	00003517          	auipc	a0,0x3
    80005d6c:	6c050513          	addi	a0,a0,1728 # 80009428 <CONSOLE_STATUS+0x418>
    80005d70:	fffff097          	auipc	ra,0xfffff
    80005d74:	388080e7          	jalr	904(ra) # 800050f8 <_Z11printStringPKc>
    80005d78:	00000613          	li	a2,0
    80005d7c:	00a00593          	li	a1,10
    80005d80:	0009051b          	sext.w	a0,s2
    80005d84:	fffff097          	auipc	ra,0xfffff
    80005d88:	524080e7          	jalr	1316(ra) # 800052a8 <_Z8printIntiii>
    80005d8c:	00003517          	auipc	a0,0x3
    80005d90:	47c50513          	addi	a0,a0,1148 # 80009208 <CONSOLE_STATUS+0x1f8>
    80005d94:	fffff097          	auipc	ra,0xfffff
    80005d98:	364080e7          	jalr	868(ra) # 800050f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005d9c:	00000493          	li	s1,0
    80005da0:	f99ff06f          	j	80005d38 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005da4:	00003517          	auipc	a0,0x3
    80005da8:	68c50513          	addi	a0,a0,1676 # 80009430 <CONSOLE_STATUS+0x420>
    80005dac:	fffff097          	auipc	ra,0xfffff
    80005db0:	34c080e7          	jalr	844(ra) # 800050f8 <_Z11printStringPKc>
    finishedA = true;
    80005db4:	00100793          	li	a5,1
    80005db8:	00006717          	auipc	a4,0x6
    80005dbc:	8ef706a3          	sb	a5,-1811(a4) # 8000b6a5 <_ZL9finishedA>
}
    80005dc0:	01813083          	ld	ra,24(sp)
    80005dc4:	01013403          	ld	s0,16(sp)
    80005dc8:	00813483          	ld	s1,8(sp)
    80005dcc:	00013903          	ld	s2,0(sp)
    80005dd0:	02010113          	addi	sp,sp,32
    80005dd4:	00008067          	ret

0000000080005dd8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005dd8:	fd010113          	addi	sp,sp,-48
    80005ddc:	02113423          	sd	ra,40(sp)
    80005de0:	02813023          	sd	s0,32(sp)
    80005de4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005de8:	00000613          	li	a2,0
    80005dec:	00000597          	auipc	a1,0x0
    80005df0:	f2058593          	addi	a1,a1,-224 # 80005d0c <_ZL11workerBodyAPv>
    80005df4:	fd040513          	addi	a0,s0,-48
    80005df8:	ffffb097          	auipc	ra,0xffffb
    80005dfc:	5dc080e7          	jalr	1500(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005e00:	00003517          	auipc	a0,0x3
    80005e04:	6a850513          	addi	a0,a0,1704 # 800094a8 <CONSOLE_STATUS+0x498>
    80005e08:	fffff097          	auipc	ra,0xfffff
    80005e0c:	2f0080e7          	jalr	752(ra) # 800050f8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005e10:	00000613          	li	a2,0
    80005e14:	00000597          	auipc	a1,0x0
    80005e18:	e1458593          	addi	a1,a1,-492 # 80005c28 <_ZL11workerBodyBPv>
    80005e1c:	fd840513          	addi	a0,s0,-40
    80005e20:	ffffb097          	auipc	ra,0xffffb
    80005e24:	5b4080e7          	jalr	1460(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005e28:	00003517          	auipc	a0,0x3
    80005e2c:	69850513          	addi	a0,a0,1688 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80005e30:	fffff097          	auipc	ra,0xfffff
    80005e34:	2c8080e7          	jalr	712(ra) # 800050f8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005e38:	00000613          	li	a2,0
    80005e3c:	00000597          	auipc	a1,0x0
    80005e40:	c6c58593          	addi	a1,a1,-916 # 80005aa8 <_ZL11workerBodyCPv>
    80005e44:	fe040513          	addi	a0,s0,-32
    80005e48:	ffffb097          	auipc	ra,0xffffb
    80005e4c:	58c080e7          	jalr	1420(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005e50:	00003517          	auipc	a0,0x3
    80005e54:	68850513          	addi	a0,a0,1672 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80005e58:	fffff097          	auipc	ra,0xfffff
    80005e5c:	2a0080e7          	jalr	672(ra) # 800050f8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005e60:	00000613          	li	a2,0
    80005e64:	00000597          	auipc	a1,0x0
    80005e68:	afc58593          	addi	a1,a1,-1284 # 80005960 <_ZL11workerBodyDPv>
    80005e6c:	fe840513          	addi	a0,s0,-24
    80005e70:	ffffb097          	auipc	ra,0xffffb
    80005e74:	564080e7          	jalr	1380(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005e78:	00003517          	auipc	a0,0x3
    80005e7c:	67850513          	addi	a0,a0,1656 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80005e80:	fffff097          	auipc	ra,0xfffff
    80005e84:	278080e7          	jalr	632(ra) # 800050f8 <_Z11printStringPKc>
    80005e88:	00c0006f          	j	80005e94 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005e8c:	ffffb097          	auipc	ra,0xffffb
    80005e90:	654080e7          	jalr	1620(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005e94:	00006797          	auipc	a5,0x6
    80005e98:	8117c783          	lbu	a5,-2031(a5) # 8000b6a5 <_ZL9finishedA>
    80005e9c:	fe0788e3          	beqz	a5,80005e8c <_Z16System_Mode_testv+0xb4>
    80005ea0:	00006797          	auipc	a5,0x6
    80005ea4:	8047c783          	lbu	a5,-2044(a5) # 8000b6a4 <_ZL9finishedB>
    80005ea8:	fe0782e3          	beqz	a5,80005e8c <_Z16System_Mode_testv+0xb4>
    80005eac:	00005797          	auipc	a5,0x5
    80005eb0:	7f77c783          	lbu	a5,2039(a5) # 8000b6a3 <_ZL9finishedC>
    80005eb4:	fc078ce3          	beqz	a5,80005e8c <_Z16System_Mode_testv+0xb4>
    80005eb8:	00005797          	auipc	a5,0x5
    80005ebc:	7ea7c783          	lbu	a5,2026(a5) # 8000b6a2 <_ZL9finishedD>
    80005ec0:	fc0786e3          	beqz	a5,80005e8c <_Z16System_Mode_testv+0xb4>
    }

}
    80005ec4:	02813083          	ld	ra,40(sp)
    80005ec8:	02013403          	ld	s0,32(sp)
    80005ecc:	03010113          	addi	sp,sp,48
    80005ed0:	00008067          	ret

0000000080005ed4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005ed4:	fe010113          	addi	sp,sp,-32
    80005ed8:	00113c23          	sd	ra,24(sp)
    80005edc:	00813823          	sd	s0,16(sp)
    80005ee0:	00913423          	sd	s1,8(sp)
    80005ee4:	01213023          	sd	s2,0(sp)
    80005ee8:	02010413          	addi	s0,sp,32
    80005eec:	00050493          	mv	s1,a0
    80005ef0:	00058913          	mv	s2,a1
    80005ef4:	0015879b          	addiw	a5,a1,1
    80005ef8:	0007851b          	sext.w	a0,a5
    80005efc:	00f4a023          	sw	a5,0(s1)
    80005f00:	0004a823          	sw	zero,16(s1)
    80005f04:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005f08:	00251513          	slli	a0,a0,0x2
    80005f0c:	ffffb097          	auipc	ra,0xffffb
    80005f10:	34c080e7          	jalr	844(ra) # 80001258 <_Z9mem_allocm>
    80005f14:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005f18:	00000593          	li	a1,0
    80005f1c:	02048513          	addi	a0,s1,32
    80005f20:	ffffb097          	auipc	ra,0xffffb
    80005f24:	600080e7          	jalr	1536(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&spaceAvailable, _cap);
    80005f28:	00090593          	mv	a1,s2
    80005f2c:	01848513          	addi	a0,s1,24
    80005f30:	ffffb097          	auipc	ra,0xffffb
    80005f34:	5f0080e7          	jalr	1520(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&mutexHead, 1);
    80005f38:	00100593          	li	a1,1
    80005f3c:	02848513          	addi	a0,s1,40
    80005f40:	ffffb097          	auipc	ra,0xffffb
    80005f44:	5e0080e7          	jalr	1504(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&mutexTail, 1);
    80005f48:	00100593          	li	a1,1
    80005f4c:	03048513          	addi	a0,s1,48
    80005f50:	ffffb097          	auipc	ra,0xffffb
    80005f54:	5d0080e7          	jalr	1488(ra) # 80001520 <_Z8sem_openPP3Semj>
}
    80005f58:	01813083          	ld	ra,24(sp)
    80005f5c:	01013403          	ld	s0,16(sp)
    80005f60:	00813483          	ld	s1,8(sp)
    80005f64:	00013903          	ld	s2,0(sp)
    80005f68:	02010113          	addi	sp,sp,32
    80005f6c:	00008067          	ret

0000000080005f70 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005f70:	fe010113          	addi	sp,sp,-32
    80005f74:	00113c23          	sd	ra,24(sp)
    80005f78:	00813823          	sd	s0,16(sp)
    80005f7c:	00913423          	sd	s1,8(sp)
    80005f80:	01213023          	sd	s2,0(sp)
    80005f84:	02010413          	addi	s0,sp,32
    80005f88:	00050493          	mv	s1,a0
    80005f8c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005f90:	01853503          	ld	a0,24(a0)
    80005f94:	ffffb097          	auipc	ra,0xffffb
    80005f98:	660080e7          	jalr	1632(ra) # 800015f4 <_Z8sem_waitP3Sem>

    sem_wait(mutexTail);
    80005f9c:	0304b503          	ld	a0,48(s1)
    80005fa0:	ffffb097          	auipc	ra,0xffffb
    80005fa4:	654080e7          	jalr	1620(ra) # 800015f4 <_Z8sem_waitP3Sem>
    buffer[tail] = val;
    80005fa8:	0084b783          	ld	a5,8(s1)
    80005fac:	0144a703          	lw	a4,20(s1)
    80005fb0:	00271713          	slli	a4,a4,0x2
    80005fb4:	00e787b3          	add	a5,a5,a4
    80005fb8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005fbc:	0144a783          	lw	a5,20(s1)
    80005fc0:	0017879b          	addiw	a5,a5,1
    80005fc4:	0004a703          	lw	a4,0(s1)
    80005fc8:	02e7e7bb          	remw	a5,a5,a4
    80005fcc:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005fd0:	0304b503          	ld	a0,48(s1)
    80005fd4:	ffffb097          	auipc	ra,0xffffb
    80005fd8:	688080e7          	jalr	1672(ra) # 8000165c <_Z10sem_signalP3Sem>

    sem_signal(itemAvailable);
    80005fdc:	0204b503          	ld	a0,32(s1)
    80005fe0:	ffffb097          	auipc	ra,0xffffb
    80005fe4:	67c080e7          	jalr	1660(ra) # 8000165c <_Z10sem_signalP3Sem>

}
    80005fe8:	01813083          	ld	ra,24(sp)
    80005fec:	01013403          	ld	s0,16(sp)
    80005ff0:	00813483          	ld	s1,8(sp)
    80005ff4:	00013903          	ld	s2,0(sp)
    80005ff8:	02010113          	addi	sp,sp,32
    80005ffc:	00008067          	ret

0000000080006000 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006000:	fe010113          	addi	sp,sp,-32
    80006004:	00113c23          	sd	ra,24(sp)
    80006008:	00813823          	sd	s0,16(sp)
    8000600c:	00913423          	sd	s1,8(sp)
    80006010:	01213023          	sd	s2,0(sp)
    80006014:	02010413          	addi	s0,sp,32
    80006018:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    8000601c:	02053503          	ld	a0,32(a0)
    80006020:	ffffb097          	auipc	ra,0xffffb
    80006024:	5d4080e7          	jalr	1492(ra) # 800015f4 <_Z8sem_waitP3Sem>

    sem_wait(mutexHead);
    80006028:	0284b503          	ld	a0,40(s1)
    8000602c:	ffffb097          	auipc	ra,0xffffb
    80006030:	5c8080e7          	jalr	1480(ra) # 800015f4 <_Z8sem_waitP3Sem>

    int ret = buffer[head];
    80006034:	0084b703          	ld	a4,8(s1)
    80006038:	0104a783          	lw	a5,16(s1)
    8000603c:	00279693          	slli	a3,a5,0x2
    80006040:	00d70733          	add	a4,a4,a3
    80006044:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006048:	0017879b          	addiw	a5,a5,1
    8000604c:	0004a703          	lw	a4,0(s1)
    80006050:	02e7e7bb          	remw	a5,a5,a4
    80006054:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006058:	0284b503          	ld	a0,40(s1)
    8000605c:	ffffb097          	auipc	ra,0xffffb
    80006060:	600080e7          	jalr	1536(ra) # 8000165c <_Z10sem_signalP3Sem>

    sem_signal(spaceAvailable);
    80006064:	0184b503          	ld	a0,24(s1)
    80006068:	ffffb097          	auipc	ra,0xffffb
    8000606c:	5f4080e7          	jalr	1524(ra) # 8000165c <_Z10sem_signalP3Sem>

    return ret;
}
    80006070:	00090513          	mv	a0,s2
    80006074:	01813083          	ld	ra,24(sp)
    80006078:	01013403          	ld	s0,16(sp)
    8000607c:	00813483          	ld	s1,8(sp)
    80006080:	00013903          	ld	s2,0(sp)
    80006084:	02010113          	addi	sp,sp,32
    80006088:	00008067          	ret

000000008000608c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000608c:	fe010113          	addi	sp,sp,-32
    80006090:	00113c23          	sd	ra,24(sp)
    80006094:	00813823          	sd	s0,16(sp)
    80006098:	00913423          	sd	s1,8(sp)
    8000609c:	01213023          	sd	s2,0(sp)
    800060a0:	02010413          	addi	s0,sp,32
    800060a4:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800060a8:	02853503          	ld	a0,40(a0)
    800060ac:	ffffb097          	auipc	ra,0xffffb
    800060b0:	548080e7          	jalr	1352(ra) # 800015f4 <_Z8sem_waitP3Sem>
    sem_wait(mutexTail);
    800060b4:	0304b503          	ld	a0,48(s1)
    800060b8:	ffffb097          	auipc	ra,0xffffb
    800060bc:	53c080e7          	jalr	1340(ra) # 800015f4 <_Z8sem_waitP3Sem>

    if (tail >= head) {
    800060c0:	0144a783          	lw	a5,20(s1)
    800060c4:	0104a903          	lw	s2,16(s1)
    800060c8:	0327ce63          	blt	a5,s2,80006104 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800060cc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800060d0:	0304b503          	ld	a0,48(s1)
    800060d4:	ffffb097          	auipc	ra,0xffffb
    800060d8:	588080e7          	jalr	1416(ra) # 8000165c <_Z10sem_signalP3Sem>
    sem_signal(mutexHead);
    800060dc:	0284b503          	ld	a0,40(s1)
    800060e0:	ffffb097          	auipc	ra,0xffffb
    800060e4:	57c080e7          	jalr	1404(ra) # 8000165c <_Z10sem_signalP3Sem>

    return ret;
}
    800060e8:	00090513          	mv	a0,s2
    800060ec:	01813083          	ld	ra,24(sp)
    800060f0:	01013403          	ld	s0,16(sp)
    800060f4:	00813483          	ld	s1,8(sp)
    800060f8:	00013903          	ld	s2,0(sp)
    800060fc:	02010113          	addi	sp,sp,32
    80006100:	00008067          	ret
        ret = cap - head + tail;
    80006104:	0004a703          	lw	a4,0(s1)
    80006108:	4127093b          	subw	s2,a4,s2
    8000610c:	00f9093b          	addw	s2,s2,a5
    80006110:	fc1ff06f          	j	800060d0 <_ZN6Buffer6getCntEv+0x44>

0000000080006114 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006114:	fe010113          	addi	sp,sp,-32
    80006118:	00113c23          	sd	ra,24(sp)
    8000611c:	00813823          	sd	s0,16(sp)
    80006120:	00913423          	sd	s1,8(sp)
    80006124:	02010413          	addi	s0,sp,32
    80006128:	00050493          	mv	s1,a0
    putc('\n');
    8000612c:	00a00513          	li	a0,10
    80006130:	ffffb097          	auipc	ra,0xffffb
    80006134:	640080e7          	jalr	1600(ra) # 80001770 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006138:	00003517          	auipc	a0,0x3
    8000613c:	3d050513          	addi	a0,a0,976 # 80009508 <CONSOLE_STATUS+0x4f8>
    80006140:	fffff097          	auipc	ra,0xfffff
    80006144:	fb8080e7          	jalr	-72(ra) # 800050f8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006148:	00048513          	mv	a0,s1
    8000614c:	00000097          	auipc	ra,0x0
    80006150:	f40080e7          	jalr	-192(ra) # 8000608c <_ZN6Buffer6getCntEv>
    80006154:	02a05c63          	blez	a0,8000618c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006158:	0084b783          	ld	a5,8(s1)
    8000615c:	0104a703          	lw	a4,16(s1)
    80006160:	00271713          	slli	a4,a4,0x2
    80006164:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006168:	0007c503          	lbu	a0,0(a5)
    8000616c:	ffffb097          	auipc	ra,0xffffb
    80006170:	604080e7          	jalr	1540(ra) # 80001770 <_Z4putcc>
        head = (head + 1) % cap;
    80006174:	0104a783          	lw	a5,16(s1)
    80006178:	0017879b          	addiw	a5,a5,1
    8000617c:	0004a703          	lw	a4,0(s1)
    80006180:	02e7e7bb          	remw	a5,a5,a4
    80006184:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006188:	fc1ff06f          	j	80006148 <_ZN6BufferD1Ev+0x34>
    putc('!');
    8000618c:	02100513          	li	a0,33
    80006190:	ffffb097          	auipc	ra,0xffffb
    80006194:	5e0080e7          	jalr	1504(ra) # 80001770 <_Z4putcc>
    putc('\n');
    80006198:	00a00513          	li	a0,10
    8000619c:	ffffb097          	auipc	ra,0xffffb
    800061a0:	5d4080e7          	jalr	1492(ra) # 80001770 <_Z4putcc>
    mem_free(buffer);
    800061a4:	0084b503          	ld	a0,8(s1)
    800061a8:	ffffb097          	auipc	ra,0xffffb
    800061ac:	11c080e7          	jalr	284(ra) # 800012c4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800061b0:	0204b503          	ld	a0,32(s1)
    800061b4:	ffffb097          	auipc	ra,0xffffb
    800061b8:	3d8080e7          	jalr	984(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(spaceAvailable);
    800061bc:	0184b503          	ld	a0,24(s1)
    800061c0:	ffffb097          	auipc	ra,0xffffb
    800061c4:	3cc080e7          	jalr	972(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(mutexTail);
    800061c8:	0304b503          	ld	a0,48(s1)
    800061cc:	ffffb097          	auipc	ra,0xffffb
    800061d0:	3c0080e7          	jalr	960(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(mutexHead);
    800061d4:	0284b503          	ld	a0,40(s1)
    800061d8:	ffffb097          	auipc	ra,0xffffb
    800061dc:	3b4080e7          	jalr	948(ra) # 8000158c <_Z9sem_closeP3Sem>
}
    800061e0:	01813083          	ld	ra,24(sp)
    800061e4:	01013403          	ld	s0,16(sp)
    800061e8:	00813483          	ld	s1,8(sp)
    800061ec:	02010113          	addi	sp,sp,32
    800061f0:	00008067          	ret

00000000800061f4 <start>:
    800061f4:	ff010113          	addi	sp,sp,-16
    800061f8:	00813423          	sd	s0,8(sp)
    800061fc:	01010413          	addi	s0,sp,16
    80006200:	300027f3          	csrr	a5,mstatus
    80006204:	ffffe737          	lui	a4,0xffffe
    80006208:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1eef>
    8000620c:	00e7f7b3          	and	a5,a5,a4
    80006210:	00001737          	lui	a4,0x1
    80006214:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006218:	00e7e7b3          	or	a5,a5,a4
    8000621c:	30079073          	csrw	mstatus,a5
    80006220:	00000797          	auipc	a5,0x0
    80006224:	16078793          	addi	a5,a5,352 # 80006380 <system_main>
    80006228:	34179073          	csrw	mepc,a5
    8000622c:	00000793          	li	a5,0
    80006230:	18079073          	csrw	satp,a5
    80006234:	000107b7          	lui	a5,0x10
    80006238:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000623c:	30279073          	csrw	medeleg,a5
    80006240:	30379073          	csrw	mideleg,a5
    80006244:	104027f3          	csrr	a5,sie
    80006248:	2227e793          	ori	a5,a5,546
    8000624c:	10479073          	csrw	sie,a5
    80006250:	fff00793          	li	a5,-1
    80006254:	00a7d793          	srli	a5,a5,0xa
    80006258:	3b079073          	csrw	pmpaddr0,a5
    8000625c:	00f00793          	li	a5,15
    80006260:	3a079073          	csrw	pmpcfg0,a5
    80006264:	f14027f3          	csrr	a5,mhartid
    80006268:	0200c737          	lui	a4,0x200c
    8000626c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006270:	0007869b          	sext.w	a3,a5
    80006274:	00269713          	slli	a4,a3,0x2
    80006278:	000f4637          	lui	a2,0xf4
    8000627c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006280:	00d70733          	add	a4,a4,a3
    80006284:	0037979b          	slliw	a5,a5,0x3
    80006288:	020046b7          	lui	a3,0x2004
    8000628c:	00d787b3          	add	a5,a5,a3
    80006290:	00c585b3          	add	a1,a1,a2
    80006294:	00371693          	slli	a3,a4,0x3
    80006298:	00005717          	auipc	a4,0x5
    8000629c:	41870713          	addi	a4,a4,1048 # 8000b6b0 <timer_scratch>
    800062a0:	00b7b023          	sd	a1,0(a5)
    800062a4:	00d70733          	add	a4,a4,a3
    800062a8:	00f73c23          	sd	a5,24(a4)
    800062ac:	02c73023          	sd	a2,32(a4)
    800062b0:	34071073          	csrw	mscratch,a4
    800062b4:	00000797          	auipc	a5,0x0
    800062b8:	6ec78793          	addi	a5,a5,1772 # 800069a0 <timervec>
    800062bc:	30579073          	csrw	mtvec,a5
    800062c0:	300027f3          	csrr	a5,mstatus
    800062c4:	0087e793          	ori	a5,a5,8
    800062c8:	30079073          	csrw	mstatus,a5
    800062cc:	304027f3          	csrr	a5,mie
    800062d0:	0807e793          	ori	a5,a5,128
    800062d4:	30479073          	csrw	mie,a5
    800062d8:	f14027f3          	csrr	a5,mhartid
    800062dc:	0007879b          	sext.w	a5,a5
    800062e0:	00078213          	mv	tp,a5
    800062e4:	30200073          	mret
    800062e8:	00813403          	ld	s0,8(sp)
    800062ec:	01010113          	addi	sp,sp,16
    800062f0:	00008067          	ret

00000000800062f4 <timerinit>:
    800062f4:	ff010113          	addi	sp,sp,-16
    800062f8:	00813423          	sd	s0,8(sp)
    800062fc:	01010413          	addi	s0,sp,16
    80006300:	f14027f3          	csrr	a5,mhartid
    80006304:	0200c737          	lui	a4,0x200c
    80006308:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000630c:	0007869b          	sext.w	a3,a5
    80006310:	00269713          	slli	a4,a3,0x2
    80006314:	000f4637          	lui	a2,0xf4
    80006318:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000631c:	00d70733          	add	a4,a4,a3
    80006320:	0037979b          	slliw	a5,a5,0x3
    80006324:	020046b7          	lui	a3,0x2004
    80006328:	00d787b3          	add	a5,a5,a3
    8000632c:	00c585b3          	add	a1,a1,a2
    80006330:	00371693          	slli	a3,a4,0x3
    80006334:	00005717          	auipc	a4,0x5
    80006338:	37c70713          	addi	a4,a4,892 # 8000b6b0 <timer_scratch>
    8000633c:	00b7b023          	sd	a1,0(a5)
    80006340:	00d70733          	add	a4,a4,a3
    80006344:	00f73c23          	sd	a5,24(a4)
    80006348:	02c73023          	sd	a2,32(a4)
    8000634c:	34071073          	csrw	mscratch,a4
    80006350:	00000797          	auipc	a5,0x0
    80006354:	65078793          	addi	a5,a5,1616 # 800069a0 <timervec>
    80006358:	30579073          	csrw	mtvec,a5
    8000635c:	300027f3          	csrr	a5,mstatus
    80006360:	0087e793          	ori	a5,a5,8
    80006364:	30079073          	csrw	mstatus,a5
    80006368:	304027f3          	csrr	a5,mie
    8000636c:	0807e793          	ori	a5,a5,128
    80006370:	30479073          	csrw	mie,a5
    80006374:	00813403          	ld	s0,8(sp)
    80006378:	01010113          	addi	sp,sp,16
    8000637c:	00008067          	ret

0000000080006380 <system_main>:
    80006380:	fe010113          	addi	sp,sp,-32
    80006384:	00813823          	sd	s0,16(sp)
    80006388:	00913423          	sd	s1,8(sp)
    8000638c:	00113c23          	sd	ra,24(sp)
    80006390:	02010413          	addi	s0,sp,32
    80006394:	00000097          	auipc	ra,0x0
    80006398:	0c4080e7          	jalr	196(ra) # 80006458 <cpuid>
    8000639c:	00005497          	auipc	s1,0x5
    800063a0:	25448493          	addi	s1,s1,596 # 8000b5f0 <started>
    800063a4:	02050263          	beqz	a0,800063c8 <system_main+0x48>
    800063a8:	0004a783          	lw	a5,0(s1)
    800063ac:	0007879b          	sext.w	a5,a5
    800063b0:	fe078ce3          	beqz	a5,800063a8 <system_main+0x28>
    800063b4:	0ff0000f          	fence
    800063b8:	00003517          	auipc	a0,0x3
    800063bc:	1a850513          	addi	a0,a0,424 # 80009560 <CONSOLE_STATUS+0x550>
    800063c0:	00001097          	auipc	ra,0x1
    800063c4:	a7c080e7          	jalr	-1412(ra) # 80006e3c <panic>
    800063c8:	00001097          	auipc	ra,0x1
    800063cc:	9d0080e7          	jalr	-1584(ra) # 80006d98 <consoleinit>
    800063d0:	00001097          	auipc	ra,0x1
    800063d4:	15c080e7          	jalr	348(ra) # 8000752c <printfinit>
    800063d8:	00003517          	auipc	a0,0x3
    800063dc:	e3050513          	addi	a0,a0,-464 # 80009208 <CONSOLE_STATUS+0x1f8>
    800063e0:	00001097          	auipc	ra,0x1
    800063e4:	ab8080e7          	jalr	-1352(ra) # 80006e98 <__printf>
    800063e8:	00003517          	auipc	a0,0x3
    800063ec:	14850513          	addi	a0,a0,328 # 80009530 <CONSOLE_STATUS+0x520>
    800063f0:	00001097          	auipc	ra,0x1
    800063f4:	aa8080e7          	jalr	-1368(ra) # 80006e98 <__printf>
    800063f8:	00003517          	auipc	a0,0x3
    800063fc:	e1050513          	addi	a0,a0,-496 # 80009208 <CONSOLE_STATUS+0x1f8>
    80006400:	00001097          	auipc	ra,0x1
    80006404:	a98080e7          	jalr	-1384(ra) # 80006e98 <__printf>
    80006408:	00001097          	auipc	ra,0x1
    8000640c:	4b0080e7          	jalr	1200(ra) # 800078b8 <kinit>
    80006410:	00000097          	auipc	ra,0x0
    80006414:	148080e7          	jalr	328(ra) # 80006558 <trapinit>
    80006418:	00000097          	auipc	ra,0x0
    8000641c:	16c080e7          	jalr	364(ra) # 80006584 <trapinithart>
    80006420:	00000097          	auipc	ra,0x0
    80006424:	5c0080e7          	jalr	1472(ra) # 800069e0 <plicinit>
    80006428:	00000097          	auipc	ra,0x0
    8000642c:	5e0080e7          	jalr	1504(ra) # 80006a08 <plicinithart>
    80006430:	00000097          	auipc	ra,0x0
    80006434:	078080e7          	jalr	120(ra) # 800064a8 <userinit>
    80006438:	0ff0000f          	fence
    8000643c:	00100793          	li	a5,1
    80006440:	00003517          	auipc	a0,0x3
    80006444:	10850513          	addi	a0,a0,264 # 80009548 <CONSOLE_STATUS+0x538>
    80006448:	00f4a023          	sw	a5,0(s1)
    8000644c:	00001097          	auipc	ra,0x1
    80006450:	a4c080e7          	jalr	-1460(ra) # 80006e98 <__printf>
    80006454:	0000006f          	j	80006454 <system_main+0xd4>

0000000080006458 <cpuid>:
    80006458:	ff010113          	addi	sp,sp,-16
    8000645c:	00813423          	sd	s0,8(sp)
    80006460:	01010413          	addi	s0,sp,16
    80006464:	00020513          	mv	a0,tp
    80006468:	00813403          	ld	s0,8(sp)
    8000646c:	0005051b          	sext.w	a0,a0
    80006470:	01010113          	addi	sp,sp,16
    80006474:	00008067          	ret

0000000080006478 <mycpu>:
    80006478:	ff010113          	addi	sp,sp,-16
    8000647c:	00813423          	sd	s0,8(sp)
    80006480:	01010413          	addi	s0,sp,16
    80006484:	00020793          	mv	a5,tp
    80006488:	00813403          	ld	s0,8(sp)
    8000648c:	0007879b          	sext.w	a5,a5
    80006490:	00779793          	slli	a5,a5,0x7
    80006494:	00006517          	auipc	a0,0x6
    80006498:	24c50513          	addi	a0,a0,588 # 8000c6e0 <cpus>
    8000649c:	00f50533          	add	a0,a0,a5
    800064a0:	01010113          	addi	sp,sp,16
    800064a4:	00008067          	ret

00000000800064a8 <userinit>:
    800064a8:	ff010113          	addi	sp,sp,-16
    800064ac:	00813423          	sd	s0,8(sp)
    800064b0:	01010413          	addi	s0,sp,16
    800064b4:	00813403          	ld	s0,8(sp)
    800064b8:	01010113          	addi	sp,sp,16
    800064bc:	ffffc317          	auipc	t1,0xffffc
    800064c0:	8bc30067          	jr	-1860(t1) # 80001d78 <main>

00000000800064c4 <either_copyout>:
    800064c4:	ff010113          	addi	sp,sp,-16
    800064c8:	00813023          	sd	s0,0(sp)
    800064cc:	00113423          	sd	ra,8(sp)
    800064d0:	01010413          	addi	s0,sp,16
    800064d4:	02051663          	bnez	a0,80006500 <either_copyout+0x3c>
    800064d8:	00058513          	mv	a0,a1
    800064dc:	00060593          	mv	a1,a2
    800064e0:	0006861b          	sext.w	a2,a3
    800064e4:	00002097          	auipc	ra,0x2
    800064e8:	c60080e7          	jalr	-928(ra) # 80008144 <__memmove>
    800064ec:	00813083          	ld	ra,8(sp)
    800064f0:	00013403          	ld	s0,0(sp)
    800064f4:	00000513          	li	a0,0
    800064f8:	01010113          	addi	sp,sp,16
    800064fc:	00008067          	ret
    80006500:	00003517          	auipc	a0,0x3
    80006504:	08850513          	addi	a0,a0,136 # 80009588 <CONSOLE_STATUS+0x578>
    80006508:	00001097          	auipc	ra,0x1
    8000650c:	934080e7          	jalr	-1740(ra) # 80006e3c <panic>

0000000080006510 <either_copyin>:
    80006510:	ff010113          	addi	sp,sp,-16
    80006514:	00813023          	sd	s0,0(sp)
    80006518:	00113423          	sd	ra,8(sp)
    8000651c:	01010413          	addi	s0,sp,16
    80006520:	02059463          	bnez	a1,80006548 <either_copyin+0x38>
    80006524:	00060593          	mv	a1,a2
    80006528:	0006861b          	sext.w	a2,a3
    8000652c:	00002097          	auipc	ra,0x2
    80006530:	c18080e7          	jalr	-1000(ra) # 80008144 <__memmove>
    80006534:	00813083          	ld	ra,8(sp)
    80006538:	00013403          	ld	s0,0(sp)
    8000653c:	00000513          	li	a0,0
    80006540:	01010113          	addi	sp,sp,16
    80006544:	00008067          	ret
    80006548:	00003517          	auipc	a0,0x3
    8000654c:	06850513          	addi	a0,a0,104 # 800095b0 <CONSOLE_STATUS+0x5a0>
    80006550:	00001097          	auipc	ra,0x1
    80006554:	8ec080e7          	jalr	-1812(ra) # 80006e3c <panic>

0000000080006558 <trapinit>:
    80006558:	ff010113          	addi	sp,sp,-16
    8000655c:	00813423          	sd	s0,8(sp)
    80006560:	01010413          	addi	s0,sp,16
    80006564:	00813403          	ld	s0,8(sp)
    80006568:	00003597          	auipc	a1,0x3
    8000656c:	07058593          	addi	a1,a1,112 # 800095d8 <CONSOLE_STATUS+0x5c8>
    80006570:	00006517          	auipc	a0,0x6
    80006574:	1f050513          	addi	a0,a0,496 # 8000c760 <tickslock>
    80006578:	01010113          	addi	sp,sp,16
    8000657c:	00001317          	auipc	t1,0x1
    80006580:	5cc30067          	jr	1484(t1) # 80007b48 <initlock>

0000000080006584 <trapinithart>:
    80006584:	ff010113          	addi	sp,sp,-16
    80006588:	00813423          	sd	s0,8(sp)
    8000658c:	01010413          	addi	s0,sp,16
    80006590:	00000797          	auipc	a5,0x0
    80006594:	30078793          	addi	a5,a5,768 # 80006890 <kernelvec>
    80006598:	10579073          	csrw	stvec,a5
    8000659c:	00813403          	ld	s0,8(sp)
    800065a0:	01010113          	addi	sp,sp,16
    800065a4:	00008067          	ret

00000000800065a8 <usertrap>:
    800065a8:	ff010113          	addi	sp,sp,-16
    800065ac:	00813423          	sd	s0,8(sp)
    800065b0:	01010413          	addi	s0,sp,16
    800065b4:	00813403          	ld	s0,8(sp)
    800065b8:	01010113          	addi	sp,sp,16
    800065bc:	00008067          	ret

00000000800065c0 <usertrapret>:
    800065c0:	ff010113          	addi	sp,sp,-16
    800065c4:	00813423          	sd	s0,8(sp)
    800065c8:	01010413          	addi	s0,sp,16
    800065cc:	00813403          	ld	s0,8(sp)
    800065d0:	01010113          	addi	sp,sp,16
    800065d4:	00008067          	ret

00000000800065d8 <kerneltrap>:
    800065d8:	fe010113          	addi	sp,sp,-32
    800065dc:	00813823          	sd	s0,16(sp)
    800065e0:	00113c23          	sd	ra,24(sp)
    800065e4:	00913423          	sd	s1,8(sp)
    800065e8:	02010413          	addi	s0,sp,32
    800065ec:	142025f3          	csrr	a1,scause
    800065f0:	100027f3          	csrr	a5,sstatus
    800065f4:	0027f793          	andi	a5,a5,2
    800065f8:	10079c63          	bnez	a5,80006710 <kerneltrap+0x138>
    800065fc:	142027f3          	csrr	a5,scause
    80006600:	0207ce63          	bltz	a5,8000663c <kerneltrap+0x64>
    80006604:	00003517          	auipc	a0,0x3
    80006608:	01c50513          	addi	a0,a0,28 # 80009620 <CONSOLE_STATUS+0x610>
    8000660c:	00001097          	auipc	ra,0x1
    80006610:	88c080e7          	jalr	-1908(ra) # 80006e98 <__printf>
    80006614:	141025f3          	csrr	a1,sepc
    80006618:	14302673          	csrr	a2,stval
    8000661c:	00003517          	auipc	a0,0x3
    80006620:	01450513          	addi	a0,a0,20 # 80009630 <CONSOLE_STATUS+0x620>
    80006624:	00001097          	auipc	ra,0x1
    80006628:	874080e7          	jalr	-1932(ra) # 80006e98 <__printf>
    8000662c:	00003517          	auipc	a0,0x3
    80006630:	01c50513          	addi	a0,a0,28 # 80009648 <CONSOLE_STATUS+0x638>
    80006634:	00001097          	auipc	ra,0x1
    80006638:	808080e7          	jalr	-2040(ra) # 80006e3c <panic>
    8000663c:	0ff7f713          	andi	a4,a5,255
    80006640:	00900693          	li	a3,9
    80006644:	04d70063          	beq	a4,a3,80006684 <kerneltrap+0xac>
    80006648:	fff00713          	li	a4,-1
    8000664c:	03f71713          	slli	a4,a4,0x3f
    80006650:	00170713          	addi	a4,a4,1
    80006654:	fae798e3          	bne	a5,a4,80006604 <kerneltrap+0x2c>
    80006658:	00000097          	auipc	ra,0x0
    8000665c:	e00080e7          	jalr	-512(ra) # 80006458 <cpuid>
    80006660:	06050663          	beqz	a0,800066cc <kerneltrap+0xf4>
    80006664:	144027f3          	csrr	a5,sip
    80006668:	ffd7f793          	andi	a5,a5,-3
    8000666c:	14479073          	csrw	sip,a5
    80006670:	01813083          	ld	ra,24(sp)
    80006674:	01013403          	ld	s0,16(sp)
    80006678:	00813483          	ld	s1,8(sp)
    8000667c:	02010113          	addi	sp,sp,32
    80006680:	00008067          	ret
    80006684:	00000097          	auipc	ra,0x0
    80006688:	3d0080e7          	jalr	976(ra) # 80006a54 <plic_claim>
    8000668c:	00a00793          	li	a5,10
    80006690:	00050493          	mv	s1,a0
    80006694:	06f50863          	beq	a0,a5,80006704 <kerneltrap+0x12c>
    80006698:	fc050ce3          	beqz	a0,80006670 <kerneltrap+0x98>
    8000669c:	00050593          	mv	a1,a0
    800066a0:	00003517          	auipc	a0,0x3
    800066a4:	f6050513          	addi	a0,a0,-160 # 80009600 <CONSOLE_STATUS+0x5f0>
    800066a8:	00000097          	auipc	ra,0x0
    800066ac:	7f0080e7          	jalr	2032(ra) # 80006e98 <__printf>
    800066b0:	01013403          	ld	s0,16(sp)
    800066b4:	01813083          	ld	ra,24(sp)
    800066b8:	00048513          	mv	a0,s1
    800066bc:	00813483          	ld	s1,8(sp)
    800066c0:	02010113          	addi	sp,sp,32
    800066c4:	00000317          	auipc	t1,0x0
    800066c8:	3c830067          	jr	968(t1) # 80006a8c <plic_complete>
    800066cc:	00006517          	auipc	a0,0x6
    800066d0:	09450513          	addi	a0,a0,148 # 8000c760 <tickslock>
    800066d4:	00001097          	auipc	ra,0x1
    800066d8:	498080e7          	jalr	1176(ra) # 80007b6c <acquire>
    800066dc:	00005717          	auipc	a4,0x5
    800066e0:	f1870713          	addi	a4,a4,-232 # 8000b5f4 <ticks>
    800066e4:	00072783          	lw	a5,0(a4)
    800066e8:	00006517          	auipc	a0,0x6
    800066ec:	07850513          	addi	a0,a0,120 # 8000c760 <tickslock>
    800066f0:	0017879b          	addiw	a5,a5,1
    800066f4:	00f72023          	sw	a5,0(a4)
    800066f8:	00001097          	auipc	ra,0x1
    800066fc:	540080e7          	jalr	1344(ra) # 80007c38 <release>
    80006700:	f65ff06f          	j	80006664 <kerneltrap+0x8c>
    80006704:	00001097          	auipc	ra,0x1
    80006708:	09c080e7          	jalr	156(ra) # 800077a0 <uartintr>
    8000670c:	fa5ff06f          	j	800066b0 <kerneltrap+0xd8>
    80006710:	00003517          	auipc	a0,0x3
    80006714:	ed050513          	addi	a0,a0,-304 # 800095e0 <CONSOLE_STATUS+0x5d0>
    80006718:	00000097          	auipc	ra,0x0
    8000671c:	724080e7          	jalr	1828(ra) # 80006e3c <panic>

0000000080006720 <clockintr>:
    80006720:	fe010113          	addi	sp,sp,-32
    80006724:	00813823          	sd	s0,16(sp)
    80006728:	00913423          	sd	s1,8(sp)
    8000672c:	00113c23          	sd	ra,24(sp)
    80006730:	02010413          	addi	s0,sp,32
    80006734:	00006497          	auipc	s1,0x6
    80006738:	02c48493          	addi	s1,s1,44 # 8000c760 <tickslock>
    8000673c:	00048513          	mv	a0,s1
    80006740:	00001097          	auipc	ra,0x1
    80006744:	42c080e7          	jalr	1068(ra) # 80007b6c <acquire>
    80006748:	00005717          	auipc	a4,0x5
    8000674c:	eac70713          	addi	a4,a4,-340 # 8000b5f4 <ticks>
    80006750:	00072783          	lw	a5,0(a4)
    80006754:	01013403          	ld	s0,16(sp)
    80006758:	01813083          	ld	ra,24(sp)
    8000675c:	00048513          	mv	a0,s1
    80006760:	0017879b          	addiw	a5,a5,1
    80006764:	00813483          	ld	s1,8(sp)
    80006768:	00f72023          	sw	a5,0(a4)
    8000676c:	02010113          	addi	sp,sp,32
    80006770:	00001317          	auipc	t1,0x1
    80006774:	4c830067          	jr	1224(t1) # 80007c38 <release>

0000000080006778 <devintr>:
    80006778:	142027f3          	csrr	a5,scause
    8000677c:	00000513          	li	a0,0
    80006780:	0007c463          	bltz	a5,80006788 <devintr+0x10>
    80006784:	00008067          	ret
    80006788:	fe010113          	addi	sp,sp,-32
    8000678c:	00813823          	sd	s0,16(sp)
    80006790:	00113c23          	sd	ra,24(sp)
    80006794:	00913423          	sd	s1,8(sp)
    80006798:	02010413          	addi	s0,sp,32
    8000679c:	0ff7f713          	andi	a4,a5,255
    800067a0:	00900693          	li	a3,9
    800067a4:	04d70c63          	beq	a4,a3,800067fc <devintr+0x84>
    800067a8:	fff00713          	li	a4,-1
    800067ac:	03f71713          	slli	a4,a4,0x3f
    800067b0:	00170713          	addi	a4,a4,1
    800067b4:	00e78c63          	beq	a5,a4,800067cc <devintr+0x54>
    800067b8:	01813083          	ld	ra,24(sp)
    800067bc:	01013403          	ld	s0,16(sp)
    800067c0:	00813483          	ld	s1,8(sp)
    800067c4:	02010113          	addi	sp,sp,32
    800067c8:	00008067          	ret
    800067cc:	00000097          	auipc	ra,0x0
    800067d0:	c8c080e7          	jalr	-884(ra) # 80006458 <cpuid>
    800067d4:	06050663          	beqz	a0,80006840 <devintr+0xc8>
    800067d8:	144027f3          	csrr	a5,sip
    800067dc:	ffd7f793          	andi	a5,a5,-3
    800067e0:	14479073          	csrw	sip,a5
    800067e4:	01813083          	ld	ra,24(sp)
    800067e8:	01013403          	ld	s0,16(sp)
    800067ec:	00813483          	ld	s1,8(sp)
    800067f0:	00200513          	li	a0,2
    800067f4:	02010113          	addi	sp,sp,32
    800067f8:	00008067          	ret
    800067fc:	00000097          	auipc	ra,0x0
    80006800:	258080e7          	jalr	600(ra) # 80006a54 <plic_claim>
    80006804:	00a00793          	li	a5,10
    80006808:	00050493          	mv	s1,a0
    8000680c:	06f50663          	beq	a0,a5,80006878 <devintr+0x100>
    80006810:	00100513          	li	a0,1
    80006814:	fa0482e3          	beqz	s1,800067b8 <devintr+0x40>
    80006818:	00048593          	mv	a1,s1
    8000681c:	00003517          	auipc	a0,0x3
    80006820:	de450513          	addi	a0,a0,-540 # 80009600 <CONSOLE_STATUS+0x5f0>
    80006824:	00000097          	auipc	ra,0x0
    80006828:	674080e7          	jalr	1652(ra) # 80006e98 <__printf>
    8000682c:	00048513          	mv	a0,s1
    80006830:	00000097          	auipc	ra,0x0
    80006834:	25c080e7          	jalr	604(ra) # 80006a8c <plic_complete>
    80006838:	00100513          	li	a0,1
    8000683c:	f7dff06f          	j	800067b8 <devintr+0x40>
    80006840:	00006517          	auipc	a0,0x6
    80006844:	f2050513          	addi	a0,a0,-224 # 8000c760 <tickslock>
    80006848:	00001097          	auipc	ra,0x1
    8000684c:	324080e7          	jalr	804(ra) # 80007b6c <acquire>
    80006850:	00005717          	auipc	a4,0x5
    80006854:	da470713          	addi	a4,a4,-604 # 8000b5f4 <ticks>
    80006858:	00072783          	lw	a5,0(a4)
    8000685c:	00006517          	auipc	a0,0x6
    80006860:	f0450513          	addi	a0,a0,-252 # 8000c760 <tickslock>
    80006864:	0017879b          	addiw	a5,a5,1
    80006868:	00f72023          	sw	a5,0(a4)
    8000686c:	00001097          	auipc	ra,0x1
    80006870:	3cc080e7          	jalr	972(ra) # 80007c38 <release>
    80006874:	f65ff06f          	j	800067d8 <devintr+0x60>
    80006878:	00001097          	auipc	ra,0x1
    8000687c:	f28080e7          	jalr	-216(ra) # 800077a0 <uartintr>
    80006880:	fadff06f          	j	8000682c <devintr+0xb4>
	...

0000000080006890 <kernelvec>:
    80006890:	f0010113          	addi	sp,sp,-256
    80006894:	00113023          	sd	ra,0(sp)
    80006898:	00213423          	sd	sp,8(sp)
    8000689c:	00313823          	sd	gp,16(sp)
    800068a0:	00413c23          	sd	tp,24(sp)
    800068a4:	02513023          	sd	t0,32(sp)
    800068a8:	02613423          	sd	t1,40(sp)
    800068ac:	02713823          	sd	t2,48(sp)
    800068b0:	02813c23          	sd	s0,56(sp)
    800068b4:	04913023          	sd	s1,64(sp)
    800068b8:	04a13423          	sd	a0,72(sp)
    800068bc:	04b13823          	sd	a1,80(sp)
    800068c0:	04c13c23          	sd	a2,88(sp)
    800068c4:	06d13023          	sd	a3,96(sp)
    800068c8:	06e13423          	sd	a4,104(sp)
    800068cc:	06f13823          	sd	a5,112(sp)
    800068d0:	07013c23          	sd	a6,120(sp)
    800068d4:	09113023          	sd	a7,128(sp)
    800068d8:	09213423          	sd	s2,136(sp)
    800068dc:	09313823          	sd	s3,144(sp)
    800068e0:	09413c23          	sd	s4,152(sp)
    800068e4:	0b513023          	sd	s5,160(sp)
    800068e8:	0b613423          	sd	s6,168(sp)
    800068ec:	0b713823          	sd	s7,176(sp)
    800068f0:	0b813c23          	sd	s8,184(sp)
    800068f4:	0d913023          	sd	s9,192(sp)
    800068f8:	0da13423          	sd	s10,200(sp)
    800068fc:	0db13823          	sd	s11,208(sp)
    80006900:	0dc13c23          	sd	t3,216(sp)
    80006904:	0fd13023          	sd	t4,224(sp)
    80006908:	0fe13423          	sd	t5,232(sp)
    8000690c:	0ff13823          	sd	t6,240(sp)
    80006910:	cc9ff0ef          	jal	ra,800065d8 <kerneltrap>
    80006914:	00013083          	ld	ra,0(sp)
    80006918:	00813103          	ld	sp,8(sp)
    8000691c:	01013183          	ld	gp,16(sp)
    80006920:	02013283          	ld	t0,32(sp)
    80006924:	02813303          	ld	t1,40(sp)
    80006928:	03013383          	ld	t2,48(sp)
    8000692c:	03813403          	ld	s0,56(sp)
    80006930:	04013483          	ld	s1,64(sp)
    80006934:	04813503          	ld	a0,72(sp)
    80006938:	05013583          	ld	a1,80(sp)
    8000693c:	05813603          	ld	a2,88(sp)
    80006940:	06013683          	ld	a3,96(sp)
    80006944:	06813703          	ld	a4,104(sp)
    80006948:	07013783          	ld	a5,112(sp)
    8000694c:	07813803          	ld	a6,120(sp)
    80006950:	08013883          	ld	a7,128(sp)
    80006954:	08813903          	ld	s2,136(sp)
    80006958:	09013983          	ld	s3,144(sp)
    8000695c:	09813a03          	ld	s4,152(sp)
    80006960:	0a013a83          	ld	s5,160(sp)
    80006964:	0a813b03          	ld	s6,168(sp)
    80006968:	0b013b83          	ld	s7,176(sp)
    8000696c:	0b813c03          	ld	s8,184(sp)
    80006970:	0c013c83          	ld	s9,192(sp)
    80006974:	0c813d03          	ld	s10,200(sp)
    80006978:	0d013d83          	ld	s11,208(sp)
    8000697c:	0d813e03          	ld	t3,216(sp)
    80006980:	0e013e83          	ld	t4,224(sp)
    80006984:	0e813f03          	ld	t5,232(sp)
    80006988:	0f013f83          	ld	t6,240(sp)
    8000698c:	10010113          	addi	sp,sp,256
    80006990:	10200073          	sret
    80006994:	00000013          	nop
    80006998:	00000013          	nop
    8000699c:	00000013          	nop

00000000800069a0 <timervec>:
    800069a0:	34051573          	csrrw	a0,mscratch,a0
    800069a4:	00b53023          	sd	a1,0(a0)
    800069a8:	00c53423          	sd	a2,8(a0)
    800069ac:	00d53823          	sd	a3,16(a0)
    800069b0:	01853583          	ld	a1,24(a0)
    800069b4:	02053603          	ld	a2,32(a0)
    800069b8:	0005b683          	ld	a3,0(a1)
    800069bc:	00c686b3          	add	a3,a3,a2
    800069c0:	00d5b023          	sd	a3,0(a1)
    800069c4:	00200593          	li	a1,2
    800069c8:	14459073          	csrw	sip,a1
    800069cc:	01053683          	ld	a3,16(a0)
    800069d0:	00853603          	ld	a2,8(a0)
    800069d4:	00053583          	ld	a1,0(a0)
    800069d8:	34051573          	csrrw	a0,mscratch,a0
    800069dc:	30200073          	mret

00000000800069e0 <plicinit>:
    800069e0:	ff010113          	addi	sp,sp,-16
    800069e4:	00813423          	sd	s0,8(sp)
    800069e8:	01010413          	addi	s0,sp,16
    800069ec:	00813403          	ld	s0,8(sp)
    800069f0:	0c0007b7          	lui	a5,0xc000
    800069f4:	00100713          	li	a4,1
    800069f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800069fc:	00e7a223          	sw	a4,4(a5)
    80006a00:	01010113          	addi	sp,sp,16
    80006a04:	00008067          	ret

0000000080006a08 <plicinithart>:
    80006a08:	ff010113          	addi	sp,sp,-16
    80006a0c:	00813023          	sd	s0,0(sp)
    80006a10:	00113423          	sd	ra,8(sp)
    80006a14:	01010413          	addi	s0,sp,16
    80006a18:	00000097          	auipc	ra,0x0
    80006a1c:	a40080e7          	jalr	-1472(ra) # 80006458 <cpuid>
    80006a20:	0085171b          	slliw	a4,a0,0x8
    80006a24:	0c0027b7          	lui	a5,0xc002
    80006a28:	00e787b3          	add	a5,a5,a4
    80006a2c:	40200713          	li	a4,1026
    80006a30:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006a34:	00813083          	ld	ra,8(sp)
    80006a38:	00013403          	ld	s0,0(sp)
    80006a3c:	00d5151b          	slliw	a0,a0,0xd
    80006a40:	0c2017b7          	lui	a5,0xc201
    80006a44:	00a78533          	add	a0,a5,a0
    80006a48:	00052023          	sw	zero,0(a0)
    80006a4c:	01010113          	addi	sp,sp,16
    80006a50:	00008067          	ret

0000000080006a54 <plic_claim>:
    80006a54:	ff010113          	addi	sp,sp,-16
    80006a58:	00813023          	sd	s0,0(sp)
    80006a5c:	00113423          	sd	ra,8(sp)
    80006a60:	01010413          	addi	s0,sp,16
    80006a64:	00000097          	auipc	ra,0x0
    80006a68:	9f4080e7          	jalr	-1548(ra) # 80006458 <cpuid>
    80006a6c:	00813083          	ld	ra,8(sp)
    80006a70:	00013403          	ld	s0,0(sp)
    80006a74:	00d5151b          	slliw	a0,a0,0xd
    80006a78:	0c2017b7          	lui	a5,0xc201
    80006a7c:	00a78533          	add	a0,a5,a0
    80006a80:	00452503          	lw	a0,4(a0)
    80006a84:	01010113          	addi	sp,sp,16
    80006a88:	00008067          	ret

0000000080006a8c <plic_complete>:
    80006a8c:	fe010113          	addi	sp,sp,-32
    80006a90:	00813823          	sd	s0,16(sp)
    80006a94:	00913423          	sd	s1,8(sp)
    80006a98:	00113c23          	sd	ra,24(sp)
    80006a9c:	02010413          	addi	s0,sp,32
    80006aa0:	00050493          	mv	s1,a0
    80006aa4:	00000097          	auipc	ra,0x0
    80006aa8:	9b4080e7          	jalr	-1612(ra) # 80006458 <cpuid>
    80006aac:	01813083          	ld	ra,24(sp)
    80006ab0:	01013403          	ld	s0,16(sp)
    80006ab4:	00d5179b          	slliw	a5,a0,0xd
    80006ab8:	0c201737          	lui	a4,0xc201
    80006abc:	00f707b3          	add	a5,a4,a5
    80006ac0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006ac4:	00813483          	ld	s1,8(sp)
    80006ac8:	02010113          	addi	sp,sp,32
    80006acc:	00008067          	ret

0000000080006ad0 <consolewrite>:
    80006ad0:	fb010113          	addi	sp,sp,-80
    80006ad4:	04813023          	sd	s0,64(sp)
    80006ad8:	04113423          	sd	ra,72(sp)
    80006adc:	02913c23          	sd	s1,56(sp)
    80006ae0:	03213823          	sd	s2,48(sp)
    80006ae4:	03313423          	sd	s3,40(sp)
    80006ae8:	03413023          	sd	s4,32(sp)
    80006aec:	01513c23          	sd	s5,24(sp)
    80006af0:	05010413          	addi	s0,sp,80
    80006af4:	06c05c63          	blez	a2,80006b6c <consolewrite+0x9c>
    80006af8:	00060993          	mv	s3,a2
    80006afc:	00050a13          	mv	s4,a0
    80006b00:	00058493          	mv	s1,a1
    80006b04:	00000913          	li	s2,0
    80006b08:	fff00a93          	li	s5,-1
    80006b0c:	01c0006f          	j	80006b28 <consolewrite+0x58>
    80006b10:	fbf44503          	lbu	a0,-65(s0)
    80006b14:	0019091b          	addiw	s2,s2,1
    80006b18:	00148493          	addi	s1,s1,1
    80006b1c:	00001097          	auipc	ra,0x1
    80006b20:	a9c080e7          	jalr	-1380(ra) # 800075b8 <uartputc>
    80006b24:	03298063          	beq	s3,s2,80006b44 <consolewrite+0x74>
    80006b28:	00048613          	mv	a2,s1
    80006b2c:	00100693          	li	a3,1
    80006b30:	000a0593          	mv	a1,s4
    80006b34:	fbf40513          	addi	a0,s0,-65
    80006b38:	00000097          	auipc	ra,0x0
    80006b3c:	9d8080e7          	jalr	-1576(ra) # 80006510 <either_copyin>
    80006b40:	fd5518e3          	bne	a0,s5,80006b10 <consolewrite+0x40>
    80006b44:	04813083          	ld	ra,72(sp)
    80006b48:	04013403          	ld	s0,64(sp)
    80006b4c:	03813483          	ld	s1,56(sp)
    80006b50:	02813983          	ld	s3,40(sp)
    80006b54:	02013a03          	ld	s4,32(sp)
    80006b58:	01813a83          	ld	s5,24(sp)
    80006b5c:	00090513          	mv	a0,s2
    80006b60:	03013903          	ld	s2,48(sp)
    80006b64:	05010113          	addi	sp,sp,80
    80006b68:	00008067          	ret
    80006b6c:	00000913          	li	s2,0
    80006b70:	fd5ff06f          	j	80006b44 <consolewrite+0x74>

0000000080006b74 <consoleread>:
    80006b74:	f9010113          	addi	sp,sp,-112
    80006b78:	06813023          	sd	s0,96(sp)
    80006b7c:	04913c23          	sd	s1,88(sp)
    80006b80:	05213823          	sd	s2,80(sp)
    80006b84:	05313423          	sd	s3,72(sp)
    80006b88:	05413023          	sd	s4,64(sp)
    80006b8c:	03513c23          	sd	s5,56(sp)
    80006b90:	03613823          	sd	s6,48(sp)
    80006b94:	03713423          	sd	s7,40(sp)
    80006b98:	03813023          	sd	s8,32(sp)
    80006b9c:	06113423          	sd	ra,104(sp)
    80006ba0:	01913c23          	sd	s9,24(sp)
    80006ba4:	07010413          	addi	s0,sp,112
    80006ba8:	00060b93          	mv	s7,a2
    80006bac:	00050913          	mv	s2,a0
    80006bb0:	00058c13          	mv	s8,a1
    80006bb4:	00060b1b          	sext.w	s6,a2
    80006bb8:	00006497          	auipc	s1,0x6
    80006bbc:	bd048493          	addi	s1,s1,-1072 # 8000c788 <cons>
    80006bc0:	00400993          	li	s3,4
    80006bc4:	fff00a13          	li	s4,-1
    80006bc8:	00a00a93          	li	s5,10
    80006bcc:	05705e63          	blez	s7,80006c28 <consoleread+0xb4>
    80006bd0:	09c4a703          	lw	a4,156(s1)
    80006bd4:	0984a783          	lw	a5,152(s1)
    80006bd8:	0007071b          	sext.w	a4,a4
    80006bdc:	08e78463          	beq	a5,a4,80006c64 <consoleread+0xf0>
    80006be0:	07f7f713          	andi	a4,a5,127
    80006be4:	00e48733          	add	a4,s1,a4
    80006be8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80006bec:	0017869b          	addiw	a3,a5,1
    80006bf0:	08d4ac23          	sw	a3,152(s1)
    80006bf4:	00070c9b          	sext.w	s9,a4
    80006bf8:	0b370663          	beq	a4,s3,80006ca4 <consoleread+0x130>
    80006bfc:	00100693          	li	a3,1
    80006c00:	f9f40613          	addi	a2,s0,-97
    80006c04:	000c0593          	mv	a1,s8
    80006c08:	00090513          	mv	a0,s2
    80006c0c:	f8e40fa3          	sb	a4,-97(s0)
    80006c10:	00000097          	auipc	ra,0x0
    80006c14:	8b4080e7          	jalr	-1868(ra) # 800064c4 <either_copyout>
    80006c18:	01450863          	beq	a0,s4,80006c28 <consoleread+0xb4>
    80006c1c:	001c0c13          	addi	s8,s8,1
    80006c20:	fffb8b9b          	addiw	s7,s7,-1
    80006c24:	fb5c94e3          	bne	s9,s5,80006bcc <consoleread+0x58>
    80006c28:	000b851b          	sext.w	a0,s7
    80006c2c:	06813083          	ld	ra,104(sp)
    80006c30:	06013403          	ld	s0,96(sp)
    80006c34:	05813483          	ld	s1,88(sp)
    80006c38:	05013903          	ld	s2,80(sp)
    80006c3c:	04813983          	ld	s3,72(sp)
    80006c40:	04013a03          	ld	s4,64(sp)
    80006c44:	03813a83          	ld	s5,56(sp)
    80006c48:	02813b83          	ld	s7,40(sp)
    80006c4c:	02013c03          	ld	s8,32(sp)
    80006c50:	01813c83          	ld	s9,24(sp)
    80006c54:	40ab053b          	subw	a0,s6,a0
    80006c58:	03013b03          	ld	s6,48(sp)
    80006c5c:	07010113          	addi	sp,sp,112
    80006c60:	00008067          	ret
    80006c64:	00001097          	auipc	ra,0x1
    80006c68:	1d8080e7          	jalr	472(ra) # 80007e3c <push_on>
    80006c6c:	0984a703          	lw	a4,152(s1)
    80006c70:	09c4a783          	lw	a5,156(s1)
    80006c74:	0007879b          	sext.w	a5,a5
    80006c78:	fef70ce3          	beq	a4,a5,80006c70 <consoleread+0xfc>
    80006c7c:	00001097          	auipc	ra,0x1
    80006c80:	234080e7          	jalr	564(ra) # 80007eb0 <pop_on>
    80006c84:	0984a783          	lw	a5,152(s1)
    80006c88:	07f7f713          	andi	a4,a5,127
    80006c8c:	00e48733          	add	a4,s1,a4
    80006c90:	01874703          	lbu	a4,24(a4)
    80006c94:	0017869b          	addiw	a3,a5,1
    80006c98:	08d4ac23          	sw	a3,152(s1)
    80006c9c:	00070c9b          	sext.w	s9,a4
    80006ca0:	f5371ee3          	bne	a4,s3,80006bfc <consoleread+0x88>
    80006ca4:	000b851b          	sext.w	a0,s7
    80006ca8:	f96bf2e3          	bgeu	s7,s6,80006c2c <consoleread+0xb8>
    80006cac:	08f4ac23          	sw	a5,152(s1)
    80006cb0:	f7dff06f          	j	80006c2c <consoleread+0xb8>

0000000080006cb4 <consputc>:
    80006cb4:	10000793          	li	a5,256
    80006cb8:	00f50663          	beq	a0,a5,80006cc4 <consputc+0x10>
    80006cbc:	00001317          	auipc	t1,0x1
    80006cc0:	9f430067          	jr	-1548(t1) # 800076b0 <uartputc_sync>
    80006cc4:	ff010113          	addi	sp,sp,-16
    80006cc8:	00113423          	sd	ra,8(sp)
    80006ccc:	00813023          	sd	s0,0(sp)
    80006cd0:	01010413          	addi	s0,sp,16
    80006cd4:	00800513          	li	a0,8
    80006cd8:	00001097          	auipc	ra,0x1
    80006cdc:	9d8080e7          	jalr	-1576(ra) # 800076b0 <uartputc_sync>
    80006ce0:	02000513          	li	a0,32
    80006ce4:	00001097          	auipc	ra,0x1
    80006ce8:	9cc080e7          	jalr	-1588(ra) # 800076b0 <uartputc_sync>
    80006cec:	00013403          	ld	s0,0(sp)
    80006cf0:	00813083          	ld	ra,8(sp)
    80006cf4:	00800513          	li	a0,8
    80006cf8:	01010113          	addi	sp,sp,16
    80006cfc:	00001317          	auipc	t1,0x1
    80006d00:	9b430067          	jr	-1612(t1) # 800076b0 <uartputc_sync>

0000000080006d04 <consoleintr>:
    80006d04:	fe010113          	addi	sp,sp,-32
    80006d08:	00813823          	sd	s0,16(sp)
    80006d0c:	00913423          	sd	s1,8(sp)
    80006d10:	01213023          	sd	s2,0(sp)
    80006d14:	00113c23          	sd	ra,24(sp)
    80006d18:	02010413          	addi	s0,sp,32
    80006d1c:	00006917          	auipc	s2,0x6
    80006d20:	a6c90913          	addi	s2,s2,-1428 # 8000c788 <cons>
    80006d24:	00050493          	mv	s1,a0
    80006d28:	00090513          	mv	a0,s2
    80006d2c:	00001097          	auipc	ra,0x1
    80006d30:	e40080e7          	jalr	-448(ra) # 80007b6c <acquire>
    80006d34:	02048c63          	beqz	s1,80006d6c <consoleintr+0x68>
    80006d38:	0a092783          	lw	a5,160(s2)
    80006d3c:	09892703          	lw	a4,152(s2)
    80006d40:	07f00693          	li	a3,127
    80006d44:	40e7873b          	subw	a4,a5,a4
    80006d48:	02e6e263          	bltu	a3,a4,80006d6c <consoleintr+0x68>
    80006d4c:	00d00713          	li	a4,13
    80006d50:	04e48063          	beq	s1,a4,80006d90 <consoleintr+0x8c>
    80006d54:	07f7f713          	andi	a4,a5,127
    80006d58:	00e90733          	add	a4,s2,a4
    80006d5c:	0017879b          	addiw	a5,a5,1
    80006d60:	0af92023          	sw	a5,160(s2)
    80006d64:	00970c23          	sb	s1,24(a4)
    80006d68:	08f92e23          	sw	a5,156(s2)
    80006d6c:	01013403          	ld	s0,16(sp)
    80006d70:	01813083          	ld	ra,24(sp)
    80006d74:	00813483          	ld	s1,8(sp)
    80006d78:	00013903          	ld	s2,0(sp)
    80006d7c:	00006517          	auipc	a0,0x6
    80006d80:	a0c50513          	addi	a0,a0,-1524 # 8000c788 <cons>
    80006d84:	02010113          	addi	sp,sp,32
    80006d88:	00001317          	auipc	t1,0x1
    80006d8c:	eb030067          	jr	-336(t1) # 80007c38 <release>
    80006d90:	00a00493          	li	s1,10
    80006d94:	fc1ff06f          	j	80006d54 <consoleintr+0x50>

0000000080006d98 <consoleinit>:
    80006d98:	fe010113          	addi	sp,sp,-32
    80006d9c:	00113c23          	sd	ra,24(sp)
    80006da0:	00813823          	sd	s0,16(sp)
    80006da4:	00913423          	sd	s1,8(sp)
    80006da8:	02010413          	addi	s0,sp,32
    80006dac:	00006497          	auipc	s1,0x6
    80006db0:	9dc48493          	addi	s1,s1,-1572 # 8000c788 <cons>
    80006db4:	00048513          	mv	a0,s1
    80006db8:	00003597          	auipc	a1,0x3
    80006dbc:	8a058593          	addi	a1,a1,-1888 # 80009658 <CONSOLE_STATUS+0x648>
    80006dc0:	00001097          	auipc	ra,0x1
    80006dc4:	d88080e7          	jalr	-632(ra) # 80007b48 <initlock>
    80006dc8:	00000097          	auipc	ra,0x0
    80006dcc:	7ac080e7          	jalr	1964(ra) # 80007574 <uartinit>
    80006dd0:	01813083          	ld	ra,24(sp)
    80006dd4:	01013403          	ld	s0,16(sp)
    80006dd8:	00000797          	auipc	a5,0x0
    80006ddc:	d9c78793          	addi	a5,a5,-612 # 80006b74 <consoleread>
    80006de0:	0af4bc23          	sd	a5,184(s1)
    80006de4:	00000797          	auipc	a5,0x0
    80006de8:	cec78793          	addi	a5,a5,-788 # 80006ad0 <consolewrite>
    80006dec:	0cf4b023          	sd	a5,192(s1)
    80006df0:	00813483          	ld	s1,8(sp)
    80006df4:	02010113          	addi	sp,sp,32
    80006df8:	00008067          	ret

0000000080006dfc <console_read>:
    80006dfc:	ff010113          	addi	sp,sp,-16
    80006e00:	00813423          	sd	s0,8(sp)
    80006e04:	01010413          	addi	s0,sp,16
    80006e08:	00813403          	ld	s0,8(sp)
    80006e0c:	00006317          	auipc	t1,0x6
    80006e10:	a3433303          	ld	t1,-1484(t1) # 8000c840 <devsw+0x10>
    80006e14:	01010113          	addi	sp,sp,16
    80006e18:	00030067          	jr	t1

0000000080006e1c <console_write>:
    80006e1c:	ff010113          	addi	sp,sp,-16
    80006e20:	00813423          	sd	s0,8(sp)
    80006e24:	01010413          	addi	s0,sp,16
    80006e28:	00813403          	ld	s0,8(sp)
    80006e2c:	00006317          	auipc	t1,0x6
    80006e30:	a1c33303          	ld	t1,-1508(t1) # 8000c848 <devsw+0x18>
    80006e34:	01010113          	addi	sp,sp,16
    80006e38:	00030067          	jr	t1

0000000080006e3c <panic>:
    80006e3c:	fe010113          	addi	sp,sp,-32
    80006e40:	00113c23          	sd	ra,24(sp)
    80006e44:	00813823          	sd	s0,16(sp)
    80006e48:	00913423          	sd	s1,8(sp)
    80006e4c:	02010413          	addi	s0,sp,32
    80006e50:	00050493          	mv	s1,a0
    80006e54:	00003517          	auipc	a0,0x3
    80006e58:	80c50513          	addi	a0,a0,-2036 # 80009660 <CONSOLE_STATUS+0x650>
    80006e5c:	00006797          	auipc	a5,0x6
    80006e60:	a807a623          	sw	zero,-1396(a5) # 8000c8e8 <pr+0x18>
    80006e64:	00000097          	auipc	ra,0x0
    80006e68:	034080e7          	jalr	52(ra) # 80006e98 <__printf>
    80006e6c:	00048513          	mv	a0,s1
    80006e70:	00000097          	auipc	ra,0x0
    80006e74:	028080e7          	jalr	40(ra) # 80006e98 <__printf>
    80006e78:	00002517          	auipc	a0,0x2
    80006e7c:	39050513          	addi	a0,a0,912 # 80009208 <CONSOLE_STATUS+0x1f8>
    80006e80:	00000097          	auipc	ra,0x0
    80006e84:	018080e7          	jalr	24(ra) # 80006e98 <__printf>
    80006e88:	00100793          	li	a5,1
    80006e8c:	00004717          	auipc	a4,0x4
    80006e90:	76f72623          	sw	a5,1900(a4) # 8000b5f8 <panicked>
    80006e94:	0000006f          	j	80006e94 <panic+0x58>

0000000080006e98 <__printf>:
    80006e98:	f3010113          	addi	sp,sp,-208
    80006e9c:	08813023          	sd	s0,128(sp)
    80006ea0:	07313423          	sd	s3,104(sp)
    80006ea4:	09010413          	addi	s0,sp,144
    80006ea8:	05813023          	sd	s8,64(sp)
    80006eac:	08113423          	sd	ra,136(sp)
    80006eb0:	06913c23          	sd	s1,120(sp)
    80006eb4:	07213823          	sd	s2,112(sp)
    80006eb8:	07413023          	sd	s4,96(sp)
    80006ebc:	05513c23          	sd	s5,88(sp)
    80006ec0:	05613823          	sd	s6,80(sp)
    80006ec4:	05713423          	sd	s7,72(sp)
    80006ec8:	03913c23          	sd	s9,56(sp)
    80006ecc:	03a13823          	sd	s10,48(sp)
    80006ed0:	03b13423          	sd	s11,40(sp)
    80006ed4:	00006317          	auipc	t1,0x6
    80006ed8:	9fc30313          	addi	t1,t1,-1540 # 8000c8d0 <pr>
    80006edc:	01832c03          	lw	s8,24(t1)
    80006ee0:	00b43423          	sd	a1,8(s0)
    80006ee4:	00c43823          	sd	a2,16(s0)
    80006ee8:	00d43c23          	sd	a3,24(s0)
    80006eec:	02e43023          	sd	a4,32(s0)
    80006ef0:	02f43423          	sd	a5,40(s0)
    80006ef4:	03043823          	sd	a6,48(s0)
    80006ef8:	03143c23          	sd	a7,56(s0)
    80006efc:	00050993          	mv	s3,a0
    80006f00:	4a0c1663          	bnez	s8,800073ac <__printf+0x514>
    80006f04:	60098c63          	beqz	s3,8000751c <__printf+0x684>
    80006f08:	0009c503          	lbu	a0,0(s3)
    80006f0c:	00840793          	addi	a5,s0,8
    80006f10:	f6f43c23          	sd	a5,-136(s0)
    80006f14:	00000493          	li	s1,0
    80006f18:	22050063          	beqz	a0,80007138 <__printf+0x2a0>
    80006f1c:	00002a37          	lui	s4,0x2
    80006f20:	00018ab7          	lui	s5,0x18
    80006f24:	000f4b37          	lui	s6,0xf4
    80006f28:	00989bb7          	lui	s7,0x989
    80006f2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006f30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006f34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006f38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80006f3c:	00148c9b          	addiw	s9,s1,1
    80006f40:	02500793          	li	a5,37
    80006f44:	01998933          	add	s2,s3,s9
    80006f48:	38f51263          	bne	a0,a5,800072cc <__printf+0x434>
    80006f4c:	00094783          	lbu	a5,0(s2)
    80006f50:	00078c9b          	sext.w	s9,a5
    80006f54:	1e078263          	beqz	a5,80007138 <__printf+0x2a0>
    80006f58:	0024849b          	addiw	s1,s1,2
    80006f5c:	07000713          	li	a4,112
    80006f60:	00998933          	add	s2,s3,s1
    80006f64:	38e78a63          	beq	a5,a4,800072f8 <__printf+0x460>
    80006f68:	20f76863          	bltu	a4,a5,80007178 <__printf+0x2e0>
    80006f6c:	42a78863          	beq	a5,a0,8000739c <__printf+0x504>
    80006f70:	06400713          	li	a4,100
    80006f74:	40e79663          	bne	a5,a4,80007380 <__printf+0x4e8>
    80006f78:	f7843783          	ld	a5,-136(s0)
    80006f7c:	0007a603          	lw	a2,0(a5)
    80006f80:	00878793          	addi	a5,a5,8
    80006f84:	f6f43c23          	sd	a5,-136(s0)
    80006f88:	42064a63          	bltz	a2,800073bc <__printf+0x524>
    80006f8c:	00a00713          	li	a4,10
    80006f90:	02e677bb          	remuw	a5,a2,a4
    80006f94:	00002d97          	auipc	s11,0x2
    80006f98:	6f4d8d93          	addi	s11,s11,1780 # 80009688 <digits>
    80006f9c:	00900593          	li	a1,9
    80006fa0:	0006051b          	sext.w	a0,a2
    80006fa4:	00000c93          	li	s9,0
    80006fa8:	02079793          	slli	a5,a5,0x20
    80006fac:	0207d793          	srli	a5,a5,0x20
    80006fb0:	00fd87b3          	add	a5,s11,a5
    80006fb4:	0007c783          	lbu	a5,0(a5)
    80006fb8:	02e656bb          	divuw	a3,a2,a4
    80006fbc:	f8f40023          	sb	a5,-128(s0)
    80006fc0:	14c5d863          	bge	a1,a2,80007110 <__printf+0x278>
    80006fc4:	06300593          	li	a1,99
    80006fc8:	00100c93          	li	s9,1
    80006fcc:	02e6f7bb          	remuw	a5,a3,a4
    80006fd0:	02079793          	slli	a5,a5,0x20
    80006fd4:	0207d793          	srli	a5,a5,0x20
    80006fd8:	00fd87b3          	add	a5,s11,a5
    80006fdc:	0007c783          	lbu	a5,0(a5)
    80006fe0:	02e6d73b          	divuw	a4,a3,a4
    80006fe4:	f8f400a3          	sb	a5,-127(s0)
    80006fe8:	12a5f463          	bgeu	a1,a0,80007110 <__printf+0x278>
    80006fec:	00a00693          	li	a3,10
    80006ff0:	00900593          	li	a1,9
    80006ff4:	02d777bb          	remuw	a5,a4,a3
    80006ff8:	02079793          	slli	a5,a5,0x20
    80006ffc:	0207d793          	srli	a5,a5,0x20
    80007000:	00fd87b3          	add	a5,s11,a5
    80007004:	0007c503          	lbu	a0,0(a5)
    80007008:	02d757bb          	divuw	a5,a4,a3
    8000700c:	f8a40123          	sb	a0,-126(s0)
    80007010:	48e5f263          	bgeu	a1,a4,80007494 <__printf+0x5fc>
    80007014:	06300513          	li	a0,99
    80007018:	02d7f5bb          	remuw	a1,a5,a3
    8000701c:	02059593          	slli	a1,a1,0x20
    80007020:	0205d593          	srli	a1,a1,0x20
    80007024:	00bd85b3          	add	a1,s11,a1
    80007028:	0005c583          	lbu	a1,0(a1)
    8000702c:	02d7d7bb          	divuw	a5,a5,a3
    80007030:	f8b401a3          	sb	a1,-125(s0)
    80007034:	48e57263          	bgeu	a0,a4,800074b8 <__printf+0x620>
    80007038:	3e700513          	li	a0,999
    8000703c:	02d7f5bb          	remuw	a1,a5,a3
    80007040:	02059593          	slli	a1,a1,0x20
    80007044:	0205d593          	srli	a1,a1,0x20
    80007048:	00bd85b3          	add	a1,s11,a1
    8000704c:	0005c583          	lbu	a1,0(a1)
    80007050:	02d7d7bb          	divuw	a5,a5,a3
    80007054:	f8b40223          	sb	a1,-124(s0)
    80007058:	46e57663          	bgeu	a0,a4,800074c4 <__printf+0x62c>
    8000705c:	02d7f5bb          	remuw	a1,a5,a3
    80007060:	02059593          	slli	a1,a1,0x20
    80007064:	0205d593          	srli	a1,a1,0x20
    80007068:	00bd85b3          	add	a1,s11,a1
    8000706c:	0005c583          	lbu	a1,0(a1)
    80007070:	02d7d7bb          	divuw	a5,a5,a3
    80007074:	f8b402a3          	sb	a1,-123(s0)
    80007078:	46ea7863          	bgeu	s4,a4,800074e8 <__printf+0x650>
    8000707c:	02d7f5bb          	remuw	a1,a5,a3
    80007080:	02059593          	slli	a1,a1,0x20
    80007084:	0205d593          	srli	a1,a1,0x20
    80007088:	00bd85b3          	add	a1,s11,a1
    8000708c:	0005c583          	lbu	a1,0(a1)
    80007090:	02d7d7bb          	divuw	a5,a5,a3
    80007094:	f8b40323          	sb	a1,-122(s0)
    80007098:	3eeaf863          	bgeu	s5,a4,80007488 <__printf+0x5f0>
    8000709c:	02d7f5bb          	remuw	a1,a5,a3
    800070a0:	02059593          	slli	a1,a1,0x20
    800070a4:	0205d593          	srli	a1,a1,0x20
    800070a8:	00bd85b3          	add	a1,s11,a1
    800070ac:	0005c583          	lbu	a1,0(a1)
    800070b0:	02d7d7bb          	divuw	a5,a5,a3
    800070b4:	f8b403a3          	sb	a1,-121(s0)
    800070b8:	42eb7e63          	bgeu	s6,a4,800074f4 <__printf+0x65c>
    800070bc:	02d7f5bb          	remuw	a1,a5,a3
    800070c0:	02059593          	slli	a1,a1,0x20
    800070c4:	0205d593          	srli	a1,a1,0x20
    800070c8:	00bd85b3          	add	a1,s11,a1
    800070cc:	0005c583          	lbu	a1,0(a1)
    800070d0:	02d7d7bb          	divuw	a5,a5,a3
    800070d4:	f8b40423          	sb	a1,-120(s0)
    800070d8:	42ebfc63          	bgeu	s7,a4,80007510 <__printf+0x678>
    800070dc:	02079793          	slli	a5,a5,0x20
    800070e0:	0207d793          	srli	a5,a5,0x20
    800070e4:	00fd8db3          	add	s11,s11,a5
    800070e8:	000dc703          	lbu	a4,0(s11)
    800070ec:	00a00793          	li	a5,10
    800070f0:	00900c93          	li	s9,9
    800070f4:	f8e404a3          	sb	a4,-119(s0)
    800070f8:	00065c63          	bgez	a2,80007110 <__printf+0x278>
    800070fc:	f9040713          	addi	a4,s0,-112
    80007100:	00f70733          	add	a4,a4,a5
    80007104:	02d00693          	li	a3,45
    80007108:	fed70823          	sb	a3,-16(a4)
    8000710c:	00078c93          	mv	s9,a5
    80007110:	f8040793          	addi	a5,s0,-128
    80007114:	01978cb3          	add	s9,a5,s9
    80007118:	f7f40d13          	addi	s10,s0,-129
    8000711c:	000cc503          	lbu	a0,0(s9)
    80007120:	fffc8c93          	addi	s9,s9,-1
    80007124:	00000097          	auipc	ra,0x0
    80007128:	b90080e7          	jalr	-1136(ra) # 80006cb4 <consputc>
    8000712c:	ffac98e3          	bne	s9,s10,8000711c <__printf+0x284>
    80007130:	00094503          	lbu	a0,0(s2)
    80007134:	e00514e3          	bnez	a0,80006f3c <__printf+0xa4>
    80007138:	1a0c1663          	bnez	s8,800072e4 <__printf+0x44c>
    8000713c:	08813083          	ld	ra,136(sp)
    80007140:	08013403          	ld	s0,128(sp)
    80007144:	07813483          	ld	s1,120(sp)
    80007148:	07013903          	ld	s2,112(sp)
    8000714c:	06813983          	ld	s3,104(sp)
    80007150:	06013a03          	ld	s4,96(sp)
    80007154:	05813a83          	ld	s5,88(sp)
    80007158:	05013b03          	ld	s6,80(sp)
    8000715c:	04813b83          	ld	s7,72(sp)
    80007160:	04013c03          	ld	s8,64(sp)
    80007164:	03813c83          	ld	s9,56(sp)
    80007168:	03013d03          	ld	s10,48(sp)
    8000716c:	02813d83          	ld	s11,40(sp)
    80007170:	0d010113          	addi	sp,sp,208
    80007174:	00008067          	ret
    80007178:	07300713          	li	a4,115
    8000717c:	1ce78a63          	beq	a5,a4,80007350 <__printf+0x4b8>
    80007180:	07800713          	li	a4,120
    80007184:	1ee79e63          	bne	a5,a4,80007380 <__printf+0x4e8>
    80007188:	f7843783          	ld	a5,-136(s0)
    8000718c:	0007a703          	lw	a4,0(a5)
    80007190:	00878793          	addi	a5,a5,8
    80007194:	f6f43c23          	sd	a5,-136(s0)
    80007198:	28074263          	bltz	a4,8000741c <__printf+0x584>
    8000719c:	00002d97          	auipc	s11,0x2
    800071a0:	4ecd8d93          	addi	s11,s11,1260 # 80009688 <digits>
    800071a4:	00f77793          	andi	a5,a4,15
    800071a8:	00fd87b3          	add	a5,s11,a5
    800071ac:	0007c683          	lbu	a3,0(a5)
    800071b0:	00f00613          	li	a2,15
    800071b4:	0007079b          	sext.w	a5,a4
    800071b8:	f8d40023          	sb	a3,-128(s0)
    800071bc:	0047559b          	srliw	a1,a4,0x4
    800071c0:	0047569b          	srliw	a3,a4,0x4
    800071c4:	00000c93          	li	s9,0
    800071c8:	0ee65063          	bge	a2,a4,800072a8 <__printf+0x410>
    800071cc:	00f6f693          	andi	a3,a3,15
    800071d0:	00dd86b3          	add	a3,s11,a3
    800071d4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800071d8:	0087d79b          	srliw	a5,a5,0x8
    800071dc:	00100c93          	li	s9,1
    800071e0:	f8d400a3          	sb	a3,-127(s0)
    800071e4:	0cb67263          	bgeu	a2,a1,800072a8 <__printf+0x410>
    800071e8:	00f7f693          	andi	a3,a5,15
    800071ec:	00dd86b3          	add	a3,s11,a3
    800071f0:	0006c583          	lbu	a1,0(a3)
    800071f4:	00f00613          	li	a2,15
    800071f8:	0047d69b          	srliw	a3,a5,0x4
    800071fc:	f8b40123          	sb	a1,-126(s0)
    80007200:	0047d593          	srli	a1,a5,0x4
    80007204:	28f67e63          	bgeu	a2,a5,800074a0 <__printf+0x608>
    80007208:	00f6f693          	andi	a3,a3,15
    8000720c:	00dd86b3          	add	a3,s11,a3
    80007210:	0006c503          	lbu	a0,0(a3)
    80007214:	0087d813          	srli	a6,a5,0x8
    80007218:	0087d69b          	srliw	a3,a5,0x8
    8000721c:	f8a401a3          	sb	a0,-125(s0)
    80007220:	28b67663          	bgeu	a2,a1,800074ac <__printf+0x614>
    80007224:	00f6f693          	andi	a3,a3,15
    80007228:	00dd86b3          	add	a3,s11,a3
    8000722c:	0006c583          	lbu	a1,0(a3)
    80007230:	00c7d513          	srli	a0,a5,0xc
    80007234:	00c7d69b          	srliw	a3,a5,0xc
    80007238:	f8b40223          	sb	a1,-124(s0)
    8000723c:	29067a63          	bgeu	a2,a6,800074d0 <__printf+0x638>
    80007240:	00f6f693          	andi	a3,a3,15
    80007244:	00dd86b3          	add	a3,s11,a3
    80007248:	0006c583          	lbu	a1,0(a3)
    8000724c:	0107d813          	srli	a6,a5,0x10
    80007250:	0107d69b          	srliw	a3,a5,0x10
    80007254:	f8b402a3          	sb	a1,-123(s0)
    80007258:	28a67263          	bgeu	a2,a0,800074dc <__printf+0x644>
    8000725c:	00f6f693          	andi	a3,a3,15
    80007260:	00dd86b3          	add	a3,s11,a3
    80007264:	0006c683          	lbu	a3,0(a3)
    80007268:	0147d79b          	srliw	a5,a5,0x14
    8000726c:	f8d40323          	sb	a3,-122(s0)
    80007270:	21067663          	bgeu	a2,a6,8000747c <__printf+0x5e4>
    80007274:	02079793          	slli	a5,a5,0x20
    80007278:	0207d793          	srli	a5,a5,0x20
    8000727c:	00fd8db3          	add	s11,s11,a5
    80007280:	000dc683          	lbu	a3,0(s11)
    80007284:	00800793          	li	a5,8
    80007288:	00700c93          	li	s9,7
    8000728c:	f8d403a3          	sb	a3,-121(s0)
    80007290:	00075c63          	bgez	a4,800072a8 <__printf+0x410>
    80007294:	f9040713          	addi	a4,s0,-112
    80007298:	00f70733          	add	a4,a4,a5
    8000729c:	02d00693          	li	a3,45
    800072a0:	fed70823          	sb	a3,-16(a4)
    800072a4:	00078c93          	mv	s9,a5
    800072a8:	f8040793          	addi	a5,s0,-128
    800072ac:	01978cb3          	add	s9,a5,s9
    800072b0:	f7f40d13          	addi	s10,s0,-129
    800072b4:	000cc503          	lbu	a0,0(s9)
    800072b8:	fffc8c93          	addi	s9,s9,-1
    800072bc:	00000097          	auipc	ra,0x0
    800072c0:	9f8080e7          	jalr	-1544(ra) # 80006cb4 <consputc>
    800072c4:	ff9d18e3          	bne	s10,s9,800072b4 <__printf+0x41c>
    800072c8:	0100006f          	j	800072d8 <__printf+0x440>
    800072cc:	00000097          	auipc	ra,0x0
    800072d0:	9e8080e7          	jalr	-1560(ra) # 80006cb4 <consputc>
    800072d4:	000c8493          	mv	s1,s9
    800072d8:	00094503          	lbu	a0,0(s2)
    800072dc:	c60510e3          	bnez	a0,80006f3c <__printf+0xa4>
    800072e0:	e40c0ee3          	beqz	s8,8000713c <__printf+0x2a4>
    800072e4:	00005517          	auipc	a0,0x5
    800072e8:	5ec50513          	addi	a0,a0,1516 # 8000c8d0 <pr>
    800072ec:	00001097          	auipc	ra,0x1
    800072f0:	94c080e7          	jalr	-1716(ra) # 80007c38 <release>
    800072f4:	e49ff06f          	j	8000713c <__printf+0x2a4>
    800072f8:	f7843783          	ld	a5,-136(s0)
    800072fc:	03000513          	li	a0,48
    80007300:	01000d13          	li	s10,16
    80007304:	00878713          	addi	a4,a5,8
    80007308:	0007bc83          	ld	s9,0(a5)
    8000730c:	f6e43c23          	sd	a4,-136(s0)
    80007310:	00000097          	auipc	ra,0x0
    80007314:	9a4080e7          	jalr	-1628(ra) # 80006cb4 <consputc>
    80007318:	07800513          	li	a0,120
    8000731c:	00000097          	auipc	ra,0x0
    80007320:	998080e7          	jalr	-1640(ra) # 80006cb4 <consputc>
    80007324:	00002d97          	auipc	s11,0x2
    80007328:	364d8d93          	addi	s11,s11,868 # 80009688 <digits>
    8000732c:	03ccd793          	srli	a5,s9,0x3c
    80007330:	00fd87b3          	add	a5,s11,a5
    80007334:	0007c503          	lbu	a0,0(a5)
    80007338:	fffd0d1b          	addiw	s10,s10,-1
    8000733c:	004c9c93          	slli	s9,s9,0x4
    80007340:	00000097          	auipc	ra,0x0
    80007344:	974080e7          	jalr	-1676(ra) # 80006cb4 <consputc>
    80007348:	fe0d12e3          	bnez	s10,8000732c <__printf+0x494>
    8000734c:	f8dff06f          	j	800072d8 <__printf+0x440>
    80007350:	f7843783          	ld	a5,-136(s0)
    80007354:	0007bc83          	ld	s9,0(a5)
    80007358:	00878793          	addi	a5,a5,8
    8000735c:	f6f43c23          	sd	a5,-136(s0)
    80007360:	000c9a63          	bnez	s9,80007374 <__printf+0x4dc>
    80007364:	1080006f          	j	8000746c <__printf+0x5d4>
    80007368:	001c8c93          	addi	s9,s9,1
    8000736c:	00000097          	auipc	ra,0x0
    80007370:	948080e7          	jalr	-1720(ra) # 80006cb4 <consputc>
    80007374:	000cc503          	lbu	a0,0(s9)
    80007378:	fe0518e3          	bnez	a0,80007368 <__printf+0x4d0>
    8000737c:	f5dff06f          	j	800072d8 <__printf+0x440>
    80007380:	02500513          	li	a0,37
    80007384:	00000097          	auipc	ra,0x0
    80007388:	930080e7          	jalr	-1744(ra) # 80006cb4 <consputc>
    8000738c:	000c8513          	mv	a0,s9
    80007390:	00000097          	auipc	ra,0x0
    80007394:	924080e7          	jalr	-1756(ra) # 80006cb4 <consputc>
    80007398:	f41ff06f          	j	800072d8 <__printf+0x440>
    8000739c:	02500513          	li	a0,37
    800073a0:	00000097          	auipc	ra,0x0
    800073a4:	914080e7          	jalr	-1772(ra) # 80006cb4 <consputc>
    800073a8:	f31ff06f          	j	800072d8 <__printf+0x440>
    800073ac:	00030513          	mv	a0,t1
    800073b0:	00000097          	auipc	ra,0x0
    800073b4:	7bc080e7          	jalr	1980(ra) # 80007b6c <acquire>
    800073b8:	b4dff06f          	j	80006f04 <__printf+0x6c>
    800073bc:	40c0053b          	negw	a0,a2
    800073c0:	00a00713          	li	a4,10
    800073c4:	02e576bb          	remuw	a3,a0,a4
    800073c8:	00002d97          	auipc	s11,0x2
    800073cc:	2c0d8d93          	addi	s11,s11,704 # 80009688 <digits>
    800073d0:	ff700593          	li	a1,-9
    800073d4:	02069693          	slli	a3,a3,0x20
    800073d8:	0206d693          	srli	a3,a3,0x20
    800073dc:	00dd86b3          	add	a3,s11,a3
    800073e0:	0006c683          	lbu	a3,0(a3)
    800073e4:	02e557bb          	divuw	a5,a0,a4
    800073e8:	f8d40023          	sb	a3,-128(s0)
    800073ec:	10b65e63          	bge	a2,a1,80007508 <__printf+0x670>
    800073f0:	06300593          	li	a1,99
    800073f4:	02e7f6bb          	remuw	a3,a5,a4
    800073f8:	02069693          	slli	a3,a3,0x20
    800073fc:	0206d693          	srli	a3,a3,0x20
    80007400:	00dd86b3          	add	a3,s11,a3
    80007404:	0006c683          	lbu	a3,0(a3)
    80007408:	02e7d73b          	divuw	a4,a5,a4
    8000740c:	00200793          	li	a5,2
    80007410:	f8d400a3          	sb	a3,-127(s0)
    80007414:	bca5ece3          	bltu	a1,a0,80006fec <__printf+0x154>
    80007418:	ce5ff06f          	j	800070fc <__printf+0x264>
    8000741c:	40e007bb          	negw	a5,a4
    80007420:	00002d97          	auipc	s11,0x2
    80007424:	268d8d93          	addi	s11,s11,616 # 80009688 <digits>
    80007428:	00f7f693          	andi	a3,a5,15
    8000742c:	00dd86b3          	add	a3,s11,a3
    80007430:	0006c583          	lbu	a1,0(a3)
    80007434:	ff100613          	li	a2,-15
    80007438:	0047d69b          	srliw	a3,a5,0x4
    8000743c:	f8b40023          	sb	a1,-128(s0)
    80007440:	0047d59b          	srliw	a1,a5,0x4
    80007444:	0ac75e63          	bge	a4,a2,80007500 <__printf+0x668>
    80007448:	00f6f693          	andi	a3,a3,15
    8000744c:	00dd86b3          	add	a3,s11,a3
    80007450:	0006c603          	lbu	a2,0(a3)
    80007454:	00f00693          	li	a3,15
    80007458:	0087d79b          	srliw	a5,a5,0x8
    8000745c:	f8c400a3          	sb	a2,-127(s0)
    80007460:	d8b6e4e3          	bltu	a3,a1,800071e8 <__printf+0x350>
    80007464:	00200793          	li	a5,2
    80007468:	e2dff06f          	j	80007294 <__printf+0x3fc>
    8000746c:	00002c97          	auipc	s9,0x2
    80007470:	1fcc8c93          	addi	s9,s9,508 # 80009668 <CONSOLE_STATUS+0x658>
    80007474:	02800513          	li	a0,40
    80007478:	ef1ff06f          	j	80007368 <__printf+0x4d0>
    8000747c:	00700793          	li	a5,7
    80007480:	00600c93          	li	s9,6
    80007484:	e0dff06f          	j	80007290 <__printf+0x3f8>
    80007488:	00700793          	li	a5,7
    8000748c:	00600c93          	li	s9,6
    80007490:	c69ff06f          	j	800070f8 <__printf+0x260>
    80007494:	00300793          	li	a5,3
    80007498:	00200c93          	li	s9,2
    8000749c:	c5dff06f          	j	800070f8 <__printf+0x260>
    800074a0:	00300793          	li	a5,3
    800074a4:	00200c93          	li	s9,2
    800074a8:	de9ff06f          	j	80007290 <__printf+0x3f8>
    800074ac:	00400793          	li	a5,4
    800074b0:	00300c93          	li	s9,3
    800074b4:	dddff06f          	j	80007290 <__printf+0x3f8>
    800074b8:	00400793          	li	a5,4
    800074bc:	00300c93          	li	s9,3
    800074c0:	c39ff06f          	j	800070f8 <__printf+0x260>
    800074c4:	00500793          	li	a5,5
    800074c8:	00400c93          	li	s9,4
    800074cc:	c2dff06f          	j	800070f8 <__printf+0x260>
    800074d0:	00500793          	li	a5,5
    800074d4:	00400c93          	li	s9,4
    800074d8:	db9ff06f          	j	80007290 <__printf+0x3f8>
    800074dc:	00600793          	li	a5,6
    800074e0:	00500c93          	li	s9,5
    800074e4:	dadff06f          	j	80007290 <__printf+0x3f8>
    800074e8:	00600793          	li	a5,6
    800074ec:	00500c93          	li	s9,5
    800074f0:	c09ff06f          	j	800070f8 <__printf+0x260>
    800074f4:	00800793          	li	a5,8
    800074f8:	00700c93          	li	s9,7
    800074fc:	bfdff06f          	j	800070f8 <__printf+0x260>
    80007500:	00100793          	li	a5,1
    80007504:	d91ff06f          	j	80007294 <__printf+0x3fc>
    80007508:	00100793          	li	a5,1
    8000750c:	bf1ff06f          	j	800070fc <__printf+0x264>
    80007510:	00900793          	li	a5,9
    80007514:	00800c93          	li	s9,8
    80007518:	be1ff06f          	j	800070f8 <__printf+0x260>
    8000751c:	00002517          	auipc	a0,0x2
    80007520:	15450513          	addi	a0,a0,340 # 80009670 <CONSOLE_STATUS+0x660>
    80007524:	00000097          	auipc	ra,0x0
    80007528:	918080e7          	jalr	-1768(ra) # 80006e3c <panic>

000000008000752c <printfinit>:
    8000752c:	fe010113          	addi	sp,sp,-32
    80007530:	00813823          	sd	s0,16(sp)
    80007534:	00913423          	sd	s1,8(sp)
    80007538:	00113c23          	sd	ra,24(sp)
    8000753c:	02010413          	addi	s0,sp,32
    80007540:	00005497          	auipc	s1,0x5
    80007544:	39048493          	addi	s1,s1,912 # 8000c8d0 <pr>
    80007548:	00048513          	mv	a0,s1
    8000754c:	00002597          	auipc	a1,0x2
    80007550:	13458593          	addi	a1,a1,308 # 80009680 <CONSOLE_STATUS+0x670>
    80007554:	00000097          	auipc	ra,0x0
    80007558:	5f4080e7          	jalr	1524(ra) # 80007b48 <initlock>
    8000755c:	01813083          	ld	ra,24(sp)
    80007560:	01013403          	ld	s0,16(sp)
    80007564:	0004ac23          	sw	zero,24(s1)
    80007568:	00813483          	ld	s1,8(sp)
    8000756c:	02010113          	addi	sp,sp,32
    80007570:	00008067          	ret

0000000080007574 <uartinit>:
    80007574:	ff010113          	addi	sp,sp,-16
    80007578:	00813423          	sd	s0,8(sp)
    8000757c:	01010413          	addi	s0,sp,16
    80007580:	100007b7          	lui	a5,0x10000
    80007584:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007588:	f8000713          	li	a4,-128
    8000758c:	00e781a3          	sb	a4,3(a5)
    80007590:	00300713          	li	a4,3
    80007594:	00e78023          	sb	a4,0(a5)
    80007598:	000780a3          	sb	zero,1(a5)
    8000759c:	00e781a3          	sb	a4,3(a5)
    800075a0:	00700693          	li	a3,7
    800075a4:	00d78123          	sb	a3,2(a5)
    800075a8:	00e780a3          	sb	a4,1(a5)
    800075ac:	00813403          	ld	s0,8(sp)
    800075b0:	01010113          	addi	sp,sp,16
    800075b4:	00008067          	ret

00000000800075b8 <uartputc>:
    800075b8:	00004797          	auipc	a5,0x4
    800075bc:	0407a783          	lw	a5,64(a5) # 8000b5f8 <panicked>
    800075c0:	00078463          	beqz	a5,800075c8 <uartputc+0x10>
    800075c4:	0000006f          	j	800075c4 <uartputc+0xc>
    800075c8:	fd010113          	addi	sp,sp,-48
    800075cc:	02813023          	sd	s0,32(sp)
    800075d0:	00913c23          	sd	s1,24(sp)
    800075d4:	01213823          	sd	s2,16(sp)
    800075d8:	01313423          	sd	s3,8(sp)
    800075dc:	02113423          	sd	ra,40(sp)
    800075e0:	03010413          	addi	s0,sp,48
    800075e4:	00004917          	auipc	s2,0x4
    800075e8:	01c90913          	addi	s2,s2,28 # 8000b600 <uart_tx_r>
    800075ec:	00093783          	ld	a5,0(s2)
    800075f0:	00004497          	auipc	s1,0x4
    800075f4:	01848493          	addi	s1,s1,24 # 8000b608 <uart_tx_w>
    800075f8:	0004b703          	ld	a4,0(s1)
    800075fc:	02078693          	addi	a3,a5,32
    80007600:	00050993          	mv	s3,a0
    80007604:	02e69c63          	bne	a3,a4,8000763c <uartputc+0x84>
    80007608:	00001097          	auipc	ra,0x1
    8000760c:	834080e7          	jalr	-1996(ra) # 80007e3c <push_on>
    80007610:	00093783          	ld	a5,0(s2)
    80007614:	0004b703          	ld	a4,0(s1)
    80007618:	02078793          	addi	a5,a5,32
    8000761c:	00e79463          	bne	a5,a4,80007624 <uartputc+0x6c>
    80007620:	0000006f          	j	80007620 <uartputc+0x68>
    80007624:	00001097          	auipc	ra,0x1
    80007628:	88c080e7          	jalr	-1908(ra) # 80007eb0 <pop_on>
    8000762c:	00093783          	ld	a5,0(s2)
    80007630:	0004b703          	ld	a4,0(s1)
    80007634:	02078693          	addi	a3,a5,32
    80007638:	fce688e3          	beq	a3,a4,80007608 <uartputc+0x50>
    8000763c:	01f77693          	andi	a3,a4,31
    80007640:	00005597          	auipc	a1,0x5
    80007644:	2b058593          	addi	a1,a1,688 # 8000c8f0 <uart_tx_buf>
    80007648:	00d586b3          	add	a3,a1,a3
    8000764c:	00170713          	addi	a4,a4,1
    80007650:	01368023          	sb	s3,0(a3)
    80007654:	00e4b023          	sd	a4,0(s1)
    80007658:	10000637          	lui	a2,0x10000
    8000765c:	02f71063          	bne	a4,a5,8000767c <uartputc+0xc4>
    80007660:	0340006f          	j	80007694 <uartputc+0xdc>
    80007664:	00074703          	lbu	a4,0(a4)
    80007668:	00f93023          	sd	a5,0(s2)
    8000766c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007670:	00093783          	ld	a5,0(s2)
    80007674:	0004b703          	ld	a4,0(s1)
    80007678:	00f70e63          	beq	a4,a5,80007694 <uartputc+0xdc>
    8000767c:	00564683          	lbu	a3,5(a2)
    80007680:	01f7f713          	andi	a4,a5,31
    80007684:	00e58733          	add	a4,a1,a4
    80007688:	0206f693          	andi	a3,a3,32
    8000768c:	00178793          	addi	a5,a5,1
    80007690:	fc069ae3          	bnez	a3,80007664 <uartputc+0xac>
    80007694:	02813083          	ld	ra,40(sp)
    80007698:	02013403          	ld	s0,32(sp)
    8000769c:	01813483          	ld	s1,24(sp)
    800076a0:	01013903          	ld	s2,16(sp)
    800076a4:	00813983          	ld	s3,8(sp)
    800076a8:	03010113          	addi	sp,sp,48
    800076ac:	00008067          	ret

00000000800076b0 <uartputc_sync>:
    800076b0:	ff010113          	addi	sp,sp,-16
    800076b4:	00813423          	sd	s0,8(sp)
    800076b8:	01010413          	addi	s0,sp,16
    800076bc:	00004717          	auipc	a4,0x4
    800076c0:	f3c72703          	lw	a4,-196(a4) # 8000b5f8 <panicked>
    800076c4:	02071663          	bnez	a4,800076f0 <uartputc_sync+0x40>
    800076c8:	00050793          	mv	a5,a0
    800076cc:	100006b7          	lui	a3,0x10000
    800076d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800076d4:	02077713          	andi	a4,a4,32
    800076d8:	fe070ce3          	beqz	a4,800076d0 <uartputc_sync+0x20>
    800076dc:	0ff7f793          	andi	a5,a5,255
    800076e0:	00f68023          	sb	a5,0(a3)
    800076e4:	00813403          	ld	s0,8(sp)
    800076e8:	01010113          	addi	sp,sp,16
    800076ec:	00008067          	ret
    800076f0:	0000006f          	j	800076f0 <uartputc_sync+0x40>

00000000800076f4 <uartstart>:
    800076f4:	ff010113          	addi	sp,sp,-16
    800076f8:	00813423          	sd	s0,8(sp)
    800076fc:	01010413          	addi	s0,sp,16
    80007700:	00004617          	auipc	a2,0x4
    80007704:	f0060613          	addi	a2,a2,-256 # 8000b600 <uart_tx_r>
    80007708:	00004517          	auipc	a0,0x4
    8000770c:	f0050513          	addi	a0,a0,-256 # 8000b608 <uart_tx_w>
    80007710:	00063783          	ld	a5,0(a2)
    80007714:	00053703          	ld	a4,0(a0)
    80007718:	04f70263          	beq	a4,a5,8000775c <uartstart+0x68>
    8000771c:	100005b7          	lui	a1,0x10000
    80007720:	00005817          	auipc	a6,0x5
    80007724:	1d080813          	addi	a6,a6,464 # 8000c8f0 <uart_tx_buf>
    80007728:	01c0006f          	j	80007744 <uartstart+0x50>
    8000772c:	0006c703          	lbu	a4,0(a3)
    80007730:	00f63023          	sd	a5,0(a2)
    80007734:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007738:	00063783          	ld	a5,0(a2)
    8000773c:	00053703          	ld	a4,0(a0)
    80007740:	00f70e63          	beq	a4,a5,8000775c <uartstart+0x68>
    80007744:	01f7f713          	andi	a4,a5,31
    80007748:	00e806b3          	add	a3,a6,a4
    8000774c:	0055c703          	lbu	a4,5(a1)
    80007750:	00178793          	addi	a5,a5,1
    80007754:	02077713          	andi	a4,a4,32
    80007758:	fc071ae3          	bnez	a4,8000772c <uartstart+0x38>
    8000775c:	00813403          	ld	s0,8(sp)
    80007760:	01010113          	addi	sp,sp,16
    80007764:	00008067          	ret

0000000080007768 <uartgetc>:
    80007768:	ff010113          	addi	sp,sp,-16
    8000776c:	00813423          	sd	s0,8(sp)
    80007770:	01010413          	addi	s0,sp,16
    80007774:	10000737          	lui	a4,0x10000
    80007778:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000777c:	0017f793          	andi	a5,a5,1
    80007780:	00078c63          	beqz	a5,80007798 <uartgetc+0x30>
    80007784:	00074503          	lbu	a0,0(a4)
    80007788:	0ff57513          	andi	a0,a0,255
    8000778c:	00813403          	ld	s0,8(sp)
    80007790:	01010113          	addi	sp,sp,16
    80007794:	00008067          	ret
    80007798:	fff00513          	li	a0,-1
    8000779c:	ff1ff06f          	j	8000778c <uartgetc+0x24>

00000000800077a0 <uartintr>:
    800077a0:	100007b7          	lui	a5,0x10000
    800077a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800077a8:	0017f793          	andi	a5,a5,1
    800077ac:	0a078463          	beqz	a5,80007854 <uartintr+0xb4>
    800077b0:	fe010113          	addi	sp,sp,-32
    800077b4:	00813823          	sd	s0,16(sp)
    800077b8:	00913423          	sd	s1,8(sp)
    800077bc:	00113c23          	sd	ra,24(sp)
    800077c0:	02010413          	addi	s0,sp,32
    800077c4:	100004b7          	lui	s1,0x10000
    800077c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800077cc:	0ff57513          	andi	a0,a0,255
    800077d0:	fffff097          	auipc	ra,0xfffff
    800077d4:	534080e7          	jalr	1332(ra) # 80006d04 <consoleintr>
    800077d8:	0054c783          	lbu	a5,5(s1)
    800077dc:	0017f793          	andi	a5,a5,1
    800077e0:	fe0794e3          	bnez	a5,800077c8 <uartintr+0x28>
    800077e4:	00004617          	auipc	a2,0x4
    800077e8:	e1c60613          	addi	a2,a2,-484 # 8000b600 <uart_tx_r>
    800077ec:	00004517          	auipc	a0,0x4
    800077f0:	e1c50513          	addi	a0,a0,-484 # 8000b608 <uart_tx_w>
    800077f4:	00063783          	ld	a5,0(a2)
    800077f8:	00053703          	ld	a4,0(a0)
    800077fc:	04f70263          	beq	a4,a5,80007840 <uartintr+0xa0>
    80007800:	100005b7          	lui	a1,0x10000
    80007804:	00005817          	auipc	a6,0x5
    80007808:	0ec80813          	addi	a6,a6,236 # 8000c8f0 <uart_tx_buf>
    8000780c:	01c0006f          	j	80007828 <uartintr+0x88>
    80007810:	0006c703          	lbu	a4,0(a3)
    80007814:	00f63023          	sd	a5,0(a2)
    80007818:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000781c:	00063783          	ld	a5,0(a2)
    80007820:	00053703          	ld	a4,0(a0)
    80007824:	00f70e63          	beq	a4,a5,80007840 <uartintr+0xa0>
    80007828:	01f7f713          	andi	a4,a5,31
    8000782c:	00e806b3          	add	a3,a6,a4
    80007830:	0055c703          	lbu	a4,5(a1)
    80007834:	00178793          	addi	a5,a5,1
    80007838:	02077713          	andi	a4,a4,32
    8000783c:	fc071ae3          	bnez	a4,80007810 <uartintr+0x70>
    80007840:	01813083          	ld	ra,24(sp)
    80007844:	01013403          	ld	s0,16(sp)
    80007848:	00813483          	ld	s1,8(sp)
    8000784c:	02010113          	addi	sp,sp,32
    80007850:	00008067          	ret
    80007854:	00004617          	auipc	a2,0x4
    80007858:	dac60613          	addi	a2,a2,-596 # 8000b600 <uart_tx_r>
    8000785c:	00004517          	auipc	a0,0x4
    80007860:	dac50513          	addi	a0,a0,-596 # 8000b608 <uart_tx_w>
    80007864:	00063783          	ld	a5,0(a2)
    80007868:	00053703          	ld	a4,0(a0)
    8000786c:	04f70263          	beq	a4,a5,800078b0 <uartintr+0x110>
    80007870:	100005b7          	lui	a1,0x10000
    80007874:	00005817          	auipc	a6,0x5
    80007878:	07c80813          	addi	a6,a6,124 # 8000c8f0 <uart_tx_buf>
    8000787c:	01c0006f          	j	80007898 <uartintr+0xf8>
    80007880:	0006c703          	lbu	a4,0(a3)
    80007884:	00f63023          	sd	a5,0(a2)
    80007888:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000788c:	00063783          	ld	a5,0(a2)
    80007890:	00053703          	ld	a4,0(a0)
    80007894:	02f70063          	beq	a4,a5,800078b4 <uartintr+0x114>
    80007898:	01f7f713          	andi	a4,a5,31
    8000789c:	00e806b3          	add	a3,a6,a4
    800078a0:	0055c703          	lbu	a4,5(a1)
    800078a4:	00178793          	addi	a5,a5,1
    800078a8:	02077713          	andi	a4,a4,32
    800078ac:	fc071ae3          	bnez	a4,80007880 <uartintr+0xe0>
    800078b0:	00008067          	ret
    800078b4:	00008067          	ret

00000000800078b8 <kinit>:
    800078b8:	fc010113          	addi	sp,sp,-64
    800078bc:	02913423          	sd	s1,40(sp)
    800078c0:	fffff7b7          	lui	a5,0xfffff
    800078c4:	00006497          	auipc	s1,0x6
    800078c8:	04b48493          	addi	s1,s1,75 # 8000d90f <end+0xfff>
    800078cc:	02813823          	sd	s0,48(sp)
    800078d0:	01313c23          	sd	s3,24(sp)
    800078d4:	00f4f4b3          	and	s1,s1,a5
    800078d8:	02113c23          	sd	ra,56(sp)
    800078dc:	03213023          	sd	s2,32(sp)
    800078e0:	01413823          	sd	s4,16(sp)
    800078e4:	01513423          	sd	s5,8(sp)
    800078e8:	04010413          	addi	s0,sp,64
    800078ec:	000017b7          	lui	a5,0x1
    800078f0:	01100993          	li	s3,17
    800078f4:	00f487b3          	add	a5,s1,a5
    800078f8:	01b99993          	slli	s3,s3,0x1b
    800078fc:	06f9e063          	bltu	s3,a5,8000795c <kinit+0xa4>
    80007900:	00005a97          	auipc	s5,0x5
    80007904:	010a8a93          	addi	s5,s5,16 # 8000c910 <end>
    80007908:	0754ec63          	bltu	s1,s5,80007980 <kinit+0xc8>
    8000790c:	0734fa63          	bgeu	s1,s3,80007980 <kinit+0xc8>
    80007910:	00088a37          	lui	s4,0x88
    80007914:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007918:	00004917          	auipc	s2,0x4
    8000791c:	cf890913          	addi	s2,s2,-776 # 8000b610 <kmem>
    80007920:	00ca1a13          	slli	s4,s4,0xc
    80007924:	0140006f          	j	80007938 <kinit+0x80>
    80007928:	000017b7          	lui	a5,0x1
    8000792c:	00f484b3          	add	s1,s1,a5
    80007930:	0554e863          	bltu	s1,s5,80007980 <kinit+0xc8>
    80007934:	0534f663          	bgeu	s1,s3,80007980 <kinit+0xc8>
    80007938:	00001637          	lui	a2,0x1
    8000793c:	00100593          	li	a1,1
    80007940:	00048513          	mv	a0,s1
    80007944:	00000097          	auipc	ra,0x0
    80007948:	5e4080e7          	jalr	1508(ra) # 80007f28 <__memset>
    8000794c:	00093783          	ld	a5,0(s2)
    80007950:	00f4b023          	sd	a5,0(s1)
    80007954:	00993023          	sd	s1,0(s2)
    80007958:	fd4498e3          	bne	s1,s4,80007928 <kinit+0x70>
    8000795c:	03813083          	ld	ra,56(sp)
    80007960:	03013403          	ld	s0,48(sp)
    80007964:	02813483          	ld	s1,40(sp)
    80007968:	02013903          	ld	s2,32(sp)
    8000796c:	01813983          	ld	s3,24(sp)
    80007970:	01013a03          	ld	s4,16(sp)
    80007974:	00813a83          	ld	s5,8(sp)
    80007978:	04010113          	addi	sp,sp,64
    8000797c:	00008067          	ret
    80007980:	00002517          	auipc	a0,0x2
    80007984:	d2050513          	addi	a0,a0,-736 # 800096a0 <digits+0x18>
    80007988:	fffff097          	auipc	ra,0xfffff
    8000798c:	4b4080e7          	jalr	1204(ra) # 80006e3c <panic>

0000000080007990 <freerange>:
    80007990:	fc010113          	addi	sp,sp,-64
    80007994:	000017b7          	lui	a5,0x1
    80007998:	02913423          	sd	s1,40(sp)
    8000799c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800079a0:	009504b3          	add	s1,a0,s1
    800079a4:	fffff537          	lui	a0,0xfffff
    800079a8:	02813823          	sd	s0,48(sp)
    800079ac:	02113c23          	sd	ra,56(sp)
    800079b0:	03213023          	sd	s2,32(sp)
    800079b4:	01313c23          	sd	s3,24(sp)
    800079b8:	01413823          	sd	s4,16(sp)
    800079bc:	01513423          	sd	s5,8(sp)
    800079c0:	01613023          	sd	s6,0(sp)
    800079c4:	04010413          	addi	s0,sp,64
    800079c8:	00a4f4b3          	and	s1,s1,a0
    800079cc:	00f487b3          	add	a5,s1,a5
    800079d0:	06f5e463          	bltu	a1,a5,80007a38 <freerange+0xa8>
    800079d4:	00005a97          	auipc	s5,0x5
    800079d8:	f3ca8a93          	addi	s5,s5,-196 # 8000c910 <end>
    800079dc:	0954e263          	bltu	s1,s5,80007a60 <freerange+0xd0>
    800079e0:	01100993          	li	s3,17
    800079e4:	01b99993          	slli	s3,s3,0x1b
    800079e8:	0734fc63          	bgeu	s1,s3,80007a60 <freerange+0xd0>
    800079ec:	00058a13          	mv	s4,a1
    800079f0:	00004917          	auipc	s2,0x4
    800079f4:	c2090913          	addi	s2,s2,-992 # 8000b610 <kmem>
    800079f8:	00002b37          	lui	s6,0x2
    800079fc:	0140006f          	j	80007a10 <freerange+0x80>
    80007a00:	000017b7          	lui	a5,0x1
    80007a04:	00f484b3          	add	s1,s1,a5
    80007a08:	0554ec63          	bltu	s1,s5,80007a60 <freerange+0xd0>
    80007a0c:	0534fa63          	bgeu	s1,s3,80007a60 <freerange+0xd0>
    80007a10:	00001637          	lui	a2,0x1
    80007a14:	00100593          	li	a1,1
    80007a18:	00048513          	mv	a0,s1
    80007a1c:	00000097          	auipc	ra,0x0
    80007a20:	50c080e7          	jalr	1292(ra) # 80007f28 <__memset>
    80007a24:	00093703          	ld	a4,0(s2)
    80007a28:	016487b3          	add	a5,s1,s6
    80007a2c:	00e4b023          	sd	a4,0(s1)
    80007a30:	00993023          	sd	s1,0(s2)
    80007a34:	fcfa76e3          	bgeu	s4,a5,80007a00 <freerange+0x70>
    80007a38:	03813083          	ld	ra,56(sp)
    80007a3c:	03013403          	ld	s0,48(sp)
    80007a40:	02813483          	ld	s1,40(sp)
    80007a44:	02013903          	ld	s2,32(sp)
    80007a48:	01813983          	ld	s3,24(sp)
    80007a4c:	01013a03          	ld	s4,16(sp)
    80007a50:	00813a83          	ld	s5,8(sp)
    80007a54:	00013b03          	ld	s6,0(sp)
    80007a58:	04010113          	addi	sp,sp,64
    80007a5c:	00008067          	ret
    80007a60:	00002517          	auipc	a0,0x2
    80007a64:	c4050513          	addi	a0,a0,-960 # 800096a0 <digits+0x18>
    80007a68:	fffff097          	auipc	ra,0xfffff
    80007a6c:	3d4080e7          	jalr	980(ra) # 80006e3c <panic>

0000000080007a70 <kfree>:
    80007a70:	fe010113          	addi	sp,sp,-32
    80007a74:	00813823          	sd	s0,16(sp)
    80007a78:	00113c23          	sd	ra,24(sp)
    80007a7c:	00913423          	sd	s1,8(sp)
    80007a80:	02010413          	addi	s0,sp,32
    80007a84:	03451793          	slli	a5,a0,0x34
    80007a88:	04079c63          	bnez	a5,80007ae0 <kfree+0x70>
    80007a8c:	00005797          	auipc	a5,0x5
    80007a90:	e8478793          	addi	a5,a5,-380 # 8000c910 <end>
    80007a94:	00050493          	mv	s1,a0
    80007a98:	04f56463          	bltu	a0,a5,80007ae0 <kfree+0x70>
    80007a9c:	01100793          	li	a5,17
    80007aa0:	01b79793          	slli	a5,a5,0x1b
    80007aa4:	02f57e63          	bgeu	a0,a5,80007ae0 <kfree+0x70>
    80007aa8:	00001637          	lui	a2,0x1
    80007aac:	00100593          	li	a1,1
    80007ab0:	00000097          	auipc	ra,0x0
    80007ab4:	478080e7          	jalr	1144(ra) # 80007f28 <__memset>
    80007ab8:	00004797          	auipc	a5,0x4
    80007abc:	b5878793          	addi	a5,a5,-1192 # 8000b610 <kmem>
    80007ac0:	0007b703          	ld	a4,0(a5)
    80007ac4:	01813083          	ld	ra,24(sp)
    80007ac8:	01013403          	ld	s0,16(sp)
    80007acc:	00e4b023          	sd	a4,0(s1)
    80007ad0:	0097b023          	sd	s1,0(a5)
    80007ad4:	00813483          	ld	s1,8(sp)
    80007ad8:	02010113          	addi	sp,sp,32
    80007adc:	00008067          	ret
    80007ae0:	00002517          	auipc	a0,0x2
    80007ae4:	bc050513          	addi	a0,a0,-1088 # 800096a0 <digits+0x18>
    80007ae8:	fffff097          	auipc	ra,0xfffff
    80007aec:	354080e7          	jalr	852(ra) # 80006e3c <panic>

0000000080007af0 <kalloc>:
    80007af0:	fe010113          	addi	sp,sp,-32
    80007af4:	00813823          	sd	s0,16(sp)
    80007af8:	00913423          	sd	s1,8(sp)
    80007afc:	00113c23          	sd	ra,24(sp)
    80007b00:	02010413          	addi	s0,sp,32
    80007b04:	00004797          	auipc	a5,0x4
    80007b08:	b0c78793          	addi	a5,a5,-1268 # 8000b610 <kmem>
    80007b0c:	0007b483          	ld	s1,0(a5)
    80007b10:	02048063          	beqz	s1,80007b30 <kalloc+0x40>
    80007b14:	0004b703          	ld	a4,0(s1)
    80007b18:	00001637          	lui	a2,0x1
    80007b1c:	00500593          	li	a1,5
    80007b20:	00048513          	mv	a0,s1
    80007b24:	00e7b023          	sd	a4,0(a5)
    80007b28:	00000097          	auipc	ra,0x0
    80007b2c:	400080e7          	jalr	1024(ra) # 80007f28 <__memset>
    80007b30:	01813083          	ld	ra,24(sp)
    80007b34:	01013403          	ld	s0,16(sp)
    80007b38:	00048513          	mv	a0,s1
    80007b3c:	00813483          	ld	s1,8(sp)
    80007b40:	02010113          	addi	sp,sp,32
    80007b44:	00008067          	ret

0000000080007b48 <initlock>:
    80007b48:	ff010113          	addi	sp,sp,-16
    80007b4c:	00813423          	sd	s0,8(sp)
    80007b50:	01010413          	addi	s0,sp,16
    80007b54:	00813403          	ld	s0,8(sp)
    80007b58:	00b53423          	sd	a1,8(a0)
    80007b5c:	00052023          	sw	zero,0(a0)
    80007b60:	00053823          	sd	zero,16(a0)
    80007b64:	01010113          	addi	sp,sp,16
    80007b68:	00008067          	ret

0000000080007b6c <acquire>:
    80007b6c:	fe010113          	addi	sp,sp,-32
    80007b70:	00813823          	sd	s0,16(sp)
    80007b74:	00913423          	sd	s1,8(sp)
    80007b78:	00113c23          	sd	ra,24(sp)
    80007b7c:	01213023          	sd	s2,0(sp)
    80007b80:	02010413          	addi	s0,sp,32
    80007b84:	00050493          	mv	s1,a0
    80007b88:	10002973          	csrr	s2,sstatus
    80007b8c:	100027f3          	csrr	a5,sstatus
    80007b90:	ffd7f793          	andi	a5,a5,-3
    80007b94:	10079073          	csrw	sstatus,a5
    80007b98:	fffff097          	auipc	ra,0xfffff
    80007b9c:	8e0080e7          	jalr	-1824(ra) # 80006478 <mycpu>
    80007ba0:	07852783          	lw	a5,120(a0)
    80007ba4:	06078e63          	beqz	a5,80007c20 <acquire+0xb4>
    80007ba8:	fffff097          	auipc	ra,0xfffff
    80007bac:	8d0080e7          	jalr	-1840(ra) # 80006478 <mycpu>
    80007bb0:	07852783          	lw	a5,120(a0)
    80007bb4:	0004a703          	lw	a4,0(s1)
    80007bb8:	0017879b          	addiw	a5,a5,1
    80007bbc:	06f52c23          	sw	a5,120(a0)
    80007bc0:	04071063          	bnez	a4,80007c00 <acquire+0x94>
    80007bc4:	00100713          	li	a4,1
    80007bc8:	00070793          	mv	a5,a4
    80007bcc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007bd0:	0007879b          	sext.w	a5,a5
    80007bd4:	fe079ae3          	bnez	a5,80007bc8 <acquire+0x5c>
    80007bd8:	0ff0000f          	fence
    80007bdc:	fffff097          	auipc	ra,0xfffff
    80007be0:	89c080e7          	jalr	-1892(ra) # 80006478 <mycpu>
    80007be4:	01813083          	ld	ra,24(sp)
    80007be8:	01013403          	ld	s0,16(sp)
    80007bec:	00a4b823          	sd	a0,16(s1)
    80007bf0:	00013903          	ld	s2,0(sp)
    80007bf4:	00813483          	ld	s1,8(sp)
    80007bf8:	02010113          	addi	sp,sp,32
    80007bfc:	00008067          	ret
    80007c00:	0104b903          	ld	s2,16(s1)
    80007c04:	fffff097          	auipc	ra,0xfffff
    80007c08:	874080e7          	jalr	-1932(ra) # 80006478 <mycpu>
    80007c0c:	faa91ce3          	bne	s2,a0,80007bc4 <acquire+0x58>
    80007c10:	00002517          	auipc	a0,0x2
    80007c14:	a9850513          	addi	a0,a0,-1384 # 800096a8 <digits+0x20>
    80007c18:	fffff097          	auipc	ra,0xfffff
    80007c1c:	224080e7          	jalr	548(ra) # 80006e3c <panic>
    80007c20:	00195913          	srli	s2,s2,0x1
    80007c24:	fffff097          	auipc	ra,0xfffff
    80007c28:	854080e7          	jalr	-1964(ra) # 80006478 <mycpu>
    80007c2c:	00197913          	andi	s2,s2,1
    80007c30:	07252e23          	sw	s2,124(a0)
    80007c34:	f75ff06f          	j	80007ba8 <acquire+0x3c>

0000000080007c38 <release>:
    80007c38:	fe010113          	addi	sp,sp,-32
    80007c3c:	00813823          	sd	s0,16(sp)
    80007c40:	00113c23          	sd	ra,24(sp)
    80007c44:	00913423          	sd	s1,8(sp)
    80007c48:	01213023          	sd	s2,0(sp)
    80007c4c:	02010413          	addi	s0,sp,32
    80007c50:	00052783          	lw	a5,0(a0)
    80007c54:	00079a63          	bnez	a5,80007c68 <release+0x30>
    80007c58:	00002517          	auipc	a0,0x2
    80007c5c:	a5850513          	addi	a0,a0,-1448 # 800096b0 <digits+0x28>
    80007c60:	fffff097          	auipc	ra,0xfffff
    80007c64:	1dc080e7          	jalr	476(ra) # 80006e3c <panic>
    80007c68:	01053903          	ld	s2,16(a0)
    80007c6c:	00050493          	mv	s1,a0
    80007c70:	fffff097          	auipc	ra,0xfffff
    80007c74:	808080e7          	jalr	-2040(ra) # 80006478 <mycpu>
    80007c78:	fea910e3          	bne	s2,a0,80007c58 <release+0x20>
    80007c7c:	0004b823          	sd	zero,16(s1)
    80007c80:	0ff0000f          	fence
    80007c84:	0f50000f          	fence	iorw,ow
    80007c88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80007c8c:	ffffe097          	auipc	ra,0xffffe
    80007c90:	7ec080e7          	jalr	2028(ra) # 80006478 <mycpu>
    80007c94:	100027f3          	csrr	a5,sstatus
    80007c98:	0027f793          	andi	a5,a5,2
    80007c9c:	04079a63          	bnez	a5,80007cf0 <release+0xb8>
    80007ca0:	07852783          	lw	a5,120(a0)
    80007ca4:	02f05e63          	blez	a5,80007ce0 <release+0xa8>
    80007ca8:	fff7871b          	addiw	a4,a5,-1
    80007cac:	06e52c23          	sw	a4,120(a0)
    80007cb0:	00071c63          	bnez	a4,80007cc8 <release+0x90>
    80007cb4:	07c52783          	lw	a5,124(a0)
    80007cb8:	00078863          	beqz	a5,80007cc8 <release+0x90>
    80007cbc:	100027f3          	csrr	a5,sstatus
    80007cc0:	0027e793          	ori	a5,a5,2
    80007cc4:	10079073          	csrw	sstatus,a5
    80007cc8:	01813083          	ld	ra,24(sp)
    80007ccc:	01013403          	ld	s0,16(sp)
    80007cd0:	00813483          	ld	s1,8(sp)
    80007cd4:	00013903          	ld	s2,0(sp)
    80007cd8:	02010113          	addi	sp,sp,32
    80007cdc:	00008067          	ret
    80007ce0:	00002517          	auipc	a0,0x2
    80007ce4:	9f050513          	addi	a0,a0,-1552 # 800096d0 <digits+0x48>
    80007ce8:	fffff097          	auipc	ra,0xfffff
    80007cec:	154080e7          	jalr	340(ra) # 80006e3c <panic>
    80007cf0:	00002517          	auipc	a0,0x2
    80007cf4:	9c850513          	addi	a0,a0,-1592 # 800096b8 <digits+0x30>
    80007cf8:	fffff097          	auipc	ra,0xfffff
    80007cfc:	144080e7          	jalr	324(ra) # 80006e3c <panic>

0000000080007d00 <holding>:
    80007d00:	00052783          	lw	a5,0(a0)
    80007d04:	00079663          	bnez	a5,80007d10 <holding+0x10>
    80007d08:	00000513          	li	a0,0
    80007d0c:	00008067          	ret
    80007d10:	fe010113          	addi	sp,sp,-32
    80007d14:	00813823          	sd	s0,16(sp)
    80007d18:	00913423          	sd	s1,8(sp)
    80007d1c:	00113c23          	sd	ra,24(sp)
    80007d20:	02010413          	addi	s0,sp,32
    80007d24:	01053483          	ld	s1,16(a0)
    80007d28:	ffffe097          	auipc	ra,0xffffe
    80007d2c:	750080e7          	jalr	1872(ra) # 80006478 <mycpu>
    80007d30:	01813083          	ld	ra,24(sp)
    80007d34:	01013403          	ld	s0,16(sp)
    80007d38:	40a48533          	sub	a0,s1,a0
    80007d3c:	00153513          	seqz	a0,a0
    80007d40:	00813483          	ld	s1,8(sp)
    80007d44:	02010113          	addi	sp,sp,32
    80007d48:	00008067          	ret

0000000080007d4c <push_off>:
    80007d4c:	fe010113          	addi	sp,sp,-32
    80007d50:	00813823          	sd	s0,16(sp)
    80007d54:	00113c23          	sd	ra,24(sp)
    80007d58:	00913423          	sd	s1,8(sp)
    80007d5c:	02010413          	addi	s0,sp,32
    80007d60:	100024f3          	csrr	s1,sstatus
    80007d64:	100027f3          	csrr	a5,sstatus
    80007d68:	ffd7f793          	andi	a5,a5,-3
    80007d6c:	10079073          	csrw	sstatus,a5
    80007d70:	ffffe097          	auipc	ra,0xffffe
    80007d74:	708080e7          	jalr	1800(ra) # 80006478 <mycpu>
    80007d78:	07852783          	lw	a5,120(a0)
    80007d7c:	02078663          	beqz	a5,80007da8 <push_off+0x5c>
    80007d80:	ffffe097          	auipc	ra,0xffffe
    80007d84:	6f8080e7          	jalr	1784(ra) # 80006478 <mycpu>
    80007d88:	07852783          	lw	a5,120(a0)
    80007d8c:	01813083          	ld	ra,24(sp)
    80007d90:	01013403          	ld	s0,16(sp)
    80007d94:	0017879b          	addiw	a5,a5,1
    80007d98:	06f52c23          	sw	a5,120(a0)
    80007d9c:	00813483          	ld	s1,8(sp)
    80007da0:	02010113          	addi	sp,sp,32
    80007da4:	00008067          	ret
    80007da8:	0014d493          	srli	s1,s1,0x1
    80007dac:	ffffe097          	auipc	ra,0xffffe
    80007db0:	6cc080e7          	jalr	1740(ra) # 80006478 <mycpu>
    80007db4:	0014f493          	andi	s1,s1,1
    80007db8:	06952e23          	sw	s1,124(a0)
    80007dbc:	fc5ff06f          	j	80007d80 <push_off+0x34>

0000000080007dc0 <pop_off>:
    80007dc0:	ff010113          	addi	sp,sp,-16
    80007dc4:	00813023          	sd	s0,0(sp)
    80007dc8:	00113423          	sd	ra,8(sp)
    80007dcc:	01010413          	addi	s0,sp,16
    80007dd0:	ffffe097          	auipc	ra,0xffffe
    80007dd4:	6a8080e7          	jalr	1704(ra) # 80006478 <mycpu>
    80007dd8:	100027f3          	csrr	a5,sstatus
    80007ddc:	0027f793          	andi	a5,a5,2
    80007de0:	04079663          	bnez	a5,80007e2c <pop_off+0x6c>
    80007de4:	07852783          	lw	a5,120(a0)
    80007de8:	02f05a63          	blez	a5,80007e1c <pop_off+0x5c>
    80007dec:	fff7871b          	addiw	a4,a5,-1
    80007df0:	06e52c23          	sw	a4,120(a0)
    80007df4:	00071c63          	bnez	a4,80007e0c <pop_off+0x4c>
    80007df8:	07c52783          	lw	a5,124(a0)
    80007dfc:	00078863          	beqz	a5,80007e0c <pop_off+0x4c>
    80007e00:	100027f3          	csrr	a5,sstatus
    80007e04:	0027e793          	ori	a5,a5,2
    80007e08:	10079073          	csrw	sstatus,a5
    80007e0c:	00813083          	ld	ra,8(sp)
    80007e10:	00013403          	ld	s0,0(sp)
    80007e14:	01010113          	addi	sp,sp,16
    80007e18:	00008067          	ret
    80007e1c:	00002517          	auipc	a0,0x2
    80007e20:	8b450513          	addi	a0,a0,-1868 # 800096d0 <digits+0x48>
    80007e24:	fffff097          	auipc	ra,0xfffff
    80007e28:	018080e7          	jalr	24(ra) # 80006e3c <panic>
    80007e2c:	00002517          	auipc	a0,0x2
    80007e30:	88c50513          	addi	a0,a0,-1908 # 800096b8 <digits+0x30>
    80007e34:	fffff097          	auipc	ra,0xfffff
    80007e38:	008080e7          	jalr	8(ra) # 80006e3c <panic>

0000000080007e3c <push_on>:
    80007e3c:	fe010113          	addi	sp,sp,-32
    80007e40:	00813823          	sd	s0,16(sp)
    80007e44:	00113c23          	sd	ra,24(sp)
    80007e48:	00913423          	sd	s1,8(sp)
    80007e4c:	02010413          	addi	s0,sp,32
    80007e50:	100024f3          	csrr	s1,sstatus
    80007e54:	100027f3          	csrr	a5,sstatus
    80007e58:	0027e793          	ori	a5,a5,2
    80007e5c:	10079073          	csrw	sstatus,a5
    80007e60:	ffffe097          	auipc	ra,0xffffe
    80007e64:	618080e7          	jalr	1560(ra) # 80006478 <mycpu>
    80007e68:	07852783          	lw	a5,120(a0)
    80007e6c:	02078663          	beqz	a5,80007e98 <push_on+0x5c>
    80007e70:	ffffe097          	auipc	ra,0xffffe
    80007e74:	608080e7          	jalr	1544(ra) # 80006478 <mycpu>
    80007e78:	07852783          	lw	a5,120(a0)
    80007e7c:	01813083          	ld	ra,24(sp)
    80007e80:	01013403          	ld	s0,16(sp)
    80007e84:	0017879b          	addiw	a5,a5,1
    80007e88:	06f52c23          	sw	a5,120(a0)
    80007e8c:	00813483          	ld	s1,8(sp)
    80007e90:	02010113          	addi	sp,sp,32
    80007e94:	00008067          	ret
    80007e98:	0014d493          	srli	s1,s1,0x1
    80007e9c:	ffffe097          	auipc	ra,0xffffe
    80007ea0:	5dc080e7          	jalr	1500(ra) # 80006478 <mycpu>
    80007ea4:	0014f493          	andi	s1,s1,1
    80007ea8:	06952e23          	sw	s1,124(a0)
    80007eac:	fc5ff06f          	j	80007e70 <push_on+0x34>

0000000080007eb0 <pop_on>:
    80007eb0:	ff010113          	addi	sp,sp,-16
    80007eb4:	00813023          	sd	s0,0(sp)
    80007eb8:	00113423          	sd	ra,8(sp)
    80007ebc:	01010413          	addi	s0,sp,16
    80007ec0:	ffffe097          	auipc	ra,0xffffe
    80007ec4:	5b8080e7          	jalr	1464(ra) # 80006478 <mycpu>
    80007ec8:	100027f3          	csrr	a5,sstatus
    80007ecc:	0027f793          	andi	a5,a5,2
    80007ed0:	04078463          	beqz	a5,80007f18 <pop_on+0x68>
    80007ed4:	07852783          	lw	a5,120(a0)
    80007ed8:	02f05863          	blez	a5,80007f08 <pop_on+0x58>
    80007edc:	fff7879b          	addiw	a5,a5,-1
    80007ee0:	06f52c23          	sw	a5,120(a0)
    80007ee4:	07853783          	ld	a5,120(a0)
    80007ee8:	00079863          	bnez	a5,80007ef8 <pop_on+0x48>
    80007eec:	100027f3          	csrr	a5,sstatus
    80007ef0:	ffd7f793          	andi	a5,a5,-3
    80007ef4:	10079073          	csrw	sstatus,a5
    80007ef8:	00813083          	ld	ra,8(sp)
    80007efc:	00013403          	ld	s0,0(sp)
    80007f00:	01010113          	addi	sp,sp,16
    80007f04:	00008067          	ret
    80007f08:	00001517          	auipc	a0,0x1
    80007f0c:	7f050513          	addi	a0,a0,2032 # 800096f8 <digits+0x70>
    80007f10:	fffff097          	auipc	ra,0xfffff
    80007f14:	f2c080e7          	jalr	-212(ra) # 80006e3c <panic>
    80007f18:	00001517          	auipc	a0,0x1
    80007f1c:	7c050513          	addi	a0,a0,1984 # 800096d8 <digits+0x50>
    80007f20:	fffff097          	auipc	ra,0xfffff
    80007f24:	f1c080e7          	jalr	-228(ra) # 80006e3c <panic>

0000000080007f28 <__memset>:
    80007f28:	ff010113          	addi	sp,sp,-16
    80007f2c:	00813423          	sd	s0,8(sp)
    80007f30:	01010413          	addi	s0,sp,16
    80007f34:	1a060e63          	beqz	a2,800080f0 <__memset+0x1c8>
    80007f38:	40a007b3          	neg	a5,a0
    80007f3c:	0077f793          	andi	a5,a5,7
    80007f40:	00778693          	addi	a3,a5,7
    80007f44:	00b00813          	li	a6,11
    80007f48:	0ff5f593          	andi	a1,a1,255
    80007f4c:	fff6071b          	addiw	a4,a2,-1
    80007f50:	1b06e663          	bltu	a3,a6,800080fc <__memset+0x1d4>
    80007f54:	1cd76463          	bltu	a4,a3,8000811c <__memset+0x1f4>
    80007f58:	1a078e63          	beqz	a5,80008114 <__memset+0x1ec>
    80007f5c:	00b50023          	sb	a1,0(a0)
    80007f60:	00100713          	li	a4,1
    80007f64:	1ae78463          	beq	a5,a4,8000810c <__memset+0x1e4>
    80007f68:	00b500a3          	sb	a1,1(a0)
    80007f6c:	00200713          	li	a4,2
    80007f70:	1ae78a63          	beq	a5,a4,80008124 <__memset+0x1fc>
    80007f74:	00b50123          	sb	a1,2(a0)
    80007f78:	00300713          	li	a4,3
    80007f7c:	18e78463          	beq	a5,a4,80008104 <__memset+0x1dc>
    80007f80:	00b501a3          	sb	a1,3(a0)
    80007f84:	00400713          	li	a4,4
    80007f88:	1ae78263          	beq	a5,a4,8000812c <__memset+0x204>
    80007f8c:	00b50223          	sb	a1,4(a0)
    80007f90:	00500713          	li	a4,5
    80007f94:	1ae78063          	beq	a5,a4,80008134 <__memset+0x20c>
    80007f98:	00b502a3          	sb	a1,5(a0)
    80007f9c:	00700713          	li	a4,7
    80007fa0:	18e79e63          	bne	a5,a4,8000813c <__memset+0x214>
    80007fa4:	00b50323          	sb	a1,6(a0)
    80007fa8:	00700e93          	li	t4,7
    80007fac:	00859713          	slli	a4,a1,0x8
    80007fb0:	00e5e733          	or	a4,a1,a4
    80007fb4:	01059e13          	slli	t3,a1,0x10
    80007fb8:	01c76e33          	or	t3,a4,t3
    80007fbc:	01859313          	slli	t1,a1,0x18
    80007fc0:	006e6333          	or	t1,t3,t1
    80007fc4:	02059893          	slli	a7,a1,0x20
    80007fc8:	40f60e3b          	subw	t3,a2,a5
    80007fcc:	011368b3          	or	a7,t1,a7
    80007fd0:	02859813          	slli	a6,a1,0x28
    80007fd4:	0108e833          	or	a6,a7,a6
    80007fd8:	03059693          	slli	a3,a1,0x30
    80007fdc:	003e589b          	srliw	a7,t3,0x3
    80007fe0:	00d866b3          	or	a3,a6,a3
    80007fe4:	03859713          	slli	a4,a1,0x38
    80007fe8:	00389813          	slli	a6,a7,0x3
    80007fec:	00f507b3          	add	a5,a0,a5
    80007ff0:	00e6e733          	or	a4,a3,a4
    80007ff4:	000e089b          	sext.w	a7,t3
    80007ff8:	00f806b3          	add	a3,a6,a5
    80007ffc:	00e7b023          	sd	a4,0(a5)
    80008000:	00878793          	addi	a5,a5,8
    80008004:	fed79ce3          	bne	a5,a3,80007ffc <__memset+0xd4>
    80008008:	ff8e7793          	andi	a5,t3,-8
    8000800c:	0007871b          	sext.w	a4,a5
    80008010:	01d787bb          	addw	a5,a5,t4
    80008014:	0ce88e63          	beq	a7,a4,800080f0 <__memset+0x1c8>
    80008018:	00f50733          	add	a4,a0,a5
    8000801c:	00b70023          	sb	a1,0(a4)
    80008020:	0017871b          	addiw	a4,a5,1
    80008024:	0cc77663          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008028:	00e50733          	add	a4,a0,a4
    8000802c:	00b70023          	sb	a1,0(a4)
    80008030:	0027871b          	addiw	a4,a5,2
    80008034:	0ac77e63          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008038:	00e50733          	add	a4,a0,a4
    8000803c:	00b70023          	sb	a1,0(a4)
    80008040:	0037871b          	addiw	a4,a5,3
    80008044:	0ac77663          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008048:	00e50733          	add	a4,a0,a4
    8000804c:	00b70023          	sb	a1,0(a4)
    80008050:	0047871b          	addiw	a4,a5,4
    80008054:	08c77e63          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008058:	00e50733          	add	a4,a0,a4
    8000805c:	00b70023          	sb	a1,0(a4)
    80008060:	0057871b          	addiw	a4,a5,5
    80008064:	08c77663          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008068:	00e50733          	add	a4,a0,a4
    8000806c:	00b70023          	sb	a1,0(a4)
    80008070:	0067871b          	addiw	a4,a5,6
    80008074:	06c77e63          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008078:	00e50733          	add	a4,a0,a4
    8000807c:	00b70023          	sb	a1,0(a4)
    80008080:	0077871b          	addiw	a4,a5,7
    80008084:	06c77663          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008088:	00e50733          	add	a4,a0,a4
    8000808c:	00b70023          	sb	a1,0(a4)
    80008090:	0087871b          	addiw	a4,a5,8
    80008094:	04c77e63          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    80008098:	00e50733          	add	a4,a0,a4
    8000809c:	00b70023          	sb	a1,0(a4)
    800080a0:	0097871b          	addiw	a4,a5,9
    800080a4:	04c77663          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    800080a8:	00e50733          	add	a4,a0,a4
    800080ac:	00b70023          	sb	a1,0(a4)
    800080b0:	00a7871b          	addiw	a4,a5,10
    800080b4:	02c77e63          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    800080b8:	00e50733          	add	a4,a0,a4
    800080bc:	00b70023          	sb	a1,0(a4)
    800080c0:	00b7871b          	addiw	a4,a5,11
    800080c4:	02c77663          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    800080c8:	00e50733          	add	a4,a0,a4
    800080cc:	00b70023          	sb	a1,0(a4)
    800080d0:	00c7871b          	addiw	a4,a5,12
    800080d4:	00c77e63          	bgeu	a4,a2,800080f0 <__memset+0x1c8>
    800080d8:	00e50733          	add	a4,a0,a4
    800080dc:	00b70023          	sb	a1,0(a4)
    800080e0:	00d7879b          	addiw	a5,a5,13
    800080e4:	00c7f663          	bgeu	a5,a2,800080f0 <__memset+0x1c8>
    800080e8:	00f507b3          	add	a5,a0,a5
    800080ec:	00b78023          	sb	a1,0(a5)
    800080f0:	00813403          	ld	s0,8(sp)
    800080f4:	01010113          	addi	sp,sp,16
    800080f8:	00008067          	ret
    800080fc:	00b00693          	li	a3,11
    80008100:	e55ff06f          	j	80007f54 <__memset+0x2c>
    80008104:	00300e93          	li	t4,3
    80008108:	ea5ff06f          	j	80007fac <__memset+0x84>
    8000810c:	00100e93          	li	t4,1
    80008110:	e9dff06f          	j	80007fac <__memset+0x84>
    80008114:	00000e93          	li	t4,0
    80008118:	e95ff06f          	j	80007fac <__memset+0x84>
    8000811c:	00000793          	li	a5,0
    80008120:	ef9ff06f          	j	80008018 <__memset+0xf0>
    80008124:	00200e93          	li	t4,2
    80008128:	e85ff06f          	j	80007fac <__memset+0x84>
    8000812c:	00400e93          	li	t4,4
    80008130:	e7dff06f          	j	80007fac <__memset+0x84>
    80008134:	00500e93          	li	t4,5
    80008138:	e75ff06f          	j	80007fac <__memset+0x84>
    8000813c:	00600e93          	li	t4,6
    80008140:	e6dff06f          	j	80007fac <__memset+0x84>

0000000080008144 <__memmove>:
    80008144:	ff010113          	addi	sp,sp,-16
    80008148:	00813423          	sd	s0,8(sp)
    8000814c:	01010413          	addi	s0,sp,16
    80008150:	0e060863          	beqz	a2,80008240 <__memmove+0xfc>
    80008154:	fff6069b          	addiw	a3,a2,-1
    80008158:	0006881b          	sext.w	a6,a3
    8000815c:	0ea5e863          	bltu	a1,a0,8000824c <__memmove+0x108>
    80008160:	00758713          	addi	a4,a1,7
    80008164:	00a5e7b3          	or	a5,a1,a0
    80008168:	40a70733          	sub	a4,a4,a0
    8000816c:	0077f793          	andi	a5,a5,7
    80008170:	00f73713          	sltiu	a4,a4,15
    80008174:	00174713          	xori	a4,a4,1
    80008178:	0017b793          	seqz	a5,a5
    8000817c:	00e7f7b3          	and	a5,a5,a4
    80008180:	10078863          	beqz	a5,80008290 <__memmove+0x14c>
    80008184:	00900793          	li	a5,9
    80008188:	1107f463          	bgeu	a5,a6,80008290 <__memmove+0x14c>
    8000818c:	0036581b          	srliw	a6,a2,0x3
    80008190:	fff8081b          	addiw	a6,a6,-1
    80008194:	02081813          	slli	a6,a6,0x20
    80008198:	01d85893          	srli	a7,a6,0x1d
    8000819c:	00858813          	addi	a6,a1,8
    800081a0:	00058793          	mv	a5,a1
    800081a4:	00050713          	mv	a4,a0
    800081a8:	01088833          	add	a6,a7,a6
    800081ac:	0007b883          	ld	a7,0(a5)
    800081b0:	00878793          	addi	a5,a5,8
    800081b4:	00870713          	addi	a4,a4,8
    800081b8:	ff173c23          	sd	a7,-8(a4)
    800081bc:	ff0798e3          	bne	a5,a6,800081ac <__memmove+0x68>
    800081c0:	ff867713          	andi	a4,a2,-8
    800081c4:	02071793          	slli	a5,a4,0x20
    800081c8:	0207d793          	srli	a5,a5,0x20
    800081cc:	00f585b3          	add	a1,a1,a5
    800081d0:	40e686bb          	subw	a3,a3,a4
    800081d4:	00f507b3          	add	a5,a0,a5
    800081d8:	06e60463          	beq	a2,a4,80008240 <__memmove+0xfc>
    800081dc:	0005c703          	lbu	a4,0(a1)
    800081e0:	00e78023          	sb	a4,0(a5)
    800081e4:	04068e63          	beqz	a3,80008240 <__memmove+0xfc>
    800081e8:	0015c603          	lbu	a2,1(a1)
    800081ec:	00100713          	li	a4,1
    800081f0:	00c780a3          	sb	a2,1(a5)
    800081f4:	04e68663          	beq	a3,a4,80008240 <__memmove+0xfc>
    800081f8:	0025c603          	lbu	a2,2(a1)
    800081fc:	00200713          	li	a4,2
    80008200:	00c78123          	sb	a2,2(a5)
    80008204:	02e68e63          	beq	a3,a4,80008240 <__memmove+0xfc>
    80008208:	0035c603          	lbu	a2,3(a1)
    8000820c:	00300713          	li	a4,3
    80008210:	00c781a3          	sb	a2,3(a5)
    80008214:	02e68663          	beq	a3,a4,80008240 <__memmove+0xfc>
    80008218:	0045c603          	lbu	a2,4(a1)
    8000821c:	00400713          	li	a4,4
    80008220:	00c78223          	sb	a2,4(a5)
    80008224:	00e68e63          	beq	a3,a4,80008240 <__memmove+0xfc>
    80008228:	0055c603          	lbu	a2,5(a1)
    8000822c:	00500713          	li	a4,5
    80008230:	00c782a3          	sb	a2,5(a5)
    80008234:	00e68663          	beq	a3,a4,80008240 <__memmove+0xfc>
    80008238:	0065c703          	lbu	a4,6(a1)
    8000823c:	00e78323          	sb	a4,6(a5)
    80008240:	00813403          	ld	s0,8(sp)
    80008244:	01010113          	addi	sp,sp,16
    80008248:	00008067          	ret
    8000824c:	02061713          	slli	a4,a2,0x20
    80008250:	02075713          	srli	a4,a4,0x20
    80008254:	00e587b3          	add	a5,a1,a4
    80008258:	f0f574e3          	bgeu	a0,a5,80008160 <__memmove+0x1c>
    8000825c:	02069613          	slli	a2,a3,0x20
    80008260:	02065613          	srli	a2,a2,0x20
    80008264:	fff64613          	not	a2,a2
    80008268:	00e50733          	add	a4,a0,a4
    8000826c:	00c78633          	add	a2,a5,a2
    80008270:	fff7c683          	lbu	a3,-1(a5)
    80008274:	fff78793          	addi	a5,a5,-1
    80008278:	fff70713          	addi	a4,a4,-1
    8000827c:	00d70023          	sb	a3,0(a4)
    80008280:	fec798e3          	bne	a5,a2,80008270 <__memmove+0x12c>
    80008284:	00813403          	ld	s0,8(sp)
    80008288:	01010113          	addi	sp,sp,16
    8000828c:	00008067          	ret
    80008290:	02069713          	slli	a4,a3,0x20
    80008294:	02075713          	srli	a4,a4,0x20
    80008298:	00170713          	addi	a4,a4,1
    8000829c:	00e50733          	add	a4,a0,a4
    800082a0:	00050793          	mv	a5,a0
    800082a4:	0005c683          	lbu	a3,0(a1)
    800082a8:	00178793          	addi	a5,a5,1
    800082ac:	00158593          	addi	a1,a1,1
    800082b0:	fed78fa3          	sb	a3,-1(a5)
    800082b4:	fee798e3          	bne	a5,a4,800082a4 <__memmove+0x160>
    800082b8:	f89ff06f          	j	80008240 <__memmove+0xfc>

00000000800082bc <__putc>:
    800082bc:	fe010113          	addi	sp,sp,-32
    800082c0:	00813823          	sd	s0,16(sp)
    800082c4:	00113c23          	sd	ra,24(sp)
    800082c8:	02010413          	addi	s0,sp,32
    800082cc:	00050793          	mv	a5,a0
    800082d0:	fef40593          	addi	a1,s0,-17
    800082d4:	00100613          	li	a2,1
    800082d8:	00000513          	li	a0,0
    800082dc:	fef407a3          	sb	a5,-17(s0)
    800082e0:	fffff097          	auipc	ra,0xfffff
    800082e4:	b3c080e7          	jalr	-1220(ra) # 80006e1c <console_write>
    800082e8:	01813083          	ld	ra,24(sp)
    800082ec:	01013403          	ld	s0,16(sp)
    800082f0:	02010113          	addi	sp,sp,32
    800082f4:	00008067          	ret

00000000800082f8 <__getc>:
    800082f8:	fe010113          	addi	sp,sp,-32
    800082fc:	00813823          	sd	s0,16(sp)
    80008300:	00113c23          	sd	ra,24(sp)
    80008304:	02010413          	addi	s0,sp,32
    80008308:	fe840593          	addi	a1,s0,-24
    8000830c:	00100613          	li	a2,1
    80008310:	00000513          	li	a0,0
    80008314:	fffff097          	auipc	ra,0xfffff
    80008318:	ae8080e7          	jalr	-1304(ra) # 80006dfc <console_read>
    8000831c:	fe844503          	lbu	a0,-24(s0)
    80008320:	01813083          	ld	ra,24(sp)
    80008324:	01013403          	ld	s0,16(sp)
    80008328:	02010113          	addi	sp,sp,32
    8000832c:	00008067          	ret

0000000080008330 <console_handler>:
    80008330:	fe010113          	addi	sp,sp,-32
    80008334:	00813823          	sd	s0,16(sp)
    80008338:	00113c23          	sd	ra,24(sp)
    8000833c:	00913423          	sd	s1,8(sp)
    80008340:	02010413          	addi	s0,sp,32
    80008344:	14202773          	csrr	a4,scause
    80008348:	100027f3          	csrr	a5,sstatus
    8000834c:	0027f793          	andi	a5,a5,2
    80008350:	06079e63          	bnez	a5,800083cc <console_handler+0x9c>
    80008354:	00074c63          	bltz	a4,8000836c <console_handler+0x3c>
    80008358:	01813083          	ld	ra,24(sp)
    8000835c:	01013403          	ld	s0,16(sp)
    80008360:	00813483          	ld	s1,8(sp)
    80008364:	02010113          	addi	sp,sp,32
    80008368:	00008067          	ret
    8000836c:	0ff77713          	andi	a4,a4,255
    80008370:	00900793          	li	a5,9
    80008374:	fef712e3          	bne	a4,a5,80008358 <console_handler+0x28>
    80008378:	ffffe097          	auipc	ra,0xffffe
    8000837c:	6dc080e7          	jalr	1756(ra) # 80006a54 <plic_claim>
    80008380:	00a00793          	li	a5,10
    80008384:	00050493          	mv	s1,a0
    80008388:	02f50c63          	beq	a0,a5,800083c0 <console_handler+0x90>
    8000838c:	fc0506e3          	beqz	a0,80008358 <console_handler+0x28>
    80008390:	00050593          	mv	a1,a0
    80008394:	00001517          	auipc	a0,0x1
    80008398:	26c50513          	addi	a0,a0,620 # 80009600 <CONSOLE_STATUS+0x5f0>
    8000839c:	fffff097          	auipc	ra,0xfffff
    800083a0:	afc080e7          	jalr	-1284(ra) # 80006e98 <__printf>
    800083a4:	01013403          	ld	s0,16(sp)
    800083a8:	01813083          	ld	ra,24(sp)
    800083ac:	00048513          	mv	a0,s1
    800083b0:	00813483          	ld	s1,8(sp)
    800083b4:	02010113          	addi	sp,sp,32
    800083b8:	ffffe317          	auipc	t1,0xffffe
    800083bc:	6d430067          	jr	1748(t1) # 80006a8c <plic_complete>
    800083c0:	fffff097          	auipc	ra,0xfffff
    800083c4:	3e0080e7          	jalr	992(ra) # 800077a0 <uartintr>
    800083c8:	fddff06f          	j	800083a4 <console_handler+0x74>
    800083cc:	00001517          	auipc	a0,0x1
    800083d0:	33450513          	addi	a0,a0,820 # 80009700 <digits+0x78>
    800083d4:	fffff097          	auipc	ra,0xfffff
    800083d8:	a68080e7          	jalr	-1432(ra) # 80006e3c <panic>
	...
