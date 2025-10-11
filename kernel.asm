
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	bc013103          	ld	sp,-1088(sp) # 8000cbc0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	785060ef          	jal	ra,80006fa0 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001000:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001004:	00b29a63          	bne	t0,a1,80001018 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001008:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000100c:	fe029ae3          	bnez	t0,80001000 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001010:	00000513          	li	a0,0
    jr ra                  # Return.
    80001014:	00008067          	ret

0000000080001018 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001018:	00100513          	li	a0,1
    8000101c:	00008067          	ret

0000000080001020 <_ZN5RISCV14supervisorTrapEv>:

.align 4
.global _ZN5RISCV14supervisorTrapEv
.type _ZN5RISCV14supervisorTrapEv,@function
_ZN5RISCV14supervisorTrapEv:
        addi sp, sp, -256
    80001020:	f0010113          	addi	sp,sp,-256
        .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        sd x\index, \index*  8(sp)
        .endr
    80001024:	00013023          	sd	zero,0(sp)
    80001028:	00113423          	sd	ra,8(sp)
    8000102c:	00213823          	sd	sp,16(sp)
    80001030:	00313c23          	sd	gp,24(sp)
    80001034:	02413023          	sd	tp,32(sp)
    80001038:	02513423          	sd	t0,40(sp)
    8000103c:	02613823          	sd	t1,48(sp)
    80001040:	02713c23          	sd	t2,56(sp)
    80001044:	04813023          	sd	s0,64(sp)
    80001048:	04913423          	sd	s1,72(sp)
    8000104c:	04a13823          	sd	a0,80(sp)
    80001050:	04b13c23          	sd	a1,88(sp)
    80001054:	06c13023          	sd	a2,96(sp)
    80001058:	06d13423          	sd	a3,104(sp)
    8000105c:	06e13823          	sd	a4,112(sp)
    80001060:	06f13c23          	sd	a5,120(sp)
    80001064:	09013023          	sd	a6,128(sp)
    80001068:	09113423          	sd	a7,136(sp)
    8000106c:	09213823          	sd	s2,144(sp)
    80001070:	09313c23          	sd	s3,152(sp)
    80001074:	0b413023          	sd	s4,160(sp)
    80001078:	0b513423          	sd	s5,168(sp)
    8000107c:	0b613823          	sd	s6,176(sp)
    80001080:	0b713c23          	sd	s7,184(sp)
    80001084:	0d813023          	sd	s8,192(sp)
    80001088:	0d913423          	sd	s9,200(sp)
    8000108c:	0da13823          	sd	s10,208(sp)
    80001090:	0db13c23          	sd	s11,216(sp)
    80001094:	0fc13023          	sd	t3,224(sp)
    80001098:	0fd13423          	sd	t4,232(sp)
    8000109c:	0fe13823          	sd	t5,240(sp)
    800010a0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5RISCV20handleSupervisorTrapEv
    800010a4:	325010ef          	jal	ra,80002bc8 <_ZN5RISCV20handleSupervisorTrapEv>


        .irp index 0,1,23,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
        ld x\index, \index * 8(sp)
        .endr
    800010a8:	00013003          	ld	zero,0(sp)
    800010ac:	00813083          	ld	ra,8(sp)
    800010b0:	0b813b83          	ld	s7,184(sp)
    800010b4:	02013203          	ld	tp,32(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    800010c0:	03813383          	ld	t2,56(sp)
    800010c4:	04013403          	ld	s0,64(sp)
    800010c8:	04813483          	ld	s1,72(sp)
    800010cc:	05013503          	ld	a0,80(sp)
    800010d0:	05813583          	ld	a1,88(sp)
    800010d4:	06013603          	ld	a2,96(sp)
    800010d8:	06813683          	ld	a3,104(sp)
    800010dc:	07013703          	ld	a4,112(sp)
    800010e0:	07813783          	ld	a5,120(sp)
    800010e4:	08013803          	ld	a6,128(sp)
    800010e8:	08813883          	ld	a7,136(sp)
    800010ec:	09013903          	ld	s2,144(sp)
    800010f0:	09813983          	ld	s3,152(sp)
    800010f4:	0a013a03          	ld	s4,160(sp)
    800010f8:	0a813a83          	ld	s5,168(sp)
    800010fc:	0b013b03          	ld	s6,176(sp)
    80001100:	0b813b83          	ld	s7,184(sp)
    80001104:	0c013c03          	ld	s8,192(sp)
    80001108:	0c813c83          	ld	s9,200(sp)
    8000110c:	0d013d03          	ld	s10,208(sp)
    80001110:	0d813d83          	ld	s11,216(sp)
    80001114:	0e013e03          	ld	t3,224(sp)
    80001118:	0e813e83          	ld	t4,232(sp)
    8000111c:	0f013f03          	ld	t5,240(sp)
    80001120:	0f813f83          	ld	t6,248(sp)
        addi sp, sp, 256
    80001124:	10010113          	addi	sp,sp,256


    80001128:	10200073          	sret
    8000112c:	0000                	unimp
	...

0000000080001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_,@function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    #a0 &old->context
    #a1 &running->context
    sd ra,0*8(a0)
    80001130:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp,1*8(a0)
    80001134:	00253423          	sd	sp,8(a0)


    ld ra,0*8(a1)
    80001138:	0005b083          	ld	ra,0(a1)
    ld sp,1*8(a1)
    8000113c:	0085b103          	ld	sp,8(a1)

    80001140:	00008067          	ret

0000000080001144 <_ZN5RISCV13pushRegistersEv>:
.global _ZN5RISCV13pushRegistersEv
.type _ZN5RISCV13pushRegistersEv,@function
_ZN5RISCV13pushRegistersEv:
    addi sp, sp, -256
    80001144:	f0010113          	addi	sp,sp,-256
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*  8(sp)
    .endr
    80001148:	00313c23          	sd	gp,24(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    80001150:	02513423          	sd	t0,40(sp)
    80001154:	02613823          	sd	t1,48(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    80001160:	04913423          	sd	s1,72(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    80001180:	09113423          	sd	a7,136(sp)
    80001184:	09213823          	sd	s2,144(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)
    ret
    800011bc:	00008067          	ret

00000000800011c0 <_ZN5RISCV12popRegistersEv>:
.global _ZN5RISCV12popRegistersEv
.type _ZN5RISCV12popRegistersEv,@function
_ZN5RISCV12popRegistersEv:
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011c0:	01813183          	ld	gp,24(sp)
    800011c4:	02013203          	ld	tp,32(sp)
    800011c8:	02813283          	ld	t0,40(sp)
    800011cc:	03013303          	ld	t1,48(sp)
    800011d0:	03813383          	ld	t2,56(sp)
    800011d4:	04013403          	ld	s0,64(sp)
    800011d8:	04813483          	ld	s1,72(sp)
    800011dc:	05013503          	ld	a0,80(sp)
    800011e0:	05813583          	ld	a1,88(sp)
    800011e4:	06013603          	ld	a2,96(sp)
    800011e8:	06813683          	ld	a3,104(sp)
    800011ec:	07013703          	ld	a4,112(sp)
    800011f0:	07813783          	ld	a5,120(sp)
    800011f4:	08013803          	ld	a6,128(sp)
    800011f8:	08813883          	ld	a7,136(sp)
    800011fc:	09013903          	ld	s2,144(sp)
    80001200:	09813983          	ld	s3,152(sp)
    80001204:	0a013a03          	ld	s4,160(sp)
    80001208:	0a813a83          	ld	s5,168(sp)
    8000120c:	0b013b03          	ld	s6,176(sp)
    80001210:	0b813b83          	ld	s7,184(sp)
    80001214:	0c013c03          	ld	s8,192(sp)
    80001218:	0c813c83          	ld	s9,200(sp)
    8000121c:	0d013d03          	ld	s10,208(sp)
    80001220:	0d813d83          	ld	s11,216(sp)
    80001224:	0e013e03          	ld	t3,224(sp)
    80001228:	0e813e83          	ld	t4,232(sp)
    8000122c:	0f013f03          	ld	t5,240(sp)
    80001230:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001234:	10010113          	addi	sp,sp,256
    ret
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
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
}

inline size_t RISCV::r_a0() {
    size_t volatile a0;
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001298:	00050793          	mv	a5,a0
    8000129c:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    800012f8:	00050793          	mv	a5,a0
    800012fc:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    8000135c:	00050793          	mv	a5,a0
    80001360:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    800013b0:	00050793          	mv	a5,a0
    800013b4:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001434:	00050793          	mv	a5,a0
    80001438:	fcf43023          	sd	a5,-64(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    800014b4:	00050793          	mv	a5,a0
    800014b8:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001558:	00050793          	mv	a5,a0
    8000155c:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    800015c0:	00050793          	mv	a5,a0
    800015c4:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001628:	00050793          	mv	a5,a0
    8000162c:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001690:	00050793          	mv	a5,a0
    80001694:	fef43023          	sd	a5,-32(s0)
    return a0;
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
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80001744:	00050793          	mv	a5,a0
    80001748:	fef43023          	sd	a5,-32(s0)
    return a0;
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

00000000800017b0 <_Z41__static_initialization_and_destruction_0ii>:
        block();
    }
    if (this->closed)return -1;
    if (this->timedOut)return -2;
    return 0;
}
    800017b0:	ff010113          	addi	sp,sp,-16
    800017b4:	00813423          	sd	s0,8(sp)
    800017b8:	01010413          	addi	s0,sp,16
    800017bc:	00100793          	li	a5,1
    800017c0:	00f50863          	beq	a0,a5,800017d0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800017c4:	00813403          	ld	s0,8(sp)
    800017c8:	01010113          	addi	sp,sp,16
    800017cc:	00008067          	ret
    800017d0:	000107b7          	lui	a5,0x10
    800017d4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800017d8:	fef596e3          	bne	a1,a5,800017c4 <_Z41__static_initialization_and_destruction_0ii+0x14>
            MemoryAllocator::mem_free(ptr);
        }
    };
    Elem *head,*tail,*curr,*prev;
public:
    List() : head(0), tail(0), curr(0), prev(0) {}
    800017dc:	0000b797          	auipc	a5,0xb
    800017e0:	46478793          	addi	a5,a5,1124 # 8000cc40 <_ZN9Semaphore18allSemaphoresQueueE>
    800017e4:	0007b023          	sd	zero,0(a5)
    800017e8:	0007b423          	sd	zero,8(a5)
    800017ec:	0007b823          	sd	zero,16(a5)
    800017f0:	0007bc23          	sd	zero,24(a5)
    800017f4:	fd1ff06f          	j	800017c4 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>:
int Semaphore::createSemaphore(Semaphore **semHandle, unsigned val) {
    800017f8:	fd010113          	addi	sp,sp,-48
    800017fc:	02113423          	sd	ra,40(sp)
    80001800:	02813023          	sd	s0,32(sp)
    80001804:	00913c23          	sd	s1,24(sp)
    80001808:	01213823          	sd	s2,16(sp)
    8000180c:	01313423          	sd	s3,8(sp)
    80001810:	03010413          	addi	s0,sp,48
    80001814:	00050993          	mv	s3,a0
    80001818:	00058913          	mv	s2,a1

    //Wait with timeout
    int semTimeWait(time_t t);

    void* operator new(size_t size) {
        return MemoryAllocator::mem_alloc(size);
    8000181c:	03800513          	li	a0,56
    80001820:	00002097          	auipc	ra,0x2
    80001824:	e50080e7          	jalr	-432(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
    Semaphore(unsigned vr):val(vr),closed(false),timeout(-1),timedOut(false){}
    80001828:	01252023          	sw	s2,0(a0) # 1000 <_entry-0x7ffff000>
    8000182c:	00050223          	sb	zero,4(a0)
    80001830:	fff00793          	li	a5,-1
    80001834:	00f53423          	sd	a5,8(a0)
    80001838:	00050823          	sb	zero,16(a0)
    8000183c:	00053c23          	sd	zero,24(a0)
    80001840:	02053023          	sd	zero,32(a0)
    80001844:	02053423          	sd	zero,40(a0)
    80001848:	02053823          	sd	zero,48(a0)
    if (semaphore==nullptr){return -1;}
    8000184c:	06050463          	beqz	a0,800018b4 <_ZN9Semaphore15createSemaphoreEPPS_j+0xbc>
    80001850:	00050493          	mv	s1,a0
    *semHandle=semaphore;
    80001854:	00a9b023          	sd	a0,0(s3)
            return MemoryAllocator::mem_alloc(size);
    80001858:	01000513          	li	a0,16
    8000185c:	00002097          	auipc	ra,0x2
    80001860:	e14080e7          	jalr	-492(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
    List(const List<T> &)= delete;

    List<T> &operator=(const List<T> &)=delete;

    void addFirst(T *data) {
        Elem *el =new Elem(data,head);
    80001864:	0000b797          	auipc	a5,0xb
    80001868:	3dc78793          	addi	a5,a5,988 # 8000cc40 <_ZN9Semaphore18allSemaphoresQueueE>
    8000186c:	0007b703          	ld	a4,0(a5)
        Elem(T *data, Elem *next):data(data),next(next){}
    80001870:	00953023          	sd	s1,0(a0)
    80001874:	00e53423          	sd	a4,8(a0)
        head=el;
    80001878:	00a7b023          	sd	a0,0(a5)
        if (!tail){tail=head;}
    8000187c:	0087b783          	ld	a5,8(a5)
    80001880:	02078263          	beqz	a5,800018a4 <_ZN9Semaphore15createSemaphoreEPPS_j+0xac>
    return 0;
    80001884:	00000513          	li	a0,0
}
    80001888:	02813083          	ld	ra,40(sp)
    8000188c:	02013403          	ld	s0,32(sp)
    80001890:	01813483          	ld	s1,24(sp)
    80001894:	01013903          	ld	s2,16(sp)
    80001898:	00813983          	ld	s3,8(sp)
    8000189c:	03010113          	addi	sp,sp,48
    800018a0:	00008067          	ret
    800018a4:	0000b797          	auipc	a5,0xb
    800018a8:	3aa7b223          	sd	a0,932(a5) # 8000cc48 <_ZN9Semaphore18allSemaphoresQueueE+0x8>
    return 0;
    800018ac:	00000513          	li	a0,0
    800018b0:	fd9ff06f          	j	80001888 <_ZN9Semaphore15createSemaphoreEPPS_j+0x90>
    if (semaphore==nullptr){return -1;}
    800018b4:	fff00513          	li	a0,-1
    800018b8:	fd1ff06f          	j	80001888 <_ZN9Semaphore15createSemaphoreEPPS_j+0x90>

00000000800018bc <_ZN9Semaphore14closeSemaphoreEPS_>:
    if (id->closed){return -1;}
    800018bc:	00454783          	lbu	a5,4(a0)
    800018c0:	06079463          	bnez	a5,80001928 <_ZN9Semaphore14closeSemaphoreEPS_+0x6c>
int Semaphore::closeSemaphore(Semaphore *id) {
    800018c4:	fe010113          	addi	sp,sp,-32
    800018c8:	00113c23          	sd	ra,24(sp)
    800018cc:	00813823          	sd	s0,16(sp)
    800018d0:	00913423          	sd	s1,8(sp)
    800018d4:	01213023          	sd	s2,0(sp)
    800018d8:	02010413          	addi	s0,sp,32
    800018dc:	00050493          	mv	s1,a0
    id->closed=true;
    800018e0:	00100793          	li	a5,1
    800018e4:	00f50223          	sb	a5,4(a0)
    800018e8:	0200006f          	j	80001908 <_ZN9Semaphore14closeSemaphoreEPS_+0x4c>
    T *removeFIrst() {
        if (!head) return 0;

        Elem *el=head;
        head=head->next;
        if (!head) tail=0;
    800018ec:	0204b023          	sd	zero,32(s1)

        T *ret=el->data;
    800018f0:	00053903          	ld	s2,0(a0)
            MemoryAllocator::mem_free(ptr);
    800018f4:	00002097          	auipc	ra,0x2
    800018f8:	eb8080e7          	jalr	-328(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
        Scheduler::put(id->blockedQueue.removeFIrst());
    800018fc:	00090513          	mv	a0,s2
    80001900:	00001097          	auipc	ra,0x1
    80001904:	848080e7          	jalr	-1976(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
        delete el;
        return ret;
    }

    T *peekFirst() {
        if (!head)return  0;
    80001908:	0184b503          	ld	a0,24(s1)
    8000190c:	02050263          	beqz	a0,80001930 <_ZN9Semaphore14closeSemaphoreEPS_+0x74>
        return head->data;
    80001910:	00053783          	ld	a5,0(a0)
    while (id->blockedQueue.peekFirst()) {
    80001914:	02078c63          	beqz	a5,8000194c <_ZN9Semaphore14closeSemaphoreEPS_+0x90>
        head=head->next;
    80001918:	00853783          	ld	a5,8(a0)
    8000191c:	00f4bc23          	sd	a5,24(s1)
        if (!head) tail=0;
    80001920:	fc0798e3          	bnez	a5,800018f0 <_ZN9Semaphore14closeSemaphoreEPS_+0x34>
    80001924:	fc9ff06f          	j	800018ec <_ZN9Semaphore14closeSemaphoreEPS_+0x30>
    if (id->closed){return -1;}
    80001928:	fff00513          	li	a0,-1
}
    8000192c:	00008067          	ret
    return 0;
    80001930:	00000513          	li	a0,0
}
    80001934:	01813083          	ld	ra,24(sp)
    80001938:	01013403          	ld	s0,16(sp)
    8000193c:	00813483          	ld	s1,8(sp)
    80001940:	00013903          	ld	s2,0(sp)
    80001944:	02010113          	addi	sp,sp,32
    80001948:	00008067          	ret
    return 0;
    8000194c:	00000513          	li	a0,0
    80001950:	fe5ff06f          	j	80001934 <_ZN9Semaphore14closeSemaphoreEPS_+0x78>

0000000080001954 <_ZN9Semaphore5blockEv>:
void Semaphore::block() {
    80001954:	fe010113          	addi	sp,sp,-32
    80001958:	00113c23          	sd	ra,24(sp)
    8000195c:	00813823          	sd	s0,16(sp)
    80001960:	00913423          	sd	s1,8(sp)
    80001964:	01213023          	sd	s2,0(sp)
    80001968:	02010413          	addi	s0,sp,32
    8000196c:	00050493          	mv	s1,a0
    TCB*oldT=TCB::running;
    80001970:	0000b797          	auipc	a5,0xb
    80001974:	2687b783          	ld	a5,616(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001978:	0007b903          	ld	s2,0(a5)
            return MemoryAllocator::mem_alloc(size);
    8000197c:	01000513          	li	a0,16
    80001980:	00002097          	auipc	ra,0x2
    80001984:	cf0080e7          	jalr	-784(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next):data(data),next(next){}
    80001988:	01253023          	sd	s2,0(a0)
    8000198c:	00053423          	sd	zero,8(a0)
        if (tail) {
    80001990:	0204b783          	ld	a5,32(s1)
    80001994:	04078463          	beqz	a5,800019dc <_ZN9Semaphore5blockEv+0x88>
            tail->next=el;
    80001998:	00a7b423          	sd	a0,8(a5)
            tail=el;
    8000199c:	02a4b023          	sd	a0,32(s1)
    TCB::running=Scheduler::get();
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	740080e7          	jalr	1856(ra) # 800020e0 <_ZN9Scheduler3getEv>
    800019a8:	0000b797          	auipc	a5,0xb
    800019ac:	2307b783          	ld	a5,560(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x50>
    800019b0:	00a7b023          	sd	a0,0(a5)
    TCB::contextSwitch(&oldT->context,&TCB::running->context);
    800019b4:	01050593          	addi	a1,a0,16
    800019b8:	01090513          	addi	a0,s2,16
    800019bc:	fffff097          	auipc	ra,0xfffff
    800019c0:	774080e7          	jalr	1908(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    800019c4:	01813083          	ld	ra,24(sp)
    800019c8:	01013403          	ld	s0,16(sp)
    800019cc:	00813483          	ld	s1,8(sp)
    800019d0:	00013903          	ld	s2,0(sp)
    800019d4:	02010113          	addi	sp,sp,32
    800019d8:	00008067          	ret
            head=tail=el;
    800019dc:	02a4b023          	sd	a0,32(s1)
    800019e0:	00a4bc23          	sd	a0,24(s1)
    800019e4:	fbdff06f          	j	800019a0 <_ZN9Semaphore5blockEv+0x4c>

00000000800019e8 <_ZN9Semaphore8sem_waitEv>:
int Semaphore::sem_wait() {
    800019e8:	fe010113          	addi	sp,sp,-32
    800019ec:	00113c23          	sd	ra,24(sp)
    800019f0:	00813823          	sd	s0,16(sp)
    800019f4:	00913423          	sd	s1,8(sp)
    800019f8:	02010413          	addi	s0,sp,32
    800019fc:	00050493          	mv	s1,a0
    if (--val<0) {
    80001a00:	00052783          	lw	a5,0(a0)
    80001a04:	fff7879b          	addiw	a5,a5,-1
    80001a08:	00f52023          	sw	a5,0(a0)
    80001a0c:	02079713          	slli	a4,a5,0x20
    80001a10:	02074263          	bltz	a4,80001a34 <_ZN9Semaphore8sem_waitEv+0x4c>
    if (this->closed) {
    80001a14:	0044c783          	lbu	a5,4(s1)
    80001a18:	02079463          	bnez	a5,80001a40 <_ZN9Semaphore8sem_waitEv+0x58>
    return 0;
    80001a1c:	00000513          	li	a0,0
}
    80001a20:	01813083          	ld	ra,24(sp)
    80001a24:	01013403          	ld	s0,16(sp)
    80001a28:	00813483          	ld	s1,8(sp)
    80001a2c:	02010113          	addi	sp,sp,32
    80001a30:	00008067          	ret
        block();
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	f20080e7          	jalr	-224(ra) # 80001954 <_ZN9Semaphore5blockEv>
    80001a3c:	fd9ff06f          	j	80001a14 <_ZN9Semaphore8sem_waitEv+0x2c>
        return -1;
    80001a40:	fff00513          	li	a0,-1
    80001a44:	fddff06f          	j	80001a20 <_ZN9Semaphore8sem_waitEv+0x38>

0000000080001a48 <_ZN9Semaphore7unblockEv>:
void Semaphore::unblock() {
    80001a48:	00050793          	mv	a5,a0
        if (!head) return 0;
    80001a4c:	01853503          	ld	a0,24(a0)
    80001a50:	04050e63          	beqz	a0,80001aac <_ZN9Semaphore7unblockEv+0x64>
    80001a54:	fe010113          	addi	sp,sp,-32
    80001a58:	00113c23          	sd	ra,24(sp)
    80001a5c:	00813823          	sd	s0,16(sp)
    80001a60:	00913423          	sd	s1,8(sp)
    80001a64:	02010413          	addi	s0,sp,32
        head=head->next;
    80001a68:	00853703          	ld	a4,8(a0)
    80001a6c:	00e7bc23          	sd	a4,24(a5)
        if (!head) tail=0;
    80001a70:	02070a63          	beqz	a4,80001aa4 <_ZN9Semaphore7unblockEv+0x5c>
        T *ret=el->data;
    80001a74:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80001a78:	00002097          	auipc	ra,0x2
    80001a7c:	d34080e7          	jalr	-716(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    if (thread) {
    80001a80:	00048863          	beqz	s1,80001a90 <_ZN9Semaphore7unblockEv+0x48>
        Scheduler::put(thread);
    80001a84:	00048513          	mv	a0,s1
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	6c0080e7          	jalr	1728(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
}
    80001a90:	01813083          	ld	ra,24(sp)
    80001a94:	01013403          	ld	s0,16(sp)
    80001a98:	00813483          	ld	s1,8(sp)
    80001a9c:	02010113          	addi	sp,sp,32
    80001aa0:	00008067          	ret
        if (!head) tail=0;
    80001aa4:	0207b023          	sd	zero,32(a5)
    80001aa8:	fcdff06f          	j	80001a74 <_ZN9Semaphore7unblockEv+0x2c>
    80001aac:	00008067          	ret

0000000080001ab0 <_ZN9Semaphore10sem_signalEv>:
    if (++val<=0) {
    80001ab0:	00052783          	lw	a5,0(a0)
    80001ab4:	0017879b          	addiw	a5,a5,1
    80001ab8:	0007871b          	sext.w	a4,a5
    80001abc:	00f52023          	sw	a5,0(a0)
    80001ac0:	00e05663          	blez	a4,80001acc <_ZN9Semaphore10sem_signalEv+0x1c>
}
    80001ac4:	00000513          	li	a0,0
    80001ac8:	00008067          	ret
int Semaphore::sem_signal() {
    80001acc:	ff010113          	addi	sp,sp,-16
    80001ad0:	00113423          	sd	ra,8(sp)
    80001ad4:	00813023          	sd	s0,0(sp)
    80001ad8:	01010413          	addi	s0,sp,16
        unblock();
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	f6c080e7          	jalr	-148(ra) # 80001a48 <_ZN9Semaphore7unblockEv>
}
    80001ae4:	00000513          	li	a0,0
    80001ae8:	00813083          	ld	ra,8(sp)
    80001aec:	00013403          	ld	s0,0(sp)
    80001af0:	01010113          	addi	sp,sp,16
    80001af4:	00008067          	ret

0000000080001af8 <_ZN9Semaphore12semTryToWaitEv>:
int Semaphore::semTryToWait() {
    80001af8:	ff010113          	addi	sp,sp,-16
    80001afc:	00813423          	sd	s0,8(sp)
    80001b00:	01010413          	addi	s0,sp,16
    int getVal()const{return val;}
    80001b04:	00052783          	lw	a5,0(a0)
    if (this->getVal()-1>=0) {
    80001b08:	00f04a63          	bgtz	a5,80001b1c <_ZN9Semaphore12semTryToWaitEv+0x24>
    return 1;
    80001b0c:	00100513          	li	a0,1
}
    80001b10:	00813403          	ld	s0,8(sp)
    80001b14:	01010113          	addi	sp,sp,16
    80001b18:	00008067          	ret
        this->val--;
    80001b1c:	fff7879b          	addiw	a5,a5,-1
    80001b20:	00f52023          	sw	a5,0(a0)
        return 0;
    80001b24:	00000513          	li	a0,0
    80001b28:	fe9ff06f          	j	80001b10 <_ZN9Semaphore12semTryToWaitEv+0x18>

0000000080001b2c <_ZN9Semaphore11semTimeWaitEm>:
int Semaphore::semTimeWait(time_t t) {
    80001b2c:	fe010113          	addi	sp,sp,-32
    80001b30:	00113c23          	sd	ra,24(sp)
    80001b34:	00813823          	sd	s0,16(sp)
    80001b38:	00913423          	sd	s1,8(sp)
    80001b3c:	02010413          	addi	s0,sp,32
    80001b40:	00050493          	mv	s1,a0
    val--;
    80001b44:	00052783          	lw	a5,0(a0)
    80001b48:	fff7879b          	addiw	a5,a5,-1
    80001b4c:	00f52023          	sw	a5,0(a0)
    if (val<0) {
    80001b50:	02079713          	slli	a4,a5,0x20
    80001b54:	02074663          	bltz	a4,80001b80 <_ZN9Semaphore11semTimeWaitEm+0x54>
    if (this->closed)return -1;
    80001b58:	0044c783          	lbu	a5,4(s1)
    80001b5c:	02079a63          	bnez	a5,80001b90 <_ZN9Semaphore11semTimeWaitEm+0x64>
    if (this->timedOut)return -2;
    80001b60:	0104c783          	lbu	a5,16(s1)
    80001b64:	02079a63          	bnez	a5,80001b98 <_ZN9Semaphore11semTimeWaitEm+0x6c>
    return 0;
    80001b68:	00000513          	li	a0,0
}
    80001b6c:	01813083          	ld	ra,24(sp)
    80001b70:	01013403          	ld	s0,16(sp)
    80001b74:	00813483          	ld	s1,8(sp)
    80001b78:	02010113          	addi	sp,sp,32
    80001b7c:	00008067          	ret
        this->timeout=t;
    80001b80:	00b53423          	sd	a1,8(a0)
        block();
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	dd0080e7          	jalr	-560(ra) # 80001954 <_ZN9Semaphore5blockEv>
    80001b8c:	fcdff06f          	j	80001b58 <_ZN9Semaphore11semTimeWaitEm+0x2c>
    if (this->closed)return -1;
    80001b90:	fff00513          	li	a0,-1
    80001b94:	fd9ff06f          	j	80001b6c <_ZN9Semaphore11semTimeWaitEm+0x40>
    if (this->timedOut)return -2;
    80001b98:	ffe00513          	li	a0,-2
    80001b9c:	fd1ff06f          	j	80001b6c <_ZN9Semaphore11semTimeWaitEm+0x40>

0000000080001ba0 <_GLOBAL__sub_I__ZN9Semaphore18allSemaphoresQueueE>:
}
    80001ba0:	ff010113          	addi	sp,sp,-16
    80001ba4:	00113423          	sd	ra,8(sp)
    80001ba8:	00813023          	sd	s0,0(sp)
    80001bac:	01010413          	addi	s0,sp,16
    80001bb0:	000105b7          	lui	a1,0x10
    80001bb4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001bb8:	00100513          	li	a0,1
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	bf4080e7          	jalr	-1036(ra) # 800017b0 <_Z41__static_initialization_and_destruction_0ii>
    80001bc4:	00813083          	ld	ra,8(sp)
    80001bc8:	00013403          	ld	s0,0(sp)
    80001bcc:	01010113          	addi	sp,sp,16
    80001bd0:	00008067          	ret

0000000080001bd4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80001bd4:	fe010113          	addi	sp,sp,-32
    80001bd8:	00113c23          	sd	ra,24(sp)
    80001bdc:	00813823          	sd	s0,16(sp)
    80001be0:	00913423          	sd	s1,8(sp)
    80001be4:	02010413          	addi	s0,sp,32
    80001be8:	00050493          	mv	s1,a0
    LOCK();
    80001bec:	00100613          	li	a2,1
    80001bf0:	00000593          	li	a1,0
    80001bf4:	0000b517          	auipc	a0,0xb
    80001bf8:	06c50513          	addi	a0,a0,108 # 8000cc60 <lockPrint>
    80001bfc:	fffff097          	auipc	ra,0xfffff
    80001c00:	404080e7          	jalr	1028(ra) # 80001000 <copy_and_swap>
    80001c04:	00050863          	beqz	a0,80001c14 <_Z11printStringPKc+0x40>
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	8d8080e7          	jalr	-1832(ra) # 800014e0 <_Z15thread_dispatchv>
    80001c10:	fddff06f          	j	80001bec <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001c14:	0004c503          	lbu	a0,0(s1)
    80001c18:	00050a63          	beqz	a0,80001c2c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80001c1c:	00000097          	auipc	ra,0x0
    80001c20:	b54080e7          	jalr	-1196(ra) # 80001770 <_Z4putcc>
        string++;
    80001c24:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001c28:	fedff06f          	j	80001c14 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80001c2c:	00000613          	li	a2,0
    80001c30:	00100593          	li	a1,1
    80001c34:	0000b517          	auipc	a0,0xb
    80001c38:	02c50513          	addi	a0,a0,44 # 8000cc60 <lockPrint>
    80001c3c:	fffff097          	auipc	ra,0xfffff
    80001c40:	3c4080e7          	jalr	964(ra) # 80001000 <copy_and_swap>
    80001c44:	fe0514e3          	bnez	a0,80001c2c <_Z11printStringPKc+0x58>
}
    80001c48:	01813083          	ld	ra,24(sp)
    80001c4c:	01013403          	ld	s0,16(sp)
    80001c50:	00813483          	ld	s1,8(sp)
    80001c54:	02010113          	addi	sp,sp,32
    80001c58:	00008067          	ret

0000000080001c5c <_Z12printStringSPKc>:
void printStringS(const char* string) {
    80001c5c:	fe010113          	addi	sp,sp,-32
    80001c60:	00113c23          	sd	ra,24(sp)
    80001c64:	00813823          	sd	s0,16(sp)
    80001c68:	00913423          	sd	s1,8(sp)
    80001c6c:	02010413          	addi	s0,sp,32
    80001c70:	00050493          	mv	s1,a0
    LOCK();
    80001c74:	00100613          	li	a2,1
    80001c78:	00000593          	li	a1,0
    80001c7c:	0000b517          	auipc	a0,0xb
    80001c80:	fe450513          	addi	a0,a0,-28 # 8000cc60 <lockPrint>
    80001c84:	fffff097          	auipc	ra,0xfffff
    80001c88:	37c080e7          	jalr	892(ra) # 80001000 <copy_and_swap>
    80001c8c:	00050863          	beqz	a0,80001c9c <_Z12printStringSPKc+0x40>
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	850080e7          	jalr	-1968(ra) # 800014e0 <_Z15thread_dispatchv>
    80001c98:	fddff06f          	j	80001c74 <_Z12printStringSPKc+0x18>
    while (*string != '\0') {
    80001c9c:	0004c503          	lbu	a0,0(s1)
    80001ca0:	00050a63          	beqz	a0,80001cb4 <_Z12printStringSPKc+0x58>
        Console::writeCharSync(*string);
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	7f0080e7          	jalr	2032(ra) # 80002494 <_ZN7Console13writeCharSyncEc>
        string++;
    80001cac:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001cb0:	fedff06f          	j	80001c9c <_Z12printStringSPKc+0x40>
    }
    UNLOCK();
    80001cb4:	00000613          	li	a2,0
    80001cb8:	00100593          	li	a1,1
    80001cbc:	0000b517          	auipc	a0,0xb
    80001cc0:	fa450513          	addi	a0,a0,-92 # 8000cc60 <lockPrint>
    80001cc4:	fffff097          	auipc	ra,0xfffff
    80001cc8:	33c080e7          	jalr	828(ra) # 80001000 <copy_and_swap>
    80001ccc:	fe0514e3          	bnez	a0,80001cb4 <_Z12printStringSPKc+0x58>
}
    80001cd0:	01813083          	ld	ra,24(sp)
    80001cd4:	01013403          	ld	s0,16(sp)
    80001cd8:	00813483          	ld	s1,8(sp)
    80001cdc:	02010113          	addi	sp,sp,32
    80001ce0:	00008067          	ret

0000000080001ce4 <_Z9getStringPci>:
char* getString(char *buf, int max) {
    80001ce4:	fd010113          	addi	sp,sp,-48
    80001ce8:	02113423          	sd	ra,40(sp)
    80001cec:	02813023          	sd	s0,32(sp)
    80001cf0:	00913c23          	sd	s1,24(sp)
    80001cf4:	01213823          	sd	s2,16(sp)
    80001cf8:	01313423          	sd	s3,8(sp)
    80001cfc:	01413023          	sd	s4,0(sp)
    80001d00:	03010413          	addi	s0,sp,48
    80001d04:	00050993          	mv	s3,a0
    80001d08:	00058a13          	mv	s4,a1
    LOCK();
    80001d0c:	00100613          	li	a2,1
    80001d10:	00000593          	li	a1,0
    80001d14:	0000b517          	auipc	a0,0xb
    80001d18:	f4c50513          	addi	a0,a0,-180 # 8000cc60 <lockPrint>
    80001d1c:	fffff097          	auipc	ra,0xfffff
    80001d20:	2e4080e7          	jalr	740(ra) # 80001000 <copy_and_swap>
    80001d24:	00050863          	beqz	a0,80001d34 <_Z9getStringPci+0x50>
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	7b8080e7          	jalr	1976(ra) # 800014e0 <_Z15thread_dispatchv>
    80001d30:	fddff06f          	j	80001d0c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001d34:	00000913          	li	s2,0
    80001d38:	00090493          	mv	s1,s2
    80001d3c:	0019091b          	addiw	s2,s2,1
    80001d40:	03495a63          	bge	s2,s4,80001d74 <_Z9getStringPci+0x90>
        cc = getc();
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	9d0080e7          	jalr	-1584(ra) # 80001714 <_Z4getcv>
        if(cc < 1)
    80001d4c:	02050463          	beqz	a0,80001d74 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80001d50:	009984b3          	add	s1,s3,s1
    80001d54:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001d58:	00a00793          	li	a5,10
    80001d5c:	00f50a63          	beq	a0,a5,80001d70 <_Z9getStringPci+0x8c>
    80001d60:	00d00793          	li	a5,13
    80001d64:	fcf51ae3          	bne	a0,a5,80001d38 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80001d68:	00090493          	mv	s1,s2
    80001d6c:	0080006f          	j	80001d74 <_Z9getStringPci+0x90>
    80001d70:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001d74:	009984b3          	add	s1,s3,s1
    80001d78:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001d7c:	00000613          	li	a2,0
    80001d80:	00100593          	li	a1,1
    80001d84:	0000b517          	auipc	a0,0xb
    80001d88:	edc50513          	addi	a0,a0,-292 # 8000cc60 <lockPrint>
    80001d8c:	fffff097          	auipc	ra,0xfffff
    80001d90:	274080e7          	jalr	628(ra) # 80001000 <copy_and_swap>
    80001d94:	fe0514e3          	bnez	a0,80001d7c <_Z9getStringPci+0x98>
    return buf;
}
    80001d98:	00098513          	mv	a0,s3
    80001d9c:	02813083          	ld	ra,40(sp)
    80001da0:	02013403          	ld	s0,32(sp)
    80001da4:	01813483          	ld	s1,24(sp)
    80001da8:	01013903          	ld	s2,16(sp)
    80001dac:	00813983          	ld	s3,8(sp)
    80001db0:	00013a03          	ld	s4,0(sp)
    80001db4:	03010113          	addi	sp,sp,48
    80001db8:	00008067          	ret

0000000080001dbc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001dbc:	ff010113          	addi	sp,sp,-16
    80001dc0:	00813423          	sd	s0,8(sp)
    80001dc4:	01010413          	addi	s0,sp,16
    80001dc8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001dcc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001dd0:	0006c603          	lbu	a2,0(a3)
    80001dd4:	fd06071b          	addiw	a4,a2,-48
    80001dd8:	0ff77713          	andi	a4,a4,255
    80001ddc:	00900793          	li	a5,9
    80001de0:	02e7e063          	bltu	a5,a4,80001e00 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001de4:	0025179b          	slliw	a5,a0,0x2
    80001de8:	00a787bb          	addw	a5,a5,a0
    80001dec:	0017979b          	slliw	a5,a5,0x1
    80001df0:	00168693          	addi	a3,a3,1
    80001df4:	00c787bb          	addw	a5,a5,a2
    80001df8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001dfc:	fd5ff06f          	j	80001dd0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001e00:	00813403          	ld	s0,8(sp)
    80001e04:	01010113          	addi	sp,sp,16
    80001e08:	00008067          	ret

0000000080001e0c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001e0c:	fc010113          	addi	sp,sp,-64
    80001e10:	02113c23          	sd	ra,56(sp)
    80001e14:	02813823          	sd	s0,48(sp)
    80001e18:	02913423          	sd	s1,40(sp)
    80001e1c:	03213023          	sd	s2,32(sp)
    80001e20:	01313c23          	sd	s3,24(sp)
    80001e24:	04010413          	addi	s0,sp,64
    80001e28:	00050493          	mv	s1,a0
    80001e2c:	00058913          	mv	s2,a1
    80001e30:	00060993          	mv	s3,a2
    LOCK();
    80001e34:	00100613          	li	a2,1
    80001e38:	00000593          	li	a1,0
    80001e3c:	0000b517          	auipc	a0,0xb
    80001e40:	e2450513          	addi	a0,a0,-476 # 8000cc60 <lockPrint>
    80001e44:	fffff097          	auipc	ra,0xfffff
    80001e48:	1bc080e7          	jalr	444(ra) # 80001000 <copy_and_swap>
    80001e4c:	00050863          	beqz	a0,80001e5c <_Z8printIntiii+0x50>
    80001e50:	fffff097          	auipc	ra,0xfffff
    80001e54:	690080e7          	jalr	1680(ra) # 800014e0 <_Z15thread_dispatchv>
    80001e58:	fddff06f          	j	80001e34 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001e5c:	00098463          	beqz	s3,80001e64 <_Z8printIntiii+0x58>
    80001e60:	0804c463          	bltz	s1,80001ee8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001e64:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001e68:	00000593          	li	a1,0
    }

    i = 0;
    80001e6c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001e70:	0009079b          	sext.w	a5,s2
    80001e74:	0325773b          	remuw	a4,a0,s2
    80001e78:	00048613          	mv	a2,s1
    80001e7c:	0014849b          	addiw	s1,s1,1
    80001e80:	02071693          	slli	a3,a4,0x20
    80001e84:	0206d693          	srli	a3,a3,0x20
    80001e88:	0000b717          	auipc	a4,0xb
    80001e8c:	ad870713          	addi	a4,a4,-1320 # 8000c960 <digits>
    80001e90:	00d70733          	add	a4,a4,a3
    80001e94:	00074683          	lbu	a3,0(a4)
    80001e98:	fd040713          	addi	a4,s0,-48
    80001e9c:	00c70733          	add	a4,a4,a2
    80001ea0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001ea4:	0005071b          	sext.w	a4,a0
    80001ea8:	0325553b          	divuw	a0,a0,s2
    80001eac:	fcf772e3          	bgeu	a4,a5,80001e70 <_Z8printIntiii+0x64>
    if(neg)
    80001eb0:	00058c63          	beqz	a1,80001ec8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80001eb4:	fd040793          	addi	a5,s0,-48
    80001eb8:	009784b3          	add	s1,a5,s1
    80001ebc:	02d00793          	li	a5,45
    80001ec0:	fef48823          	sb	a5,-16(s1)
    80001ec4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001ec8:	fff4849b          	addiw	s1,s1,-1
    80001ecc:	0204c463          	bltz	s1,80001ef4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80001ed0:	fd040793          	addi	a5,s0,-48
    80001ed4:	009787b3          	add	a5,a5,s1
    80001ed8:	ff07c503          	lbu	a0,-16(a5)
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	894080e7          	jalr	-1900(ra) # 80001770 <_Z4putcc>
    80001ee4:	fe5ff06f          	j	80001ec8 <_Z8printIntiii+0xbc>
        x = -xx;
    80001ee8:	4090053b          	negw	a0,s1
        neg = 1;
    80001eec:	00100593          	li	a1,1
        x = -xx;
    80001ef0:	f7dff06f          	j	80001e6c <_Z8printIntiii+0x60>

    UNLOCK();
    80001ef4:	00000613          	li	a2,0
    80001ef8:	00100593          	li	a1,1
    80001efc:	0000b517          	auipc	a0,0xb
    80001f00:	d6450513          	addi	a0,a0,-668 # 8000cc60 <lockPrint>
    80001f04:	fffff097          	auipc	ra,0xfffff
    80001f08:	0fc080e7          	jalr	252(ra) # 80001000 <copy_and_swap>
    80001f0c:	fe0514e3          	bnez	a0,80001ef4 <_Z8printIntiii+0xe8>
}
    80001f10:	03813083          	ld	ra,56(sp)
    80001f14:	03013403          	ld	s0,48(sp)
    80001f18:	02813483          	ld	s1,40(sp)
    80001f1c:	02013903          	ld	s2,32(sp)
    80001f20:	01813983          	ld	s3,24(sp)
    80001f24:	04010113          	addi	sp,sp,64
    80001f28:	00008067          	ret

0000000080001f2c <_Z9printIntSiii>:

void printIntS(int xx, int base, int sgn) {
    80001f2c:	fc010113          	addi	sp,sp,-64
    80001f30:	02113c23          	sd	ra,56(sp)
    80001f34:	02813823          	sd	s0,48(sp)
    80001f38:	02913423          	sd	s1,40(sp)
    80001f3c:	03213023          	sd	s2,32(sp)
    80001f40:	01313c23          	sd	s3,24(sp)
    80001f44:	04010413          	addi	s0,sp,64
    80001f48:	00050493          	mv	s1,a0
    80001f4c:	00058913          	mv	s2,a1
    80001f50:	00060993          	mv	s3,a2
    LOCK();
    80001f54:	00100613          	li	a2,1
    80001f58:	00000593          	li	a1,0
    80001f5c:	0000b517          	auipc	a0,0xb
    80001f60:	d0450513          	addi	a0,a0,-764 # 8000cc60 <lockPrint>
    80001f64:	fffff097          	auipc	ra,0xfffff
    80001f68:	09c080e7          	jalr	156(ra) # 80001000 <copy_and_swap>
    80001f6c:	00050863          	beqz	a0,80001f7c <_Z9printIntSiii+0x50>
    80001f70:	fffff097          	auipc	ra,0xfffff
    80001f74:	570080e7          	jalr	1392(ra) # 800014e0 <_Z15thread_dispatchv>
    80001f78:	fddff06f          	j	80001f54 <_Z9printIntSiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001f7c:	00098463          	beqz	s3,80001f84 <_Z9printIntSiii+0x58>
    80001f80:	0804c463          	bltz	s1,80002008 <_Z9printIntSiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001f84:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001f88:	00000593          	li	a1,0
    }

    i = 0;
    80001f8c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001f90:	0009079b          	sext.w	a5,s2
    80001f94:	0325773b          	remuw	a4,a0,s2
    80001f98:	00048613          	mv	a2,s1
    80001f9c:	0014849b          	addiw	s1,s1,1
    80001fa0:	02071693          	slli	a3,a4,0x20
    80001fa4:	0206d693          	srli	a3,a3,0x20
    80001fa8:	0000b717          	auipc	a4,0xb
    80001fac:	9b870713          	addi	a4,a4,-1608 # 8000c960 <digits>
    80001fb0:	00d70733          	add	a4,a4,a3
    80001fb4:	00074683          	lbu	a3,0(a4)
    80001fb8:	fd040713          	addi	a4,s0,-48
    80001fbc:	00c70733          	add	a4,a4,a2
    80001fc0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001fc4:	0005071b          	sext.w	a4,a0
    80001fc8:	0325553b          	divuw	a0,a0,s2
    80001fcc:	fcf772e3          	bgeu	a4,a5,80001f90 <_Z9printIntSiii+0x64>
    if(neg)
    80001fd0:	00058c63          	beqz	a1,80001fe8 <_Z9printIntSiii+0xbc>
        buf[i++] = '-';
    80001fd4:	fd040793          	addi	a5,s0,-48
    80001fd8:	009784b3          	add	s1,a5,s1
    80001fdc:	02d00793          	li	a5,45
    80001fe0:	fef48823          	sb	a5,-16(s1)
    80001fe4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001fe8:	fff4849b          	addiw	s1,s1,-1
    80001fec:	0204c463          	bltz	s1,80002014 <_Z9printIntSiii+0xe8>
        Console::writeCharSync(buf[i]);
    80001ff0:	fd040793          	addi	a5,s0,-48
    80001ff4:	009787b3          	add	a5,a5,s1
    80001ff8:	ff07c503          	lbu	a0,-16(a5)
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	498080e7          	jalr	1176(ra) # 80002494 <_ZN7Console13writeCharSyncEc>
    80002004:	fe5ff06f          	j	80001fe8 <_Z9printIntSiii+0xbc>
        x = -xx;
    80002008:	4090053b          	negw	a0,s1
        neg = 1;
    8000200c:	00100593          	li	a1,1
        x = -xx;
    80002010:	f7dff06f          	j	80001f8c <_Z9printIntSiii+0x60>

    UNLOCK();
    80002014:	00000613          	li	a2,0
    80002018:	00100593          	li	a1,1
    8000201c:	0000b517          	auipc	a0,0xb
    80002020:	c4450513          	addi	a0,a0,-956 # 8000cc60 <lockPrint>
    80002024:	fffff097          	auipc	ra,0xfffff
    80002028:	fdc080e7          	jalr	-36(ra) # 80001000 <copy_and_swap>
    8000202c:	fe0514e3          	bnez	a0,80002014 <_Z9printIntSiii+0xe8>
    80002030:	03813083          	ld	ra,56(sp)
    80002034:	03013403          	ld	s0,48(sp)
    80002038:	02813483          	ld	s1,40(sp)
    8000203c:	02013903          	ld	s2,32(sp)
    80002040:	01813983          	ld	s3,24(sp)
    80002044:	04010113          	addi	sp,sp,64
    80002048:	00008067          	ret

000000008000204c <_Z8userMainv>:
#include "../h/printing.hpp"

void userMain() {
    8000204c:	fe010113          	addi	sp,sp,-32
    80002050:	00113c23          	sd	ra,24(sp)
    80002054:	00813823          	sd	s0,16(sp)
    80002058:	00913423          	sd	s1,8(sp)
    8000205c:	02010413          	addi	s0,sp,32
    for (int i = 0; i < 10; i++) {
    80002060:	00000493          	li	s1,0
    80002064:	00900793          	li	a5,9
    80002068:	0097ce63          	blt	a5,s1,80002084 <_Z8userMainv+0x38>
        printStringS("This is just a test for user flow of control.\n");
    8000206c:	00008517          	auipc	a0,0x8
    80002070:	fb450513          	addi	a0,a0,-76 # 8000a020 <CONSOLE_STATUS+0x10>
    80002074:	00000097          	auipc	ra,0x0
    80002078:	be8080e7          	jalr	-1048(ra) # 80001c5c <_Z12printStringSPKc>
    for (int i = 0; i < 10; i++) {
    8000207c:	0014849b          	addiw	s1,s1,1
    80002080:	fe5ff06f          	j	80002064 <_Z8userMainv+0x18>
    }
    80002084:	01813083          	ld	ra,24(sp)
    80002088:	01013403          	ld	s0,16(sp)
    8000208c:	00813483          	ld	s1,8(sp)
    80002090:	02010113          	addi	sp,sp,32
    80002094:	00008067          	ret

0000000080002098 <_Z41__static_initialization_and_destruction_0ii>:
    readyThreadsQueue.addLast(ccb);
}

TCB* Scheduler::peekFirst() {
    return readyThreadsQueue.peekFirst();
}
    80002098:	ff010113          	addi	sp,sp,-16
    8000209c:	00813423          	sd	s0,8(sp)
    800020a0:	01010413          	addi	s0,sp,16
    800020a4:	00100793          	li	a5,1
    800020a8:	00f50863          	beq	a0,a5,800020b8 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800020ac:	00813403          	ld	s0,8(sp)
    800020b0:	01010113          	addi	sp,sp,16
    800020b4:	00008067          	ret
    800020b8:	000107b7          	lui	a5,0x10
    800020bc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800020c0:	fef596e3          	bne	a1,a5,800020ac <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0), curr(0), prev(0) {}
    800020c4:	0000b797          	auipc	a5,0xb
    800020c8:	ba478793          	addi	a5,a5,-1116 # 8000cc68 <_ZN9Scheduler17readyThreadsQueueE>
    800020cc:	0007b023          	sd	zero,0(a5)
    800020d0:	0007b423          	sd	zero,8(a5)
    800020d4:	0007b823          	sd	zero,16(a5)
    800020d8:	0007bc23          	sd	zero,24(a5)
    800020dc:	fd1ff06f          	j	800020ac <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800020e0 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800020e0:	fe010113          	addi	sp,sp,-32
    800020e4:	00113c23          	sd	ra,24(sp)
    800020e8:	00813823          	sd	s0,16(sp)
    800020ec:	00913423          	sd	s1,8(sp)
    800020f0:	02010413          	addi	s0,sp,32
        if (!head) return 0;
    800020f4:	0000b517          	auipc	a0,0xb
    800020f8:	b7453503          	ld	a0,-1164(a0) # 8000cc68 <_ZN9Scheduler17readyThreadsQueueE>
    800020fc:	04050263          	beqz	a0,80002140 <_ZN9Scheduler3getEv+0x60>
        head=head->next;
    80002100:	00853783          	ld	a5,8(a0)
    80002104:	0000b717          	auipc	a4,0xb
    80002108:	b6f73223          	sd	a5,-1180(a4) # 8000cc68 <_ZN9Scheduler17readyThreadsQueueE>
        if (!head) tail=0;
    8000210c:	02078463          	beqz	a5,80002134 <_ZN9Scheduler3getEv+0x54>
        T *ret=el->data;
    80002110:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80002114:	00001097          	auipc	ra,0x1
    80002118:	698080e7          	jalr	1688(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000211c:	00048513          	mv	a0,s1
    80002120:	01813083          	ld	ra,24(sp)
    80002124:	01013403          	ld	s0,16(sp)
    80002128:	00813483          	ld	s1,8(sp)
    8000212c:	02010113          	addi	sp,sp,32
    80002130:	00008067          	ret
        if (!head) tail=0;
    80002134:	0000b797          	auipc	a5,0xb
    80002138:	b207be23          	sd	zero,-1220(a5) # 8000cc70 <_ZN9Scheduler17readyThreadsQueueE+0x8>
    8000213c:	fd5ff06f          	j	80002110 <_ZN9Scheduler3getEv+0x30>
        if (!head) return 0;
    80002140:	00050493          	mv	s1,a0
    return readyThreadsQueue.removeFIrst();
    80002144:	fd9ff06f          	j	8000211c <_ZN9Scheduler3getEv+0x3c>

0000000080002148 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *ccb) {
    80002148:	fe010113          	addi	sp,sp,-32
    8000214c:	00113c23          	sd	ra,24(sp)
    80002150:	00813823          	sd	s0,16(sp)
    80002154:	00913423          	sd	s1,8(sp)
    80002158:	02010413          	addi	s0,sp,32
    8000215c:	00050493          	mv	s1,a0
            return MemoryAllocator::mem_alloc(size);
    80002160:	01000513          	li	a0,16
    80002164:	00001097          	auipc	ra,0x1
    80002168:	50c080e7          	jalr	1292(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next):data(data),next(next){}
    8000216c:	00953023          	sd	s1,0(a0)
    80002170:	00053423          	sd	zero,8(a0)
        if (tail) {
    80002174:	0000b797          	auipc	a5,0xb
    80002178:	afc7b783          	ld	a5,-1284(a5) # 8000cc70 <_ZN9Scheduler17readyThreadsQueueE+0x8>
    8000217c:	02078263          	beqz	a5,800021a0 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next=el;
    80002180:	00a7b423          	sd	a0,8(a5)
            tail=el;
    80002184:	0000b797          	auipc	a5,0xb
    80002188:	aea7b623          	sd	a0,-1300(a5) # 8000cc70 <_ZN9Scheduler17readyThreadsQueueE+0x8>
}
    8000218c:	01813083          	ld	ra,24(sp)
    80002190:	01013403          	ld	s0,16(sp)
    80002194:	00813483          	ld	s1,8(sp)
    80002198:	02010113          	addi	sp,sp,32
    8000219c:	00008067          	ret
            head=tail=el;
    800021a0:	0000b797          	auipc	a5,0xb
    800021a4:	ac878793          	addi	a5,a5,-1336 # 8000cc68 <_ZN9Scheduler17readyThreadsQueueE>
    800021a8:	00a7b423          	sd	a0,8(a5)
    800021ac:	00a7b023          	sd	a0,0(a5)
    800021b0:	fddff06f          	j	8000218c <_ZN9Scheduler3putEP3TCB+0x44>

00000000800021b4 <_ZN9Scheduler9peekFirstEv>:
TCB* Scheduler::peekFirst() {
    800021b4:	ff010113          	addi	sp,sp,-16
    800021b8:	00813423          	sd	s0,8(sp)
    800021bc:	01010413          	addi	s0,sp,16
        if (!head)return  0;
    800021c0:	0000b517          	auipc	a0,0xb
    800021c4:	aa853503          	ld	a0,-1368(a0) # 8000cc68 <_ZN9Scheduler17readyThreadsQueueE>
    800021c8:	00050463          	beqz	a0,800021d0 <_ZN9Scheduler9peekFirstEv+0x1c>
        return head->data;
    800021cc:	00053503          	ld	a0,0(a0)
}
    800021d0:	00813403          	ld	s0,8(sp)
    800021d4:	01010113          	addi	sp,sp,16
    800021d8:	00008067          	ret

00000000800021dc <_GLOBAL__sub_I__ZN9Scheduler17readyThreadsQueueE>:
    800021dc:	ff010113          	addi	sp,sp,-16
    800021e0:	00113423          	sd	ra,8(sp)
    800021e4:	00813023          	sd	s0,0(sp)
    800021e8:	01010413          	addi	s0,sp,16
    800021ec:	000105b7          	lui	a1,0x10
    800021f0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800021f4:	00100513          	li	a0,1
    800021f8:	00000097          	auipc	ra,0x0
    800021fc:	ea0080e7          	jalr	-352(ra) # 80002098 <_Z41__static_initialization_and_destruction_0ii>
    80002200:	00813083          	ld	ra,8(sp)
    80002204:	00013403          	ld	s0,0(sp)
    80002208:	01010113          	addi	sp,sp,16
    8000220c:	00008067          	ret

0000000080002210 <_ZN7Console12outputWorkerEPv>:
    return  inputBuff;
}

void Console::outputWorker(void * arg) {
    while (true) {  //system background thread dedicated to outputting data (wait until hardware ready)
        while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}//Poll the console status reg until transmit buffer is ready (busy-wait)
    80002210:	0000b797          	auipc	a5,0xb
    80002214:	9907b783          	ld	a5,-1648(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002218:	0007b783          	ld	a5,0(a5)
    8000221c:	0007c783          	lbu	a5,0(a5)
    80002220:	0207f793          	andi	a5,a5,32
    80002224:	fe0786e3          	beqz	a5,80002210 <_ZN7Console12outputWorkerEPv>
void Console::outputWorker(void * arg) {
    80002228:	fe010113          	addi	sp,sp,-32
    8000222c:	00113c23          	sd	ra,24(sp)
    80002230:	00813823          	sd	s0,16(sp)
    80002234:	00913423          	sd	s1,8(sp)
    80002238:	02010413          	addi	s0,sp,32
        *((char*)CONSOLE_TX_DATA) = outputBuff->take(); //Take the next character from output buffer and writes to reg
    8000223c:	0000b797          	auipc	a5,0xb
    80002240:	97c7b783          	ld	a5,-1668(a5) # 8000cbb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002244:	0007b483          	ld	s1,0(a5)
    80002248:	0000b517          	auipc	a0,0xb
    8000224c:	a4053503          	ld	a0,-1472(a0) # 8000cc88 <_ZN7Console10outputBuffE>
    80002250:	00002097          	auipc	ra,0x2
    80002254:	8d0080e7          	jalr	-1840(ra) # 80003b20 <_ZN20ConsoleBoundedBuffer4takeEv>
    80002258:	00a48023          	sb	a0,0(s1)
        while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}//Poll the console status reg until transmit buffer is ready (busy-wait)
    8000225c:	0000b797          	auipc	a5,0xb
    80002260:	9447b783          	ld	a5,-1724(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002264:	0007b783          	ld	a5,0(a5)
    80002268:	0007c783          	lbu	a5,0(a5)
    8000226c:	0207f793          	andi	a5,a5,32
    80002270:	fe0786e3          	beqz	a5,8000225c <_ZN7Console12outputWorkerEPv+0x4c>
    80002274:	fc9ff06f          	j	8000223c <_ZN7Console12outputWorkerEPv+0x2c>

0000000080002278 <_ZN7Console8readCharEv>:
    if (!inputBuff) return '\0';
    80002278:	0000b517          	auipc	a0,0xb
    8000227c:	a1853503          	ld	a0,-1512(a0) # 8000cc90 <_ZN7Console9inputBuffE>
    80002280:	02050663          	beqz	a0,800022ac <_ZN7Console8readCharEv+0x34>
char Console::readChar() {
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00113423          	sd	ra,8(sp)
    8000228c:	00813023          	sd	s0,0(sp)
    80002290:	01010413          	addi	s0,sp,16
    return inputBuff->take();
    80002294:	00002097          	auipc	ra,0x2
    80002298:	88c080e7          	jalr	-1908(ra) # 80003b20 <_ZN20ConsoleBoundedBuffer4takeEv>
}
    8000229c:	00813083          	ld	ra,8(sp)
    800022a0:	00013403          	ld	s0,0(sp)
    800022a4:	01010113          	addi	sp,sp,16
    800022a8:	00008067          	ret
    if (!inputBuff) return '\0';
    800022ac:	00000513          	li	a0,0
}
    800022b0:	00008067          	ret

00000000800022b4 <_ZN7Console9writeCharEc>:
void Console::writeChar(char character) {
    800022b4:	00050593          	mv	a1,a0
    if (outputBuff!=nullptr) {
    800022b8:	0000b517          	auipc	a0,0xb
    800022bc:	9d053503          	ld	a0,-1584(a0) # 8000cc88 <_ZN7Console10outputBuffE>
    800022c0:	02050663          	beqz	a0,800022ec <_ZN7Console9writeCharEc+0x38>
void Console::writeChar(char character) {
    800022c4:	ff010113          	addi	sp,sp,-16
    800022c8:	00113423          	sd	ra,8(sp)
    800022cc:	00813023          	sd	s0,0(sp)
    800022d0:	01010413          	addi	s0,sp,16
        outputBuff->append(character);
    800022d4:	00001097          	auipc	ra,0x1
    800022d8:	7c0080e7          	jalr	1984(ra) # 80003a94 <_ZN20ConsoleBoundedBuffer6appendEc>
}
    800022dc:	00813083          	ld	ra,8(sp)
    800022e0:	00013403          	ld	s0,0(sp)
    800022e4:	01010113          	addi	sp,sp,16
    800022e8:	00008067          	ret
    800022ec:	00008067          	ret

00000000800022f0 <_ZN7Console15initInputBufferEv>:
void Console::initInputBuffer() {
    800022f0:	fe010113          	addi	sp,sp,-32
    800022f4:	00113c23          	sd	ra,24(sp)
    800022f8:	00813823          	sd	s0,16(sp)
    800022fc:	00913423          	sd	s1,8(sp)
    80002300:	01213023          	sd	s2,0(sp)
    80002304:	02010413          	addi	s0,sp,32
    inputBuff=new ConsoleBoundedBuffer(256);
    80002308:	03800513          	li	a0,56
    8000230c:	00000097          	auipc	ra,0x0
    80002310:	3f8080e7          	jalr	1016(ra) # 80002704 <_Znwm>
    80002314:	00050493          	mv	s1,a0
    80002318:	10000593          	li	a1,256
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	638080e7          	jalr	1592(ra) # 80003954 <_ZN20ConsoleBoundedBufferC1Ei>
    80002324:	0000b797          	auipc	a5,0xb
    80002328:	9697b623          	sd	s1,-1684(a5) # 8000cc90 <_ZN7Console9inputBuffE>
}
    8000232c:	01813083          	ld	ra,24(sp)
    80002330:	01013403          	ld	s0,16(sp)
    80002334:	00813483          	ld	s1,8(sp)
    80002338:	00013903          	ld	s2,0(sp)
    8000233c:	02010113          	addi	sp,sp,32
    80002340:	00008067          	ret
    80002344:	00050913          	mv	s2,a0
    inputBuff=new ConsoleBoundedBuffer(256);
    80002348:	00048513          	mv	a0,s1
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	408080e7          	jalr	1032(ra) # 80002754 <_ZdlPv>
    80002354:	00090513          	mv	a0,s2
    80002358:	0000c097          	auipc	ra,0xc
    8000235c:	a90080e7          	jalr	-1392(ra) # 8000dde8 <_Unwind_Resume>

0000000080002360 <_ZN7Console18startOutputServiceEPP3TCB>:
int Console::startOutputService(thread_t *threadHandle) {
    80002360:	fd010113          	addi	sp,sp,-48
    80002364:	02113423          	sd	ra,40(sp)
    80002368:	02813023          	sd	s0,32(sp)
    8000236c:	00913c23          	sd	s1,24(sp)
    80002370:	01213823          	sd	s2,16(sp)
    80002374:	01313423          	sd	s3,8(sp)
    80002378:	03010413          	addi	s0,sp,48
    8000237c:	00050993          	mv	s3,a0
    outputBuff=new ConsoleBoundedBuffer(256);
    80002380:	03800513          	li	a0,56
    80002384:	00000097          	auipc	ra,0x0
    80002388:	380080e7          	jalr	896(ra) # 80002704 <_Znwm>
    8000238c:	00050493          	mv	s1,a0
    80002390:	10000593          	li	a1,256
    80002394:	00001097          	auipc	ra,0x1
    80002398:	5c0080e7          	jalr	1472(ra) # 80003954 <_ZN20ConsoleBoundedBufferC1Ei>
    8000239c:	0000b797          	auipc	a5,0xb
    800023a0:	8e97b623          	sd	s1,-1812(a5) # 8000cc88 <_ZN7Console10outputBuffE>
    char *stack=(char*)MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE);
    800023a4:	00001537          	lui	a0,0x1
    800023a8:	00001097          	auipc	ra,0x1
    800023ac:	2c8080e7          	jalr	712(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
    800023b0:	00050493          	mv	s1,a0
    if (stack==nullptr) {
    800023b4:	06050263          	beqz	a0,80002418 <_ZN7Console18startOutputServiceEPP3TCB+0xb8>
    }*/

    //Dispatch the next thread from the sceduler
    static void dispatch();

/*
    800023b8:	03800513          	li	a0,56
    800023bc:	00001097          	auipc	ra,0x1
    800023c0:	2b4080e7          	jalr	692(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
    800023c4:	00050913          	mv	s2,a0
    TCB *thread=new TCB(outputWorker,nullptr,stack,true);
    800023c8:	00100713          	li	a4,1
    800023cc:	00048693          	mv	a3,s1
    800023d0:	00000613          	li	a2,0
    800023d4:	00000597          	auipc	a1,0x0
    800023d8:	e3c58593          	addi	a1,a1,-452 # 80002210 <_ZN7Console12outputWorkerEPv>
    800023dc:	00001097          	auipc	ra,0x1
    800023e0:	e9c080e7          	jalr	-356(ra) # 80003278 <_ZN3TCBC1EPFvPvES0_Pcb>
    if (thread==nullptr) {
    800023e4:	02090463          	beqz	s2,8000240c <_ZN7Console18startOutputServiceEPP3TCB+0xac>
    *threadHandle=thread;
    800023e8:	0129b023          	sd	s2,0(s3)
    return 0;
    800023ec:	00000513          	li	a0,0
}
    800023f0:	02813083          	ld	ra,40(sp)
    800023f4:	02013403          	ld	s0,32(sp)
    800023f8:	01813483          	ld	s1,24(sp)
    800023fc:	01013903          	ld	s2,16(sp)
    80002400:	00813983          	ld	s3,8(sp)
    80002404:	03010113          	addi	sp,sp,48
    80002408:	00008067          	ret
        *threadHandle=nullptr;
    8000240c:	0009b023          	sd	zero,0(s3)
        return -1;
    80002410:	fff00513          	li	a0,-1
    80002414:	fddff06f          	j	800023f0 <_ZN7Console18startOutputServiceEPP3TCB+0x90>
        return -1;
    80002418:	fff00513          	li	a0,-1
    8000241c:	fd5ff06f          	j	800023f0 <_ZN7Console18startOutputServiceEPP3TCB+0x90>
    80002420:	00050913          	mv	s2,a0
    outputBuff=new ConsoleBoundedBuffer(256);
    80002424:	00048513          	mv	a0,s1
    80002428:	00000097          	auipc	ra,0x0
    8000242c:	32c080e7          	jalr	812(ra) # 80002754 <_ZdlPv>
    80002430:	00090513          	mv	a0,s2
    80002434:	0000c097          	auipc	ra,0xc
    80002438:	9b4080e7          	jalr	-1612(ra) # 8000dde8 <_Unwind_Resume>
    8000243c:	00050493          	mv	s1,a0
    }*/

    //Check if scheduler is empty
    static bool schedulerIsEmpty();

    //Currently running thread
    80002440:	00090513          	mv	a0,s2
    80002444:	00001097          	auipc	ra,0x1
    80002448:	368080e7          	jalr	872(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    8000244c:	00048513          	mv	a0,s1
    80002450:	0000c097          	auipc	ra,0xc
    80002454:	998080e7          	jalr	-1640(ra) # 8000dde8 <_Unwind_Resume>

0000000080002458 <_ZN7Console14onCharRecievedEc>:
void Console::onCharRecieved(char character) {
    80002458:	00050593          	mv	a1,a0
    if (!inputBuff) return;
    8000245c:	0000b517          	auipc	a0,0xb
    80002460:	83453503          	ld	a0,-1996(a0) # 8000cc90 <_ZN7Console9inputBuffE>
    80002464:	02050663          	beqz	a0,80002490 <_ZN7Console14onCharRecievedEc+0x38>
void Console::onCharRecieved(char character) {
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00113423          	sd	ra,8(sp)
    80002470:	00813023          	sd	s0,0(sp)
    80002474:	01010413          	addi	s0,sp,16
    inputBuff->append(character);
    80002478:	00001097          	auipc	ra,0x1
    8000247c:	61c080e7          	jalr	1564(ra) # 80003a94 <_ZN20ConsoleBoundedBuffer6appendEc>
}
    80002480:	00813083          	ld	ra,8(sp)
    80002484:	00013403          	ld	s0,0(sp)
    80002488:	01010113          	addi	sp,sp,16
    8000248c:	00008067          	ret
    80002490:	00008067          	ret

0000000080002494 <_ZN7Console13writeCharSyncEc>:
void Console::writeCharSync(char character) {
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00813423          	sd	s0,8(sp)
    8000249c:	01010413          	addi	s0,sp,16
    while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {
    800024a0:	0000a797          	auipc	a5,0xa
    800024a4:	7007b783          	ld	a5,1792(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800024a8:	0007b783          	ld	a5,0(a5)
    800024ac:	0007c783          	lbu	a5,0(a5)
    800024b0:	0207f793          	andi	a5,a5,32
    800024b4:	fe0786e3          	beqz	a5,800024a0 <_ZN7Console13writeCharSyncEc+0xc>
    *((char*)CONSOLE_TX_DATA) = character;//Write character to the console data register
    800024b8:	0000a797          	auipc	a5,0xa
    800024bc:	7007b783          	ld	a5,1792(a5) # 8000cbb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800024c0:	0007b783          	ld	a5,0(a5)
    800024c4:	00a78023          	sb	a0,0(a5)
}
    800024c8:	00813403          	ld	s0,8(sp)
    800024cc:	01010113          	addi	sp,sp,16
    800024d0:	00008067          	ret

00000000800024d4 <_ZN7Console13getOutputBuffEv>:
ConsoleBoundedBuffer* Console::getOutputBuff() {
    800024d4:	ff010113          	addi	sp,sp,-16
    800024d8:	00813423          	sd	s0,8(sp)
    800024dc:	01010413          	addi	s0,sp,16
}
    800024e0:	0000a517          	auipc	a0,0xa
    800024e4:	7a853503          	ld	a0,1960(a0) # 8000cc88 <_ZN7Console10outputBuffE>
    800024e8:	00813403          	ld	s0,8(sp)
    800024ec:	01010113          	addi	sp,sp,16
    800024f0:	00008067          	ret

00000000800024f4 <_ZN7Console12getInputBuffEv>:
ConsoleBoundedBuffer* Console::getInputBuff() {
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00813423          	sd	s0,8(sp)
    800024fc:	01010413          	addi	s0,sp,16
}
    80002500:	0000a517          	auipc	a0,0xa
    80002504:	79053503          	ld	a0,1936(a0) # 8000cc90 <_ZN7Console9inputBuffE>
    80002508:	00813403          	ld	s0,8(sp)
    8000250c:	01010113          	addi	sp,sp,16
    80002510:	00008067          	ret

0000000080002514 <_Z15userMainWrapperPv>:

void userMain();

void userMainTests();

void userMainWrapper(void* arg) {
    80002514:	ff010113          	addi	sp,sp,-16
    80002518:	00113423          	sd	ra,8(sp)
    8000251c:	00813023          	sd	s0,0(sp)
    80002520:	01010413          	addi	s0,sp,16
    //    userMain();
    userMainTests();
    80002524:	00001097          	auipc	ra,0x1
    80002528:	684080e7          	jalr	1668(ra) # 80003ba8 <_Z13userMainTestsv>
}
    8000252c:	00813083          	ld	ra,8(sp)
    80002530:	00013403          	ld	s0,0(sp)
    80002534:	01010113          	addi	sp,sp,16
    80002538:	00008067          	ret

000000008000253c <main>:

void main() {
    8000253c:	fc010113          	addi	sp,sp,-64
    80002540:	02113c23          	sd	ra,56(sp)
    80002544:	02813823          	sd	s0,48(sp)
    80002548:	02913423          	sd	s1,40(sp)
    8000254c:	03213023          	sd	s2,32(sp)
    80002550:	04010413          	addi	s0,sp,64
    // initialize the kernel
    MemoryAllocator::initialize();
    80002554:	00001097          	auipc	ra,0x1
    80002558:	0c0080e7          	jalr	192(ra) # 80003614 <_ZN15MemoryAllocator10initializeEv>
    RISCV::w_stvec((size_t)(&RISCV::supervisorTrap));
    8000255c:	0000a797          	auipc	a5,0xa
    80002560:	6747b783          	ld	a5,1652(a5) # 8000cbd0 <_GLOBAL_OFFSET_TABLE_+0x48>
    __asm__ volatile("csrw stvec, %[stvec]" : : [stvec] "r" (stvec));
    80002564:	10579073          	csrw	stvec,a5

    thread_t threads[4];
    thread_create(&threads[0], nullptr, nullptr);
    80002568:	00000613          	li	a2,0
    8000256c:	00000593          	li	a1,0
    80002570:	fc040513          	addi	a0,s0,-64
    80002574:	fffff097          	auipc	ra,0xfffff
    80002578:	e60080e7          	jalr	-416(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = threads[0]; // must be init. imm. after we create a thread for main
    8000257c:	fc043703          	ld	a4,-64(s0)
    80002580:	0000a797          	auipc	a5,0xa
    80002584:	6587b783          	ld	a5,1624(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002588:	00e7b023          	sd	a4,0(a5)

    // terminal thread for putc and initialize buffer for getc
    Console::initInputBuffer();
    8000258c:	00000097          	auipc	ra,0x0
    80002590:	d64080e7          	jalr	-668(ra) # 800022f0 <_ZN7Console15initInputBufferEv>
    Console::startOutputService(&threads[2]);
    80002594:	fd040513          	addi	a0,s0,-48
    80002598:	00000097          	auipc	ra,0x0
    8000259c:	dc8080e7          	jalr	-568(ra) # 80002360 <_ZN7Console18startOutputServiceEPP3TCB>

    thread_create(&threads[1], &userMainWrapper, nullptr);
    800025a0:	00000613          	li	a2,0
    800025a4:	00000597          	auipc	a1,0x0
    800025a8:	f7058593          	addi	a1,a1,-144 # 80002514 <_Z15userMainWrapperPv>
    800025ac:	fc840513          	addi	a0,s0,-56
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	e24080e7          	jalr	-476(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
inline void RISCV::mc_sstatus(size_t mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void RISCV::ms_sstatus(size_t mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
    800025b8:	00200793          	li	a5,2
    800025bc:	1007a073          	csrs	sstatus,a5
}
    800025c0:	00c0006f          	j	800025cc <main+0x90>

    RISCV::ms_sstatus(RISCV::SSTATUS_SIE);

    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
        thread_dispatch();
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	f1c080e7          	jalr	-228(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
    800025cc:	fc843783          	ld	a5,-56(s0)
    //Exit the currently running thread (system call)
    800025d0:	0207c783          	lbu	a5,32(a5)
    800025d4:	fe0788e3          	beqz	a5,800025c4 <main+0x88>
    800025d8:	00001097          	auipc	ra,0x1
    800025dc:	df8080e7          	jalr	-520(ra) # 800033d0 <_ZN3TCB16schedulerIsEmptyEv>
    800025e0:	fe0502e3          	beqz	a0,800025c4 <main+0x88>
    800025e4:	fc040493          	addi	s1,s0,-64
    800025e8:	0080006f          	j	800025f0 <main+0xb4>
    }

    for (auto &thread : threads) {
    800025ec:	00848493          	addi	s1,s1,8
    800025f0:	fe040793          	addi	a5,s0,-32
    800025f4:	02f48463          	beq	s1,a5,8000261c <main+0xe0>
        delete thread;
    800025f8:	0004b903          	ld	s2,0(s1)
    800025fc:	fe0908e3          	beqz	s2,800025ec <main+0xb0>
    80002600:	00090513          	mv	a0,s2
    80002604:	00001097          	auipc	ra,0x1
    80002608:	ce8080e7          	jalr	-792(ra) # 800032ec <_ZN3TCBD1Ev>
    //Currently running thread
    8000260c:	00090513          	mv	a0,s2
    80002610:	00001097          	auipc	ra,0x1
    80002614:	19c080e7          	jalr	412(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    static TCB *running;
    80002618:	fd5ff06f          	j	800025ec <main+0xb0>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    __asm__ volatile ("sw t0, 80(x8)");
}

inline void RISCV::halt() {
    __asm__ volatile("li t0, 0x5555");
    8000261c:	000052b7          	lui	t0,0x5
    80002620:	5552829b          	addiw	t0,t0,1365
    __asm__ volatile("li t1, 0x100000");
    80002624:	00100337          	lui	t1,0x100
    __asm__ volatile("sw t0, 0(t1)");
    80002628:	00532023          	sw	t0,0(t1) # 100000 <_entry-0x7ff00000>
    }

    RISCV::halt();
    8000262c:	03813083          	ld	ra,56(sp)
    80002630:	03013403          	ld	s0,48(sp)
    80002634:	02813483          	ld	s1,40(sp)
    80002638:	02013903          	ld	s2,32(sp)
    8000263c:	04010113          	addi	sp,sp,64
    80002640:	00008067          	ret

0000000080002644 <_ZN6Thread10runWrapperEPv>:

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

void Thread::runWrapper(void* thisObj) {
    80002644:	ff010113          	addi	sp,sp,-16
    80002648:	00113423          	sd	ra,8(sp)
    8000264c:	00813023          	sd	s0,0(sp)
    80002650:	01010413          	addi	s0,sp,16
    ((Thread*)thisObj)->run();
    80002654:	00053783          	ld	a5,0(a0)
    80002658:	0107b783          	ld	a5,16(a5)
    8000265c:	000780e7          	jalr	a5
}
    80002660:	00813083          	ld	ra,8(sp)
    80002664:	00013403          	ld	s0,0(sp)
    80002668:	01010113          	addi	sp,sp,16
    8000266c:	00008067          	ret

0000000080002670 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002670:	fe010113          	addi	sp,sp,-32
    80002674:	00113c23          	sd	ra,24(sp)
    80002678:	00813823          	sd	s0,16(sp)
    8000267c:	00913423          	sd	s1,8(sp)
    80002680:	02010413          	addi	s0,sp,32
    80002684:	0000a797          	auipc	a5,0xa
    80002688:	30c78793          	addi	a5,a5,780 # 8000c990 <_ZTV6Thread+0x10>
    8000268c:	00f53023          	sd	a5,0(a0)
    if (myHandle->isFinished()) delete myHandle;
    80002690:	00853483          	ld	s1,8(a0)
    //Exit the currently running thread (system call)
    80002694:	0204c783          	lbu	a5,32(s1)
    80002698:	02078063          	beqz	a5,800026b8 <_ZN6ThreadD1Ev+0x48>
    8000269c:	00048e63          	beqz	s1,800026b8 <_ZN6ThreadD1Ev+0x48>
    800026a0:	00048513          	mv	a0,s1
    800026a4:	00001097          	auipc	ra,0x1
    800026a8:	c48080e7          	jalr	-952(ra) # 800032ec <_ZN3TCBD1Ev>
    //Currently running thread
    800026ac:	00048513          	mv	a0,s1
    800026b0:	00001097          	auipc	ra,0x1
    800026b4:	0fc080e7          	jalr	252(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
}
    800026b8:	01813083          	ld	ra,24(sp)
    800026bc:	01013403          	ld	s0,16(sp)
    800026c0:	00813483          	ld	s1,8(sp)
    800026c4:	02010113          	addi	sp,sp,32
    800026c8:	00008067          	ret

00000000800026cc <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore() {
    800026cc:	ff010113          	addi	sp,sp,-16
    800026d0:	00113423          	sd	ra,8(sp)
    800026d4:	00813023          	sd	s0,0(sp)
    800026d8:	01010413          	addi	s0,sp,16
    800026dc:	0000a797          	auipc	a5,0xa
    800026e0:	2dc78793          	addi	a5,a5,732 # 8000c9b8 <_ZTV9Semaphore+0x10>
    800026e4:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800026e8:	00853503          	ld	a0,8(a0)
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	ea0080e7          	jalr	-352(ra) # 8000158c <_Z9sem_closeP3Sem>
}
    800026f4:	00813083          	ld	ra,8(sp)
    800026f8:	00013403          	ld	s0,0(sp)
    800026fc:	01010113          	addi	sp,sp,16
    80002700:	00008067          	ret

0000000080002704 <_Znwm>:
void *operator new(size_t size) {
    80002704:	ff010113          	addi	sp,sp,-16
    80002708:	00113423          	sd	ra,8(sp)
    8000270c:	00813023          	sd	s0,0(sp)
    80002710:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	b44080e7          	jalr	-1212(ra) # 80001258 <_Z9mem_allocm>
}
    8000271c:	00813083          	ld	ra,8(sp)
    80002720:	00013403          	ld	s0,0(sp)
    80002724:	01010113          	addi	sp,sp,16
    80002728:	00008067          	ret

000000008000272c <_Znam>:
void *operator new[](size_t size) {
    8000272c:	ff010113          	addi	sp,sp,-16
    80002730:	00113423          	sd	ra,8(sp)
    80002734:	00813023          	sd	s0,0(sp)
    80002738:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	b1c080e7          	jalr	-1252(ra) # 80001258 <_Z9mem_allocm>
}
    80002744:	00813083          	ld	ra,8(sp)
    80002748:	00013403          	ld	s0,0(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret

0000000080002754 <_ZdlPv>:
void operator delete(void *mem) noexcept {
    80002754:	ff010113          	addi	sp,sp,-16
    80002758:	00113423          	sd	ra,8(sp)
    8000275c:	00813023          	sd	s0,0(sp)
    80002760:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	b60080e7          	jalr	-1184(ra) # 800012c4 <_Z8mem_freePv>
}
    8000276c:	00813083          	ld	ra,8(sp)
    80002770:	00013403          	ld	s0,0(sp)
    80002774:	01010113          	addi	sp,sp,16
    80002778:	00008067          	ret

000000008000277c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000277c:	fe010113          	addi	sp,sp,-32
    80002780:	00113c23          	sd	ra,24(sp)
    80002784:	00813823          	sd	s0,16(sp)
    80002788:	00913423          	sd	s1,8(sp)
    8000278c:	02010413          	addi	s0,sp,32
    80002790:	00050493          	mv	s1,a0
}
    80002794:	00000097          	auipc	ra,0x0
    80002798:	edc080e7          	jalr	-292(ra) # 80002670 <_ZN6ThreadD1Ev>
    8000279c:	00048513          	mv	a0,s1
    800027a0:	00000097          	auipc	ra,0x0
    800027a4:	fb4080e7          	jalr	-76(ra) # 80002754 <_ZdlPv>
    800027a8:	01813083          	ld	ra,24(sp)
    800027ac:	01013403          	ld	s0,16(sp)
    800027b0:	00813483          	ld	s1,8(sp)
    800027b4:	02010113          	addi	sp,sp,32
    800027b8:	00008067          	ret

00000000800027bc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800027bc:	fe010113          	addi	sp,sp,-32
    800027c0:	00113c23          	sd	ra,24(sp)
    800027c4:	00813823          	sd	s0,16(sp)
    800027c8:	00913423          	sd	s1,8(sp)
    800027cc:	02010413          	addi	s0,sp,32
    800027d0:	00050493          	mv	s1,a0
}
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	ef8080e7          	jalr	-264(ra) # 800026cc <_ZN9SemaphoreD1Ev>
    800027dc:	00048513          	mv	a0,s1
    800027e0:	00000097          	auipc	ra,0x0
    800027e4:	f74080e7          	jalr	-140(ra) # 80002754 <_ZdlPv>
    800027e8:	01813083          	ld	ra,24(sp)
    800027ec:	01013403          	ld	s0,16(sp)
    800027f0:	00813483          	ld	s1,8(sp)
    800027f4:	02010113          	addi	sp,sp,32
    800027f8:	00008067          	ret

00000000800027fc <_ZdaPv>:
void operator delete[](void *mem) noexcept {
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	00813023          	sd	s0,0(sp)
    80002808:	01010413          	addi	s0,sp,16
    mem_free(mem);
    8000280c:	fffff097          	auipc	ra,0xfffff
    80002810:	ab8080e7          	jalr	-1352(ra) # 800012c4 <_Z8mem_freePv>
}
    80002814:	00813083          	ld	ra,8(sp)
    80002818:	00013403          	ld	s0,0(sp)
    8000281c:	01010113          	addi	sp,sp,16
    80002820:	00008067          	ret

0000000080002824 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002824:	ff010113          	addi	sp,sp,-16
    80002828:	00813423          	sd	s0,8(sp)
    8000282c:	01010413          	addi	s0,sp,16
    80002830:	0000a797          	auipc	a5,0xa
    80002834:	16078793          	addi	a5,a5,352 # 8000c990 <_ZTV6Thread+0x10>
    80002838:	00f53023          	sd	a5,0(a0)
    this->body = body;
    8000283c:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80002840:	00c53c23          	sd	a2,24(a0)
    this->myHandle = nullptr;
    80002844:	00053423          	sd	zero,8(a0)
}
    80002848:	00813403          	ld	s0,8(sp)
    8000284c:	01010113          	addi	sp,sp,16
    80002850:	00008067          	ret

0000000080002854 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00813423          	sd	s0,8(sp)
    8000285c:	01010413          	addi	s0,sp,16
    80002860:	0000a797          	auipc	a5,0xa
    80002864:	13078793          	addi	a5,a5,304 # 8000c990 <_ZTV6Thread+0x10>
    80002868:	00f53023          	sd	a5,0(a0)
    this->body = runWrapper;
    8000286c:	00000797          	auipc	a5,0x0
    80002870:	dd878793          	addi	a5,a5,-552 # 80002644 <_ZN6Thread10runWrapperEPv>
    80002874:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    80002878:	00a53c23          	sd	a0,24(a0)
    this->myHandle = nullptr;
    8000287c:	00053423          	sd	zero,8(a0)
}
    80002880:	00813403          	ld	s0,8(sp)
    80002884:	01010113          	addi	sp,sp,16
    80002888:	00008067          	ret

000000008000288c <_ZN6Thread5startEv>:
int Thread::start() {
    8000288c:	fe010113          	addi	sp,sp,-32
    80002890:	00113c23          	sd	ra,24(sp)
    80002894:	00813823          	sd	s0,16(sp)
    80002898:	00913423          	sd	s1,8(sp)
    8000289c:	02010413          	addi	s0,sp,32
    800028a0:	00050493          	mv	s1,a0
    thread_create(&this->myHandle, this->body, this->arg);
    800028a4:	01853603          	ld	a2,24(a0)
    800028a8:	01053583          	ld	a1,16(a0)
    800028ac:	00850513          	addi	a0,a0,8
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	b24080e7          	jalr	-1244(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    if (this->myHandle) return 0;
    800028b8:	0084b783          	ld	a5,8(s1)
    800028bc:	00078e63          	beqz	a5,800028d8 <_ZN6Thread5startEv+0x4c>
    800028c0:	00000513          	li	a0,0
}
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00813483          	ld	s1,8(sp)
    800028d0:	02010113          	addi	sp,sp,32
    800028d4:	00008067          	ret
    else return -1;
    800028d8:	fff00513          	li	a0,-1
    800028dc:	fe9ff06f          	j	800028c4 <_ZN6Thread5startEv+0x38>

00000000800028e0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800028e0:	ff010113          	addi	sp,sp,-16
    800028e4:	00113423          	sd	ra,8(sp)
    800028e8:	00813023          	sd	s0,0(sp)
    800028ec:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	bf0080e7          	jalr	-1040(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800028f8:	00813083          	ld	ra,8(sp)
    800028fc:	00013403          	ld	s0,0(sp)
    80002900:	01010113          	addi	sp,sp,16
    80002904:	00008067          	ret

0000000080002908 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80002908:	ff010113          	addi	sp,sp,-16
    8000290c:	00113423          	sd	ra,8(sp)
    80002910:	00813023          	sd	s0,0(sp)
    80002914:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80002918:	fffff097          	auipc	ra,0xfffff
    8000291c:	dac080e7          	jalr	-596(ra) # 800016c4 <_Z10time_sleepm>
}
    80002920:	00813083          	ld	ra,8(sp)
    80002924:	00013403          	ld	s0,0(sp)
    80002928:	01010113          	addi	sp,sp,16
    8000292c:	00008067          	ret

0000000080002930 <_ZN14PeriodicThread3runEv>:

void PeriodicThread::terminate() {
    period = 0;
}

void PeriodicThread::run() {
    80002930:	fe010113          	addi	sp,sp,-32
    80002934:	00113c23          	sd	ra,24(sp)
    80002938:	00813823          	sd	s0,16(sp)
    8000293c:	00913423          	sd	s1,8(sp)
    80002940:	02010413          	addi	s0,sp,32
    80002944:	00050493          	mv	s1,a0
    while (period != 0) {
    80002948:	0204b783          	ld	a5,32(s1)
    8000294c:	02078263          	beqz	a5,80002970 <_ZN14PeriodicThread3runEv+0x40>
        periodicActivation();
    80002950:	0004b783          	ld	a5,0(s1)
    80002954:	0187b783          	ld	a5,24(a5)
    80002958:	00048513          	mv	a0,s1
    8000295c:	000780e7          	jalr	a5
        if (Thread::sleep(period) < 0) break;
    80002960:	0204b503          	ld	a0,32(s1)
    80002964:	00000097          	auipc	ra,0x0
    80002968:	fa4080e7          	jalr	-92(ra) # 80002908 <_ZN6Thread5sleepEm>
    8000296c:	fc055ee3          	bgez	a0,80002948 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80002970:	01813083          	ld	ra,24(sp)
    80002974:	01013403          	ld	s0,16(sp)
    80002978:	00813483          	ld	s1,8(sp)
    8000297c:	02010113          	addi	sp,sp,32
    80002980:	00008067          	ret

0000000080002984 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002984:	ff010113          	addi	sp,sp,-16
    80002988:	00113423          	sd	ra,8(sp)
    8000298c:	00813023          	sd	s0,0(sp)
    80002990:	01010413          	addi	s0,sp,16
    80002994:	0000a797          	auipc	a5,0xa
    80002998:	02478793          	addi	a5,a5,36 # 8000c9b8 <_ZTV9Semaphore+0x10>
    8000299c:	00f53023          	sd	a5,0(a0)
    sem_open(&this->myHandle, init);
    800029a0:	00850513          	addi	a0,a0,8
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	b7c080e7          	jalr	-1156(ra) # 80001520 <_Z8sem_openPP3Semj>
}
    800029ac:	00813083          	ld	ra,8(sp)
    800029b0:	00013403          	ld	s0,0(sp)
    800029b4:	01010113          	addi	sp,sp,16
    800029b8:	00008067          	ret

00000000800029bc <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800029bc:	ff010113          	addi	sp,sp,-16
    800029c0:	00113423          	sd	ra,8(sp)
    800029c4:	00813023          	sd	s0,0(sp)
    800029c8:	01010413          	addi	s0,sp,16
    return sem_wait(this->myHandle);
    800029cc:	00853503          	ld	a0,8(a0)
    800029d0:	fffff097          	auipc	ra,0xfffff
    800029d4:	c24080e7          	jalr	-988(ra) # 800015f4 <_Z8sem_waitP3Sem>
}
    800029d8:	00813083          	ld	ra,8(sp)
    800029dc:	00013403          	ld	s0,0(sp)
    800029e0:	01010113          	addi	sp,sp,16
    800029e4:	00008067          	ret

00000000800029e8 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800029e8:	ff010113          	addi	sp,sp,-16
    800029ec:	00113423          	sd	ra,8(sp)
    800029f0:	00813023          	sd	s0,0(sp)
    800029f4:	01010413          	addi	s0,sp,16
    return sem_signal(this->myHandle);
    800029f8:	00853503          	ld	a0,8(a0)
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	c60080e7          	jalr	-928(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80002a04:	00813083          	ld	ra,8(sp)
    80002a08:	00013403          	ld	s0,0(sp)
    80002a0c:	01010113          	addi	sp,sp,16
    80002a10:	00008067          	ret

0000000080002a14 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period): Thread() {
    80002a14:	fe010113          	addi	sp,sp,-32
    80002a18:	00113c23          	sd	ra,24(sp)
    80002a1c:	00813823          	sd	s0,16(sp)
    80002a20:	00913423          	sd	s1,8(sp)
    80002a24:	01213023          	sd	s2,0(sp)
    80002a28:	02010413          	addi	s0,sp,32
    80002a2c:	00050493          	mv	s1,a0
    80002a30:	00058913          	mv	s2,a1
    80002a34:	00000097          	auipc	ra,0x0
    80002a38:	e20080e7          	jalr	-480(ra) # 80002854 <_ZN6ThreadC1Ev>
    80002a3c:	0000a797          	auipc	a5,0xa
    80002a40:	f9c78793          	addi	a5,a5,-100 # 8000c9d8 <_ZTV14PeriodicThread+0x10>
    80002a44:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    80002a48:	0324b023          	sd	s2,32(s1)
}
    80002a4c:	01813083          	ld	ra,24(sp)
    80002a50:	01013403          	ld	s0,16(sp)
    80002a54:	00813483          	ld	s1,8(sp)
    80002a58:	00013903          	ld	s2,0(sp)
    80002a5c:	02010113          	addi	sp,sp,32
    80002a60:	00008067          	ret

0000000080002a64 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002a64:	ff010113          	addi	sp,sp,-16
    80002a68:	00813423          	sd	s0,8(sp)
    80002a6c:	01010413          	addi	s0,sp,16
    period = 0;
    80002a70:	02053023          	sd	zero,32(a0)
}
    80002a74:	00813403          	ld	s0,8(sp)
    80002a78:	01010113          	addi	sp,sp,16
    80002a7c:	00008067          	ret

0000000080002a80 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a80:	ff010113          	addi	sp,sp,-16
    80002a84:	00113423          	sd	ra,8(sp)
    80002a88:	00813023          	sd	s0,0(sp)
    80002a8c:	01010413          	addi	s0,sp,16
    return ::getc();
    80002a90:	fffff097          	auipc	ra,0xfffff
    80002a94:	c84080e7          	jalr	-892(ra) # 80001714 <_Z4getcv>
}
    80002a98:	00813083          	ld	ra,8(sp)
    80002a9c:	00013403          	ld	s0,0(sp)
    80002aa0:	01010113          	addi	sp,sp,16
    80002aa4:	00008067          	ret

0000000080002aa8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002aa8:	ff010113          	addi	sp,sp,-16
    80002aac:	00113423          	sd	ra,8(sp)
    80002ab0:	00813023          	sd	s0,0(sp)
    80002ab4:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002ab8:	fffff097          	auipc	ra,0xfffff
    80002abc:	cb8080e7          	jalr	-840(ra) # 80001770 <_Z4putcc>
}
    80002ac0:	00813083          	ld	ra,8(sp)
    80002ac4:	00013403          	ld	s0,0(sp)
    80002ac8:	01010113          	addi	sp,sp,16
    80002acc:	00008067          	ret

0000000080002ad0 <_ZN6Thread3runEv>:

    static void runWrapper(void*);
    thread_t getMyHandle() const { return myHandle; }
protected:
    Thread();
    virtual void run() {}
    80002ad0:	ff010113          	addi	sp,sp,-16
    80002ad4:	00813423          	sd	s0,8(sp)
    80002ad8:	01010413          	addi	s0,sp,16
    80002adc:	00813403          	ld	s0,8(sp)
    80002ae0:	01010113          	addi	sp,sp,16
    80002ae4:	00008067          	ret

0000000080002ae8 <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate();

protected:
    PeriodicThread(time_t period);
    virtual void periodicActivation () {}
    80002ae8:	ff010113          	addi	sp,sp,-16
    80002aec:	00813423          	sd	s0,8(sp)
    80002af0:	01010413          	addi	s0,sp,16
    80002af4:	00813403          	ld	s0,8(sp)
    80002af8:	01010113          	addi	sp,sp,16
    80002afc:	00008067          	ret

0000000080002b00 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002b00:	ff010113          	addi	sp,sp,-16
    80002b04:	00113423          	sd	ra,8(sp)
    80002b08:	00813023          	sd	s0,0(sp)
    80002b0c:	01010413          	addi	s0,sp,16
    80002b10:	0000a797          	auipc	a5,0xa
    80002b14:	ec878793          	addi	a5,a5,-312 # 8000c9d8 <_ZTV14PeriodicThread+0x10>
    80002b18:	00f53023          	sd	a5,0(a0)
    80002b1c:	00000097          	auipc	ra,0x0
    80002b20:	b54080e7          	jalr	-1196(ra) # 80002670 <_ZN6ThreadD1Ev>
    80002b24:	00813083          	ld	ra,8(sp)
    80002b28:	00013403          	ld	s0,0(sp)
    80002b2c:	01010113          	addi	sp,sp,16
    80002b30:	00008067          	ret

0000000080002b34 <_ZN14PeriodicThreadD0Ev>:
    80002b34:	fe010113          	addi	sp,sp,-32
    80002b38:	00113c23          	sd	ra,24(sp)
    80002b3c:	00813823          	sd	s0,16(sp)
    80002b40:	00913423          	sd	s1,8(sp)
    80002b44:	02010413          	addi	s0,sp,32
    80002b48:	00050493          	mv	s1,a0
    80002b4c:	0000a797          	auipc	a5,0xa
    80002b50:	e8c78793          	addi	a5,a5,-372 # 8000c9d8 <_ZTV14PeriodicThread+0x10>
    80002b54:	00f53023          	sd	a5,0(a0)
    80002b58:	00000097          	auipc	ra,0x0
    80002b5c:	b18080e7          	jalr	-1256(ra) # 80002670 <_ZN6ThreadD1Ev>
    80002b60:	00048513          	mv	a0,s1
    80002b64:	00000097          	auipc	ra,0x0
    80002b68:	bf0080e7          	jalr	-1040(ra) # 80002754 <_ZdlPv>
    80002b6c:	01813083          	ld	ra,24(sp)
    80002b70:	01013403          	ld	s0,16(sp)
    80002b74:	00813483          	ld	s1,8(sp)
    80002b78:	02010113          	addi	sp,sp,32
    80002b7c:	00008067          	ret

0000000080002b80 <_ZN5RISCV10popSppSpieEv>:
#include "../h/MemoryAllocator.hpp"

//---------------------------------------------------------
// Context and privilege utilities
//---------------------------------------------------------
void RISCV::popSppSpie() {
    80002b80:	ff010113          	addi	sp,sp,-16
    80002b84:	00813423          	sd	s0,8(sp)
    80002b88:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80002b8c:	10000793          	li	a5,256
    80002b90:	1007b073          	csrc	sstatus,a5
     mc_sstatus(SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80002b94:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002b98:	10200073          	sret
}
    80002b9c:	00813403          	ld	s0,8(sp)
    80002ba0:	01010113          	addi	sp,sp,16
    80002ba4:	00008067          	ret

0000000080002ba8 <_ZN5RISCV16systemPopSppSpieEv>:

void RISCV::systemPopSppSpie() {
    80002ba8:	ff010113          	addi	sp,sp,-16
    80002bac:	00813423          	sd	s0,8(sp)
    80002bb0:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80002bb4:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002bb8:	10200073          	sret
}
    80002bbc:	00813403          	ld	s0,8(sp)
    80002bc0:	01010113          	addi	sp,sp,16
    80002bc4:	00008067          	ret

0000000080002bc8 <_ZN5RISCV20handleSupervisorTrapEv>:

//---------------------------------------------------------
// Core Supervisor Trap Handler
//---------------------------------------------------------
void RISCV::handleSupervisorTrap() {
    80002bc8:	f0010113          	addi	sp,sp,-256
    80002bcc:	0e113c23          	sd	ra,248(sp)
    80002bd0:	0e813823          	sd	s0,240(sp)
    80002bd4:	0e913423          	sd	s1,232(sp)
    80002bd8:	0f213023          	sd	s2,224(sp)
    80002bdc:	10010413          	addi	s0,sp,256
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r" (scause));
    80002be0:	142027f3          	csrr	a5,scause
    80002be4:	f6f43423          	sd	a5,-152(s0)
    return scause;
    80002be8:	f6843783          	ld	a5,-152(s0)

    //volatile used to tell the compiler not to optimize acces to the variable
    //because its value may change outside the programs normal control bcs of context-switching, interrupts etc

    uint64  volatile scause = r_scause();
    80002bec:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80002bf0:	00050793          	mv	a5,a0
    80002bf4:	f6f43023          	sd	a5,-160(s0)
    return a0;
    80002bf8:	f6043783          	ld	a5,-160(s0)
    uint64 volatile code=r_a0();
    80002bfc:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80002c00:	00058793          	mv	a5,a1
    80002c04:	f4f43c23          	sd	a5,-168(s0)
    return a1;
    80002c08:	f5843783          	ld	a5,-168(s0)
    uint64 volatile arg1=r_a1();
    80002c0c:	fcf43423          	sd	a5,-56(s0)
    __asm__ volatile ("mv %0, a2" : "=r" (a2));
    80002c10:	00060793          	mv	a5,a2
    80002c14:	f4f43823          	sd	a5,-176(s0)
    return a2;
    80002c18:	f5043783          	ld	a5,-176(s0)
    uint64 volatile arg2=r_a2();
    80002c1c:	fcf43023          	sd	a5,-64(s0)
    __asm__ volatile ("mv %0, a3" : "=r" (a3));
    80002c20:	00068793          	mv	a5,a3
    80002c24:	f4f43423          	sd	a5,-184(s0)
    return a3;
    80002c28:	f4843783          	ld	a5,-184(s0)
    uint64 volatile arg3=r_a3();
    80002c2c:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("mv %0, a4" : "=r" (a4));
    80002c30:	00070793          	mv	a5,a4
    80002c34:	f4f43023          	sd	a5,-192(s0)
    return a4;
    80002c38:	f4043783          	ld	a5,-192(s0)
    uint64 volatile arg4=r_a4();
    80002c3c:	faf43823          	sd	a5,-80(s0)

    //-----------------------------------------------------
    // System call from user or supervisor mode
    //-----------------------------------------------------

    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL ) {
    80002c40:	fd843703          	ld	a4,-40(s0)
    80002c44:	00900793          	li	a5,9
    80002c48:	08f70e63          	beq	a4,a5,80002ce4 <_ZN5RISCV20handleSupervisorTrapEv+0x11c>
    80002c4c:	fd843703          	ld	a4,-40(s0)
    80002c50:	00800793          	li	a5,8
    80002c54:	08f70863          	beq	a4,a5,80002ce4 <_ZN5RISCV20handleSupervisorTrapEv+0x11c>

    //-----------------------------------------------------
    // Timer interrupt
    //-----------------------------------------------------

    else if (scause == 0x8000000000000001UL) {
    80002c58:	fd843703          	ld	a4,-40(s0)
    80002c5c:	fff00793          	li	a5,-1
    80002c60:	03f79793          	slli	a5,a5,0x3f
    80002c64:	00178793          	addi	a5,a5,1
    80002c68:	28f70863          	beq	a4,a5,80002ef8 <_ZN5RISCV20handleSupervisorTrapEv+0x330>

    //-----------------------------------------------------
    // External interrupt (e.g., console)
    //-----------------------------------------------------

    else if (scause == 0x8000000000000009UL) {
    80002c6c:	fd843703          	ld	a4,-40(s0)
    80002c70:	fff00793          	li	a5,-1
    80002c74:	03f79793          	slli	a5,a5,0x3f
    80002c78:	00978793          	addi	a5,a5,9
    80002c7c:	50f70863          	beq	a4,a5,8000318c <_ZN5RISCV20handleSupervisorTrapEv+0x5c4>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002c80:	141027f3          	csrr	a5,sepc
    80002c84:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002c88:	fa843783          	ld	a5,-88(s0)
    }
    //-----------------------------------------------------
    // Unexpected trap
    //-----------------------------------------------------
    else {
        size_t volatile sepc = r_sepc();
    80002c8c:	faf43023          	sd	a5,-96(s0)
        printStringS("Exception!!! scause: ");
    80002c90:	00007517          	auipc	a0,0x7
    80002c94:	3e050513          	addi	a0,a0,992 # 8000a070 <CONSOLE_STATUS+0x60>
    80002c98:	fffff097          	auipc	ra,0xfffff
    80002c9c:	fc4080e7          	jalr	-60(ra) # 80001c5c <_Z12printStringSPKc>
        printIntS(scause);
    80002ca0:	fd843503          	ld	a0,-40(s0)
    80002ca4:	00000613          	li	a2,0
    80002ca8:	00a00593          	li	a1,10
    80002cac:	0005051b          	sext.w	a0,a0
    80002cb0:	fffff097          	auipc	ra,0xfffff
    80002cb4:	27c080e7          	jalr	636(ra) # 80001f2c <_Z9printIntSiii>
        printStringS("\n sepc: ");
    80002cb8:	00007517          	auipc	a0,0x7
    80002cbc:	3d050513          	addi	a0,a0,976 # 8000a088 <CONSOLE_STATUS+0x78>
    80002cc0:	fffff097          	auipc	ra,0xfffff
    80002cc4:	f9c080e7          	jalr	-100(ra) # 80001c5c <_Z12printStringSPKc>
        printIntS(sepc);
    80002cc8:	fa043503          	ld	a0,-96(s0)
    80002ccc:	00000613          	li	a2,0
    80002cd0:	00a00593          	li	a1,10
    80002cd4:	0005051b          	sext.w	a0,a0
    80002cd8:	fffff097          	auipc	ra,0xfffff
    80002cdc:	254080e7          	jalr	596(ra) # 80001f2c <_Z9printIntSiii>
        while (true) {}
    80002ce0:	0000006f          	j	80002ce0 <_ZN5RISCV20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002ce4:	141027f3          	csrr	a5,sepc
    80002ce8:	f6f43c23          	sd	a5,-136(s0)
    return sepc;
    80002cec:	f7843783          	ld	a5,-136(s0)
        uint64 volatile sepc = r_sepc()+4;
    80002cf0:	00478793          	addi	a5,a5,4
    80002cf4:	f0f43023          	sd	a5,-256(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002cf8:	100027f3          	csrr	a5,sstatus
    80002cfc:	f6f43823          	sd	a5,-144(s0)
    return sstatus;
    80002d00:	f7043783          	ld	a5,-144(s0)
        uint64 volatile sstatus = r_sstatus();
    80002d04:	f0f43423          	sd	a5,-248(s0)
        switch (code) {
    80002d08:	fd043783          	ld	a5,-48(s0)
    80002d0c:	04200713          	li	a4,66
    80002d10:	1cf76a63          	bltu	a4,a5,80002ee4 <_ZN5RISCV20handleSupervisorTrapEv+0x31c>
    80002d14:	00279793          	slli	a5,a5,0x2
    80002d18:	00007717          	auipc	a4,0x7
    80002d1c:	37c70713          	addi	a4,a4,892 # 8000a094 <CONSOLE_STATUS+0x84>
    80002d20:	00e787b3          	add	a5,a5,a4
    80002d24:	0007a783          	lw	a5,0(a5)
    80002d28:	00e787b3          	add	a5,a5,a4
    80002d2c:	00078067          	jr	a5
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80002d30:	00058793          	mv	a5,a1
    80002d34:	f8f43023          	sd	a5,-128(s0)
    return a1;
    80002d38:	f8043783          	ld	a5,-128(s0)
                size_t volatile size_in_bytes=r_a1()*MEM_BLOCK_SIZE;
    80002d3c:	00679793          	slli	a5,a5,0x6
    80002d40:	f0f43823          	sd	a5,-240(s0)
                void *ret=MemoryAllocator::mem_alloc(size_in_bytes);
    80002d44:	f1043503          	ld	a0,-240(s0)
    80002d48:	00001097          	auipc	ra,0x1
    80002d4c:	928080e7          	jalr	-1752(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002d50:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002d54:	04542823          	sw	t0,80(s0)
        w_sepc(sepc);
    80002d58:	f0043783          	ld	a5,-256(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002d5c:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    80002d60:	f0843783          	ld	a5,-248(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002d64:	10079073          	csrw	sstatus,a5
        w_scause(scause);
    80002d68:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
    80002d6c:	14279073          	csrw	scause,a5
    }
}
    80002d70:	0f813083          	ld	ra,248(sp)
    80002d74:	0f013403          	ld	s0,240(sp)
    80002d78:	0e813483          	ld	s1,232(sp)
    80002d7c:	0e013903          	ld	s2,224(sp)
    80002d80:	10010113          	addi	sp,sp,256
    80002d84:	00008067          	ret
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80002d88:	00058793          	mv	a5,a1
    80002d8c:	f8f43423          	sd	a5,-120(s0)
    return a1;
    80002d90:	f8843783          	ld	a5,-120(s0)
                void* volatile start=(void*)r_a1();
    80002d94:	f0f43c23          	sd	a5,-232(s0)
                int ret=MemoryAllocator::mem_free(start);
    80002d98:	f1843503          	ld	a0,-232(s0)
    80002d9c:	00001097          	auipc	ra,0x1
    80002da0:	a10080e7          	jalr	-1520(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002da4:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002da8:	04542823          	sw	t0,80(s0)
}
    80002dac:	fadff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                size_t ret=MemoryAllocator::mem_get_free_space();
    80002db0:	00001097          	auipc	ra,0x1
    80002db4:	b44080e7          	jalr	-1212(ra) # 800038f4 <_ZN15MemoryAllocator18mem_get_free_spaceEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002db8:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002dbc:	04542823          	sw	t0,80(s0)
}
    80002dc0:	f99ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                size_t ret=MemoryAllocator::mem_get_largest_free_block();
    80002dc4:	00001097          	auipc	ra,0x1
    80002dc8:	aec080e7          	jalr	-1300(ra) # 800038b0 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002dcc:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002dd0:	04542823          	sw	t0,80(s0)
}
    80002dd4:	f85ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                TCB **threadcreatHandle=(TCB**)arg1;
    80002dd8:	fc843503          	ld	a0,-56(s0)
                TCB::Body routine=(TCB::Body)arg2;
    80002ddc:	fc043583          	ld	a1,-64(s0)
                void *arg=(void*)arg3;
    80002de0:	fb843603          	ld	a2,-72(s0)
                char *stack=(char*)arg4;
    80002de4:	fb043683          	ld	a3,-80(s0)
                int ret = TCB::createThread(threadcreatHandle,routine,arg,stack);
    80002de8:	00000097          	auipc	ra,0x0
    80002dec:	538080e7          	jalr	1336(ra) # 80003320 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002df0:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002df4:	04542823          	sw	t0,80(s0)
}
    80002df8:	f61ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                TCB::running->setFinished(true);
    80002dfc:	0000a797          	auipc	a5,0xa
    80002e00:	ddc7b783          	ld	a5,-548(a5) # 8000cbd8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002e04:	0007b783          	ld	a5,0(a5)
    void setFinished(bool finished) {this->finished = finished;}
    80002e08:	00100713          	li	a4,1
    80002e0c:	02e78023          	sb	a4,32(a5)
                TCB::dispatch();
    80002e10:	00000097          	auipc	ra,0x0
    80002e14:	6d0080e7          	jalr	1744(ra) # 800034e0 <_ZN3TCB8dispatchEv>
                break;
    80002e18:	f41ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                TCB::dispatch();
    80002e1c:	00000097          	auipc	ra,0x0
    80002e20:	6c4080e7          	jalr	1732(ra) # 800034e0 <_ZN3TCB8dispatchEv>
                break;
    80002e24:	f35ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                Semaphore **semHandle=(Semaphore**)arg1;
    80002e28:	fc843503          	ld	a0,-56(s0)
                unsigned initialize=(unsigned)arg2;
    80002e2c:	fc043583          	ld	a1,-64(s0)
                int ret=Semaphore::createSemaphore(semHandle,initialize);
    80002e30:	0005859b          	sext.w	a1,a1
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	9c4080e7          	jalr	-1596(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e3c:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002e40:	04542823          	sw	t0,80(s0)
}
    80002e44:	f15ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                Semaphore *semId=(Semaphore*)arg1;
    80002e48:	fc843903          	ld	s2,-56(s0)
                int ret=Semaphore::closeSemaphore(semId);
    80002e4c:	00090513          	mv	a0,s2
    80002e50:	fffff097          	auipc	ra,0xfffff
    80002e54:	a6c080e7          	jalr	-1428(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    80002e58:	00050493          	mv	s1,a0
                delete semId;
    80002e5c:	00091863          	bnez	s2,80002e6c <_ZN5RISCV20handleSupervisorTrapEv+0x2a4>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e60:	00048293          	mv	t0,s1
    __asm__ volatile ("sw t0, 80(x8)");
    80002e64:	04542823          	sw	t0,80(s0)
}
    80002e68:	ef1ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
    void* operator new[](size_t size) {
        return MemoryAllocator::mem_alloc(size);
    }

    void operator delete(void *ptr) {
        MemoryAllocator::mem_free(ptr);
    80002e6c:	00090513          	mv	a0,s2
    80002e70:	00001097          	auipc	ra,0x1
    80002e74:	93c080e7          	jalr	-1732(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    }
    80002e78:	fe9ff06f          	j	80002e60 <_ZN5RISCV20handleSupervisorTrapEv+0x298>
                Semaphore *semId=(Semaphore*)arg1;
    80002e7c:	fc843503          	ld	a0,-56(s0)
                int ret=semId->sem_wait();
    80002e80:	fffff097          	auipc	ra,0xfffff
    80002e84:	b68080e7          	jalr	-1176(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e88:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002e8c:	04542823          	sw	t0,80(s0)
}
    80002e90:	ec9ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                Semaphore *semId=(Semaphore*)arg1;
    80002e94:	fc843503          	ld	a0,-56(s0)
                int ret=semId->sem_signal();
    80002e98:	fffff097          	auipc	ra,0xfffff
    80002e9c:	c18080e7          	jalr	-1000(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002ea0:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002ea4:	04542823          	sw	t0,80(s0)
}
    80002ea8:	eb1ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                time_t time=(time_t)arg1;
    80002eac:	fc843503          	ld	a0,-56(s0)
                TCB::timeSleep(time);
    80002eb0:	00000097          	auipc	ra,0x0
    80002eb4:	698080e7          	jalr	1688(ra) # 80003548 <_ZN3TCB9timeSleepEm>
                break;
    80002eb8:	ea1ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                char ret=Console::readChar();
    80002ebc:	fffff097          	auipc	ra,0xfffff
    80002ec0:	3bc080e7          	jalr	956(ra) # 80002278 <_ZN7Console8readCharEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002ec4:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002ec8:	04542823          	sw	t0,80(s0)
}
    80002ecc:	e8dff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                char character=(char)arg1;
    80002ed0:	fc843503          	ld	a0,-56(s0)
                Console::writeChar(character);
    80002ed4:	0ff57513          	andi	a0,a0,255
    80002ed8:	fffff097          	auipc	ra,0xfffff
    80002edc:	3dc080e7          	jalr	988(ra) # 800022b4 <_ZN7Console9writeCharEc>
                break;
    80002ee0:	e79ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                printStringS("Unsupported system-call code.");
    80002ee4:	00007517          	auipc	a0,0x7
    80002ee8:	16c50513          	addi	a0,a0,364 # 8000a050 <CONSOLE_STATUS+0x40>
    80002eec:	fffff097          	auipc	ra,0xfffff
    80002ef0:	d70080e7          	jalr	-656(ra) # 80001c5c <_Z12printStringSPKc>
                break;
    80002ef4:	e65ff06f          	j	80002d58 <_ZN5RISCV20handleSupervisorTrapEv+0x190>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r" (mask));
    80002ef8:	00200793          	li	a5,2
    80002efc:	1447b073          	csrc	sip,a5
    T *peekLast() {
        if (!tail)return 0;
        return tail->data;
    }
    void setFirst() {
        curr = head;
    80002f00:	0000a797          	auipc	a5,0xa
    80002f04:	cc87b783          	ld	a5,-824(a5) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f08:	0007b703          	ld	a4,0(a5)
    80002f0c:	00e7b823          	sd	a4,16(a5)
        prev = 0;
    80002f10:	0007bc23          	sd	zero,24(a5)
    }

    T* getCurrent() {
        if (curr) return curr->data;
    80002f14:	0000a797          	auipc	a5,0xa
    80002f18:	cb47b783          	ld	a5,-844(a5) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f1c:	0107b783          	ld	a5,16(a5)
    80002f20:	0a078c63          	beqz	a5,80002fd8 <_ZN5RISCV20handleSupervisorTrapEv+0x410>
    80002f24:	0007b783          	ld	a5,0(a5)
        while (Semaphore::allSemaphoresQueue.getCurrent()!=nullptr) {
    80002f28:	0a078863          	beqz	a5,80002fd8 <_ZN5RISCV20handleSupervisorTrapEv+0x410>
            if (Semaphore::allSemaphoresQueue.getCurrent()->timeout<0) {
    80002f2c:	0087b703          	ld	a4,8(a5)
            Semaphore::allSemaphoresQueue.getCurrent()->timeout-=1;
    80002f30:	fff70713          	addi	a4,a4,-1
    80002f34:	00e7b423          	sd	a4,8(a5)
    80002f38:	0000a797          	auipc	a5,0xa
    80002f3c:	c907b783          	ld	a5,-880(a5) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f40:	0107b783          	ld	a5,16(a5)
    80002f44:	00078463          	beqz	a5,80002f4c <_ZN5RISCV20handleSupervisorTrapEv+0x384>
    80002f48:	0007b783          	ld	a5,0(a5)
            if (Semaphore::allSemaphoresQueue.getCurrent()->timeout==0) {
    80002f4c:	0087b783          	ld	a5,8(a5)
    80002f50:	04078263          	beqz	a5,80002f94 <_ZN5RISCV20handleSupervisorTrapEv+0x3cc>
        delete curr;
        return ret;
    }

    void next() {
        if (curr) {
    80002f54:	0000a797          	auipc	a5,0xa
    80002f58:	c747b783          	ld	a5,-908(a5) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f5c:	0107b783          	ld	a5,16(a5)
    80002f60:	fa078ae3          	beqz	a5,80002f14 <_ZN5RISCV20handleSupervisorTrapEv+0x34c>
            prev = curr;
    80002f64:	0000a717          	auipc	a4,0xa
    80002f68:	c6473703          	ld	a4,-924(a4) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f6c:	00f73c23          	sd	a5,24(a4)
            curr = curr->next;
    80002f70:	0087b783          	ld	a5,8(a5)
    80002f74:	00f73823          	sd	a5,16(a4)
    80002f78:	f9dff06f          	j	80002f14 <_ZN5RISCV20handleSupervisorTrapEv+0x34c>
        T *ret=el->data;
    80002f7c:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80002f80:	00001097          	auipc	ra,0x1
    80002f84:	82c080e7          	jalr	-2004(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
                    Scheduler::put(Semaphore::allSemaphoresQueue.getCurrent()->blockedQueue.removeFIrst());
    80002f88:	00048513          	mv	a0,s1
    80002f8c:	fffff097          	auipc	ra,0xfffff
    80002f90:	1bc080e7          	jalr	444(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
        if (curr) return curr->data;
    80002f94:	0000a797          	auipc	a5,0xa
    80002f98:	c347b783          	ld	a5,-972(a5) # 8000cbc8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f9c:	0107b783          	ld	a5,16(a5)
    80002fa0:	00078463          	beqz	a5,80002fa8 <_ZN5RISCV20handleSupervisorTrapEv+0x3e0>
    80002fa4:	0007b783          	ld	a5,0(a5)
        if (!head)return  0;
    80002fa8:	0187b503          	ld	a0,24(a5)
    80002fac:	02050063          	beqz	a0,80002fcc <_ZN5RISCV20handleSupervisorTrapEv+0x404>
        return head->data;
    80002fb0:	00053703          	ld	a4,0(a0)
                while (Semaphore::allSemaphoresQueue.getCurrent()->blockedQueue.peekFirst()) {
    80002fb4:	00070c63          	beqz	a4,80002fcc <_ZN5RISCV20handleSupervisorTrapEv+0x404>
        head=head->next;
    80002fb8:	00853703          	ld	a4,8(a0)
    80002fbc:	00e7bc23          	sd	a4,24(a5)
        if (!head) tail=0;
    80002fc0:	fa071ee3          	bnez	a4,80002f7c <_ZN5RISCV20handleSupervisorTrapEv+0x3b4>
    80002fc4:	0207b023          	sd	zero,32(a5)
    80002fc8:	fb5ff06f          	j	80002f7c <_ZN5RISCV20handleSupervisorTrapEv+0x3b4>
                Semaphore::allSemaphoresQueue.getCurrent()->timedOut=true;
    80002fcc:	00100713          	li	a4,1
    80002fd0:	00e78823          	sb	a4,16(a5)
    80002fd4:	f81ff06f          	j	80002f54 <_ZN5RISCV20handleSupervisorTrapEv+0x38c>
        curr = head;
    80002fd8:	0000a797          	auipc	a5,0xa
    80002fdc:	bb87b783          	ld	a5,-1096(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fe0:	0007b703          	ld	a4,0(a5)
    80002fe4:	00e7b823          	sd	a4,16(a5)
        prev = 0;
    80002fe8:	0007bc23          	sd	zero,24(a5)
    }
    80002fec:	0540006f          	j	80003040 <_ZN5RISCV20handleSupervisorTrapEv+0x478>
            head = head->next;
    80002ff0:	0087b783          	ld	a5,8(a5)
    80002ff4:	0000a717          	auipc	a4,0xa
    80002ff8:	b9c73703          	ld	a4,-1124(a4) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002ffc:	00f73023          	sd	a5,0(a4)
            if (!head) tail = 0;
    80003000:	0c078263          	beqz	a5,800030c4 <_ZN5RISCV20handleSupervisorTrapEv+0x4fc>
            T* ret = curr->data;
    80003004:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80003008:	00000097          	auipc	ra,0x0
    8000300c:	7a4080e7          	jalr	1956(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
                Scheduler::put(TCB::sleepingThreads.removeCurrent());
    80003010:	00048513          	mv	a0,s1
    80003014:	fffff097          	auipc	ra,0xfffff
    80003018:	134080e7          	jalr	308(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
        if (curr) {
    8000301c:	0000a797          	auipc	a5,0xa
    80003020:	b747b783          	ld	a5,-1164(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003024:	0107b783          	ld	a5,16(a5)
    80003028:	00078c63          	beqz	a5,80003040 <_ZN5RISCV20handleSupervisorTrapEv+0x478>
            prev = curr;
    8000302c:	0000a717          	auipc	a4,0xa
    80003030:	b6473703          	ld	a4,-1180(a4) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003034:	00f73c23          	sd	a5,24(a4)
            curr = curr->next;
    80003038:	0087b783          	ld	a5,8(a5)
    8000303c:	00f73823          	sd	a5,16(a4)
        if (curr) return curr->data;
    80003040:	0000a797          	auipc	a5,0xa
    80003044:	b507b783          	ld	a5,-1200(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003048:	0107b783          	ld	a5,16(a5)
    8000304c:	0c078a63          	beqz	a5,80003120 <_ZN5RISCV20handleSupervisorTrapEv+0x558>
    80003050:	0007b703          	ld	a4,0(a5)
        while (TCB::sleepingThreads.getCurrent()!=nullptr) {
    80003054:	0c070663          	beqz	a4,80003120 <_ZN5RISCV20handleSupervisorTrapEv+0x558>
            TCB::sleepingThreads.getCurrent()->timeSleeping-=1;
    80003058:	03073683          	ld	a3,48(a4)
    8000305c:	fff68693          	addi	a3,a3,-1
    80003060:	02d73823          	sd	a3,48(a4)
    80003064:	0007b783          	ld	a5,0(a5)
            if (TCB::sleepingThreads.getCurrent()->timeSleeping==0) {
    80003068:	0307b783          	ld	a5,48(a5)
    8000306c:	fa0798e3          	bnez	a5,8000301c <_ZN5RISCV20handleSupervisorTrapEv+0x454>
        if (!curr) return 0;
    80003070:	0000a797          	auipc	a5,0xa
    80003074:	b207b783          	ld	a5,-1248(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003078:	0107b503          	ld	a0,16(a5)
    8000307c:	08050e63          	beqz	a0,80003118 <_ZN5RISCV20handleSupervisorTrapEv+0x550>
        if (curr == head) {
    80003080:	0007b783          	ld	a5,0(a5)
    80003084:	f6f506e3          	beq	a0,a5,80002ff0 <_ZN5RISCV20handleSupervisorTrapEv+0x428>
        if (curr == tail) {
    80003088:	0000a797          	auipc	a5,0xa
    8000308c:	b087b783          	ld	a5,-1272(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003090:	0087b783          	ld	a5,8(a5)
    80003094:	02f50c63          	beq	a0,a5,800030cc <_ZN5RISCV20handleSupervisorTrapEv+0x504>
        T* ret = curr->data;
    80003098:	00053483          	ld	s1,0(a0)
        prev->next = curr->next;
    8000309c:	0000a797          	auipc	a5,0xa
    800030a0:	af47b783          	ld	a5,-1292(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030a4:	0187b703          	ld	a4,24(a5)
    800030a8:	00853683          	ld	a3,8(a0)
    800030ac:	00d73423          	sd	a3,8(a4)
        delete curr;
    800030b0:	0107b503          	ld	a0,16(a5)
    800030b4:	f4050ee3          	beqz	a0,80003010 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            MemoryAllocator::mem_free(ptr);
    800030b8:	00000097          	auipc	ra,0x0
    800030bc:	6f4080e7          	jalr	1780(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
        }
    800030c0:	f51ff06f          	j	80003010 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            if (!head) tail = 0;
    800030c4:	00073423          	sd	zero,8(a4)
    800030c8:	f3dff06f          	j	80003004 <_ZN5RISCV20handleSupervisorTrapEv+0x43c>
            if (prev) prev->next = 0;
    800030cc:	0000a797          	auipc	a5,0xa
    800030d0:	ac47b783          	ld	a5,-1340(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030d4:	0187b783          	ld	a5,24(a5)
    800030d8:	02078863          	beqz	a5,80003108 <_ZN5RISCV20handleSupervisorTrapEv+0x540>
    800030dc:	0007b423          	sd	zero,8(a5)
            tail = prev;
    800030e0:	0000a797          	auipc	a5,0xa
    800030e4:	ab07b783          	ld	a5,-1360(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030e8:	0187b703          	ld	a4,24(a5)
    800030ec:	00e7b423          	sd	a4,8(a5)
            T* ret = curr->data;
    800030f0:	0107b503          	ld	a0,16(a5)
    800030f4:	00053483          	ld	s1,0(a0)
            delete curr;
    800030f8:	f0050ce3          	beqz	a0,80003010 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            MemoryAllocator::mem_free(ptr);
    800030fc:	00000097          	auipc	ra,0x0
    80003100:	6b0080e7          	jalr	1712(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
            return ret;
    80003104:	f0dff06f          	j	80003010 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            else head = 0;
    80003108:	0000a797          	auipc	a5,0xa
    8000310c:	a887b783          	ld	a5,-1400(a5) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003110:	0007b023          	sd	zero,0(a5)
    80003114:	fcdff06f          	j	800030e0 <_ZN5RISCV20handleSupervisorTrapEv+0x518>
        if (!curr) return 0;
    80003118:	00050493          	mv	s1,a0
    8000311c:	ef5ff06f          	j	80003010 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
        TCB::timeSliceCounter++;
    80003120:	0000a717          	auipc	a4,0xa
    80003124:	a9073703          	ld	a4,-1392(a4) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003128:	00073783          	ld	a5,0(a4)
    8000312c:	00178793          	addi	a5,a5,1
    80003130:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter>=DEFAULT_TIME_SLICE) {
    80003134:	00100713          	li	a4,1
    80003138:	c2f77ce3          	bgeu	a4,a5,80002d70 <_ZN5RISCV20handleSupervisorTrapEv+0x1a8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    8000313c:	141027f3          	csrr	a5,sepc
    80003140:	f8f43c23          	sd	a5,-104(s0)
    return sepc;
    80003144:	f9843783          	ld	a5,-104(s0)
            uint64 volatile sepc = r_sepc();
    80003148:	f2f43023          	sd	a5,-224(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    8000314c:	100027f3          	csrr	a5,sstatus
    80003150:	f8f43823          	sd	a5,-112(s0)
    return sstatus;
    80003154:	f9043783          	ld	a5,-112(s0)
            uint64 volatile sstatus = r_sstatus();
    80003158:	f2f43423          	sd	a5,-216(s0)
            TCB::timeSliceCounter = 0;
    8000315c:	0000a797          	auipc	a5,0xa
    80003160:	a547b783          	ld	a5,-1452(a5) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003164:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80003168:	00000097          	auipc	ra,0x0
    8000316c:	378080e7          	jalr	888(ra) # 800034e0 <_ZN3TCB8dispatchEv>
            w_sstatus(sstatus);
    80003170:	f2843783          	ld	a5,-216(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80003174:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80003178:	f2043783          	ld	a5,-224(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    8000317c:	14179073          	csrw	sepc,a5
            w_scause(scause);
    80003180:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
    80003184:	14279073          	csrw	scause,a5
}
    80003188:	be9ff06f          	j	80002d70 <_ZN5RISCV20handleSupervisorTrapEv+0x1a8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    8000318c:	141027f3          	csrr	a5,sepc
    80003190:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80003194:	fa843783          	ld	a5,-88(s0)
        uint64 volatile sepc=r_sepc();
    80003198:	f2f43823          	sd	a5,-208(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    8000319c:	100027f3          	csrr	a5,sstatus
    800031a0:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    800031a4:	fa043783          	ld	a5,-96(s0)
        uint64 volatile sstatus=r_sstatus();
    800031a8:	f2f43c23          	sd	a5,-200(s0)
        int interrupt=plic_claim();
    800031ac:	00004097          	auipc	ra,0x4
    800031b0:	648080e7          	jalr	1608(ra) # 800077f4 <plic_claim>
    800031b4:	00050493          	mv	s1,a0
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r" (mask));
    800031b8:	20000793          	li	a5,512
    800031bc:	1447b073          	csrc	sip,a5
        if (interrupt==CONSOLE_IRQ) {
    800031c0:	00a00793          	li	a5,10
    800031c4:	02f50a63          	beq	a0,a5,800031f8 <_ZN5RISCV20handleSupervisorTrapEv+0x630>
        plic_complete(interrupt);
    800031c8:	00048513          	mv	a0,s1
    800031cc:	00004097          	auipc	ra,0x4
    800031d0:	660080e7          	jalr	1632(ra) # 8000782c <plic_complete>
        w_sepc(sepc);
    800031d4:	f3043783          	ld	a5,-208(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800031d8:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    800031dc:	f3843783          	ld	a5,-200(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    800031e0:	10079073          	csrw	sstatus,a5
        w_scause(scause);
    800031e4:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
    800031e8:	14279073          	csrw	scause,a5
}
    800031ec:	b85ff06f          	j	80002d70 <_ZN5RISCV20handleSupervisorTrapEv+0x1a8>
                Console::onCharRecieved(character);
    800031f0:	fffff097          	auipc	ra,0xfffff
    800031f4:	268080e7          	jalr	616(ra) # 80002458 <_ZN7Console14onCharRecievedEc>
            while ((*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    800031f8:	0000a797          	auipc	a5,0xa
    800031fc:	9a87b783          	ld	a5,-1624(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003200:	0007b783          	ld	a5,0(a5)
    80003204:	0007c783          	lbu	a5,0(a5)
    80003208:	0017f793          	andi	a5,a5,1
    8000320c:	fa078ee3          	beqz	a5,800031c8 <_ZN5RISCV20handleSupervisorTrapEv+0x600>
                char character = (char)(*((char*)CONSOLE_RX_DATA));
    80003210:	0000a797          	auipc	a5,0xa
    80003214:	9887b783          	ld	a5,-1656(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003218:	0007b783          	ld	a5,0(a5)
    8000321c:	0007c503          	lbu	a0,0(a5)
                if ((int)character == 13) character = '\n';
    80003220:	00d00793          	li	a5,13
    80003224:	fcf516e3          	bne	a0,a5,800031f0 <_ZN5RISCV20handleSupervisorTrapEv+0x628>
    80003228:	00a00513          	li	a0,10
    8000322c:	fc5ff06f          	j	800031f0 <_ZN5RISCV20handleSupervisorTrapEv+0x628>

0000000080003230 <_Z41__static_initialization_and_destruction_0ii>:
    sleepingThreads.addFirst(running);

    TCB* oldThr=running;
    running=Scheduler::get();
    contextSwitch(&oldThr->context,&running->context);
    80003230:	ff010113          	addi	sp,sp,-16
    80003234:	00813423          	sd	s0,8(sp)
    80003238:	01010413          	addi	s0,sp,16
    8000323c:	00100793          	li	a5,1
    80003240:	00f50863          	beq	a0,a5,80003250 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003244:	00813403          	ld	s0,8(sp)
    80003248:	01010113          	addi	sp,sp,16
    8000324c:	00008067          	ret
    80003250:	000107b7          	lui	a5,0x10
    80003254:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003258:	fef596e3          	bne	a1,a5,80003244 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0), curr(0), prev(0) {}
    8000325c:	0000a797          	auipc	a5,0xa
    80003260:	a3c78793          	addi	a5,a5,-1476 # 8000cc98 <_ZN3TCB15sleepingThreadsE>
    80003264:	0007b023          	sd	zero,0(a5)
    80003268:	0007b423          	sd	zero,8(a5)
    8000326c:	0007b823          	sd	zero,16(a5)
    80003270:	0007bc23          	sd	zero,24(a5)
    80003274:	fd1ff06f          	j	80003244 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080003278 <_ZN3TCBC1EPFvPvES0_Pcb>:
    this->body = b;
    80003278:	00b53023          	sd	a1,0(a0)
    this->stack = stack_space;
    8000327c:	00d53423          	sd	a3,8(a0)
    this->arg = arg;
    80003280:	02c53423          	sd	a2,40(a0)
    this->finished = false;
    80003284:	02050023          	sb	zero,32(a0)
        !system_mode ? (size_t)threadWrapper : (size_t)systemThreadWrapper,
    80003288:	04070663          	beqz	a4,800032d4 <_ZN3TCBC1EPFvPvES0_Pcb+0x5c>
    8000328c:	00000797          	auipc	a5,0x0
    80003290:	1f078793          	addi	a5,a5,496 # 8000347c <_ZN3TCB19systemThreadWrapperEv>
        stack ? (size_t)&stack[DEFAULT_STACK_SIZE] : 0
    80003294:	04068663          	beqz	a3,800032e0 <_ZN3TCBC1EPFvPvES0_Pcb+0x68>
    80003298:	00001737          	lui	a4,0x1
    8000329c:	00e686b3          	add	a3,a3,a4
    this->context = {
    800032a0:	00f53823          	sd	a5,16(a0)
    800032a4:	00d53c23          	sd	a3,24(a0)
    if (body!=nullptr) Scheduler::put(this);
    800032a8:	04058063          	beqz	a1,800032e8 <_ZN3TCBC1EPFvPvES0_Pcb+0x70>
TCB::TCB(Body b, void *arg, char *stack_space, bool system_mode) {
    800032ac:	ff010113          	addi	sp,sp,-16
    800032b0:	00113423          	sd	ra,8(sp)
    800032b4:	00813023          	sd	s0,0(sp)
    800032b8:	01010413          	addi	s0,sp,16
    if (body!=nullptr) Scheduler::put(this);
    800032bc:	fffff097          	auipc	ra,0xfffff
    800032c0:	e8c080e7          	jalr	-372(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
}
    800032c4:	00813083          	ld	ra,8(sp)
    800032c8:	00013403          	ld	s0,0(sp)
    800032cc:	01010113          	addi	sp,sp,16
    800032d0:	00008067          	ret
        !system_mode ? (size_t)threadWrapper : (size_t)systemThreadWrapper,
    800032d4:	00000797          	auipc	a5,0x0
    800032d8:	14478793          	addi	a5,a5,324 # 80003418 <_ZN3TCB13threadWrapperEv>
    800032dc:	fb9ff06f          	j	80003294 <_ZN3TCBC1EPFvPvES0_Pcb+0x1c>
        stack ? (size_t)&stack[DEFAULT_STACK_SIZE] : 0
    800032e0:	00000693          	li	a3,0
    800032e4:	fbdff06f          	j	800032a0 <_ZN3TCBC1EPFvPvES0_Pcb+0x28>
    800032e8:	00008067          	ret

00000000800032ec <_ZN3TCBD1Ev>:
    if (stack){
    800032ec:	00853503          	ld	a0,8(a0)
    800032f0:	02050663          	beqz	a0,8000331c <_ZN3TCBD1Ev+0x30>
TCB::~TCB() {
    800032f4:	ff010113          	addi	sp,sp,-16
    800032f8:	00113423          	sd	ra,8(sp)
    800032fc:	00813023          	sd	s0,0(sp)
    80003300:	01010413          	addi	s0,sp,16
        MemoryAllocator::mem_free(stack);
    80003304:	00000097          	auipc	ra,0x0
    80003308:	4a8080e7          	jalr	1192(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000330c:	00813083          	ld	ra,8(sp)
    80003310:	00013403          	ld	s0,0(sp)
    80003314:	01010113          	addi	sp,sp,16
    80003318:	00008067          	ret
    8000331c:	00008067          	ret

0000000080003320 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc>:
int TCB::createThread(TCB** thrHandle,Body b,void*arg,char *stack_space) {
    80003320:	fc010113          	addi	sp,sp,-64
    80003324:	02113c23          	sd	ra,56(sp)
    80003328:	02813823          	sd	s0,48(sp)
    8000332c:	02913423          	sd	s1,40(sp)
    80003330:	03213023          	sd	s2,32(sp)
    80003334:	01313c23          	sd	s3,24(sp)
    80003338:	01413823          	sd	s4,16(sp)
    8000333c:	01513423          	sd	s5,8(sp)
    80003340:	04010413          	addi	s0,sp,64
    80003344:	00050a93          	mv	s5,a0
    80003348:	00058913          	mv	s2,a1
    8000334c:	00060993          	mv	s3,a2
    80003350:	00068a13          	mv	s4,a3

    void* operator new(size_t size) {return MemoryAllocator::mem_alloc(size);}
    80003354:	03800513          	li	a0,56
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	318080e7          	jalr	792(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
    80003360:	00050493          	mv	s1,a0
    TCB *newT=new TCB(b,arg,stack_space,false);
    80003364:	00000713          	li	a4,0
    80003368:	000a0693          	mv	a3,s4
    8000336c:	00098613          	mv	a2,s3
    80003370:	00090593          	mv	a1,s2
    80003374:	00000097          	auipc	ra,0x0
    80003378:	f04080e7          	jalr	-252(ra) # 80003278 <_ZN3TCBC1EPFvPvES0_Pcb>
    if (newT==nullptr){thrHandle=nullptr;return -1;}
    8000337c:	02048863          	beqz	s1,800033ac <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc+0x8c>
    *thrHandle=newT;
    80003380:	009ab023          	sd	s1,0(s5)
    return 0;
    80003384:	00000513          	li	a0,0
}
    80003388:	03813083          	ld	ra,56(sp)
    8000338c:	03013403          	ld	s0,48(sp)
    80003390:	02813483          	ld	s1,40(sp)
    80003394:	02013903          	ld	s2,32(sp)
    80003398:	01813983          	ld	s3,24(sp)
    8000339c:	01013a03          	ld	s4,16(sp)
    800033a0:	00813a83          	ld	s5,8(sp)
    800033a4:	04010113          	addi	sp,sp,64
    800033a8:	00008067          	ret
    if (newT==nullptr){thrHandle=nullptr;return -1;}
    800033ac:	fff00513          	li	a0,-1
    800033b0:	fd9ff06f          	j	80003388 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc+0x68>
    800033b4:	00050913          	mv	s2,a0
    void* operator new[](size_t size) {return MemoryAllocator::mem_alloc(size);}
    void operator delete(void *ptr) {MemoryAllocator::mem_free(ptr);}
    800033b8:	00048513          	mv	a0,s1
    800033bc:	00000097          	auipc	ra,0x0
    800033c0:	3f0080e7          	jalr	1008(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    800033c4:	00090513          	mv	a0,s2
    800033c8:	0000b097          	auipc	ra,0xb
    800033cc:	a20080e7          	jalr	-1504(ra) # 8000dde8 <_Unwind_Resume>

00000000800033d0 <_ZN3TCB16schedulerIsEmptyEv>:
bool TCB::schedulerIsEmpty() {
    800033d0:	ff010113          	addi	sp,sp,-16
    800033d4:	00113423          	sd	ra,8(sp)
    800033d8:	00813023          	sd	s0,0(sp)
    800033dc:	01010413          	addi	s0,sp,16
    return Scheduler::peekFirst() == nullptr;
    800033e0:	fffff097          	auipc	ra,0xfffff
    800033e4:	dd4080e7          	jalr	-556(ra) # 800021b4 <_ZN9Scheduler9peekFirstEv>
}
    800033e8:	00153513          	seqz	a0,a0
    800033ec:	00813083          	ld	ra,8(sp)
    800033f0:	00013403          	ld	s0,0(sp)
    800033f4:	01010113          	addi	sp,sp,16
    800033f8:	00008067          	ret

00000000800033fc <_ZN3TCB5yieldEv>:
void TCB::yield(){
    800033fc:	ff010113          	addi	sp,sp,-16
    80003400:	00813423          	sd	s0,8(sp)
    80003404:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall");
    80003408:	00000073          	ecall
}
    8000340c:	00813403          	ld	s0,8(sp)
    80003410:	01010113          	addi	sp,sp,16
    80003414:	00008067          	ret

0000000080003418 <_ZN3TCB13threadWrapperEv>:
void TCB::threadWrapper() {
    80003418:	fe010113          	addi	sp,sp,-32
    8000341c:	00113c23          	sd	ra,24(sp)
    80003420:	00813823          	sd	s0,16(sp)
    80003424:	00913423          	sd	s1,8(sp)
    80003428:	02010413          	addi	s0,sp,32
    RISCV::popSppSpie();
    8000342c:	fffff097          	auipc	ra,0xfffff
    80003430:	754080e7          	jalr	1876(ra) # 80002b80 <_ZN5RISCV10popSppSpieEv>
    running->body(running->arg);
    80003434:	0000a497          	auipc	s1,0xa
    80003438:	86448493          	addi	s1,s1,-1948 # 8000cc98 <_ZN3TCB15sleepingThreadsE>
    8000343c:	0204b783          	ld	a5,32(s1)
    80003440:	0007b703          	ld	a4,0(a5)
    80003444:	0287b503          	ld	a0,40(a5)
    80003448:	000700e7          	jalr	a4 # 1000 <_entry-0x7ffff000>
    running->setFinished(true);
    8000344c:	0204b783          	ld	a5,32(s1)
    void setFinished(bool finished) {this->finished = finished;}
    80003450:	00100713          	li	a4,1
    80003454:	02e78023          	sb	a4,32(a5)
    __asm__ volatile ("mv a0, %0" : : "r" (val));
    80003458:	01300793          	li	a5,19
    8000345c:	00078513          	mv	a0,a5
    TCB::yield();
    80003460:	00000097          	auipc	ra,0x0
    80003464:	f9c080e7          	jalr	-100(ra) # 800033fc <_ZN3TCB5yieldEv>
}
    80003468:	01813083          	ld	ra,24(sp)
    8000346c:	01013403          	ld	s0,16(sp)
    80003470:	00813483          	ld	s1,8(sp)
    80003474:	02010113          	addi	sp,sp,32
    80003478:	00008067          	ret

000000008000347c <_ZN3TCB19systemThreadWrapperEv>:
void TCB::systemThreadWrapper() {
    8000347c:	fe010113          	addi	sp,sp,-32
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	00813823          	sd	s0,16(sp)
    80003488:	00913423          	sd	s1,8(sp)
    8000348c:	02010413          	addi	s0,sp,32
    RISCV::systemPopSppSpie();
    80003490:	fffff097          	auipc	ra,0xfffff
    80003494:	718080e7          	jalr	1816(ra) # 80002ba8 <_ZN5RISCV16systemPopSppSpieEv>
    running->body(running->arg);
    80003498:	0000a497          	auipc	s1,0xa
    8000349c:	80048493          	addi	s1,s1,-2048 # 8000cc98 <_ZN3TCB15sleepingThreadsE>
    800034a0:	0204b783          	ld	a5,32(s1)
    800034a4:	0007b703          	ld	a4,0(a5)
    800034a8:	0287b503          	ld	a0,40(a5)
    800034ac:	000700e7          	jalr	a4
    running->setFinished(true);
    800034b0:	0204b783          	ld	a5,32(s1)
    800034b4:	00100713          	li	a4,1
    800034b8:	02e78023          	sb	a4,32(a5)
    800034bc:	01300793          	li	a5,19
    800034c0:	00078513          	mv	a0,a5
    TCB::yield();
    800034c4:	00000097          	auipc	ra,0x0
    800034c8:	f38080e7          	jalr	-200(ra) # 800033fc <_ZN3TCB5yieldEv>
}
    800034cc:	01813083          	ld	ra,24(sp)
    800034d0:	01013403          	ld	s0,16(sp)
    800034d4:	00813483          	ld	s1,8(sp)
    800034d8:	02010113          	addi	sp,sp,32
    800034dc:	00008067          	ret

00000000800034e0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800034e0:	fe010113          	addi	sp,sp,-32
    800034e4:	00113c23          	sd	ra,24(sp)
    800034e8:	00813823          	sd	s0,16(sp)
    800034ec:	00913423          	sd	s1,8(sp)
    800034f0:	02010413          	addi	s0,sp,32
    TCB *old=running;
    800034f4:	00009497          	auipc	s1,0x9
    800034f8:	7c44b483          	ld	s1,1988(s1) # 8000ccb8 <_ZN3TCB7runningE>
    bool isFinished() const {return finished;}
    800034fc:	0204c783          	lbu	a5,32(s1)
    if (!old->isFinished() ) {
    80003500:	02078c63          	beqz	a5,80003538 <_ZN3TCB8dispatchEv+0x58>
    running=Scheduler::get();
    80003504:	fffff097          	auipc	ra,0xfffff
    80003508:	bdc080e7          	jalr	-1060(ra) # 800020e0 <_ZN9Scheduler3getEv>
    8000350c:	00009797          	auipc	a5,0x9
    80003510:	7aa7b623          	sd	a0,1964(a5) # 8000ccb8 <_ZN3TCB7runningE>
    contextSwitch(&old->context,&running->context);
    80003514:	01050593          	addi	a1,a0,16
    80003518:	01048513          	addi	a0,s1,16
    8000351c:	ffffe097          	auipc	ra,0xffffe
    80003520:	c14080e7          	jalr	-1004(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003524:	01813083          	ld	ra,24(sp)
    80003528:	01013403          	ld	s0,16(sp)
    8000352c:	00813483          	ld	s1,8(sp)
    80003530:	02010113          	addi	sp,sp,32
    80003534:	00008067          	ret
        Scheduler::put(old);
    80003538:	00048513          	mv	a0,s1
    8000353c:	fffff097          	auipc	ra,0xfffff
    80003540:	c0c080e7          	jalr	-1012(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
    80003544:	fc1ff06f          	j	80003504 <_ZN3TCB8dispatchEv+0x24>

0000000080003548 <_ZN3TCB9timeSleepEm>:
void TCB::timeSleep(time_t time) {
    80003548:	fe010113          	addi	sp,sp,-32
    8000354c:	00113c23          	sd	ra,24(sp)
    80003550:	00813823          	sd	s0,16(sp)
    80003554:	00913423          	sd	s1,8(sp)
    80003558:	01213023          	sd	s2,0(sp)
    8000355c:	02010413          	addi	s0,sp,32
    running->timeSleeping=time;
    80003560:	00009497          	auipc	s1,0x9
    80003564:	73848493          	addi	s1,s1,1848 # 8000cc98 <_ZN3TCB15sleepingThreadsE>
    80003568:	0204b903          	ld	s2,32(s1)
    8000356c:	02a93823          	sd	a0,48(s2)
            return MemoryAllocator::mem_alloc(size);
    80003570:	01000513          	li	a0,16
    80003574:	00000097          	auipc	ra,0x0
    80003578:	0fc080e7          	jalr	252(ra) # 80003670 <_ZN15MemoryAllocator9mem_allocEm>
        Elem *el =new Elem(data,head);
    8000357c:	0004b783          	ld	a5,0(s1)
        Elem(T *data, Elem *next):data(data),next(next){}
    80003580:	01253023          	sd	s2,0(a0)
    80003584:	00f53423          	sd	a5,8(a0)
        head=el;
    80003588:	00a4b023          	sd	a0,0(s1)
        if (!tail){tail=head;}
    8000358c:	0084b783          	ld	a5,8(s1)
    80003590:	04078263          	beqz	a5,800035d4 <_ZN3TCB9timeSleepEm+0x8c>
    TCB* oldThr=running;
    80003594:	00009497          	auipc	s1,0x9
    80003598:	70448493          	addi	s1,s1,1796 # 8000cc98 <_ZN3TCB15sleepingThreadsE>
    8000359c:	0204b903          	ld	s2,32(s1)
    running=Scheduler::get();
    800035a0:	fffff097          	auipc	ra,0xfffff
    800035a4:	b40080e7          	jalr	-1216(ra) # 800020e0 <_ZN9Scheduler3getEv>
    800035a8:	02a4b023          	sd	a0,32(s1)
    contextSwitch(&oldThr->context,&running->context);
    800035ac:	01050593          	addi	a1,a0,16
    800035b0:	01090513          	addi	a0,s2,16
    800035b4:	ffffe097          	auipc	ra,0xffffe
    800035b8:	b7c080e7          	jalr	-1156(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    800035bc:	01813083          	ld	ra,24(sp)
    800035c0:	01013403          	ld	s0,16(sp)
    800035c4:	00813483          	ld	s1,8(sp)
    800035c8:	00013903          	ld	s2,0(sp)
    800035cc:	02010113          	addi	sp,sp,32
    800035d0:	00008067          	ret
    800035d4:	00009797          	auipc	a5,0x9
    800035d8:	6ca7b623          	sd	a0,1740(a5) # 8000cca0 <_ZN3TCB15sleepingThreadsE+0x8>
    800035dc:	fb9ff06f          	j	80003594 <_ZN3TCB9timeSleepEm+0x4c>

00000000800035e0 <_GLOBAL__sub_I__ZN3TCB15sleepingThreadsE>:
    800035e0:	ff010113          	addi	sp,sp,-16
    800035e4:	00113423          	sd	ra,8(sp)
    800035e8:	00813023          	sd	s0,0(sp)
    800035ec:	01010413          	addi	s0,sp,16
    800035f0:	000105b7          	lui	a1,0x10
    800035f4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800035f8:	00100513          	li	a0,1
    800035fc:	00000097          	auipc	ra,0x0
    80003600:	c34080e7          	jalr	-972(ra) # 80003230 <_Z41__static_initialization_and_destruction_0ii>
    80003604:	00813083          	ld	ra,8(sp)
    80003608:	00013403          	ld	s0,0(sp)
    8000360c:	01010113          	addi	sp,sp,16
    80003610:	00008067          	ret

0000000080003614 <_ZN15MemoryAllocator10initializeEv>:
#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeBlock* MemoryAllocator::freeListHead = nullptr;


void MemoryAllocator::initialize() {
    80003614:	ff010113          	addi	sp,sp,-16
    80003618:	00813423          	sd	s0,8(sp)
    8000361c:	01010413          	addi	s0,sp,16
    if (freeListHead) return; // prevent reinitialization
    80003620:	00009797          	auipc	a5,0x9
    80003624:	6a87b783          	ld	a5,1704(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    80003628:	00078863          	beqz	a5,80003638 <_ZN15MemoryAllocator10initializeEv+0x24>
    freeListHead = (FreeBlock*)HEAP_START_ADDR;
    *freeListHead = {
            nullptr,
            ((size_t)(HEAP_END_ADDR) - (size_t)(HEAP_START_ADDR) - sizeof(FreeBlock)) / MEM_BLOCK_SIZE
    };
}
    8000362c:	00813403          	ld	s0,8(sp)
    80003630:	01010113          	addi	sp,sp,16
    80003634:	00008067          	ret
    freeListHead = (FreeBlock*)HEAP_START_ADDR;
    80003638:	00009797          	auipc	a5,0x9
    8000363c:	5707b783          	ld	a5,1392(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003640:	0007b703          	ld	a4,0(a5)
    80003644:	00009797          	auipc	a5,0x9
    80003648:	68e7b223          	sd	a4,1668(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
            ((size_t)(HEAP_END_ADDR) - (size_t)(HEAP_START_ADDR) - sizeof(FreeBlock)) / MEM_BLOCK_SIZE
    8000364c:	00009797          	auipc	a5,0x9
    80003650:	5947b783          	ld	a5,1428(a5) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003654:	0007b783          	ld	a5,0(a5)
    80003658:	40e787b3          	sub	a5,a5,a4
    8000365c:	ff078793          	addi	a5,a5,-16
    80003660:	0067d793          	srli	a5,a5,0x6
    *freeListHead = {
    80003664:	00073023          	sd	zero,0(a4)
    80003668:	00f73423          	sd	a5,8(a4)
    8000366c:	fc1ff06f          	j	8000362c <_ZN15MemoryAllocator10initializeEv+0x18>

0000000080003670 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80003670:	ff010113          	addi	sp,sp,-16
    80003674:	00813423          	sd	s0,8(sp)
    80003678:	01010413          	addi	s0,sp,16
    if (!freeListHead || size == 0) return nullptr;
    8000367c:	00009797          	auipc	a5,0x9
    80003680:	64c7b783          	ld	a5,1612(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    80003684:	0c078663          	beqz	a5,80003750 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    80003688:	0c050863          	beqz	a0,80003758 <_ZN15MemoryAllocator9mem_allocEm+0xe8>

    size_t totalBytes = size + sizeof(FreeBlock);
    8000368c:	01050513          	addi	a0,a0,16
    size_t blocksNeeded = (totalBytes / MEM_BLOCK_SIZE) + (totalBytes % MEM_BLOCK_SIZE == 0 ? 0 : 1);
    80003690:	00655693          	srli	a3,a0,0x6
    80003694:	03f57513          	andi	a0,a0,63
    80003698:	00a03533          	snez	a0,a0
    8000369c:	00a686b3          	add	a3,a3,a0

    FreeBlock* current_prev = nullptr;
    FreeBlock* current_block = freeListHead;

    FreeBlock* best_fit_prev = nullptr;
    FreeBlock* best_fit_block = nullptr;
    800036a0:	00000513          	li	a0,0
    FreeBlock* best_fit_prev = nullptr;
    800036a4:	00000813          	li	a6,0
    FreeBlock* current_prev = nullptr;
    800036a8:	00000613          	li	a2,0
    800036ac:	0140006f          	j	800036c0 <_ZN15MemoryAllocator9mem_allocEm+0x50>

    // Best-fit search: Find the smallest block that is large enough.
    while (current_block) {
        if (current_block->sizeInBlocks >= blocksNeeded) {
            if (!best_fit_block || current_block->sizeInBlocks < best_fit_block->sizeInBlocks) {
                best_fit_block = current_block;
    800036b0:	00078513          	mv	a0,a5
                best_fit_prev = current_prev;
    800036b4:	00060813          	mv	a6,a2
            }
        }
        current_prev = current_block;
    800036b8:	00078613          	mv	a2,a5
        current_block = current_block->next;
    800036bc:	0007b783          	ld	a5,0(a5)
    while (current_block) {
    800036c0:	02078263          	beqz	a5,800036e4 <_ZN15MemoryAllocator9mem_allocEm+0x74>
        if (current_block->sizeInBlocks >= blocksNeeded) {
    800036c4:	0087b703          	ld	a4,8(a5)
    800036c8:	fed768e3          	bltu	a4,a3,800036b8 <_ZN15MemoryAllocator9mem_allocEm+0x48>
            if (!best_fit_block || current_block->sizeInBlocks < best_fit_block->sizeInBlocks) {
    800036cc:	fe0502e3          	beqz	a0,800036b0 <_ZN15MemoryAllocator9mem_allocEm+0x40>
    800036d0:	00853583          	ld	a1,8(a0)
    800036d4:	feb772e3          	bgeu	a4,a1,800036b8 <_ZN15MemoryAllocator9mem_allocEm+0x48>
                best_fit_block = current_block;
    800036d8:	00078513          	mv	a0,a5
                best_fit_prev = current_prev;
    800036dc:	00060813          	mv	a6,a2
    800036e0:	fd9ff06f          	j	800036b8 <_ZN15MemoryAllocator9mem_allocEm+0x48>
    }

    // If a suitable block was found, allocate from it.
    if (best_fit_block) {
    800036e4:	02050a63          	beqz	a0,80003718 <_ZN15MemoryAllocator9mem_allocEm+0xa8>
        size_t remainingBlocks = best_fit_block->sizeInBlocks - blocksNeeded;
    800036e8:	00853783          	ld	a5,8(a0)
    800036ec:	40d78733          	sub	a4,a5,a3

        if (remainingBlocks > 0) {
    800036f0:	04d78063          	beq	a5,a3,80003730 <_ZN15MemoryAllocator9mem_allocEm+0xc0>
            // The block is larger than needed, so split it.
            // Create a new free block from the remaining space.
            FreeBlock* newFreeBlock = (FreeBlock*)((char*)best_fit_block + blocksNeeded * MEM_BLOCK_SIZE);
    800036f4:	00669793          	slli	a5,a3,0x6
    800036f8:	00f507b3          	add	a5,a0,a5
            newFreeBlock->sizeInBlocks = remainingBlocks;
    800036fc:	00e7b423          	sd	a4,8(a5)
            newFreeBlock->next = best_fit_block->next;
    80003700:	00053703          	ld	a4,0(a0)
    80003704:	00e7b023          	sd	a4,0(a5)

            // Link the new free block into the list.
            if (best_fit_prev) {
    80003708:	00080e63          	beqz	a6,80003724 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
                best_fit_prev->next = newFreeBlock;
    8000370c:	00f83023          	sd	a5,0(a6)
            } else {
                // The best-fit block was the head of the list.
                freeListHead = newFreeBlock;
            }
            // Update the size of the allocated block.
            best_fit_block->sizeInBlocks = blocksNeeded;
    80003710:	00d53423          	sd	a3,8(a0)
                // The best-fit block was the head of the list.
                freeListHead = best_fit_block->next;
            }
        }
        // Return a pointer to the usable memory area (after the header).
        return (void*)(best_fit_block + 1);
    80003714:	01050513          	addi	a0,a0,16
    }

    // No suitable block found.
    return nullptr;
}
    80003718:	00813403          	ld	s0,8(sp)
    8000371c:	01010113          	addi	sp,sp,16
    80003720:	00008067          	ret
                freeListHead = newFreeBlock;
    80003724:	00009717          	auipc	a4,0x9
    80003728:	5af73223          	sd	a5,1444(a4) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    8000372c:	fe5ff06f          	j	80003710 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            if (best_fit_prev) {
    80003730:	00080863          	beqz	a6,80003740 <_ZN15MemoryAllocator9mem_allocEm+0xd0>
                best_fit_prev->next = best_fit_block->next;
    80003734:	00053783          	ld	a5,0(a0)
    80003738:	00f83023          	sd	a5,0(a6)
    8000373c:	fd9ff06f          	j	80003714 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
                freeListHead = best_fit_block->next;
    80003740:	00053783          	ld	a5,0(a0)
    80003744:	00009717          	auipc	a4,0x9
    80003748:	58f73223          	sd	a5,1412(a4) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    8000374c:	fc9ff06f          	j	80003714 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
    if (!freeListHead || size == 0) return nullptr;
    80003750:	00078513          	mv	a0,a5
    80003754:	fc5ff06f          	j	80003718 <_ZN15MemoryAllocator9mem_allocEm+0xa8>
    80003758:	00000513          	li	a0,0
    8000375c:	fbdff06f          	j	80003718 <_ZN15MemoryAllocator9mem_allocEm+0xa8>

0000000080003760 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE>:
    mergeAdjacent(prev);
    return 0;
}

//Implementation was taken from "OS1 KLK2 SEPT2015 2"
void MemoryAllocator::mergeAdjacent(FreeBlock* block) {
    80003760:	ff010113          	addi	sp,sp,-16
    80003764:	00813423          	sd	s0,8(sp)
    80003768:	01010413          	addi	s0,sp,16
    if (!block || !block->next) return;
    8000376c:	00050e63          	beqz	a0,80003788 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE+0x28>
    80003770:	00053783          	ld	a5,0(a0)
    80003774:	00078a63          	beqz	a5,80003788 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE+0x28>

    if (block->next && (char*)block + block->sizeInBlocks * MEM_BLOCK_SIZE == (char*)block->next) {
    80003778:	00853683          	ld	a3,8(a0)
    8000377c:	00669713          	slli	a4,a3,0x6
    80003780:	00e50733          	add	a4,a0,a4
    80003784:	00e78863          	beq	a5,a4,80003794 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE+0x34>
            // remove the fragment->next
            block->sizeInBlocks += block->next->sizeInBlocks;
            block->next = block->next->next;
    } else return;
}
    80003788:	00813403          	ld	s0,8(sp)
    8000378c:	01010113          	addi	sp,sp,16
    80003790:	00008067          	ret
            block->sizeInBlocks += block->next->sizeInBlocks;
    80003794:	0087b703          	ld	a4,8(a5)
    80003798:	00e686b3          	add	a3,a3,a4
    8000379c:	00d53423          	sd	a3,8(a0)
            block->next = block->next->next;
    800037a0:	0007b783          	ld	a5,0(a5)
    800037a4:	00f53023          	sd	a5,0(a0)
    800037a8:	fe1ff06f          	j	80003788 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE+0x28>

00000000800037ac <_ZN15MemoryAllocator8mem_freeEPv>:
    if (!ptr) return -1;
    800037ac:	0e050663          	beqz	a0,80003898 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    800037b0:	00050713          	mv	a4,a0
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;
    800037b4:	00009797          	auipc	a5,0x9
    800037b8:	3f47b783          	ld	a5,1012(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800037bc:	0007b783          	ld	a5,0(a5)
    800037c0:	0ef56063          	bltu	a0,a5,800038a0 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    800037c4:	00009797          	auipc	a5,0x9
    800037c8:	41c7b783          	ld	a5,1052(a5) # 8000cbe0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800037cc:	0007b783          	ld	a5,0(a5)
    800037d0:	0cf57c63          	bgeu	a0,a5,800038a8 <_ZN15MemoryAllocator8mem_freeEPv+0xfc>
    FreeBlock* curr = freeListHead;
    800037d4:	00009797          	auipc	a5,0x9
    800037d8:	4f47b783          	ld	a5,1268(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    FreeBlock* free_blk = reinterpret_cast<FreeBlock*>(ptr) - 1;
    800037dc:	ff050513          	addi	a0,a0,-16
    if (!curr) {
    800037e0:	02078a63          	beqz	a5,80003814 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
int MemoryAllocator::mem_free(void *ptr) {
    800037e4:	fe010113          	addi	sp,sp,-32
    800037e8:	00113c23          	sd	ra,24(sp)
    800037ec:	00813823          	sd	s0,16(sp)
    800037f0:	00913423          	sd	s1,8(sp)
    800037f4:	02010413          	addi	s0,sp,32
    if (free_blk < curr) {
    800037f8:	02f56863          	bltu	a0,a5,80003828 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    FreeBlock* prev = nullptr;
    800037fc:	00000493          	li	s1,0
    while (curr != nullptr && free_blk > curr) {
    80003800:	04078263          	beqz	a5,80003844 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    80003804:	04a7f063          	bgeu	a5,a0,80003844 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
        prev = curr;
    80003808:	00078493          	mv	s1,a5
        curr = curr->next;
    8000380c:	0007b783          	ld	a5,0(a5)
    while (curr != nullptr && free_blk > curr) {
    80003810:	ff1ff06f          	j	80003800 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
        freeListHead = free_blk;
    80003814:	00009797          	auipc	a5,0x9
    80003818:	4aa7ba23          	sd	a0,1204(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
        free_blk->next = nullptr;
    8000381c:	fe073823          	sd	zero,-16(a4)
        return 0;
    80003820:	00000513          	li	a0,0
    80003824:	00008067          	ret
        free_blk->next = freeListHead;
    80003828:	fef73823          	sd	a5,-16(a4)
        freeListHead = free_blk;
    8000382c:	00009797          	auipc	a5,0x9
    80003830:	48a7be23          	sd	a0,1180(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
        mergeAdjacent(freeListHead);
    80003834:	00000097          	auipc	ra,0x0
    80003838:	f2c080e7          	jalr	-212(ra) # 80003760 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE>
        return 0;
    8000383c:	00000513          	li	a0,0
    80003840:	0280006f          	j	80003868 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    if (curr == nullptr) {
    80003844:	02078c63          	beqz	a5,8000387c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    prev->next = free_blk;
    80003848:	00a4b023          	sd	a0,0(s1)
    free_blk->next = curr;
    8000384c:	fef73823          	sd	a5,-16(a4)
    mergeAdjacent(free_blk);
    80003850:	00000097          	auipc	ra,0x0
    80003854:	f10080e7          	jalr	-240(ra) # 80003760 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE>
    mergeAdjacent(prev);
    80003858:	00048513          	mv	a0,s1
    8000385c:	00000097          	auipc	ra,0x0
    80003860:	f04080e7          	jalr	-252(ra) # 80003760 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE>
    return 0;
    80003864:	00000513          	li	a0,0
}
    80003868:	01813083          	ld	ra,24(sp)
    8000386c:	01013403          	ld	s0,16(sp)
    80003870:	00813483          	ld	s1,8(sp)
    80003874:	02010113          	addi	sp,sp,32
    80003878:	00008067          	ret
        prev->next = free_blk;
    8000387c:	00a4b023          	sd	a0,0(s1)
        free_blk->next = nullptr;
    80003880:	fe073823          	sd	zero,-16(a4)
        mergeAdjacent(prev);
    80003884:	00048513          	mv	a0,s1
    80003888:	00000097          	auipc	ra,0x0
    8000388c:	ed8080e7          	jalr	-296(ra) # 80003760 <_ZN15MemoryAllocator13mergeAdjacentEPNS_9FreeBlockE>
        return 0;
    80003890:	00000513          	li	a0,0
    80003894:	fd5ff06f          	j	80003868 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    if (!ptr) return -1;
    80003898:	fff00513          	li	a0,-1
    8000389c:	00008067          	ret
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;
    800038a0:	fff00513          	li	a0,-1
    800038a4:	00008067          	ret
    800038a8:	fff00513          	li	a0,-1
}
    800038ac:	00008067          	ret

00000000800038b0 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv>:

size_t MemoryAllocator::mem_get_largest_free_block() {
    800038b0:	ff010113          	addi	sp,sp,-16
    800038b4:	00813423          	sd	s0,8(sp)
    800038b8:	01010413          	addi	s0,sp,16
    FreeBlock *ptr=freeListHead;
    800038bc:	00009797          	auipc	a5,0x9
    800038c0:	40c7b783          	ld	a5,1036(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    size_t max_size=0;
    800038c4:	00000513          	li	a0,0
    800038c8:	0080006f          	j	800038d0 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x20>
    while (ptr) {
        if (ptr->sizeInBlocks>max_size) {
            max_size=ptr->sizeInBlocks;
        }
        ptr=ptr->next;
    800038cc:	0007b783          	ld	a5,0(a5)
    while (ptr) {
    800038d0:	00078a63          	beqz	a5,800038e4 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x34>
        if (ptr->sizeInBlocks>max_size) {
    800038d4:	0087b703          	ld	a4,8(a5)
    800038d8:	fee57ae3          	bgeu	a0,a4,800038cc <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x1c>
            max_size=ptr->sizeInBlocks;
    800038dc:	00070513          	mv	a0,a4
    800038e0:	fedff06f          	j	800038cc <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x1c>
    }
    return max_size*MEM_BLOCK_SIZE;
}
    800038e4:	00651513          	slli	a0,a0,0x6
    800038e8:	00813403          	ld	s0,8(sp)
    800038ec:	01010113          	addi	sp,sp,16
    800038f0:	00008067          	ret

00000000800038f4 <_ZN15MemoryAllocator18mem_get_free_spaceEv>:
size_t MemoryAllocator::mem_get_free_space() {
    800038f4:	ff010113          	addi	sp,sp,-16
    800038f8:	00813423          	sd	s0,8(sp)
    800038fc:	01010413          	addi	s0,sp,16
    FreeBlock *ptr=freeListHead;
    80003900:	00009797          	auipc	a5,0x9
    80003904:	3c87b783          	ld	a5,968(a5) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    size_t space=0;
    80003908:	00000513          	li	a0,0
    while (ptr) {
    8000390c:	00078a63          	beqz	a5,80003920 <_ZN15MemoryAllocator18mem_get_free_spaceEv+0x2c>
        space+=ptr->sizeInBlocks;
    80003910:	0087b703          	ld	a4,8(a5)
    80003914:	00e50533          	add	a0,a0,a4
        ptr=ptr->next;
    80003918:	0007b783          	ld	a5,0(a5)
    while (ptr) {
    8000391c:	ff1ff06f          	j	8000390c <_ZN15MemoryAllocator18mem_get_free_spaceEv+0x18>
    }
    return space*MEM_BLOCK_SIZE;
}
    80003920:	00651513          	slli	a0,a0,0x6
    80003924:	00813403          	ld	s0,8(sp)
    80003928:	01010113          	addi	sp,sp,16
    8000392c:	00008067          	ret

0000000080003930 <_ZN15MemoryAllocator13isInitializedEv>:

bool MemoryAllocator::isInitialized() {
    80003930:	ff010113          	addi	sp,sp,-16
    80003934:	00813423          	sd	s0,8(sp)
    80003938:	01010413          	addi	s0,sp,16
    return freeListHead != nullptr;
    8000393c:	00009517          	auipc	a0,0x9
    80003940:	38c53503          	ld	a0,908(a0) # 8000ccc8 <_ZN15MemoryAllocator12freeListHeadE>
    80003944:	00a03533          	snez	a0,a0
    80003948:	00813403          	ld	s0,8(sp)
    8000394c:	01010113          	addi	sp,sp,16
    80003950:	00008067          	ret

0000000080003954 <_ZN20ConsoleBoundedBufferC1Ei>:
//

#include "../h/ConsoleBoundedBuffer.hpp"


ConsoleBoundedBuffer::ConsoleBoundedBuffer(int len)
    80003954:	fe010113          	addi	sp,sp,-32
    80003958:	00113c23          	sd	ra,24(sp)
    8000395c:	00813823          	sd	s0,16(sp)
    80003960:	00913423          	sd	s1,8(sp)
    80003964:	01213023          	sd	s2,0(sp)
    80003968:	02010413          	addi	s0,sp,32
    8000396c:	00050493          	mv	s1,a0
    80003970:	00058913          	mv	s2,a1
    :len(len),head(0),tail(0) {
    80003974:	00b52023          	sw	a1,0(a0)
    80003978:	00052823          	sw	zero,16(a0)
    8000397c:	00052a23          	sw	zero,20(a0)

    buff=new char[len];
    80003980:	00058513          	mv	a0,a1
    80003984:	fffff097          	auipc	ra,0xfffff
    80003988:	da8080e7          	jalr	-600(ra) # 8000272c <_Znam>
    8000398c:	00a4b423          	sd	a0,8(s1)

    Semaphore::createSemaphore(&mutexTail,1);
    80003990:	00100593          	li	a1,1
    80003994:	02048513          	addi	a0,s1,32
    80003998:	ffffe097          	auipc	ra,0xffffe
    8000399c:	e60080e7          	jalr	-416(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    Semaphore::createSemaphore(&mutexHead,1);
    800039a0:	00100593          	li	a1,1
    800039a4:	01848513          	addi	a0,s1,24
    800039a8:	ffffe097          	auipc	ra,0xffffe
    800039ac:	e50080e7          	jalr	-432(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    Semaphore::createSemaphore(&availableItems,0);
    800039b0:	00000593          	li	a1,0
    800039b4:	02848513          	addi	a0,s1,40
    800039b8:	ffffe097          	auipc	ra,0xffffe
    800039bc:	e40080e7          	jalr	-448(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    Semaphore::createSemaphore(&availableSpaces,len);
    800039c0:	00090593          	mv	a1,s2
    800039c4:	03048513          	addi	a0,s1,48
    800039c8:	ffffe097          	auipc	ra,0xffffe
    800039cc:	e30080e7          	jalr	-464(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
}
    800039d0:	01813083          	ld	ra,24(sp)
    800039d4:	01013403          	ld	s0,16(sp)
    800039d8:	00813483          	ld	s1,8(sp)
    800039dc:	00013903          	ld	s2,0(sp)
    800039e0:	02010113          	addi	sp,sp,32
    800039e4:	00008067          	ret

00000000800039e8 <_ZN20ConsoleBoundedBufferD1Ev>:

ConsoleBoundedBuffer::~ConsoleBoundedBuffer() {
    800039e8:	fe010113          	addi	sp,sp,-32
    800039ec:	00113c23          	sd	ra,24(sp)
    800039f0:	00813823          	sd	s0,16(sp)
    800039f4:	00913423          	sd	s1,8(sp)
    800039f8:	02010413          	addi	s0,sp,32
    800039fc:	00050493          	mv	s1,a0
    delete buff;
    80003a00:	00853503          	ld	a0,8(a0)
    80003a04:	00050663          	beqz	a0,80003a10 <_ZN20ConsoleBoundedBufferD1Ev+0x28>
    80003a08:	fffff097          	auipc	ra,0xfffff
    80003a0c:	d4c080e7          	jalr	-692(ra) # 80002754 <_ZdlPv>

    Semaphore::closeSemaphore(availableSpaces);
    80003a10:	0304b503          	ld	a0,48(s1)
    80003a14:	ffffe097          	auipc	ra,0xffffe
    80003a18:	ea8080e7          	jalr	-344(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    Semaphore::closeSemaphore(availableItems);
    80003a1c:	0284b503          	ld	a0,40(s1)
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	e9c080e7          	jalr	-356(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    Semaphore::closeSemaphore(mutexTail);
    80003a28:	0204b503          	ld	a0,32(s1)
    80003a2c:	ffffe097          	auipc	ra,0xffffe
    80003a30:	e90080e7          	jalr	-368(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    Semaphore::closeSemaphore(mutexHead);
    80003a34:	0184b503          	ld	a0,24(s1)
    80003a38:	ffffe097          	auipc	ra,0xffffe
    80003a3c:	e84080e7          	jalr	-380(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>

    delete availableItems;
    80003a40:	0284b503          	ld	a0,40(s1)
    80003a44:	00050663          	beqz	a0,80003a50 <_ZN20ConsoleBoundedBufferD1Ev+0x68>

    80003a48:	00000097          	auipc	ra,0x0
    80003a4c:	d64080e7          	jalr	-668(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    delete availableSpaces;
    80003a50:	0304b503          	ld	a0,48(s1)
    80003a54:	00050663          	beqz	a0,80003a60 <_ZN20ConsoleBoundedBufferD1Ev+0x78>
    80003a58:	00000097          	auipc	ra,0x0
    80003a5c:	d54080e7          	jalr	-684(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    delete mutexTail;
    80003a60:	0204b503          	ld	a0,32(s1)
    80003a64:	00050663          	beqz	a0,80003a70 <_ZN20ConsoleBoundedBufferD1Ev+0x88>
    80003a68:	00000097          	auipc	ra,0x0
    80003a6c:	d44080e7          	jalr	-700(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
    delete mutexHead;
    80003a70:	0184b503          	ld	a0,24(s1)
    80003a74:	00050663          	beqz	a0,80003a80 <_ZN20ConsoleBoundedBufferD1Ev+0x98>
    80003a78:	00000097          	auipc	ra,0x0
    80003a7c:	d34080e7          	jalr	-716(ra) # 800037ac <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003a80:	01813083          	ld	ra,24(sp)
    80003a84:	01013403          	ld	s0,16(sp)
    80003a88:	00813483          	ld	s1,8(sp)
    80003a8c:	02010113          	addi	sp,sp,32
    80003a90:	00008067          	ret

0000000080003a94 <_ZN20ConsoleBoundedBuffer6appendEc>:

void ConsoleBoundedBuffer::append(char character) {
    80003a94:	fe010113          	addi	sp,sp,-32
    80003a98:	00113c23          	sd	ra,24(sp)
    80003a9c:	00813823          	sd	s0,16(sp)
    80003aa0:	00913423          	sd	s1,8(sp)
    80003aa4:	01213023          	sd	s2,0(sp)
    80003aa8:	02010413          	addi	s0,sp,32
    80003aac:	00050493          	mv	s1,a0
    80003ab0:	00058913          	mv	s2,a1
    availableSpaces->sem_wait();
    80003ab4:	03053503          	ld	a0,48(a0)
    80003ab8:	ffffe097          	auipc	ra,0xffffe
    80003abc:	f30080e7          	jalr	-208(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    mutexTail->sem_wait();
    80003ac0:	0204b503          	ld	a0,32(s1)
    80003ac4:	ffffe097          	auipc	ra,0xffffe
    80003ac8:	f24080e7          	jalr	-220(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>

    buff[tail]=character;
    80003acc:	0084b783          	ld	a5,8(s1)
    80003ad0:	0144a703          	lw	a4,20(s1)
    80003ad4:	00e787b3          	add	a5,a5,a4
    80003ad8:	01278023          	sb	s2,0(a5)
    tail=(tail+1)% len;
    80003adc:	0144a783          	lw	a5,20(s1)
    80003ae0:	0017879b          	addiw	a5,a5,1
    80003ae4:	0004a703          	lw	a4,0(s1)
    80003ae8:	02e7e7bb          	remw	a5,a5,a4
    80003aec:	00f4aa23          	sw	a5,20(s1)

    mutexTail->sem_signal();
    80003af0:	0204b503          	ld	a0,32(s1)
    80003af4:	ffffe097          	auipc	ra,0xffffe
    80003af8:	fbc080e7          	jalr	-68(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    availableItems->sem_signal();
    80003afc:	0284b503          	ld	a0,40(s1)
    80003b00:	ffffe097          	auipc	ra,0xffffe
    80003b04:	fb0080e7          	jalr	-80(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
}
    80003b08:	01813083          	ld	ra,24(sp)
    80003b0c:	01013403          	ld	s0,16(sp)
    80003b10:	00813483          	ld	s1,8(sp)
    80003b14:	00013903          	ld	s2,0(sp)
    80003b18:	02010113          	addi	sp,sp,32
    80003b1c:	00008067          	ret

0000000080003b20 <_ZN20ConsoleBoundedBuffer4takeEv>:

char ConsoleBoundedBuffer::take() {
    80003b20:	fe010113          	addi	sp,sp,-32
    80003b24:	00113c23          	sd	ra,24(sp)
    80003b28:	00813823          	sd	s0,16(sp)
    80003b2c:	00913423          	sd	s1,8(sp)
    80003b30:	01213023          	sd	s2,0(sp)
    80003b34:	02010413          	addi	s0,sp,32
    80003b38:	00050493          	mv	s1,a0
    availableItems->sem_wait();
    80003b3c:	02853503          	ld	a0,40(a0)
    80003b40:	ffffe097          	auipc	ra,0xffffe
    80003b44:	ea8080e7          	jalr	-344(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    mutexHead->sem_wait();
    80003b48:	0184b503          	ld	a0,24(s1)
    80003b4c:	ffffe097          	auipc	ra,0xffffe
    80003b50:	e9c080e7          	jalr	-356(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>

    char temp=buff[head];
    80003b54:	0084b703          	ld	a4,8(s1)
    80003b58:	0104a783          	lw	a5,16(s1)
    80003b5c:	00f70733          	add	a4,a4,a5
    80003b60:	00074903          	lbu	s2,0(a4)
    head=(head+1)% len;
    80003b64:	0017879b          	addiw	a5,a5,1
    80003b68:	0004a703          	lw	a4,0(s1)
    80003b6c:	02e7e7bb          	remw	a5,a5,a4
    80003b70:	00f4a823          	sw	a5,16(s1)

    mutexHead->sem_signal();
    80003b74:	0184b503          	ld	a0,24(s1)
    80003b78:	ffffe097          	auipc	ra,0xffffe
    80003b7c:	f38080e7          	jalr	-200(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    availableSpaces->sem_signal();
    80003b80:	0304b503          	ld	a0,48(s1)
    80003b84:	ffffe097          	auipc	ra,0xffffe
    80003b88:	f2c080e7          	jalr	-212(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>

    return temp;
}
    80003b8c:	00090513          	mv	a0,s2
    80003b90:	01813083          	ld	ra,24(sp)
    80003b94:	01013403          	ld	s0,16(sp)
    80003b98:	00813483          	ld	s1,8(sp)
    80003b9c:	00013903          	ld	s2,0(sp)
    80003ba0:	02010113          	addi	sp,sp,32
    80003ba4:	00008067          	ret

0000000080003ba8 <_Z13userMainTestsv>:
//// TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"
#endif

void userMainTests() {
    80003ba8:	fe010113          	addi	sp,sp,-32
    80003bac:	00113c23          	sd	ra,24(sp)
    80003bb0:	00813823          	sd	s0,16(sp)
    80003bb4:	00913423          	sd	s1,8(sp)
    80003bb8:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80003bbc:	00006517          	auipc	a0,0x6
    80003bc0:	5e450513          	addi	a0,a0,1508 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80003bc4:	ffffe097          	auipc	ra,0xffffe
    80003bc8:	010080e7          	jalr	16(ra) # 80001bd4 <_Z11printStringPKc>
    int test = getc() - '0';
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	b48080e7          	jalr	-1208(ra) # 80001714 <_Z4getcv>
    80003bd4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80003bd8:	ffffe097          	auipc	ra,0xffffe
    80003bdc:	b3c080e7          	jalr	-1220(ra) # 80001714 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80003be0:	00700793          	li	a5,7
    80003be4:	1097e263          	bltu	a5,s1,80003ce8 <_Z13userMainTestsv+0x140>
    80003be8:	00249493          	slli	s1,s1,0x2
    80003bec:	00007717          	auipc	a4,0x7
    80003bf0:	80c70713          	addi	a4,a4,-2036 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80003bf4:	00e484b3          	add	s1,s1,a4
    80003bf8:	0004a783          	lw	a5,0(s1)
    80003bfc:	00e787b3          	add	a5,a5,a4
    80003c00:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80003c04:	00002097          	auipc	ra,0x2
    80003c08:	be8080e7          	jalr	-1048(ra) # 800057ec <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80003c0c:	00006517          	auipc	a0,0x6
    80003c10:	5b450513          	addi	a0,a0,1460 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80003c14:	ffffe097          	auipc	ra,0xffffe
    80003c18:	fc0080e7          	jalr	-64(ra) # 80001bd4 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80003c1c:	01813083          	ld	ra,24(sp)
    80003c20:	01013403          	ld	s0,16(sp)
    80003c24:	00813483          	ld	s1,8(sp)
    80003c28:	02010113          	addi	sp,sp,32
    80003c2c:	00008067          	ret
            Threads_CPP_API_test();
    80003c30:	00001097          	auipc	ra,0x1
    80003c34:	a9c080e7          	jalr	-1380(ra) # 800046cc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80003c38:	00006517          	auipc	a0,0x6
    80003c3c:	5c850513          	addi	a0,a0,1480 # 8000a200 <CONSOLE_STATUS+0x1f0>
    80003c40:	ffffe097          	auipc	ra,0xffffe
    80003c44:	f94080e7          	jalr	-108(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c48:	fd5ff06f          	j	80003c1c <_Z13userMainTestsv+0x74>
            producerConsumer_C_API();
    80003c4c:	00000097          	auipc	ra,0x0
    80003c50:	2d4080e7          	jalr	724(ra) # 80003f20 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80003c54:	00006517          	auipc	a0,0x6
    80003c58:	5ec50513          	addi	a0,a0,1516 # 8000a240 <CONSOLE_STATUS+0x230>
    80003c5c:	ffffe097          	auipc	ra,0xffffe
    80003c60:	f78080e7          	jalr	-136(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c64:	fb9ff06f          	j	80003c1c <_Z13userMainTestsv+0x74>
            producerConsumer_CPP_Sync_API();
    80003c68:	00002097          	auipc	ra,0x2
    80003c6c:	ec8080e7          	jalr	-312(ra) # 80005b30 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80003c70:	00006517          	auipc	a0,0x6
    80003c74:	62050513          	addi	a0,a0,1568 # 8000a290 <CONSOLE_STATUS+0x280>
    80003c78:	ffffe097          	auipc	ra,0xffffe
    80003c7c:	f5c080e7          	jalr	-164(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c80:	f9dff06f          	j	80003c1c <_Z13userMainTestsv+0x74>
            testSleeping();
    80003c84:	00003097          	auipc	ra,0x3
    80003c88:	98c080e7          	jalr	-1652(ra) # 80006610 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80003c8c:	00006517          	auipc	a0,0x6
    80003c90:	65c50513          	addi	a0,a0,1628 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80003c94:	ffffe097          	auipc	ra,0xffffe
    80003c98:	f40080e7          	jalr	-192(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c9c:	f81ff06f          	j	80003c1c <_Z13userMainTestsv+0x74>
            testConsumerProducer();
    80003ca0:	00001097          	auipc	ra,0x1
    80003ca4:	eec080e7          	jalr	-276(ra) # 80004b8c <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80003ca8:	00006517          	auipc	a0,0x6
    80003cac:	67050513          	addi	a0,a0,1648 # 8000a318 <CONSOLE_STATUS+0x308>
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	f24080e7          	jalr	-220(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003cb8:	f65ff06f          	j	80003c1c <_Z13userMainTestsv+0x74>
            System_Mode_test();
    80003cbc:	00003097          	auipc	ra,0x3
    80003cc0:	ec8080e7          	jalr	-312(ra) # 80006b84 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80003cc4:	00006517          	auipc	a0,0x6
    80003cc8:	69450513          	addi	a0,a0,1684 # 8000a358 <CONSOLE_STATUS+0x348>
    80003ccc:	ffffe097          	auipc	ra,0xffffe
    80003cd0:	f08080e7          	jalr	-248(ra) # 80001bd4 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80003cd4:	00006517          	auipc	a0,0x6
    80003cd8:	6a450513          	addi	a0,a0,1700 # 8000a378 <CONSOLE_STATUS+0x368>
    80003cdc:	ffffe097          	auipc	ra,0xffffe
    80003ce0:	ef8080e7          	jalr	-264(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003ce4:	f39ff06f          	j	80003c1c <_Z13userMainTestsv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80003ce8:	00006517          	auipc	a0,0x6
    80003cec:	6e850513          	addi	a0,a0,1768 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80003cf0:	ffffe097          	auipc	ra,0xffffe
    80003cf4:	ee4080e7          	jalr	-284(ra) # 80001bd4 <_Z11printStringPKc>
    80003cf8:	f25ff06f          	j	80003c1c <_Z13userMainTestsv+0x74>

0000000080003cfc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003cfc:	fe010113          	addi	sp,sp,-32
    80003d00:	00113c23          	sd	ra,24(sp)
    80003d04:	00813823          	sd	s0,16(sp)
    80003d08:	00913423          	sd	s1,8(sp)
    80003d0c:	01213023          	sd	s2,0(sp)
    80003d10:	02010413          	addi	s0,sp,32
    80003d14:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003d18:	00000913          	li	s2,0
    80003d1c:	00c0006f          	j	80003d28 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003d20:	ffffd097          	auipc	ra,0xffffd
    80003d24:	7c0080e7          	jalr	1984(ra) # 800014e0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003d28:	ffffe097          	auipc	ra,0xffffe
    80003d2c:	9ec080e7          	jalr	-1556(ra) # 80001714 <_Z4getcv>
    80003d30:	0005059b          	sext.w	a1,a0
    80003d34:	01b00793          	li	a5,27
    80003d38:	02f58a63          	beq	a1,a5,80003d6c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003d3c:	0084b503          	ld	a0,8(s1)
    80003d40:	00003097          	auipc	ra,0x3
    80003d44:	fdc080e7          	jalr	-36(ra) # 80006d1c <_ZN6Buffer3putEi>
        i++;
    80003d48:	0019071b          	addiw	a4,s2,1
    80003d4c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003d50:	0004a683          	lw	a3,0(s1)
    80003d54:	0026979b          	slliw	a5,a3,0x2
    80003d58:	00d787bb          	addw	a5,a5,a3
    80003d5c:	0017979b          	slliw	a5,a5,0x1
    80003d60:	02f767bb          	remw	a5,a4,a5
    80003d64:	fc0792e3          	bnez	a5,80003d28 <_ZL16producerKeyboardPv+0x2c>
    80003d68:	fb9ff06f          	j	80003d20 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003d6c:	00100793          	li	a5,1
    80003d70:	00009717          	auipc	a4,0x9
    80003d74:	f6f72023          	sw	a5,-160(a4) # 8000ccd0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003d78:	02100593          	li	a1,33
    80003d7c:	0084b503          	ld	a0,8(s1)
    80003d80:	00003097          	auipc	ra,0x3
    80003d84:	f9c080e7          	jalr	-100(ra) # 80006d1c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003d88:	0104b503          	ld	a0,16(s1)
    80003d8c:	ffffe097          	auipc	ra,0xffffe
    80003d90:	8d0080e7          	jalr	-1840(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80003d94:	01813083          	ld	ra,24(sp)
    80003d98:	01013403          	ld	s0,16(sp)
    80003d9c:	00813483          	ld	s1,8(sp)
    80003da0:	00013903          	ld	s2,0(sp)
    80003da4:	02010113          	addi	sp,sp,32
    80003da8:	00008067          	ret

0000000080003dac <_ZL8producerPv>:

static void producer(void *arg) {
    80003dac:	fe010113          	addi	sp,sp,-32
    80003db0:	00113c23          	sd	ra,24(sp)
    80003db4:	00813823          	sd	s0,16(sp)
    80003db8:	00913423          	sd	s1,8(sp)
    80003dbc:	01213023          	sd	s2,0(sp)
    80003dc0:	02010413          	addi	s0,sp,32
    80003dc4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003dc8:	00000913          	li	s2,0
    80003dcc:	00c0006f          	j	80003dd8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003dd0:	ffffd097          	auipc	ra,0xffffd
    80003dd4:	710080e7          	jalr	1808(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003dd8:	00009797          	auipc	a5,0x9
    80003ddc:	ef87a783          	lw	a5,-264(a5) # 8000ccd0 <_ZL9threadEnd>
    80003de0:	02079e63          	bnez	a5,80003e1c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003de4:	0004a583          	lw	a1,0(s1)
    80003de8:	0305859b          	addiw	a1,a1,48
    80003dec:	0084b503          	ld	a0,8(s1)
    80003df0:	00003097          	auipc	ra,0x3
    80003df4:	f2c080e7          	jalr	-212(ra) # 80006d1c <_ZN6Buffer3putEi>
        i++;
    80003df8:	0019071b          	addiw	a4,s2,1
    80003dfc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003e00:	0004a683          	lw	a3,0(s1)
    80003e04:	0026979b          	slliw	a5,a3,0x2
    80003e08:	00d787bb          	addw	a5,a5,a3
    80003e0c:	0017979b          	slliw	a5,a5,0x1
    80003e10:	02f767bb          	remw	a5,a4,a5
    80003e14:	fc0792e3          	bnez	a5,80003dd8 <_ZL8producerPv+0x2c>
    80003e18:	fb9ff06f          	j	80003dd0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003e1c:	0104b503          	ld	a0,16(s1)
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	83c080e7          	jalr	-1988(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80003e28:	01813083          	ld	ra,24(sp)
    80003e2c:	01013403          	ld	s0,16(sp)
    80003e30:	00813483          	ld	s1,8(sp)
    80003e34:	00013903          	ld	s2,0(sp)
    80003e38:	02010113          	addi	sp,sp,32
    80003e3c:	00008067          	ret

0000000080003e40 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003e40:	fd010113          	addi	sp,sp,-48
    80003e44:	02113423          	sd	ra,40(sp)
    80003e48:	02813023          	sd	s0,32(sp)
    80003e4c:	00913c23          	sd	s1,24(sp)
    80003e50:	01213823          	sd	s2,16(sp)
    80003e54:	01313423          	sd	s3,8(sp)
    80003e58:	03010413          	addi	s0,sp,48
    80003e5c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003e60:	00000993          	li	s3,0
    80003e64:	01c0006f          	j	80003e80 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003e68:	ffffd097          	auipc	ra,0xffffd
    80003e6c:	678080e7          	jalr	1656(ra) # 800014e0 <_Z15thread_dispatchv>
    80003e70:	0500006f          	j	80003ec0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003e74:	00a00513          	li	a0,10
    80003e78:	ffffe097          	auipc	ra,0xffffe
    80003e7c:	8f8080e7          	jalr	-1800(ra) # 80001770 <_Z4putcc>
    while (!threadEnd) {
    80003e80:	00009797          	auipc	a5,0x9
    80003e84:	e507a783          	lw	a5,-432(a5) # 8000ccd0 <_ZL9threadEnd>
    80003e88:	06079063          	bnez	a5,80003ee8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003e8c:	00893503          	ld	a0,8(s2)
    80003e90:	00003097          	auipc	ra,0x3
    80003e94:	f1c080e7          	jalr	-228(ra) # 80006dac <_ZN6Buffer3getEv>
        i++;
    80003e98:	0019849b          	addiw	s1,s3,1
    80003e9c:	0004899b          	sext.w	s3,s1
        putc(key);
    80003ea0:	0ff57513          	andi	a0,a0,255
    80003ea4:	ffffe097          	auipc	ra,0xffffe
    80003ea8:	8cc080e7          	jalr	-1844(ra) # 80001770 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003eac:	00092703          	lw	a4,0(s2)
    80003eb0:	0027179b          	slliw	a5,a4,0x2
    80003eb4:	00e787bb          	addw	a5,a5,a4
    80003eb8:	02f4e7bb          	remw	a5,s1,a5
    80003ebc:	fa0786e3          	beqz	a5,80003e68 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003ec0:	05000793          	li	a5,80
    80003ec4:	02f4e4bb          	remw	s1,s1,a5
    80003ec8:	fa049ce3          	bnez	s1,80003e80 <_ZL8consumerPv+0x40>
    80003ecc:	fa9ff06f          	j	80003e74 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003ed0:	00893503          	ld	a0,8(s2)
    80003ed4:	00003097          	auipc	ra,0x3
    80003ed8:	ed8080e7          	jalr	-296(ra) # 80006dac <_ZN6Buffer3getEv>
        putc(key);
    80003edc:	0ff57513          	andi	a0,a0,255
    80003ee0:	ffffe097          	auipc	ra,0xffffe
    80003ee4:	890080e7          	jalr	-1904(ra) # 80001770 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003ee8:	00893503          	ld	a0,8(s2)
    80003eec:	00003097          	auipc	ra,0x3
    80003ef0:	f4c080e7          	jalr	-180(ra) # 80006e38 <_ZN6Buffer6getCntEv>
    80003ef4:	fca04ee3          	bgtz	a0,80003ed0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003ef8:	01093503          	ld	a0,16(s2)
    80003efc:	ffffd097          	auipc	ra,0xffffd
    80003f00:	760080e7          	jalr	1888(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80003f04:	02813083          	ld	ra,40(sp)
    80003f08:	02013403          	ld	s0,32(sp)
    80003f0c:	01813483          	ld	s1,24(sp)
    80003f10:	01013903          	ld	s2,16(sp)
    80003f14:	00813983          	ld	s3,8(sp)
    80003f18:	03010113          	addi	sp,sp,48
    80003f1c:	00008067          	ret

0000000080003f20 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003f20:	f9010113          	addi	sp,sp,-112
    80003f24:	06113423          	sd	ra,104(sp)
    80003f28:	06813023          	sd	s0,96(sp)
    80003f2c:	04913c23          	sd	s1,88(sp)
    80003f30:	05213823          	sd	s2,80(sp)
    80003f34:	05313423          	sd	s3,72(sp)
    80003f38:	05413023          	sd	s4,64(sp)
    80003f3c:	03513c23          	sd	s5,56(sp)
    80003f40:	03613823          	sd	s6,48(sp)
    80003f44:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003f48:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003f4c:	00006517          	auipc	a0,0x6
    80003f50:	4cc50513          	addi	a0,a0,1228 # 8000a418 <CONSOLE_STATUS+0x408>
    80003f54:	ffffe097          	auipc	ra,0xffffe
    80003f58:	c80080e7          	jalr	-896(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80003f5c:	01e00593          	li	a1,30
    80003f60:	fa040493          	addi	s1,s0,-96
    80003f64:	00048513          	mv	a0,s1
    80003f68:	ffffe097          	auipc	ra,0xffffe
    80003f6c:	d7c080e7          	jalr	-644(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003f70:	00048513          	mv	a0,s1
    80003f74:	ffffe097          	auipc	ra,0xffffe
    80003f78:	e48080e7          	jalr	-440(ra) # 80001dbc <_Z11stringToIntPKc>
    80003f7c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003f80:	00006517          	auipc	a0,0x6
    80003f84:	4b850513          	addi	a0,a0,1208 # 8000a438 <CONSOLE_STATUS+0x428>
    80003f88:	ffffe097          	auipc	ra,0xffffe
    80003f8c:	c4c080e7          	jalr	-948(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80003f90:	01e00593          	li	a1,30
    80003f94:	00048513          	mv	a0,s1
    80003f98:	ffffe097          	auipc	ra,0xffffe
    80003f9c:	d4c080e7          	jalr	-692(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80003fa0:	00048513          	mv	a0,s1
    80003fa4:	ffffe097          	auipc	ra,0xffffe
    80003fa8:	e18080e7          	jalr	-488(ra) # 80001dbc <_Z11stringToIntPKc>
    80003fac:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003fb0:	00006517          	auipc	a0,0x6
    80003fb4:	4a850513          	addi	a0,a0,1192 # 8000a458 <CONSOLE_STATUS+0x448>
    80003fb8:	ffffe097          	auipc	ra,0xffffe
    80003fbc:	c1c080e7          	jalr	-996(ra) # 80001bd4 <_Z11printStringPKc>
    80003fc0:	00000613          	li	a2,0
    80003fc4:	00a00593          	li	a1,10
    80003fc8:	00090513          	mv	a0,s2
    80003fcc:	ffffe097          	auipc	ra,0xffffe
    80003fd0:	e40080e7          	jalr	-448(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003fd4:	00006517          	auipc	a0,0x6
    80003fd8:	49c50513          	addi	a0,a0,1180 # 8000a470 <CONSOLE_STATUS+0x460>
    80003fdc:	ffffe097          	auipc	ra,0xffffe
    80003fe0:	bf8080e7          	jalr	-1032(ra) # 80001bd4 <_Z11printStringPKc>
    80003fe4:	00000613          	li	a2,0
    80003fe8:	00a00593          	li	a1,10
    80003fec:	00048513          	mv	a0,s1
    80003ff0:	ffffe097          	auipc	ra,0xffffe
    80003ff4:	e1c080e7          	jalr	-484(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80003ff8:	00006517          	auipc	a0,0x6
    80003ffc:	49050513          	addi	a0,a0,1168 # 8000a488 <CONSOLE_STATUS+0x478>
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	bd4080e7          	jalr	-1068(ra) # 80001bd4 <_Z11printStringPKc>
    if(threadNum > n) {
    80004008:	0324c463          	blt	s1,s2,80004030 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000400c:	03205c63          	blez	s2,80004044 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80004010:	03800513          	li	a0,56
    80004014:	ffffe097          	auipc	ra,0xffffe
    80004018:	6f0080e7          	jalr	1776(ra) # 80002704 <_Znwm>
    8000401c:	00050a13          	mv	s4,a0
    80004020:	00048593          	mv	a1,s1
    80004024:	00003097          	auipc	ra,0x3
    80004028:	c5c080e7          	jalr	-932(ra) # 80006c80 <_ZN6BufferC1Ei>
    8000402c:	0300006f          	j	8000405c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004030:	00006517          	auipc	a0,0x6
    80004034:	46050513          	addi	a0,a0,1120 # 8000a490 <CONSOLE_STATUS+0x480>
    80004038:	ffffe097          	auipc	ra,0xffffe
    8000403c:	b9c080e7          	jalr	-1124(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004040:	0140006f          	j	80004054 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004044:	00006517          	auipc	a0,0x6
    80004048:	48c50513          	addi	a0,a0,1164 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    8000404c:	ffffe097          	auipc	ra,0xffffe
    80004050:	b88080e7          	jalr	-1144(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004054:	000b0113          	mv	sp,s6
    80004058:	1500006f          	j	800041a8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    8000405c:	00000593          	li	a1,0
    80004060:	00009517          	auipc	a0,0x9
    80004064:	c7850513          	addi	a0,a0,-904 # 8000ccd8 <_ZL10waitForAll>
    80004068:	ffffd097          	auipc	ra,0xffffd
    8000406c:	4b8080e7          	jalr	1208(ra) # 80001520 <_Z8sem_openPP3Semj>
    thread_t threads[threadNum];
    80004070:	00391793          	slli	a5,s2,0x3
    80004074:	00f78793          	addi	a5,a5,15
    80004078:	ff07f793          	andi	a5,a5,-16
    8000407c:	40f10133          	sub	sp,sp,a5
    80004080:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80004084:	0019071b          	addiw	a4,s2,1
    80004088:	00171793          	slli	a5,a4,0x1
    8000408c:	00e787b3          	add	a5,a5,a4
    80004090:	00379793          	slli	a5,a5,0x3
    80004094:	00f78793          	addi	a5,a5,15
    80004098:	ff07f793          	andi	a5,a5,-16
    8000409c:	40f10133          	sub	sp,sp,a5
    800040a0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800040a4:	00191613          	slli	a2,s2,0x1
    800040a8:	012607b3          	add	a5,a2,s2
    800040ac:	00379793          	slli	a5,a5,0x3
    800040b0:	00f987b3          	add	a5,s3,a5
    800040b4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800040b8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800040bc:	00009717          	auipc	a4,0x9
    800040c0:	c1c73703          	ld	a4,-996(a4) # 8000ccd8 <_ZL10waitForAll>
    800040c4:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800040c8:	00078613          	mv	a2,a5
    800040cc:	00000597          	auipc	a1,0x0
    800040d0:	d7458593          	addi	a1,a1,-652 # 80003e40 <_ZL8consumerPv>
    800040d4:	f9840513          	addi	a0,s0,-104
    800040d8:	ffffd097          	auipc	ra,0xffffd
    800040dc:	2fc080e7          	jalr	764(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800040e0:	00000493          	li	s1,0
    800040e4:	0280006f          	j	8000410c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800040e8:	00000597          	auipc	a1,0x0
    800040ec:	c1458593          	addi	a1,a1,-1004 # 80003cfc <_ZL16producerKeyboardPv>
                      data + i);
    800040f0:	00179613          	slli	a2,a5,0x1
    800040f4:	00f60633          	add	a2,a2,a5
    800040f8:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800040fc:	00c98633          	add	a2,s3,a2
    80004100:	ffffd097          	auipc	ra,0xffffd
    80004104:	2d4080e7          	jalr	724(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004108:	0014849b          	addiw	s1,s1,1
    8000410c:	0524d263          	bge	s1,s2,80004150 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80004110:	00149793          	slli	a5,s1,0x1
    80004114:	009787b3          	add	a5,a5,s1
    80004118:	00379793          	slli	a5,a5,0x3
    8000411c:	00f987b3          	add	a5,s3,a5
    80004120:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004124:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80004128:	00009717          	auipc	a4,0x9
    8000412c:	bb073703          	ld	a4,-1104(a4) # 8000ccd8 <_ZL10waitForAll>
    80004130:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80004134:	00048793          	mv	a5,s1
    80004138:	00349513          	slli	a0,s1,0x3
    8000413c:	00aa8533          	add	a0,s5,a0
    80004140:	fa9054e3          	blez	s1,800040e8 <_Z22producerConsumer_C_APIv+0x1c8>
    80004144:	00000597          	auipc	a1,0x0
    80004148:	c6858593          	addi	a1,a1,-920 # 80003dac <_ZL8producerPv>
    8000414c:	fa5ff06f          	j	800040f0 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80004150:	ffffd097          	auipc	ra,0xffffd
    80004154:	390080e7          	jalr	912(ra) # 800014e0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80004158:	00000493          	li	s1,0
    8000415c:	00994e63          	blt	s2,s1,80004178 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80004160:	00009517          	auipc	a0,0x9
    80004164:	b7853503          	ld	a0,-1160(a0) # 8000ccd8 <_ZL10waitForAll>
    80004168:	ffffd097          	auipc	ra,0xffffd
    8000416c:	48c080e7          	jalr	1164(ra) # 800015f4 <_Z8sem_waitP3Sem>
    for (int i = 0; i <= threadNum; i++) {
    80004170:	0014849b          	addiw	s1,s1,1
    80004174:	fe9ff06f          	j	8000415c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80004178:	00009517          	auipc	a0,0x9
    8000417c:	b6053503          	ld	a0,-1184(a0) # 8000ccd8 <_ZL10waitForAll>
    80004180:	ffffd097          	auipc	ra,0xffffd
    80004184:	40c080e7          	jalr	1036(ra) # 8000158c <_Z9sem_closeP3Sem>
    delete buffer;
    80004188:	000a0e63          	beqz	s4,800041a4 <_Z22producerConsumer_C_APIv+0x284>
    8000418c:	000a0513          	mv	a0,s4
    80004190:	00003097          	auipc	ra,0x3
    80004194:	d30080e7          	jalr	-720(ra) # 80006ec0 <_ZN6BufferD1Ev>
    80004198:	000a0513          	mv	a0,s4
    8000419c:	ffffe097          	auipc	ra,0xffffe
    800041a0:	5b8080e7          	jalr	1464(ra) # 80002754 <_ZdlPv>
    800041a4:	000b0113          	mv	sp,s6

}
    800041a8:	f9040113          	addi	sp,s0,-112
    800041ac:	06813083          	ld	ra,104(sp)
    800041b0:	06013403          	ld	s0,96(sp)
    800041b4:	05813483          	ld	s1,88(sp)
    800041b8:	05013903          	ld	s2,80(sp)
    800041bc:	04813983          	ld	s3,72(sp)
    800041c0:	04013a03          	ld	s4,64(sp)
    800041c4:	03813a83          	ld	s5,56(sp)
    800041c8:	03013b03          	ld	s6,48(sp)
    800041cc:	07010113          	addi	sp,sp,112
    800041d0:	00008067          	ret
    800041d4:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800041d8:	000a0513          	mv	a0,s4
    800041dc:	ffffe097          	auipc	ra,0xffffe
    800041e0:	578080e7          	jalr	1400(ra) # 80002754 <_ZdlPv>
    800041e4:	00048513          	mv	a0,s1
    800041e8:	0000a097          	auipc	ra,0xa
    800041ec:	c00080e7          	jalr	-1024(ra) # 8000dde8 <_Unwind_Resume>

00000000800041f0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800041f0:	fe010113          	addi	sp,sp,-32
    800041f4:	00113c23          	sd	ra,24(sp)
    800041f8:	00813823          	sd	s0,16(sp)
    800041fc:	00913423          	sd	s1,8(sp)
    80004200:	01213023          	sd	s2,0(sp)
    80004204:	02010413          	addi	s0,sp,32
    80004208:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000420c:	00100793          	li	a5,1
    80004210:	02a7f863          	bgeu	a5,a0,80004240 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004214:	00a00793          	li	a5,10
    80004218:	02f577b3          	remu	a5,a0,a5
    8000421c:	02078e63          	beqz	a5,80004258 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004220:	fff48513          	addi	a0,s1,-1
    80004224:	00000097          	auipc	ra,0x0
    80004228:	fcc080e7          	jalr	-52(ra) # 800041f0 <_ZL9fibonaccim>
    8000422c:	00050913          	mv	s2,a0
    80004230:	ffe48513          	addi	a0,s1,-2
    80004234:	00000097          	auipc	ra,0x0
    80004238:	fbc080e7          	jalr	-68(ra) # 800041f0 <_ZL9fibonaccim>
    8000423c:	00a90533          	add	a0,s2,a0
}
    80004240:	01813083          	ld	ra,24(sp)
    80004244:	01013403          	ld	s0,16(sp)
    80004248:	00813483          	ld	s1,8(sp)
    8000424c:	00013903          	ld	s2,0(sp)
    80004250:	02010113          	addi	sp,sp,32
    80004254:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004258:	ffffd097          	auipc	ra,0xffffd
    8000425c:	288080e7          	jalr	648(ra) # 800014e0 <_Z15thread_dispatchv>
    80004260:	fc1ff06f          	j	80004220 <_ZL9fibonaccim+0x30>

0000000080004264 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80004264:	fe010113          	addi	sp,sp,-32
    80004268:	00113c23          	sd	ra,24(sp)
    8000426c:	00813823          	sd	s0,16(sp)
    80004270:	00913423          	sd	s1,8(sp)
    80004274:	01213023          	sd	s2,0(sp)
    80004278:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000427c:	00000913          	li	s2,0
    80004280:	0380006f          	j	800042b8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004284:	ffffd097          	auipc	ra,0xffffd
    80004288:	25c080e7          	jalr	604(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000428c:	00148493          	addi	s1,s1,1
    80004290:	000027b7          	lui	a5,0x2
    80004294:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004298:	0097ee63          	bltu	a5,s1,800042b4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000429c:	00000713          	li	a4,0
    800042a0:	000077b7          	lui	a5,0x7
    800042a4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800042a8:	fce7eee3          	bltu	a5,a4,80004284 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800042ac:	00170713          	addi	a4,a4,1
    800042b0:	ff1ff06f          	j	800042a0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800042b4:	00190913          	addi	s2,s2,1
    800042b8:	00900793          	li	a5,9
    800042bc:	0527e063          	bltu	a5,s2,800042fc <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800042c0:	00006517          	auipc	a0,0x6
    800042c4:	24050513          	addi	a0,a0,576 # 8000a500 <CONSOLE_STATUS+0x4f0>
    800042c8:	ffffe097          	auipc	ra,0xffffe
    800042cc:	90c080e7          	jalr	-1780(ra) # 80001bd4 <_Z11printStringPKc>
    800042d0:	00000613          	li	a2,0
    800042d4:	00a00593          	li	a1,10
    800042d8:	0009051b          	sext.w	a0,s2
    800042dc:	ffffe097          	auipc	ra,0xffffe
    800042e0:	b30080e7          	jalr	-1232(ra) # 80001e0c <_Z8printIntiii>
    800042e4:	00006517          	auipc	a0,0x6
    800042e8:	ffc50513          	addi	a0,a0,-4 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800042ec:	ffffe097          	auipc	ra,0xffffe
    800042f0:	8e8080e7          	jalr	-1816(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800042f4:	00000493          	li	s1,0
    800042f8:	f99ff06f          	j	80004290 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800042fc:	00006517          	auipc	a0,0x6
    80004300:	20c50513          	addi	a0,a0,524 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80004304:	ffffe097          	auipc	ra,0xffffe
    80004308:	8d0080e7          	jalr	-1840(ra) # 80001bd4 <_Z11printStringPKc>
    finishedA = true;
    8000430c:	00100793          	li	a5,1
    80004310:	00009717          	auipc	a4,0x9
    80004314:	9cf70823          	sb	a5,-1584(a4) # 8000cce0 <_ZL9finishedA>
}
    80004318:	01813083          	ld	ra,24(sp)
    8000431c:	01013403          	ld	s0,16(sp)
    80004320:	00813483          	ld	s1,8(sp)
    80004324:	00013903          	ld	s2,0(sp)
    80004328:	02010113          	addi	sp,sp,32
    8000432c:	00008067          	ret

0000000080004330 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004330:	fe010113          	addi	sp,sp,-32
    80004334:	00113c23          	sd	ra,24(sp)
    80004338:	00813823          	sd	s0,16(sp)
    8000433c:	00913423          	sd	s1,8(sp)
    80004340:	01213023          	sd	s2,0(sp)
    80004344:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004348:	00000913          	li	s2,0
    8000434c:	0380006f          	j	80004384 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004350:	ffffd097          	auipc	ra,0xffffd
    80004354:	190080e7          	jalr	400(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004358:	00148493          	addi	s1,s1,1
    8000435c:	000027b7          	lui	a5,0x2
    80004360:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004364:	0097ee63          	bltu	a5,s1,80004380 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004368:	00000713          	li	a4,0
    8000436c:	000077b7          	lui	a5,0x7
    80004370:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004374:	fce7eee3          	bltu	a5,a4,80004350 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004378:	00170713          	addi	a4,a4,1
    8000437c:	ff1ff06f          	j	8000436c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004380:	00190913          	addi	s2,s2,1
    80004384:	00f00793          	li	a5,15
    80004388:	0527e063          	bltu	a5,s2,800043c8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000438c:	00006517          	auipc	a0,0x6
    80004390:	18c50513          	addi	a0,a0,396 # 8000a518 <CONSOLE_STATUS+0x508>
    80004394:	ffffe097          	auipc	ra,0xffffe
    80004398:	840080e7          	jalr	-1984(ra) # 80001bd4 <_Z11printStringPKc>
    8000439c:	00000613          	li	a2,0
    800043a0:	00a00593          	li	a1,10
    800043a4:	0009051b          	sext.w	a0,s2
    800043a8:	ffffe097          	auipc	ra,0xffffe
    800043ac:	a64080e7          	jalr	-1436(ra) # 80001e0c <_Z8printIntiii>
    800043b0:	00006517          	auipc	a0,0x6
    800043b4:	f3050513          	addi	a0,a0,-208 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800043b8:	ffffe097          	auipc	ra,0xffffe
    800043bc:	81c080e7          	jalr	-2020(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800043c0:	00000493          	li	s1,0
    800043c4:	f99ff06f          	j	8000435c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800043c8:	00006517          	auipc	a0,0x6
    800043cc:	15850513          	addi	a0,a0,344 # 8000a520 <CONSOLE_STATUS+0x510>
    800043d0:	ffffe097          	auipc	ra,0xffffe
    800043d4:	804080e7          	jalr	-2044(ra) # 80001bd4 <_Z11printStringPKc>
    finishedB = true;
    800043d8:	00100793          	li	a5,1
    800043dc:	00009717          	auipc	a4,0x9
    800043e0:	90f702a3          	sb	a5,-1787(a4) # 8000cce1 <_ZL9finishedB>
    thread_dispatch();
    800043e4:	ffffd097          	auipc	ra,0xffffd
    800043e8:	0fc080e7          	jalr	252(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800043ec:	01813083          	ld	ra,24(sp)
    800043f0:	01013403          	ld	s0,16(sp)
    800043f4:	00813483          	ld	s1,8(sp)
    800043f8:	00013903          	ld	s2,0(sp)
    800043fc:	02010113          	addi	sp,sp,32
    80004400:	00008067          	ret

0000000080004404 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004404:	fe010113          	addi	sp,sp,-32
    80004408:	00113c23          	sd	ra,24(sp)
    8000440c:	00813823          	sd	s0,16(sp)
    80004410:	00913423          	sd	s1,8(sp)
    80004414:	01213023          	sd	s2,0(sp)
    80004418:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000441c:	00000493          	li	s1,0
    80004420:	0400006f          	j	80004460 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004424:	00006517          	auipc	a0,0x6
    80004428:	10c50513          	addi	a0,a0,268 # 8000a530 <CONSOLE_STATUS+0x520>
    8000442c:	ffffd097          	auipc	ra,0xffffd
    80004430:	7a8080e7          	jalr	1960(ra) # 80001bd4 <_Z11printStringPKc>
    80004434:	00000613          	li	a2,0
    80004438:	00a00593          	li	a1,10
    8000443c:	00048513          	mv	a0,s1
    80004440:	ffffe097          	auipc	ra,0xffffe
    80004444:	9cc080e7          	jalr	-1588(ra) # 80001e0c <_Z8printIntiii>
    80004448:	00006517          	auipc	a0,0x6
    8000444c:	e9850513          	addi	a0,a0,-360 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004450:	ffffd097          	auipc	ra,0xffffd
    80004454:	784080e7          	jalr	1924(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004458:	0014849b          	addiw	s1,s1,1
    8000445c:	0ff4f493          	andi	s1,s1,255
    80004460:	00200793          	li	a5,2
    80004464:	fc97f0e3          	bgeu	a5,s1,80004424 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004468:	00006517          	auipc	a0,0x6
    8000446c:	0d050513          	addi	a0,a0,208 # 8000a538 <CONSOLE_STATUS+0x528>
    80004470:	ffffd097          	auipc	ra,0xffffd
    80004474:	764080e7          	jalr	1892(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004478:	00700313          	li	t1,7
    thread_dispatch();
    8000447c:	ffffd097          	auipc	ra,0xffffd
    80004480:	064080e7          	jalr	100(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004484:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004488:	00006517          	auipc	a0,0x6
    8000448c:	0c050513          	addi	a0,a0,192 # 8000a548 <CONSOLE_STATUS+0x538>
    80004490:	ffffd097          	auipc	ra,0xffffd
    80004494:	744080e7          	jalr	1860(ra) # 80001bd4 <_Z11printStringPKc>
    80004498:	00000613          	li	a2,0
    8000449c:	00a00593          	li	a1,10
    800044a0:	0009051b          	sext.w	a0,s2
    800044a4:	ffffe097          	auipc	ra,0xffffe
    800044a8:	968080e7          	jalr	-1688(ra) # 80001e0c <_Z8printIntiii>
    800044ac:	00006517          	auipc	a0,0x6
    800044b0:	e3450513          	addi	a0,a0,-460 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800044b4:	ffffd097          	auipc	ra,0xffffd
    800044b8:	720080e7          	jalr	1824(ra) # 80001bd4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800044bc:	00c00513          	li	a0,12
    800044c0:	00000097          	auipc	ra,0x0
    800044c4:	d30080e7          	jalr	-720(ra) # 800041f0 <_ZL9fibonaccim>
    800044c8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800044cc:	00006517          	auipc	a0,0x6
    800044d0:	08450513          	addi	a0,a0,132 # 8000a550 <CONSOLE_STATUS+0x540>
    800044d4:	ffffd097          	auipc	ra,0xffffd
    800044d8:	700080e7          	jalr	1792(ra) # 80001bd4 <_Z11printStringPKc>
    800044dc:	00000613          	li	a2,0
    800044e0:	00a00593          	li	a1,10
    800044e4:	0009051b          	sext.w	a0,s2
    800044e8:	ffffe097          	auipc	ra,0xffffe
    800044ec:	924080e7          	jalr	-1756(ra) # 80001e0c <_Z8printIntiii>
    800044f0:	00006517          	auipc	a0,0x6
    800044f4:	df050513          	addi	a0,a0,-528 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800044f8:	ffffd097          	auipc	ra,0xffffd
    800044fc:	6dc080e7          	jalr	1756(ra) # 80001bd4 <_Z11printStringPKc>
    80004500:	0400006f          	j	80004540 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004504:	00006517          	auipc	a0,0x6
    80004508:	02c50513          	addi	a0,a0,44 # 8000a530 <CONSOLE_STATUS+0x520>
    8000450c:	ffffd097          	auipc	ra,0xffffd
    80004510:	6c8080e7          	jalr	1736(ra) # 80001bd4 <_Z11printStringPKc>
    80004514:	00000613          	li	a2,0
    80004518:	00a00593          	li	a1,10
    8000451c:	00048513          	mv	a0,s1
    80004520:	ffffe097          	auipc	ra,0xffffe
    80004524:	8ec080e7          	jalr	-1812(ra) # 80001e0c <_Z8printIntiii>
    80004528:	00006517          	auipc	a0,0x6
    8000452c:	db850513          	addi	a0,a0,-584 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004530:	ffffd097          	auipc	ra,0xffffd
    80004534:	6a4080e7          	jalr	1700(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004538:	0014849b          	addiw	s1,s1,1
    8000453c:	0ff4f493          	andi	s1,s1,255
    80004540:	00500793          	li	a5,5
    80004544:	fc97f0e3          	bgeu	a5,s1,80004504 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004548:	00006517          	auipc	a0,0x6
    8000454c:	fc050513          	addi	a0,a0,-64 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80004550:	ffffd097          	auipc	ra,0xffffd
    80004554:	684080e7          	jalr	1668(ra) # 80001bd4 <_Z11printStringPKc>
    finishedC = true;
    80004558:	00100793          	li	a5,1
    8000455c:	00008717          	auipc	a4,0x8
    80004560:	78f70323          	sb	a5,1926(a4) # 8000cce2 <_ZL9finishedC>
    thread_dispatch();
    80004564:	ffffd097          	auipc	ra,0xffffd
    80004568:	f7c080e7          	jalr	-132(ra) # 800014e0 <_Z15thread_dispatchv>
}
    8000456c:	01813083          	ld	ra,24(sp)
    80004570:	01013403          	ld	s0,16(sp)
    80004574:	00813483          	ld	s1,8(sp)
    80004578:	00013903          	ld	s2,0(sp)
    8000457c:	02010113          	addi	sp,sp,32
    80004580:	00008067          	ret

0000000080004584 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004584:	fe010113          	addi	sp,sp,-32
    80004588:	00113c23          	sd	ra,24(sp)
    8000458c:	00813823          	sd	s0,16(sp)
    80004590:	00913423          	sd	s1,8(sp)
    80004594:	01213023          	sd	s2,0(sp)
    80004598:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000459c:	00a00493          	li	s1,10
    800045a0:	0400006f          	j	800045e0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800045a4:	00006517          	auipc	a0,0x6
    800045a8:	fbc50513          	addi	a0,a0,-68 # 8000a560 <CONSOLE_STATUS+0x550>
    800045ac:	ffffd097          	auipc	ra,0xffffd
    800045b0:	628080e7          	jalr	1576(ra) # 80001bd4 <_Z11printStringPKc>
    800045b4:	00000613          	li	a2,0
    800045b8:	00a00593          	li	a1,10
    800045bc:	00048513          	mv	a0,s1
    800045c0:	ffffe097          	auipc	ra,0xffffe
    800045c4:	84c080e7          	jalr	-1972(ra) # 80001e0c <_Z8printIntiii>
    800045c8:	00006517          	auipc	a0,0x6
    800045cc:	d1850513          	addi	a0,a0,-744 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800045d0:	ffffd097          	auipc	ra,0xffffd
    800045d4:	604080e7          	jalr	1540(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800045d8:	0014849b          	addiw	s1,s1,1
    800045dc:	0ff4f493          	andi	s1,s1,255
    800045e0:	00c00793          	li	a5,12
    800045e4:	fc97f0e3          	bgeu	a5,s1,800045a4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800045e8:	00006517          	auipc	a0,0x6
    800045ec:	f8050513          	addi	a0,a0,-128 # 8000a568 <CONSOLE_STATUS+0x558>
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	5e4080e7          	jalr	1508(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800045f8:	00500313          	li	t1,5
    thread_dispatch();
    800045fc:	ffffd097          	auipc	ra,0xffffd
    80004600:	ee4080e7          	jalr	-284(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004604:	01000513          	li	a0,16
    80004608:	00000097          	auipc	ra,0x0
    8000460c:	be8080e7          	jalr	-1048(ra) # 800041f0 <_ZL9fibonaccim>
    80004610:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004614:	00006517          	auipc	a0,0x6
    80004618:	f6450513          	addi	a0,a0,-156 # 8000a578 <CONSOLE_STATUS+0x568>
    8000461c:	ffffd097          	auipc	ra,0xffffd
    80004620:	5b8080e7          	jalr	1464(ra) # 80001bd4 <_Z11printStringPKc>
    80004624:	00000613          	li	a2,0
    80004628:	00a00593          	li	a1,10
    8000462c:	0009051b          	sext.w	a0,s2
    80004630:	ffffd097          	auipc	ra,0xffffd
    80004634:	7dc080e7          	jalr	2012(ra) # 80001e0c <_Z8printIntiii>
    80004638:	00006517          	auipc	a0,0x6
    8000463c:	ca850513          	addi	a0,a0,-856 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004640:	ffffd097          	auipc	ra,0xffffd
    80004644:	594080e7          	jalr	1428(ra) # 80001bd4 <_Z11printStringPKc>
    80004648:	0400006f          	j	80004688 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000464c:	00006517          	auipc	a0,0x6
    80004650:	f1450513          	addi	a0,a0,-236 # 8000a560 <CONSOLE_STATUS+0x550>
    80004654:	ffffd097          	auipc	ra,0xffffd
    80004658:	580080e7          	jalr	1408(ra) # 80001bd4 <_Z11printStringPKc>
    8000465c:	00000613          	li	a2,0
    80004660:	00a00593          	li	a1,10
    80004664:	00048513          	mv	a0,s1
    80004668:	ffffd097          	auipc	ra,0xffffd
    8000466c:	7a4080e7          	jalr	1956(ra) # 80001e0c <_Z8printIntiii>
    80004670:	00006517          	auipc	a0,0x6
    80004674:	c7050513          	addi	a0,a0,-912 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004678:	ffffd097          	auipc	ra,0xffffd
    8000467c:	55c080e7          	jalr	1372(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004680:	0014849b          	addiw	s1,s1,1
    80004684:	0ff4f493          	andi	s1,s1,255
    80004688:	00f00793          	li	a5,15
    8000468c:	fc97f0e3          	bgeu	a5,s1,8000464c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004690:	00006517          	auipc	a0,0x6
    80004694:	ef850513          	addi	a0,a0,-264 # 8000a588 <CONSOLE_STATUS+0x578>
    80004698:	ffffd097          	auipc	ra,0xffffd
    8000469c:	53c080e7          	jalr	1340(ra) # 80001bd4 <_Z11printStringPKc>
    finishedD = true;
    800046a0:	00100793          	li	a5,1
    800046a4:	00008717          	auipc	a4,0x8
    800046a8:	62f70fa3          	sb	a5,1599(a4) # 8000cce3 <_ZL9finishedD>
    thread_dispatch();
    800046ac:	ffffd097          	auipc	ra,0xffffd
    800046b0:	e34080e7          	jalr	-460(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800046b4:	01813083          	ld	ra,24(sp)
    800046b8:	01013403          	ld	s0,16(sp)
    800046bc:	00813483          	ld	s1,8(sp)
    800046c0:	00013903          	ld	s2,0(sp)
    800046c4:	02010113          	addi	sp,sp,32
    800046c8:	00008067          	ret

00000000800046cc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800046cc:	fc010113          	addi	sp,sp,-64
    800046d0:	02113c23          	sd	ra,56(sp)
    800046d4:	02813823          	sd	s0,48(sp)
    800046d8:	02913423          	sd	s1,40(sp)
    800046dc:	03213023          	sd	s2,32(sp)
    800046e0:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800046e4:	02000513          	li	a0,32
    800046e8:	ffffe097          	auipc	ra,0xffffe
    800046ec:	01c080e7          	jalr	28(ra) # 80002704 <_Znwm>
    800046f0:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800046f4:	ffffe097          	auipc	ra,0xffffe
    800046f8:	160080e7          	jalr	352(ra) # 80002854 <_ZN6ThreadC1Ev>
    800046fc:	00008797          	auipc	a5,0x8
    80004700:	30c78793          	addi	a5,a5,780 # 8000ca08 <_ZTV7WorkerA+0x10>
    80004704:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004708:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000470c:	00006517          	auipc	a0,0x6
    80004710:	e8c50513          	addi	a0,a0,-372 # 8000a598 <CONSOLE_STATUS+0x588>
    80004714:	ffffd097          	auipc	ra,0xffffd
    80004718:	4c0080e7          	jalr	1216(ra) # 80001bd4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    8000471c:	02000513          	li	a0,32
    80004720:	ffffe097          	auipc	ra,0xffffe
    80004724:	fe4080e7          	jalr	-28(ra) # 80002704 <_Znwm>
    80004728:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    8000472c:	ffffe097          	auipc	ra,0xffffe
    80004730:	128080e7          	jalr	296(ra) # 80002854 <_ZN6ThreadC1Ev>
    80004734:	00008797          	auipc	a5,0x8
    80004738:	2fc78793          	addi	a5,a5,764 # 8000ca30 <_ZTV7WorkerB+0x10>
    8000473c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004740:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004744:	00006517          	auipc	a0,0x6
    80004748:	e6c50513          	addi	a0,a0,-404 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    8000474c:	ffffd097          	auipc	ra,0xffffd
    80004750:	488080e7          	jalr	1160(ra) # 80001bd4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004754:	02000513          	li	a0,32
    80004758:	ffffe097          	auipc	ra,0xffffe
    8000475c:	fac080e7          	jalr	-84(ra) # 80002704 <_Znwm>
    80004760:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004764:	ffffe097          	auipc	ra,0xffffe
    80004768:	0f0080e7          	jalr	240(ra) # 80002854 <_ZN6ThreadC1Ev>
    8000476c:	00008797          	auipc	a5,0x8
    80004770:	2ec78793          	addi	a5,a5,748 # 8000ca58 <_ZTV7WorkerC+0x10>
    80004774:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004778:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000477c:	00006517          	auipc	a0,0x6
    80004780:	e4c50513          	addi	a0,a0,-436 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    80004784:	ffffd097          	auipc	ra,0xffffd
    80004788:	450080e7          	jalr	1104(ra) # 80001bd4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000478c:	02000513          	li	a0,32
    80004790:	ffffe097          	auipc	ra,0xffffe
    80004794:	f74080e7          	jalr	-140(ra) # 80002704 <_Znwm>
    80004798:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000479c:	ffffe097          	auipc	ra,0xffffe
    800047a0:	0b8080e7          	jalr	184(ra) # 80002854 <_ZN6ThreadC1Ev>
    800047a4:	00008797          	auipc	a5,0x8
    800047a8:	2dc78793          	addi	a5,a5,732 # 8000ca80 <_ZTV7WorkerD+0x10>
    800047ac:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800047b0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800047b4:	00006517          	auipc	a0,0x6
    800047b8:	e2c50513          	addi	a0,a0,-468 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    800047bc:	ffffd097          	auipc	ra,0xffffd
    800047c0:	418080e7          	jalr	1048(ra) # 80001bd4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800047c4:	00000493          	li	s1,0
    800047c8:	00300793          	li	a5,3
    800047cc:	0297c663          	blt	a5,s1,800047f8 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800047d0:	00349793          	slli	a5,s1,0x3
    800047d4:	fe040713          	addi	a4,s0,-32
    800047d8:	00f707b3          	add	a5,a4,a5
    800047dc:	fe07b503          	ld	a0,-32(a5)
    800047e0:	ffffe097          	auipc	ra,0xffffe
    800047e4:	0ac080e7          	jalr	172(ra) # 8000288c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800047e8:	0014849b          	addiw	s1,s1,1
    800047ec:	fddff06f          	j	800047c8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800047f0:	ffffe097          	auipc	ra,0xffffe
    800047f4:	0f0080e7          	jalr	240(ra) # 800028e0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800047f8:	00008797          	auipc	a5,0x8
    800047fc:	4e87c783          	lbu	a5,1256(a5) # 8000cce0 <_ZL9finishedA>
    80004800:	fe0788e3          	beqz	a5,800047f0 <_Z20Threads_CPP_API_testv+0x124>
    80004804:	00008797          	auipc	a5,0x8
    80004808:	4dd7c783          	lbu	a5,1245(a5) # 8000cce1 <_ZL9finishedB>
    8000480c:	fe0782e3          	beqz	a5,800047f0 <_Z20Threads_CPP_API_testv+0x124>
    80004810:	00008797          	auipc	a5,0x8
    80004814:	4d27c783          	lbu	a5,1234(a5) # 8000cce2 <_ZL9finishedC>
    80004818:	fc078ce3          	beqz	a5,800047f0 <_Z20Threads_CPP_API_testv+0x124>
    8000481c:	00008797          	auipc	a5,0x8
    80004820:	4c77c783          	lbu	a5,1223(a5) # 8000cce3 <_ZL9finishedD>
    80004824:	fc0786e3          	beqz	a5,800047f0 <_Z20Threads_CPP_API_testv+0x124>
    80004828:	fc040493          	addi	s1,s0,-64
    8000482c:	0080006f          	j	80004834 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004830:	00848493          	addi	s1,s1,8
    80004834:	fe040793          	addi	a5,s0,-32
    80004838:	08f48663          	beq	s1,a5,800048c4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000483c:	0004b503          	ld	a0,0(s1)
    80004840:	fe0508e3          	beqz	a0,80004830 <_Z20Threads_CPP_API_testv+0x164>
    80004844:	00053783          	ld	a5,0(a0)
    80004848:	0087b783          	ld	a5,8(a5)
    8000484c:	000780e7          	jalr	a5
    80004850:	fe1ff06f          	j	80004830 <_Z20Threads_CPP_API_testv+0x164>
    80004854:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004858:	00048513          	mv	a0,s1
    8000485c:	ffffe097          	auipc	ra,0xffffe
    80004860:	ef8080e7          	jalr	-264(ra) # 80002754 <_ZdlPv>
    80004864:	00090513          	mv	a0,s2
    80004868:	00009097          	auipc	ra,0x9
    8000486c:	580080e7          	jalr	1408(ra) # 8000dde8 <_Unwind_Resume>
    80004870:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004874:	00048513          	mv	a0,s1
    80004878:	ffffe097          	auipc	ra,0xffffe
    8000487c:	edc080e7          	jalr	-292(ra) # 80002754 <_ZdlPv>
    80004880:	00090513          	mv	a0,s2
    80004884:	00009097          	auipc	ra,0x9
    80004888:	564080e7          	jalr	1380(ra) # 8000dde8 <_Unwind_Resume>
    8000488c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004890:	00048513          	mv	a0,s1
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	ec0080e7          	jalr	-320(ra) # 80002754 <_ZdlPv>
    8000489c:	00090513          	mv	a0,s2
    800048a0:	00009097          	auipc	ra,0x9
    800048a4:	548080e7          	jalr	1352(ra) # 8000dde8 <_Unwind_Resume>
    800048a8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800048ac:	00048513          	mv	a0,s1
    800048b0:	ffffe097          	auipc	ra,0xffffe
    800048b4:	ea4080e7          	jalr	-348(ra) # 80002754 <_ZdlPv>
    800048b8:	00090513          	mv	a0,s2
    800048bc:	00009097          	auipc	ra,0x9
    800048c0:	52c080e7          	jalr	1324(ra) # 8000dde8 <_Unwind_Resume>
}
    800048c4:	03813083          	ld	ra,56(sp)
    800048c8:	03013403          	ld	s0,48(sp)
    800048cc:	02813483          	ld	s1,40(sp)
    800048d0:	02013903          	ld	s2,32(sp)
    800048d4:	04010113          	addi	sp,sp,64
    800048d8:	00008067          	ret

00000000800048dc <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800048dc:	ff010113          	addi	sp,sp,-16
    800048e0:	00113423          	sd	ra,8(sp)
    800048e4:	00813023          	sd	s0,0(sp)
    800048e8:	01010413          	addi	s0,sp,16
    800048ec:	00008797          	auipc	a5,0x8
    800048f0:	11c78793          	addi	a5,a5,284 # 8000ca08 <_ZTV7WorkerA+0x10>
    800048f4:	00f53023          	sd	a5,0(a0)
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	d78080e7          	jalr	-648(ra) # 80002670 <_ZN6ThreadD1Ev>
    80004900:	00813083          	ld	ra,8(sp)
    80004904:	00013403          	ld	s0,0(sp)
    80004908:	01010113          	addi	sp,sp,16
    8000490c:	00008067          	ret

0000000080004910 <_ZN7WorkerAD0Ev>:
    80004910:	fe010113          	addi	sp,sp,-32
    80004914:	00113c23          	sd	ra,24(sp)
    80004918:	00813823          	sd	s0,16(sp)
    8000491c:	00913423          	sd	s1,8(sp)
    80004920:	02010413          	addi	s0,sp,32
    80004924:	00050493          	mv	s1,a0
    80004928:	00008797          	auipc	a5,0x8
    8000492c:	0e078793          	addi	a5,a5,224 # 8000ca08 <_ZTV7WorkerA+0x10>
    80004930:	00f53023          	sd	a5,0(a0)
    80004934:	ffffe097          	auipc	ra,0xffffe
    80004938:	d3c080e7          	jalr	-708(ra) # 80002670 <_ZN6ThreadD1Ev>
    8000493c:	00048513          	mv	a0,s1
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	e14080e7          	jalr	-492(ra) # 80002754 <_ZdlPv>
    80004948:	01813083          	ld	ra,24(sp)
    8000494c:	01013403          	ld	s0,16(sp)
    80004950:	00813483          	ld	s1,8(sp)
    80004954:	02010113          	addi	sp,sp,32
    80004958:	00008067          	ret

000000008000495c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000495c:	ff010113          	addi	sp,sp,-16
    80004960:	00113423          	sd	ra,8(sp)
    80004964:	00813023          	sd	s0,0(sp)
    80004968:	01010413          	addi	s0,sp,16
    8000496c:	00008797          	auipc	a5,0x8
    80004970:	0c478793          	addi	a5,a5,196 # 8000ca30 <_ZTV7WorkerB+0x10>
    80004974:	00f53023          	sd	a5,0(a0)
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	cf8080e7          	jalr	-776(ra) # 80002670 <_ZN6ThreadD1Ev>
    80004980:	00813083          	ld	ra,8(sp)
    80004984:	00013403          	ld	s0,0(sp)
    80004988:	01010113          	addi	sp,sp,16
    8000498c:	00008067          	ret

0000000080004990 <_ZN7WorkerBD0Ev>:
    80004990:	fe010113          	addi	sp,sp,-32
    80004994:	00113c23          	sd	ra,24(sp)
    80004998:	00813823          	sd	s0,16(sp)
    8000499c:	00913423          	sd	s1,8(sp)
    800049a0:	02010413          	addi	s0,sp,32
    800049a4:	00050493          	mv	s1,a0
    800049a8:	00008797          	auipc	a5,0x8
    800049ac:	08878793          	addi	a5,a5,136 # 8000ca30 <_ZTV7WorkerB+0x10>
    800049b0:	00f53023          	sd	a5,0(a0)
    800049b4:	ffffe097          	auipc	ra,0xffffe
    800049b8:	cbc080e7          	jalr	-836(ra) # 80002670 <_ZN6ThreadD1Ev>
    800049bc:	00048513          	mv	a0,s1
    800049c0:	ffffe097          	auipc	ra,0xffffe
    800049c4:	d94080e7          	jalr	-620(ra) # 80002754 <_ZdlPv>
    800049c8:	01813083          	ld	ra,24(sp)
    800049cc:	01013403          	ld	s0,16(sp)
    800049d0:	00813483          	ld	s1,8(sp)
    800049d4:	02010113          	addi	sp,sp,32
    800049d8:	00008067          	ret

00000000800049dc <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800049dc:	ff010113          	addi	sp,sp,-16
    800049e0:	00113423          	sd	ra,8(sp)
    800049e4:	00813023          	sd	s0,0(sp)
    800049e8:	01010413          	addi	s0,sp,16
    800049ec:	00008797          	auipc	a5,0x8
    800049f0:	06c78793          	addi	a5,a5,108 # 8000ca58 <_ZTV7WorkerC+0x10>
    800049f4:	00f53023          	sd	a5,0(a0)
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	c78080e7          	jalr	-904(ra) # 80002670 <_ZN6ThreadD1Ev>
    80004a00:	00813083          	ld	ra,8(sp)
    80004a04:	00013403          	ld	s0,0(sp)
    80004a08:	01010113          	addi	sp,sp,16
    80004a0c:	00008067          	ret

0000000080004a10 <_ZN7WorkerCD0Ev>:
    80004a10:	fe010113          	addi	sp,sp,-32
    80004a14:	00113c23          	sd	ra,24(sp)
    80004a18:	00813823          	sd	s0,16(sp)
    80004a1c:	00913423          	sd	s1,8(sp)
    80004a20:	02010413          	addi	s0,sp,32
    80004a24:	00050493          	mv	s1,a0
    80004a28:	00008797          	auipc	a5,0x8
    80004a2c:	03078793          	addi	a5,a5,48 # 8000ca58 <_ZTV7WorkerC+0x10>
    80004a30:	00f53023          	sd	a5,0(a0)
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	c3c080e7          	jalr	-964(ra) # 80002670 <_ZN6ThreadD1Ev>
    80004a3c:	00048513          	mv	a0,s1
    80004a40:	ffffe097          	auipc	ra,0xffffe
    80004a44:	d14080e7          	jalr	-748(ra) # 80002754 <_ZdlPv>
    80004a48:	01813083          	ld	ra,24(sp)
    80004a4c:	01013403          	ld	s0,16(sp)
    80004a50:	00813483          	ld	s1,8(sp)
    80004a54:	02010113          	addi	sp,sp,32
    80004a58:	00008067          	ret

0000000080004a5c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004a5c:	ff010113          	addi	sp,sp,-16
    80004a60:	00113423          	sd	ra,8(sp)
    80004a64:	00813023          	sd	s0,0(sp)
    80004a68:	01010413          	addi	s0,sp,16
    80004a6c:	00008797          	auipc	a5,0x8
    80004a70:	01478793          	addi	a5,a5,20 # 8000ca80 <_ZTV7WorkerD+0x10>
    80004a74:	00f53023          	sd	a5,0(a0)
    80004a78:	ffffe097          	auipc	ra,0xffffe
    80004a7c:	bf8080e7          	jalr	-1032(ra) # 80002670 <_ZN6ThreadD1Ev>
    80004a80:	00813083          	ld	ra,8(sp)
    80004a84:	00013403          	ld	s0,0(sp)
    80004a88:	01010113          	addi	sp,sp,16
    80004a8c:	00008067          	ret

0000000080004a90 <_ZN7WorkerDD0Ev>:
    80004a90:	fe010113          	addi	sp,sp,-32
    80004a94:	00113c23          	sd	ra,24(sp)
    80004a98:	00813823          	sd	s0,16(sp)
    80004a9c:	00913423          	sd	s1,8(sp)
    80004aa0:	02010413          	addi	s0,sp,32
    80004aa4:	00050493          	mv	s1,a0
    80004aa8:	00008797          	auipc	a5,0x8
    80004aac:	fd878793          	addi	a5,a5,-40 # 8000ca80 <_ZTV7WorkerD+0x10>
    80004ab0:	00f53023          	sd	a5,0(a0)
    80004ab4:	ffffe097          	auipc	ra,0xffffe
    80004ab8:	bbc080e7          	jalr	-1092(ra) # 80002670 <_ZN6ThreadD1Ev>
    80004abc:	00048513          	mv	a0,s1
    80004ac0:	ffffe097          	auipc	ra,0xffffe
    80004ac4:	c94080e7          	jalr	-876(ra) # 80002754 <_ZdlPv>
    80004ac8:	01813083          	ld	ra,24(sp)
    80004acc:	01013403          	ld	s0,16(sp)
    80004ad0:	00813483          	ld	s1,8(sp)
    80004ad4:	02010113          	addi	sp,sp,32
    80004ad8:	00008067          	ret

0000000080004adc <_ZN7WorkerA3runEv>:
    void run() override {
    80004adc:	ff010113          	addi	sp,sp,-16
    80004ae0:	00113423          	sd	ra,8(sp)
    80004ae4:	00813023          	sd	s0,0(sp)
    80004ae8:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004aec:	00000593          	li	a1,0
    80004af0:	fffff097          	auipc	ra,0xfffff
    80004af4:	774080e7          	jalr	1908(ra) # 80004264 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004af8:	00813083          	ld	ra,8(sp)
    80004afc:	00013403          	ld	s0,0(sp)
    80004b00:	01010113          	addi	sp,sp,16
    80004b04:	00008067          	ret

0000000080004b08 <_ZN7WorkerB3runEv>:
    void run() override {
    80004b08:	ff010113          	addi	sp,sp,-16
    80004b0c:	00113423          	sd	ra,8(sp)
    80004b10:	00813023          	sd	s0,0(sp)
    80004b14:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004b18:	00000593          	li	a1,0
    80004b1c:	00000097          	auipc	ra,0x0
    80004b20:	814080e7          	jalr	-2028(ra) # 80004330 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004b24:	00813083          	ld	ra,8(sp)
    80004b28:	00013403          	ld	s0,0(sp)
    80004b2c:	01010113          	addi	sp,sp,16
    80004b30:	00008067          	ret

0000000080004b34 <_ZN7WorkerC3runEv>:
    void run() override {
    80004b34:	ff010113          	addi	sp,sp,-16
    80004b38:	00113423          	sd	ra,8(sp)
    80004b3c:	00813023          	sd	s0,0(sp)
    80004b40:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004b44:	00000593          	li	a1,0
    80004b48:	00000097          	auipc	ra,0x0
    80004b4c:	8bc080e7          	jalr	-1860(ra) # 80004404 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004b50:	00813083          	ld	ra,8(sp)
    80004b54:	00013403          	ld	s0,0(sp)
    80004b58:	01010113          	addi	sp,sp,16
    80004b5c:	00008067          	ret

0000000080004b60 <_ZN7WorkerD3runEv>:
    void run() override {
    80004b60:	ff010113          	addi	sp,sp,-16
    80004b64:	00113423          	sd	ra,8(sp)
    80004b68:	00813023          	sd	s0,0(sp)
    80004b6c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004b70:	00000593          	li	a1,0
    80004b74:	00000097          	auipc	ra,0x0
    80004b78:	a10080e7          	jalr	-1520(ra) # 80004584 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004b7c:	00813083          	ld	ra,8(sp)
    80004b80:	00013403          	ld	s0,0(sp)
    80004b84:	01010113          	addi	sp,sp,16
    80004b88:	00008067          	ret

0000000080004b8c <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004b8c:	f8010113          	addi	sp,sp,-128
    80004b90:	06113c23          	sd	ra,120(sp)
    80004b94:	06813823          	sd	s0,112(sp)
    80004b98:	06913423          	sd	s1,104(sp)
    80004b9c:	07213023          	sd	s2,96(sp)
    80004ba0:	05313c23          	sd	s3,88(sp)
    80004ba4:	05413823          	sd	s4,80(sp)
    80004ba8:	05513423          	sd	s5,72(sp)
    80004bac:	05613023          	sd	s6,64(sp)
    80004bb0:	03713c23          	sd	s7,56(sp)
    80004bb4:	03813823          	sd	s8,48(sp)
    80004bb8:	03913423          	sd	s9,40(sp)
    80004bbc:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004bc0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004bc4:	00006517          	auipc	a0,0x6
    80004bc8:	85450513          	addi	a0,a0,-1964 # 8000a418 <CONSOLE_STATUS+0x408>
    80004bcc:	ffffd097          	auipc	ra,0xffffd
    80004bd0:	008080e7          	jalr	8(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80004bd4:	01e00593          	li	a1,30
    80004bd8:	f8040493          	addi	s1,s0,-128
    80004bdc:	00048513          	mv	a0,s1
    80004be0:	ffffd097          	auipc	ra,0xffffd
    80004be4:	104080e7          	jalr	260(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004be8:	00048513          	mv	a0,s1
    80004bec:	ffffd097          	auipc	ra,0xffffd
    80004bf0:	1d0080e7          	jalr	464(ra) # 80001dbc <_Z11stringToIntPKc>
    80004bf4:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004bf8:	00006517          	auipc	a0,0x6
    80004bfc:	84050513          	addi	a0,a0,-1984 # 8000a438 <CONSOLE_STATUS+0x428>
    80004c00:	ffffd097          	auipc	ra,0xffffd
    80004c04:	fd4080e7          	jalr	-44(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80004c08:	01e00593          	li	a1,30
    80004c0c:	00048513          	mv	a0,s1
    80004c10:	ffffd097          	auipc	ra,0xffffd
    80004c14:	0d4080e7          	jalr	212(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80004c18:	00048513          	mv	a0,s1
    80004c1c:	ffffd097          	auipc	ra,0xffffd
    80004c20:	1a0080e7          	jalr	416(ra) # 80001dbc <_Z11stringToIntPKc>
    80004c24:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004c28:	00006517          	auipc	a0,0x6
    80004c2c:	83050513          	addi	a0,a0,-2000 # 8000a458 <CONSOLE_STATUS+0x448>
    80004c30:	ffffd097          	auipc	ra,0xffffd
    80004c34:	fa4080e7          	jalr	-92(ra) # 80001bd4 <_Z11printStringPKc>
    printInt(threadNum);
    80004c38:	00000613          	li	a2,0
    80004c3c:	00a00593          	li	a1,10
    80004c40:	00098513          	mv	a0,s3
    80004c44:	ffffd097          	auipc	ra,0xffffd
    80004c48:	1c8080e7          	jalr	456(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004c4c:	00006517          	auipc	a0,0x6
    80004c50:	82450513          	addi	a0,a0,-2012 # 8000a470 <CONSOLE_STATUS+0x460>
    80004c54:	ffffd097          	auipc	ra,0xffffd
    80004c58:	f80080e7          	jalr	-128(ra) # 80001bd4 <_Z11printStringPKc>
    printInt(n);
    80004c5c:	00000613          	li	a2,0
    80004c60:	00a00593          	li	a1,10
    80004c64:	00048513          	mv	a0,s1
    80004c68:	ffffd097          	auipc	ra,0xffffd
    80004c6c:	1a4080e7          	jalr	420(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80004c70:	00006517          	auipc	a0,0x6
    80004c74:	81850513          	addi	a0,a0,-2024 # 8000a488 <CONSOLE_STATUS+0x478>
    80004c78:	ffffd097          	auipc	ra,0xffffd
    80004c7c:	f5c080e7          	jalr	-164(ra) # 80001bd4 <_Z11printStringPKc>
    if (threadNum > n) {
    80004c80:	0334c463          	blt	s1,s3,80004ca8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004c84:	03305c63          	blez	s3,80004cbc <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004c88:	03800513          	li	a0,56
    80004c8c:	ffffe097          	auipc	ra,0xffffe
    80004c90:	a78080e7          	jalr	-1416(ra) # 80002704 <_Znwm>
    80004c94:	00050a93          	mv	s5,a0
    80004c98:	00048593          	mv	a1,s1
    80004c9c:	00001097          	auipc	ra,0x1
    80004ca0:	4d8080e7          	jalr	1240(ra) # 80006174 <_ZN9BufferCPPC1Ei>
    80004ca4:	0300006f          	j	80004cd4 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004ca8:	00005517          	auipc	a0,0x5
    80004cac:	7e850513          	addi	a0,a0,2024 # 8000a490 <CONSOLE_STATUS+0x480>
    80004cb0:	ffffd097          	auipc	ra,0xffffd
    80004cb4:	f24080e7          	jalr	-220(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004cb8:	0140006f          	j	80004ccc <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004cbc:	00006517          	auipc	a0,0x6
    80004cc0:	81450513          	addi	a0,a0,-2028 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	f10080e7          	jalr	-240(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004ccc:	000c0113          	mv	sp,s8
    80004cd0:	2140006f          	j	80004ee4 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004cd4:	01000513          	li	a0,16
    80004cd8:	ffffe097          	auipc	ra,0xffffe
    80004cdc:	a2c080e7          	jalr	-1492(ra) # 80002704 <_Znwm>
    80004ce0:	00050913          	mv	s2,a0
    80004ce4:	00000593          	li	a1,0
    80004ce8:	ffffe097          	auipc	ra,0xffffe
    80004cec:	c9c080e7          	jalr	-868(ra) # 80002984 <_ZN9SemaphoreC1Ej>
    80004cf0:	00008797          	auipc	a5,0x8
    80004cf4:	0127b023          	sd	s2,0(a5) # 8000ccf0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004cf8:	00399793          	slli	a5,s3,0x3
    80004cfc:	00f78793          	addi	a5,a5,15
    80004d00:	ff07f793          	andi	a5,a5,-16
    80004d04:	40f10133          	sub	sp,sp,a5
    80004d08:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004d0c:	0019871b          	addiw	a4,s3,1
    80004d10:	00171793          	slli	a5,a4,0x1
    80004d14:	00e787b3          	add	a5,a5,a4
    80004d18:	00379793          	slli	a5,a5,0x3
    80004d1c:	00f78793          	addi	a5,a5,15
    80004d20:	ff07f793          	andi	a5,a5,-16
    80004d24:	40f10133          	sub	sp,sp,a5
    80004d28:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004d2c:	00199493          	slli	s1,s3,0x1
    80004d30:	013484b3          	add	s1,s1,s3
    80004d34:	00349493          	slli	s1,s1,0x3
    80004d38:	009b04b3          	add	s1,s6,s1
    80004d3c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004d40:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004d44:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004d48:	02800513          	li	a0,40
    80004d4c:	ffffe097          	auipc	ra,0xffffe
    80004d50:	9b8080e7          	jalr	-1608(ra) # 80002704 <_Znwm>
    80004d54:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004d58:	ffffe097          	auipc	ra,0xffffe
    80004d5c:	afc080e7          	jalr	-1284(ra) # 80002854 <_ZN6ThreadC1Ev>
    80004d60:	00008797          	auipc	a5,0x8
    80004d64:	d9878793          	addi	a5,a5,-616 # 8000caf8 <_ZTV8Consumer+0x10>
    80004d68:	00fbb023          	sd	a5,0(s7)
    80004d6c:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004d70:	000b8513          	mv	a0,s7
    80004d74:	ffffe097          	auipc	ra,0xffffe
    80004d78:	b18080e7          	jalr	-1256(ra) # 8000288c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004d7c:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004d80:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004d84:	00008797          	auipc	a5,0x8
    80004d88:	f6c7b783          	ld	a5,-148(a5) # 8000ccf0 <_ZL10waitForAll>
    80004d8c:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004d90:	02800513          	li	a0,40
    80004d94:	ffffe097          	auipc	ra,0xffffe
    80004d98:	970080e7          	jalr	-1680(ra) # 80002704 <_Znwm>
    80004d9c:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004da0:	ffffe097          	auipc	ra,0xffffe
    80004da4:	ab4080e7          	jalr	-1356(ra) # 80002854 <_ZN6ThreadC1Ev>
    80004da8:	00008797          	auipc	a5,0x8
    80004dac:	d0078793          	addi	a5,a5,-768 # 8000caa8 <_ZTV16ProducerKeyborad+0x10>
    80004db0:	00f4b023          	sd	a5,0(s1)
    80004db4:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004db8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004dbc:	00048513          	mv	a0,s1
    80004dc0:	ffffe097          	auipc	ra,0xffffe
    80004dc4:	acc080e7          	jalr	-1332(ra) # 8000288c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004dc8:	00100913          	li	s2,1
    80004dcc:	0300006f          	j	80004dfc <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004dd0:	00008797          	auipc	a5,0x8
    80004dd4:	d0078793          	addi	a5,a5,-768 # 8000cad0 <_ZTV8Producer+0x10>
    80004dd8:	00fcb023          	sd	a5,0(s9)
    80004ddc:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004de0:	00391793          	slli	a5,s2,0x3
    80004de4:	00fa07b3          	add	a5,s4,a5
    80004de8:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004dec:	000c8513          	mv	a0,s9
    80004df0:	ffffe097          	auipc	ra,0xffffe
    80004df4:	a9c080e7          	jalr	-1380(ra) # 8000288c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004df8:	0019091b          	addiw	s2,s2,1
    80004dfc:	05395263          	bge	s2,s3,80004e40 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004e00:	00191493          	slli	s1,s2,0x1
    80004e04:	012484b3          	add	s1,s1,s2
    80004e08:	00349493          	slli	s1,s1,0x3
    80004e0c:	009b04b3          	add	s1,s6,s1
    80004e10:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004e14:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004e18:	00008797          	auipc	a5,0x8
    80004e1c:	ed87b783          	ld	a5,-296(a5) # 8000ccf0 <_ZL10waitForAll>
    80004e20:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004e24:	02800513          	li	a0,40
    80004e28:	ffffe097          	auipc	ra,0xffffe
    80004e2c:	8dc080e7          	jalr	-1828(ra) # 80002704 <_Znwm>
    80004e30:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004e34:	ffffe097          	auipc	ra,0xffffe
    80004e38:	a20080e7          	jalr	-1504(ra) # 80002854 <_ZN6ThreadC1Ev>
    80004e3c:	f95ff06f          	j	80004dd0 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004e40:	ffffe097          	auipc	ra,0xffffe
    80004e44:	aa0080e7          	jalr	-1376(ra) # 800028e0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004e48:	00000493          	li	s1,0
    80004e4c:	0099ce63          	blt	s3,s1,80004e68 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004e50:	00008517          	auipc	a0,0x8
    80004e54:	ea053503          	ld	a0,-352(a0) # 8000ccf0 <_ZL10waitForAll>
    80004e58:	ffffe097          	auipc	ra,0xffffe
    80004e5c:	b64080e7          	jalr	-1180(ra) # 800029bc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004e60:	0014849b          	addiw	s1,s1,1
    80004e64:	fe9ff06f          	j	80004e4c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004e68:	00008517          	auipc	a0,0x8
    80004e6c:	e8853503          	ld	a0,-376(a0) # 8000ccf0 <_ZL10waitForAll>
    80004e70:	00050863          	beqz	a0,80004e80 <_Z20testConsumerProducerv+0x2f4>
    80004e74:	00053783          	ld	a5,0(a0)
    80004e78:	0087b783          	ld	a5,8(a5)
    80004e7c:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004e80:	00000493          	li	s1,0
    80004e84:	0080006f          	j	80004e8c <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004e88:	0014849b          	addiw	s1,s1,1
    80004e8c:	0334d263          	bge	s1,s3,80004eb0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004e90:	00349793          	slli	a5,s1,0x3
    80004e94:	00fa07b3          	add	a5,s4,a5
    80004e98:	0007b503          	ld	a0,0(a5)
    80004e9c:	fe0506e3          	beqz	a0,80004e88 <_Z20testConsumerProducerv+0x2fc>
    80004ea0:	00053783          	ld	a5,0(a0)
    80004ea4:	0087b783          	ld	a5,8(a5)
    80004ea8:	000780e7          	jalr	a5
    80004eac:	fddff06f          	j	80004e88 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004eb0:	000b8a63          	beqz	s7,80004ec4 <_Z20testConsumerProducerv+0x338>
    80004eb4:	000bb783          	ld	a5,0(s7)
    80004eb8:	0087b783          	ld	a5,8(a5)
    80004ebc:	000b8513          	mv	a0,s7
    80004ec0:	000780e7          	jalr	a5
    delete buffer;
    80004ec4:	000a8e63          	beqz	s5,80004ee0 <_Z20testConsumerProducerv+0x354>
    80004ec8:	000a8513          	mv	a0,s5
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	5a0080e7          	jalr	1440(ra) # 8000646c <_ZN9BufferCPPD1Ev>
    80004ed4:	000a8513          	mv	a0,s5
    80004ed8:	ffffe097          	auipc	ra,0xffffe
    80004edc:	87c080e7          	jalr	-1924(ra) # 80002754 <_ZdlPv>
    80004ee0:	000c0113          	mv	sp,s8
}
    80004ee4:	f8040113          	addi	sp,s0,-128
    80004ee8:	07813083          	ld	ra,120(sp)
    80004eec:	07013403          	ld	s0,112(sp)
    80004ef0:	06813483          	ld	s1,104(sp)
    80004ef4:	06013903          	ld	s2,96(sp)
    80004ef8:	05813983          	ld	s3,88(sp)
    80004efc:	05013a03          	ld	s4,80(sp)
    80004f00:	04813a83          	ld	s5,72(sp)
    80004f04:	04013b03          	ld	s6,64(sp)
    80004f08:	03813b83          	ld	s7,56(sp)
    80004f0c:	03013c03          	ld	s8,48(sp)
    80004f10:	02813c83          	ld	s9,40(sp)
    80004f14:	08010113          	addi	sp,sp,128
    80004f18:	00008067          	ret
    80004f1c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004f20:	000a8513          	mv	a0,s5
    80004f24:	ffffe097          	auipc	ra,0xffffe
    80004f28:	830080e7          	jalr	-2000(ra) # 80002754 <_ZdlPv>
    80004f2c:	00048513          	mv	a0,s1
    80004f30:	00009097          	auipc	ra,0x9
    80004f34:	eb8080e7          	jalr	-328(ra) # 8000dde8 <_Unwind_Resume>
    80004f38:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004f3c:	00090513          	mv	a0,s2
    80004f40:	ffffe097          	auipc	ra,0xffffe
    80004f44:	814080e7          	jalr	-2028(ra) # 80002754 <_ZdlPv>
    80004f48:	00048513          	mv	a0,s1
    80004f4c:	00009097          	auipc	ra,0x9
    80004f50:	e9c080e7          	jalr	-356(ra) # 8000dde8 <_Unwind_Resume>
    80004f54:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004f58:	000b8513          	mv	a0,s7
    80004f5c:	ffffd097          	auipc	ra,0xffffd
    80004f60:	7f8080e7          	jalr	2040(ra) # 80002754 <_ZdlPv>
    80004f64:	00048513          	mv	a0,s1
    80004f68:	00009097          	auipc	ra,0x9
    80004f6c:	e80080e7          	jalr	-384(ra) # 8000dde8 <_Unwind_Resume>
    80004f70:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004f74:	00048513          	mv	a0,s1
    80004f78:	ffffd097          	auipc	ra,0xffffd
    80004f7c:	7dc080e7          	jalr	2012(ra) # 80002754 <_ZdlPv>
    80004f80:	00090513          	mv	a0,s2
    80004f84:	00009097          	auipc	ra,0x9
    80004f88:	e64080e7          	jalr	-412(ra) # 8000dde8 <_Unwind_Resume>
    80004f8c:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004f90:	000c8513          	mv	a0,s9
    80004f94:	ffffd097          	auipc	ra,0xffffd
    80004f98:	7c0080e7          	jalr	1984(ra) # 80002754 <_ZdlPv>
    80004f9c:	00048513          	mv	a0,s1
    80004fa0:	00009097          	auipc	ra,0x9
    80004fa4:	e48080e7          	jalr	-440(ra) # 8000dde8 <_Unwind_Resume>

0000000080004fa8 <_ZN8Consumer3runEv>:
    void run() override {
    80004fa8:	fd010113          	addi	sp,sp,-48
    80004fac:	02113423          	sd	ra,40(sp)
    80004fb0:	02813023          	sd	s0,32(sp)
    80004fb4:	00913c23          	sd	s1,24(sp)
    80004fb8:	01213823          	sd	s2,16(sp)
    80004fbc:	01313423          	sd	s3,8(sp)
    80004fc0:	03010413          	addi	s0,sp,48
    80004fc4:	00050913          	mv	s2,a0
        int i = 0;
    80004fc8:	00000993          	li	s3,0
    80004fcc:	0100006f          	j	80004fdc <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004fd0:	00a00513          	li	a0,10
    80004fd4:	ffffe097          	auipc	ra,0xffffe
    80004fd8:	ad4080e7          	jalr	-1324(ra) # 80002aa8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004fdc:	00008797          	auipc	a5,0x8
    80004fe0:	d0c7a783          	lw	a5,-756(a5) # 8000cce8 <_ZL9threadEnd>
    80004fe4:	04079a63          	bnez	a5,80005038 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004fe8:	02093783          	ld	a5,32(s2)
    80004fec:	0087b503          	ld	a0,8(a5)
    80004ff0:	00001097          	auipc	ra,0x1
    80004ff4:	368080e7          	jalr	872(ra) # 80006358 <_ZN9BufferCPP3getEv>
            i++;
    80004ff8:	0019849b          	addiw	s1,s3,1
    80004ffc:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005000:	0ff57513          	andi	a0,a0,255
    80005004:	ffffe097          	auipc	ra,0xffffe
    80005008:	aa4080e7          	jalr	-1372(ra) # 80002aa8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    8000500c:	05000793          	li	a5,80
    80005010:	02f4e4bb          	remw	s1,s1,a5
    80005014:	fc0494e3          	bnez	s1,80004fdc <_ZN8Consumer3runEv+0x34>
    80005018:	fb9ff06f          	j	80004fd0 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000501c:	02093783          	ld	a5,32(s2)
    80005020:	0087b503          	ld	a0,8(a5)
    80005024:	00001097          	auipc	ra,0x1
    80005028:	334080e7          	jalr	820(ra) # 80006358 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    8000502c:	0ff57513          	andi	a0,a0,255
    80005030:	ffffe097          	auipc	ra,0xffffe
    80005034:	a78080e7          	jalr	-1416(ra) # 80002aa8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005038:	02093783          	ld	a5,32(s2)
    8000503c:	0087b503          	ld	a0,8(a5)
    80005040:	00001097          	auipc	ra,0x1
    80005044:	3a4080e7          	jalr	932(ra) # 800063e4 <_ZN9BufferCPP6getCntEv>
    80005048:	fca04ae3          	bgtz	a0,8000501c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    8000504c:	02093783          	ld	a5,32(s2)
    80005050:	0107b503          	ld	a0,16(a5)
    80005054:	ffffe097          	auipc	ra,0xffffe
    80005058:	994080e7          	jalr	-1644(ra) # 800029e8 <_ZN9Semaphore6signalEv>
    }
    8000505c:	02813083          	ld	ra,40(sp)
    80005060:	02013403          	ld	s0,32(sp)
    80005064:	01813483          	ld	s1,24(sp)
    80005068:	01013903          	ld	s2,16(sp)
    8000506c:	00813983          	ld	s3,8(sp)
    80005070:	03010113          	addi	sp,sp,48
    80005074:	00008067          	ret

0000000080005078 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005078:	ff010113          	addi	sp,sp,-16
    8000507c:	00113423          	sd	ra,8(sp)
    80005080:	00813023          	sd	s0,0(sp)
    80005084:	01010413          	addi	s0,sp,16
    80005088:	00008797          	auipc	a5,0x8
    8000508c:	a7078793          	addi	a5,a5,-1424 # 8000caf8 <_ZTV8Consumer+0x10>
    80005090:	00f53023          	sd	a5,0(a0)
    80005094:	ffffd097          	auipc	ra,0xffffd
    80005098:	5dc080e7          	jalr	1500(ra) # 80002670 <_ZN6ThreadD1Ev>
    8000509c:	00813083          	ld	ra,8(sp)
    800050a0:	00013403          	ld	s0,0(sp)
    800050a4:	01010113          	addi	sp,sp,16
    800050a8:	00008067          	ret

00000000800050ac <_ZN8ConsumerD0Ev>:
    800050ac:	fe010113          	addi	sp,sp,-32
    800050b0:	00113c23          	sd	ra,24(sp)
    800050b4:	00813823          	sd	s0,16(sp)
    800050b8:	00913423          	sd	s1,8(sp)
    800050bc:	02010413          	addi	s0,sp,32
    800050c0:	00050493          	mv	s1,a0
    800050c4:	00008797          	auipc	a5,0x8
    800050c8:	a3478793          	addi	a5,a5,-1484 # 8000caf8 <_ZTV8Consumer+0x10>
    800050cc:	00f53023          	sd	a5,0(a0)
    800050d0:	ffffd097          	auipc	ra,0xffffd
    800050d4:	5a0080e7          	jalr	1440(ra) # 80002670 <_ZN6ThreadD1Ev>
    800050d8:	00048513          	mv	a0,s1
    800050dc:	ffffd097          	auipc	ra,0xffffd
    800050e0:	678080e7          	jalr	1656(ra) # 80002754 <_ZdlPv>
    800050e4:	01813083          	ld	ra,24(sp)
    800050e8:	01013403          	ld	s0,16(sp)
    800050ec:	00813483          	ld	s1,8(sp)
    800050f0:	02010113          	addi	sp,sp,32
    800050f4:	00008067          	ret

00000000800050f8 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800050f8:	ff010113          	addi	sp,sp,-16
    800050fc:	00113423          	sd	ra,8(sp)
    80005100:	00813023          	sd	s0,0(sp)
    80005104:	01010413          	addi	s0,sp,16
    80005108:	00008797          	auipc	a5,0x8
    8000510c:	9a078793          	addi	a5,a5,-1632 # 8000caa8 <_ZTV16ProducerKeyborad+0x10>
    80005110:	00f53023          	sd	a5,0(a0)
    80005114:	ffffd097          	auipc	ra,0xffffd
    80005118:	55c080e7          	jalr	1372(ra) # 80002670 <_ZN6ThreadD1Ev>
    8000511c:	00813083          	ld	ra,8(sp)
    80005120:	00013403          	ld	s0,0(sp)
    80005124:	01010113          	addi	sp,sp,16
    80005128:	00008067          	ret

000000008000512c <_ZN16ProducerKeyboradD0Ev>:
    8000512c:	fe010113          	addi	sp,sp,-32
    80005130:	00113c23          	sd	ra,24(sp)
    80005134:	00813823          	sd	s0,16(sp)
    80005138:	00913423          	sd	s1,8(sp)
    8000513c:	02010413          	addi	s0,sp,32
    80005140:	00050493          	mv	s1,a0
    80005144:	00008797          	auipc	a5,0x8
    80005148:	96478793          	addi	a5,a5,-1692 # 8000caa8 <_ZTV16ProducerKeyborad+0x10>
    8000514c:	00f53023          	sd	a5,0(a0)
    80005150:	ffffd097          	auipc	ra,0xffffd
    80005154:	520080e7          	jalr	1312(ra) # 80002670 <_ZN6ThreadD1Ev>
    80005158:	00048513          	mv	a0,s1
    8000515c:	ffffd097          	auipc	ra,0xffffd
    80005160:	5f8080e7          	jalr	1528(ra) # 80002754 <_ZdlPv>
    80005164:	01813083          	ld	ra,24(sp)
    80005168:	01013403          	ld	s0,16(sp)
    8000516c:	00813483          	ld	s1,8(sp)
    80005170:	02010113          	addi	sp,sp,32
    80005174:	00008067          	ret

0000000080005178 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005178:	ff010113          	addi	sp,sp,-16
    8000517c:	00113423          	sd	ra,8(sp)
    80005180:	00813023          	sd	s0,0(sp)
    80005184:	01010413          	addi	s0,sp,16
    80005188:	00008797          	auipc	a5,0x8
    8000518c:	94878793          	addi	a5,a5,-1720 # 8000cad0 <_ZTV8Producer+0x10>
    80005190:	00f53023          	sd	a5,0(a0)
    80005194:	ffffd097          	auipc	ra,0xffffd
    80005198:	4dc080e7          	jalr	1244(ra) # 80002670 <_ZN6ThreadD1Ev>
    8000519c:	00813083          	ld	ra,8(sp)
    800051a0:	00013403          	ld	s0,0(sp)
    800051a4:	01010113          	addi	sp,sp,16
    800051a8:	00008067          	ret

00000000800051ac <_ZN8ProducerD0Ev>:
    800051ac:	fe010113          	addi	sp,sp,-32
    800051b0:	00113c23          	sd	ra,24(sp)
    800051b4:	00813823          	sd	s0,16(sp)
    800051b8:	00913423          	sd	s1,8(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	00050493          	mv	s1,a0
    800051c4:	00008797          	auipc	a5,0x8
    800051c8:	90c78793          	addi	a5,a5,-1780 # 8000cad0 <_ZTV8Producer+0x10>
    800051cc:	00f53023          	sd	a5,0(a0)
    800051d0:	ffffd097          	auipc	ra,0xffffd
    800051d4:	4a0080e7          	jalr	1184(ra) # 80002670 <_ZN6ThreadD1Ev>
    800051d8:	00048513          	mv	a0,s1
    800051dc:	ffffd097          	auipc	ra,0xffffd
    800051e0:	578080e7          	jalr	1400(ra) # 80002754 <_ZdlPv>
    800051e4:	01813083          	ld	ra,24(sp)
    800051e8:	01013403          	ld	s0,16(sp)
    800051ec:	00813483          	ld	s1,8(sp)
    800051f0:	02010113          	addi	sp,sp,32
    800051f4:	00008067          	ret

00000000800051f8 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800051f8:	fe010113          	addi	sp,sp,-32
    800051fc:	00113c23          	sd	ra,24(sp)
    80005200:	00813823          	sd	s0,16(sp)
    80005204:	00913423          	sd	s1,8(sp)
    80005208:	02010413          	addi	s0,sp,32
    8000520c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005210:	ffffc097          	auipc	ra,0xffffc
    80005214:	504080e7          	jalr	1284(ra) # 80001714 <_Z4getcv>
    80005218:	0005059b          	sext.w	a1,a0
    8000521c:	01b00793          	li	a5,27
    80005220:	00f58c63          	beq	a1,a5,80005238 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80005224:	0204b783          	ld	a5,32(s1)
    80005228:	0087b503          	ld	a0,8(a5)
    8000522c:	00001097          	auipc	ra,0x1
    80005230:	09c080e7          	jalr	156(ra) # 800062c8 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005234:	fddff06f          	j	80005210 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005238:	00100793          	li	a5,1
    8000523c:	00008717          	auipc	a4,0x8
    80005240:	aaf72623          	sw	a5,-1364(a4) # 8000cce8 <_ZL9threadEnd>
        td->buffer->put('!');
    80005244:	0204b783          	ld	a5,32(s1)
    80005248:	02100593          	li	a1,33
    8000524c:	0087b503          	ld	a0,8(a5)
    80005250:	00001097          	auipc	ra,0x1
    80005254:	078080e7          	jalr	120(ra) # 800062c8 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005258:	0204b783          	ld	a5,32(s1)
    8000525c:	0107b503          	ld	a0,16(a5)
    80005260:	ffffd097          	auipc	ra,0xffffd
    80005264:	788080e7          	jalr	1928(ra) # 800029e8 <_ZN9Semaphore6signalEv>
    }
    80005268:	01813083          	ld	ra,24(sp)
    8000526c:	01013403          	ld	s0,16(sp)
    80005270:	00813483          	ld	s1,8(sp)
    80005274:	02010113          	addi	sp,sp,32
    80005278:	00008067          	ret

000000008000527c <_ZN8Producer3runEv>:
    void run() override {
    8000527c:	fe010113          	addi	sp,sp,-32
    80005280:	00113c23          	sd	ra,24(sp)
    80005284:	00813823          	sd	s0,16(sp)
    80005288:	00913423          	sd	s1,8(sp)
    8000528c:	01213023          	sd	s2,0(sp)
    80005290:	02010413          	addi	s0,sp,32
    80005294:	00050493          	mv	s1,a0
        int i = 0;
    80005298:	00000913          	li	s2,0
        while (!threadEnd) {
    8000529c:	00008797          	auipc	a5,0x8
    800052a0:	a4c7a783          	lw	a5,-1460(a5) # 8000cce8 <_ZL9threadEnd>
    800052a4:	04079263          	bnez	a5,800052e8 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800052a8:	0204b783          	ld	a5,32(s1)
    800052ac:	0007a583          	lw	a1,0(a5)
    800052b0:	0305859b          	addiw	a1,a1,48
    800052b4:	0087b503          	ld	a0,8(a5)
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	010080e7          	jalr	16(ra) # 800062c8 <_ZN9BufferCPP3putEi>
            i++;
    800052c0:	0019071b          	addiw	a4,s2,1
    800052c4:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800052c8:	0204b783          	ld	a5,32(s1)
    800052cc:	0007a783          	lw	a5,0(a5)
    800052d0:	00e787bb          	addw	a5,a5,a4
    800052d4:	00500513          	li	a0,5
    800052d8:	02a7e53b          	remw	a0,a5,a0
    800052dc:	ffffd097          	auipc	ra,0xffffd
    800052e0:	62c080e7          	jalr	1580(ra) # 80002908 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800052e4:	fb9ff06f          	j	8000529c <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800052e8:	0204b783          	ld	a5,32(s1)
    800052ec:	0107b503          	ld	a0,16(a5)
    800052f0:	ffffd097          	auipc	ra,0xffffd
    800052f4:	6f8080e7          	jalr	1784(ra) # 800029e8 <_ZN9Semaphore6signalEv>
    }
    800052f8:	01813083          	ld	ra,24(sp)
    800052fc:	01013403          	ld	s0,16(sp)
    80005300:	00813483          	ld	s1,8(sp)
    80005304:	00013903          	ld	s2,0(sp)
    80005308:	02010113          	addi	sp,sp,32
    8000530c:	00008067          	ret

0000000080005310 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005310:	fe010113          	addi	sp,sp,-32
    80005314:	00113c23          	sd	ra,24(sp)
    80005318:	00813823          	sd	s0,16(sp)
    8000531c:	00913423          	sd	s1,8(sp)
    80005320:	01213023          	sd	s2,0(sp)
    80005324:	02010413          	addi	s0,sp,32
    80005328:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000532c:	00100793          	li	a5,1
    80005330:	02a7f863          	bgeu	a5,a0,80005360 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005334:	00a00793          	li	a5,10
    80005338:	02f577b3          	remu	a5,a0,a5
    8000533c:	02078e63          	beqz	a5,80005378 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005340:	fff48513          	addi	a0,s1,-1
    80005344:	00000097          	auipc	ra,0x0
    80005348:	fcc080e7          	jalr	-52(ra) # 80005310 <_ZL9fibonaccim>
    8000534c:	00050913          	mv	s2,a0
    80005350:	ffe48513          	addi	a0,s1,-2
    80005354:	00000097          	auipc	ra,0x0
    80005358:	fbc080e7          	jalr	-68(ra) # 80005310 <_ZL9fibonaccim>
    8000535c:	00a90533          	add	a0,s2,a0
}
    80005360:	01813083          	ld	ra,24(sp)
    80005364:	01013403          	ld	s0,16(sp)
    80005368:	00813483          	ld	s1,8(sp)
    8000536c:	00013903          	ld	s2,0(sp)
    80005370:	02010113          	addi	sp,sp,32
    80005374:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005378:	ffffc097          	auipc	ra,0xffffc
    8000537c:	168080e7          	jalr	360(ra) # 800014e0 <_Z15thread_dispatchv>
    80005380:	fc1ff06f          	j	80005340 <_ZL9fibonaccim+0x30>

0000000080005384 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005384:	fe010113          	addi	sp,sp,-32
    80005388:	00113c23          	sd	ra,24(sp)
    8000538c:	00813823          	sd	s0,16(sp)
    80005390:	00913423          	sd	s1,8(sp)
    80005394:	01213023          	sd	s2,0(sp)
    80005398:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000539c:	00a00493          	li	s1,10
    800053a0:	0400006f          	j	800053e0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800053a4:	00005517          	auipc	a0,0x5
    800053a8:	1bc50513          	addi	a0,a0,444 # 8000a560 <CONSOLE_STATUS+0x550>
    800053ac:	ffffd097          	auipc	ra,0xffffd
    800053b0:	828080e7          	jalr	-2008(ra) # 80001bd4 <_Z11printStringPKc>
    800053b4:	00000613          	li	a2,0
    800053b8:	00a00593          	li	a1,10
    800053bc:	00048513          	mv	a0,s1
    800053c0:	ffffd097          	auipc	ra,0xffffd
    800053c4:	a4c080e7          	jalr	-1460(ra) # 80001e0c <_Z8printIntiii>
    800053c8:	00005517          	auipc	a0,0x5
    800053cc:	f1850513          	addi	a0,a0,-232 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800053d0:	ffffd097          	auipc	ra,0xffffd
    800053d4:	804080e7          	jalr	-2044(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800053d8:	0014849b          	addiw	s1,s1,1
    800053dc:	0ff4f493          	andi	s1,s1,255
    800053e0:	00c00793          	li	a5,12
    800053e4:	fc97f0e3          	bgeu	a5,s1,800053a4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800053e8:	00005517          	auipc	a0,0x5
    800053ec:	18050513          	addi	a0,a0,384 # 8000a568 <CONSOLE_STATUS+0x558>
    800053f0:	ffffc097          	auipc	ra,0xffffc
    800053f4:	7e4080e7          	jalr	2020(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800053f8:	00500313          	li	t1,5
    thread_dispatch();
    800053fc:	ffffc097          	auipc	ra,0xffffc
    80005400:	0e4080e7          	jalr	228(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005404:	01000513          	li	a0,16
    80005408:	00000097          	auipc	ra,0x0
    8000540c:	f08080e7          	jalr	-248(ra) # 80005310 <_ZL9fibonaccim>
    80005410:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005414:	00005517          	auipc	a0,0x5
    80005418:	16450513          	addi	a0,a0,356 # 8000a578 <CONSOLE_STATUS+0x568>
    8000541c:	ffffc097          	auipc	ra,0xffffc
    80005420:	7b8080e7          	jalr	1976(ra) # 80001bd4 <_Z11printStringPKc>
    80005424:	00000613          	li	a2,0
    80005428:	00a00593          	li	a1,10
    8000542c:	0009051b          	sext.w	a0,s2
    80005430:	ffffd097          	auipc	ra,0xffffd
    80005434:	9dc080e7          	jalr	-1572(ra) # 80001e0c <_Z8printIntiii>
    80005438:	00005517          	auipc	a0,0x5
    8000543c:	ea850513          	addi	a0,a0,-344 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005440:	ffffc097          	auipc	ra,0xffffc
    80005444:	794080e7          	jalr	1940(ra) # 80001bd4 <_Z11printStringPKc>
    80005448:	0400006f          	j	80005488 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000544c:	00005517          	auipc	a0,0x5
    80005450:	11450513          	addi	a0,a0,276 # 8000a560 <CONSOLE_STATUS+0x550>
    80005454:	ffffc097          	auipc	ra,0xffffc
    80005458:	780080e7          	jalr	1920(ra) # 80001bd4 <_Z11printStringPKc>
    8000545c:	00000613          	li	a2,0
    80005460:	00a00593          	li	a1,10
    80005464:	00048513          	mv	a0,s1
    80005468:	ffffd097          	auipc	ra,0xffffd
    8000546c:	9a4080e7          	jalr	-1628(ra) # 80001e0c <_Z8printIntiii>
    80005470:	00005517          	auipc	a0,0x5
    80005474:	e7050513          	addi	a0,a0,-400 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005478:	ffffc097          	auipc	ra,0xffffc
    8000547c:	75c080e7          	jalr	1884(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005480:	0014849b          	addiw	s1,s1,1
    80005484:	0ff4f493          	andi	s1,s1,255
    80005488:	00f00793          	li	a5,15
    8000548c:	fc97f0e3          	bgeu	a5,s1,8000544c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005490:	00005517          	auipc	a0,0x5
    80005494:	0f850513          	addi	a0,a0,248 # 8000a588 <CONSOLE_STATUS+0x578>
    80005498:	ffffc097          	auipc	ra,0xffffc
    8000549c:	73c080e7          	jalr	1852(ra) # 80001bd4 <_Z11printStringPKc>
    finishedD = true;
    800054a0:	00100793          	li	a5,1
    800054a4:	00008717          	auipc	a4,0x8
    800054a8:	84f70a23          	sb	a5,-1964(a4) # 8000ccf8 <_ZL9finishedD>
    thread_dispatch();
    800054ac:	ffffc097          	auipc	ra,0xffffc
    800054b0:	034080e7          	jalr	52(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800054b4:	01813083          	ld	ra,24(sp)
    800054b8:	01013403          	ld	s0,16(sp)
    800054bc:	00813483          	ld	s1,8(sp)
    800054c0:	00013903          	ld	s2,0(sp)
    800054c4:	02010113          	addi	sp,sp,32
    800054c8:	00008067          	ret

00000000800054cc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800054cc:	fe010113          	addi	sp,sp,-32
    800054d0:	00113c23          	sd	ra,24(sp)
    800054d4:	00813823          	sd	s0,16(sp)
    800054d8:	00913423          	sd	s1,8(sp)
    800054dc:	01213023          	sd	s2,0(sp)
    800054e0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800054e4:	00000493          	li	s1,0
    800054e8:	0400006f          	j	80005528 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800054ec:	00005517          	auipc	a0,0x5
    800054f0:	04450513          	addi	a0,a0,68 # 8000a530 <CONSOLE_STATUS+0x520>
    800054f4:	ffffc097          	auipc	ra,0xffffc
    800054f8:	6e0080e7          	jalr	1760(ra) # 80001bd4 <_Z11printStringPKc>
    800054fc:	00000613          	li	a2,0
    80005500:	00a00593          	li	a1,10
    80005504:	00048513          	mv	a0,s1
    80005508:	ffffd097          	auipc	ra,0xffffd
    8000550c:	904080e7          	jalr	-1788(ra) # 80001e0c <_Z8printIntiii>
    80005510:	00005517          	auipc	a0,0x5
    80005514:	dd050513          	addi	a0,a0,-560 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005518:	ffffc097          	auipc	ra,0xffffc
    8000551c:	6bc080e7          	jalr	1724(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005520:	0014849b          	addiw	s1,s1,1
    80005524:	0ff4f493          	andi	s1,s1,255
    80005528:	00200793          	li	a5,2
    8000552c:	fc97f0e3          	bgeu	a5,s1,800054ec <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005530:	00005517          	auipc	a0,0x5
    80005534:	00850513          	addi	a0,a0,8 # 8000a538 <CONSOLE_STATUS+0x528>
    80005538:	ffffc097          	auipc	ra,0xffffc
    8000553c:	69c080e7          	jalr	1692(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005540:	00700313          	li	t1,7
    thread_dispatch();
    80005544:	ffffc097          	auipc	ra,0xffffc
    80005548:	f9c080e7          	jalr	-100(ra) # 800014e0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000554c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005550:	00005517          	auipc	a0,0x5
    80005554:	ff850513          	addi	a0,a0,-8 # 8000a548 <CONSOLE_STATUS+0x538>
    80005558:	ffffc097          	auipc	ra,0xffffc
    8000555c:	67c080e7          	jalr	1660(ra) # 80001bd4 <_Z11printStringPKc>
    80005560:	00000613          	li	a2,0
    80005564:	00a00593          	li	a1,10
    80005568:	0009051b          	sext.w	a0,s2
    8000556c:	ffffd097          	auipc	ra,0xffffd
    80005570:	8a0080e7          	jalr	-1888(ra) # 80001e0c <_Z8printIntiii>
    80005574:	00005517          	auipc	a0,0x5
    80005578:	d6c50513          	addi	a0,a0,-660 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000557c:	ffffc097          	auipc	ra,0xffffc
    80005580:	658080e7          	jalr	1624(ra) # 80001bd4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005584:	00c00513          	li	a0,12
    80005588:	00000097          	auipc	ra,0x0
    8000558c:	d88080e7          	jalr	-632(ra) # 80005310 <_ZL9fibonaccim>
    80005590:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005594:	00005517          	auipc	a0,0x5
    80005598:	fbc50513          	addi	a0,a0,-68 # 8000a550 <CONSOLE_STATUS+0x540>
    8000559c:	ffffc097          	auipc	ra,0xffffc
    800055a0:	638080e7          	jalr	1592(ra) # 80001bd4 <_Z11printStringPKc>
    800055a4:	00000613          	li	a2,0
    800055a8:	00a00593          	li	a1,10
    800055ac:	0009051b          	sext.w	a0,s2
    800055b0:	ffffd097          	auipc	ra,0xffffd
    800055b4:	85c080e7          	jalr	-1956(ra) # 80001e0c <_Z8printIntiii>
    800055b8:	00005517          	auipc	a0,0x5
    800055bc:	d2850513          	addi	a0,a0,-728 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800055c0:	ffffc097          	auipc	ra,0xffffc
    800055c4:	614080e7          	jalr	1556(ra) # 80001bd4 <_Z11printStringPKc>
    800055c8:	0400006f          	j	80005608 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800055cc:	00005517          	auipc	a0,0x5
    800055d0:	f6450513          	addi	a0,a0,-156 # 8000a530 <CONSOLE_STATUS+0x520>
    800055d4:	ffffc097          	auipc	ra,0xffffc
    800055d8:	600080e7          	jalr	1536(ra) # 80001bd4 <_Z11printStringPKc>
    800055dc:	00000613          	li	a2,0
    800055e0:	00a00593          	li	a1,10
    800055e4:	00048513          	mv	a0,s1
    800055e8:	ffffd097          	auipc	ra,0xffffd
    800055ec:	824080e7          	jalr	-2012(ra) # 80001e0c <_Z8printIntiii>
    800055f0:	00005517          	auipc	a0,0x5
    800055f4:	cf050513          	addi	a0,a0,-784 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800055f8:	ffffc097          	auipc	ra,0xffffc
    800055fc:	5dc080e7          	jalr	1500(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005600:	0014849b          	addiw	s1,s1,1
    80005604:	0ff4f493          	andi	s1,s1,255
    80005608:	00500793          	li	a5,5
    8000560c:	fc97f0e3          	bgeu	a5,s1,800055cc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005610:	00005517          	auipc	a0,0x5
    80005614:	ef850513          	addi	a0,a0,-264 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80005618:	ffffc097          	auipc	ra,0xffffc
    8000561c:	5bc080e7          	jalr	1468(ra) # 80001bd4 <_Z11printStringPKc>
    finishedC = true;
    80005620:	00100793          	li	a5,1
    80005624:	00007717          	auipc	a4,0x7
    80005628:	6cf70aa3          	sb	a5,1749(a4) # 8000ccf9 <_ZL9finishedC>
    thread_dispatch();
    8000562c:	ffffc097          	auipc	ra,0xffffc
    80005630:	eb4080e7          	jalr	-332(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005634:	01813083          	ld	ra,24(sp)
    80005638:	01013403          	ld	s0,16(sp)
    8000563c:	00813483          	ld	s1,8(sp)
    80005640:	00013903          	ld	s2,0(sp)
    80005644:	02010113          	addi	sp,sp,32
    80005648:	00008067          	ret

000000008000564c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000564c:	fe010113          	addi	sp,sp,-32
    80005650:	00113c23          	sd	ra,24(sp)
    80005654:	00813823          	sd	s0,16(sp)
    80005658:	00913423          	sd	s1,8(sp)
    8000565c:	01213023          	sd	s2,0(sp)
    80005660:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005664:	00000913          	li	s2,0
    80005668:	0380006f          	j	800056a0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000566c:	ffffc097          	auipc	ra,0xffffc
    80005670:	e74080e7          	jalr	-396(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005674:	00148493          	addi	s1,s1,1
    80005678:	000027b7          	lui	a5,0x2
    8000567c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005680:	0097ee63          	bltu	a5,s1,8000569c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005684:	00000713          	li	a4,0
    80005688:	000077b7          	lui	a5,0x7
    8000568c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005690:	fce7eee3          	bltu	a5,a4,8000566c <_ZL11workerBodyBPv+0x20>
    80005694:	00170713          	addi	a4,a4,1
    80005698:	ff1ff06f          	j	80005688 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000569c:	00190913          	addi	s2,s2,1
    800056a0:	00f00793          	li	a5,15
    800056a4:	0527e063          	bltu	a5,s2,800056e4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800056a8:	00005517          	auipc	a0,0x5
    800056ac:	e7050513          	addi	a0,a0,-400 # 8000a518 <CONSOLE_STATUS+0x508>
    800056b0:	ffffc097          	auipc	ra,0xffffc
    800056b4:	524080e7          	jalr	1316(ra) # 80001bd4 <_Z11printStringPKc>
    800056b8:	00000613          	li	a2,0
    800056bc:	00a00593          	li	a1,10
    800056c0:	0009051b          	sext.w	a0,s2
    800056c4:	ffffc097          	auipc	ra,0xffffc
    800056c8:	748080e7          	jalr	1864(ra) # 80001e0c <_Z8printIntiii>
    800056cc:	00005517          	auipc	a0,0x5
    800056d0:	c1450513          	addi	a0,a0,-1004 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800056d4:	ffffc097          	auipc	ra,0xffffc
    800056d8:	500080e7          	jalr	1280(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800056dc:	00000493          	li	s1,0
    800056e0:	f99ff06f          	j	80005678 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800056e4:	00005517          	auipc	a0,0x5
    800056e8:	e3c50513          	addi	a0,a0,-452 # 8000a520 <CONSOLE_STATUS+0x510>
    800056ec:	ffffc097          	auipc	ra,0xffffc
    800056f0:	4e8080e7          	jalr	1256(ra) # 80001bd4 <_Z11printStringPKc>
    finishedB = true;
    800056f4:	00100793          	li	a5,1
    800056f8:	00007717          	auipc	a4,0x7
    800056fc:	60f70123          	sb	a5,1538(a4) # 8000ccfa <_ZL9finishedB>
    thread_dispatch();
    80005700:	ffffc097          	auipc	ra,0xffffc
    80005704:	de0080e7          	jalr	-544(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005708:	01813083          	ld	ra,24(sp)
    8000570c:	01013403          	ld	s0,16(sp)
    80005710:	00813483          	ld	s1,8(sp)
    80005714:	00013903          	ld	s2,0(sp)
    80005718:	02010113          	addi	sp,sp,32
    8000571c:	00008067          	ret

0000000080005720 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005720:	fe010113          	addi	sp,sp,-32
    80005724:	00113c23          	sd	ra,24(sp)
    80005728:	00813823          	sd	s0,16(sp)
    8000572c:	00913423          	sd	s1,8(sp)
    80005730:	01213023          	sd	s2,0(sp)
    80005734:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005738:	00000913          	li	s2,0
    8000573c:	0380006f          	j	80005774 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005740:	ffffc097          	auipc	ra,0xffffc
    80005744:	da0080e7          	jalr	-608(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005748:	00148493          	addi	s1,s1,1
    8000574c:	000027b7          	lui	a5,0x2
    80005750:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005754:	0097ee63          	bltu	a5,s1,80005770 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005758:	00000713          	li	a4,0
    8000575c:	000077b7          	lui	a5,0x7
    80005760:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005764:	fce7eee3          	bltu	a5,a4,80005740 <_ZL11workerBodyAPv+0x20>
    80005768:	00170713          	addi	a4,a4,1
    8000576c:	ff1ff06f          	j	8000575c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005770:	00190913          	addi	s2,s2,1
    80005774:	00900793          	li	a5,9
    80005778:	0527e063          	bltu	a5,s2,800057b8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000577c:	00005517          	auipc	a0,0x5
    80005780:	d8450513          	addi	a0,a0,-636 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80005784:	ffffc097          	auipc	ra,0xffffc
    80005788:	450080e7          	jalr	1104(ra) # 80001bd4 <_Z11printStringPKc>
    8000578c:	00000613          	li	a2,0
    80005790:	00a00593          	li	a1,10
    80005794:	0009051b          	sext.w	a0,s2
    80005798:	ffffc097          	auipc	ra,0xffffc
    8000579c:	674080e7          	jalr	1652(ra) # 80001e0c <_Z8printIntiii>
    800057a0:	00005517          	auipc	a0,0x5
    800057a4:	b4050513          	addi	a0,a0,-1216 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800057a8:	ffffc097          	auipc	ra,0xffffc
    800057ac:	42c080e7          	jalr	1068(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800057b0:	00000493          	li	s1,0
    800057b4:	f99ff06f          	j	8000574c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800057b8:	00005517          	auipc	a0,0x5
    800057bc:	d5050513          	addi	a0,a0,-688 # 8000a508 <CONSOLE_STATUS+0x4f8>
    800057c0:	ffffc097          	auipc	ra,0xffffc
    800057c4:	414080e7          	jalr	1044(ra) # 80001bd4 <_Z11printStringPKc>
    finishedA = true;
    800057c8:	00100793          	li	a5,1
    800057cc:	00007717          	auipc	a4,0x7
    800057d0:	52f707a3          	sb	a5,1327(a4) # 8000ccfb <_ZL9finishedA>
}
    800057d4:	01813083          	ld	ra,24(sp)
    800057d8:	01013403          	ld	s0,16(sp)
    800057dc:	00813483          	ld	s1,8(sp)
    800057e0:	00013903          	ld	s2,0(sp)
    800057e4:	02010113          	addi	sp,sp,32
    800057e8:	00008067          	ret

00000000800057ec <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800057ec:	fd010113          	addi	sp,sp,-48
    800057f0:	02113423          	sd	ra,40(sp)
    800057f4:	02813023          	sd	s0,32(sp)
    800057f8:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800057fc:	00000613          	li	a2,0
    80005800:	00000597          	auipc	a1,0x0
    80005804:	f2058593          	addi	a1,a1,-224 # 80005720 <_ZL11workerBodyAPv>
    80005808:	fd040513          	addi	a0,s0,-48
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	bc8080e7          	jalr	-1080(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005814:	00005517          	auipc	a0,0x5
    80005818:	d8450513          	addi	a0,a0,-636 # 8000a598 <CONSOLE_STATUS+0x588>
    8000581c:	ffffc097          	auipc	ra,0xffffc
    80005820:	3b8080e7          	jalr	952(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005824:	00000613          	li	a2,0
    80005828:	00000597          	auipc	a1,0x0
    8000582c:	e2458593          	addi	a1,a1,-476 # 8000564c <_ZL11workerBodyBPv>
    80005830:	fd840513          	addi	a0,s0,-40
    80005834:	ffffc097          	auipc	ra,0xffffc
    80005838:	ba0080e7          	jalr	-1120(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000583c:	00005517          	auipc	a0,0x5
    80005840:	d7450513          	addi	a0,a0,-652 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    80005844:	ffffc097          	auipc	ra,0xffffc
    80005848:	390080e7          	jalr	912(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000584c:	00000613          	li	a2,0
    80005850:	00000597          	auipc	a1,0x0
    80005854:	c7c58593          	addi	a1,a1,-900 # 800054cc <_ZL11workerBodyCPv>
    80005858:	fe040513          	addi	a0,s0,-32
    8000585c:	ffffc097          	auipc	ra,0xffffc
    80005860:	b78080e7          	jalr	-1160(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005864:	00005517          	auipc	a0,0x5
    80005868:	d6450513          	addi	a0,a0,-668 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    8000586c:	ffffc097          	auipc	ra,0xffffc
    80005870:	368080e7          	jalr	872(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005874:	00000613          	li	a2,0
    80005878:	00000597          	auipc	a1,0x0
    8000587c:	b0c58593          	addi	a1,a1,-1268 # 80005384 <_ZL11workerBodyDPv>
    80005880:	fe840513          	addi	a0,s0,-24
    80005884:	ffffc097          	auipc	ra,0xffffc
    80005888:	b50080e7          	jalr	-1200(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000588c:	00005517          	auipc	a0,0x5
    80005890:	d5450513          	addi	a0,a0,-684 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    80005894:	ffffc097          	auipc	ra,0xffffc
    80005898:	340080e7          	jalr	832(ra) # 80001bd4 <_Z11printStringPKc>
    8000589c:	00c0006f          	j	800058a8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800058a0:	ffffc097          	auipc	ra,0xffffc
    800058a4:	c40080e7          	jalr	-960(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800058a8:	00007797          	auipc	a5,0x7
    800058ac:	4537c783          	lbu	a5,1107(a5) # 8000ccfb <_ZL9finishedA>
    800058b0:	fe0788e3          	beqz	a5,800058a0 <_Z18Threads_C_API_testv+0xb4>
    800058b4:	00007797          	auipc	a5,0x7
    800058b8:	4467c783          	lbu	a5,1094(a5) # 8000ccfa <_ZL9finishedB>
    800058bc:	fe0782e3          	beqz	a5,800058a0 <_Z18Threads_C_API_testv+0xb4>
    800058c0:	00007797          	auipc	a5,0x7
    800058c4:	4397c783          	lbu	a5,1081(a5) # 8000ccf9 <_ZL9finishedC>
    800058c8:	fc078ce3          	beqz	a5,800058a0 <_Z18Threads_C_API_testv+0xb4>
    800058cc:	00007797          	auipc	a5,0x7
    800058d0:	42c7c783          	lbu	a5,1068(a5) # 8000ccf8 <_ZL9finishedD>
    800058d4:	fc0786e3          	beqz	a5,800058a0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800058d8:	02813083          	ld	ra,40(sp)
    800058dc:	02013403          	ld	s0,32(sp)
    800058e0:	03010113          	addi	sp,sp,48
    800058e4:	00008067          	ret

00000000800058e8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800058e8:	fd010113          	addi	sp,sp,-48
    800058ec:	02113423          	sd	ra,40(sp)
    800058f0:	02813023          	sd	s0,32(sp)
    800058f4:	00913c23          	sd	s1,24(sp)
    800058f8:	01213823          	sd	s2,16(sp)
    800058fc:	01313423          	sd	s3,8(sp)
    80005900:	03010413          	addi	s0,sp,48
    80005904:	00050993          	mv	s3,a0
    80005908:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000590c:	00000913          	li	s2,0
    80005910:	00c0006f          	j	8000591c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005914:	ffffd097          	auipc	ra,0xffffd
    80005918:	fcc080e7          	jalr	-52(ra) # 800028e0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000591c:	ffffc097          	auipc	ra,0xffffc
    80005920:	df8080e7          	jalr	-520(ra) # 80001714 <_Z4getcv>
    80005924:	0005059b          	sext.w	a1,a0
    80005928:	01b00793          	li	a5,27
    8000592c:	02f58a63          	beq	a1,a5,80005960 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005930:	0084b503          	ld	a0,8(s1)
    80005934:	00001097          	auipc	ra,0x1
    80005938:	994080e7          	jalr	-1644(ra) # 800062c8 <_ZN9BufferCPP3putEi>
        i++;
    8000593c:	0019071b          	addiw	a4,s2,1
    80005940:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005944:	0004a683          	lw	a3,0(s1)
    80005948:	0026979b          	slliw	a5,a3,0x2
    8000594c:	00d787bb          	addw	a5,a5,a3
    80005950:	0017979b          	slliw	a5,a5,0x1
    80005954:	02f767bb          	remw	a5,a4,a5
    80005958:	fc0792e3          	bnez	a5,8000591c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000595c:	fb9ff06f          	j	80005914 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005960:	00100793          	li	a5,1
    80005964:	00007717          	auipc	a4,0x7
    80005968:	38f72e23          	sw	a5,924(a4) # 8000cd00 <_ZL9threadEnd>
    td->buffer->put('!');
    8000596c:	0209b783          	ld	a5,32(s3)
    80005970:	02100593          	li	a1,33
    80005974:	0087b503          	ld	a0,8(a5)
    80005978:	00001097          	auipc	ra,0x1
    8000597c:	950080e7          	jalr	-1712(ra) # 800062c8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005980:	0104b503          	ld	a0,16(s1)
    80005984:	ffffd097          	auipc	ra,0xffffd
    80005988:	064080e7          	jalr	100(ra) # 800029e8 <_ZN9Semaphore6signalEv>
}
    8000598c:	02813083          	ld	ra,40(sp)
    80005990:	02013403          	ld	s0,32(sp)
    80005994:	01813483          	ld	s1,24(sp)
    80005998:	01013903          	ld	s2,16(sp)
    8000599c:	00813983          	ld	s3,8(sp)
    800059a0:	03010113          	addi	sp,sp,48
    800059a4:	00008067          	ret

00000000800059a8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800059a8:	fe010113          	addi	sp,sp,-32
    800059ac:	00113c23          	sd	ra,24(sp)
    800059b0:	00813823          	sd	s0,16(sp)
    800059b4:	00913423          	sd	s1,8(sp)
    800059b8:	01213023          	sd	s2,0(sp)
    800059bc:	02010413          	addi	s0,sp,32
    800059c0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800059c4:	00000913          	li	s2,0
    800059c8:	00c0006f          	j	800059d4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800059cc:	ffffd097          	auipc	ra,0xffffd
    800059d0:	f14080e7          	jalr	-236(ra) # 800028e0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800059d4:	00007797          	auipc	a5,0x7
    800059d8:	32c7a783          	lw	a5,812(a5) # 8000cd00 <_ZL9threadEnd>
    800059dc:	02079e63          	bnez	a5,80005a18 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800059e0:	0004a583          	lw	a1,0(s1)
    800059e4:	0305859b          	addiw	a1,a1,48
    800059e8:	0084b503          	ld	a0,8(s1)
    800059ec:	00001097          	auipc	ra,0x1
    800059f0:	8dc080e7          	jalr	-1828(ra) # 800062c8 <_ZN9BufferCPP3putEi>
        i++;
    800059f4:	0019071b          	addiw	a4,s2,1
    800059f8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800059fc:	0004a683          	lw	a3,0(s1)
    80005a00:	0026979b          	slliw	a5,a3,0x2
    80005a04:	00d787bb          	addw	a5,a5,a3
    80005a08:	0017979b          	slliw	a5,a5,0x1
    80005a0c:	02f767bb          	remw	a5,a4,a5
    80005a10:	fc0792e3          	bnez	a5,800059d4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005a14:	fb9ff06f          	j	800059cc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005a18:	0104b503          	ld	a0,16(s1)
    80005a1c:	ffffd097          	auipc	ra,0xffffd
    80005a20:	fcc080e7          	jalr	-52(ra) # 800029e8 <_ZN9Semaphore6signalEv>
}
    80005a24:	01813083          	ld	ra,24(sp)
    80005a28:	01013403          	ld	s0,16(sp)
    80005a2c:	00813483          	ld	s1,8(sp)
    80005a30:	00013903          	ld	s2,0(sp)
    80005a34:	02010113          	addi	sp,sp,32
    80005a38:	00008067          	ret

0000000080005a3c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005a3c:	fd010113          	addi	sp,sp,-48
    80005a40:	02113423          	sd	ra,40(sp)
    80005a44:	02813023          	sd	s0,32(sp)
    80005a48:	00913c23          	sd	s1,24(sp)
    80005a4c:	01213823          	sd	s2,16(sp)
    80005a50:	01313423          	sd	s3,8(sp)
    80005a54:	01413023          	sd	s4,0(sp)
    80005a58:	03010413          	addi	s0,sp,48
    80005a5c:	00050993          	mv	s3,a0
    80005a60:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005a64:	00000a13          	li	s4,0
    80005a68:	01c0006f          	j	80005a84 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005a6c:	ffffd097          	auipc	ra,0xffffd
    80005a70:	e74080e7          	jalr	-396(ra) # 800028e0 <_ZN6Thread8dispatchEv>
    80005a74:	0500006f          	j	80005ac4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005a78:	00a00513          	li	a0,10
    80005a7c:	ffffc097          	auipc	ra,0xffffc
    80005a80:	cf4080e7          	jalr	-780(ra) # 80001770 <_Z4putcc>
    while (!threadEnd) {
    80005a84:	00007797          	auipc	a5,0x7
    80005a88:	27c7a783          	lw	a5,636(a5) # 8000cd00 <_ZL9threadEnd>
    80005a8c:	06079263          	bnez	a5,80005af0 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005a90:	00893503          	ld	a0,8(s2)
    80005a94:	00001097          	auipc	ra,0x1
    80005a98:	8c4080e7          	jalr	-1852(ra) # 80006358 <_ZN9BufferCPP3getEv>
        i++;
    80005a9c:	001a049b          	addiw	s1,s4,1
    80005aa0:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005aa4:	0ff57513          	andi	a0,a0,255
    80005aa8:	ffffc097          	auipc	ra,0xffffc
    80005aac:	cc8080e7          	jalr	-824(ra) # 80001770 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005ab0:	00092703          	lw	a4,0(s2)
    80005ab4:	0027179b          	slliw	a5,a4,0x2
    80005ab8:	00e787bb          	addw	a5,a5,a4
    80005abc:	02f4e7bb          	remw	a5,s1,a5
    80005ac0:	fa0786e3          	beqz	a5,80005a6c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005ac4:	05000793          	li	a5,80
    80005ac8:	02f4e4bb          	remw	s1,s1,a5
    80005acc:	fa049ce3          	bnez	s1,80005a84 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005ad0:	fa9ff06f          	j	80005a78 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005ad4:	0209b783          	ld	a5,32(s3)
    80005ad8:	0087b503          	ld	a0,8(a5)
    80005adc:	00001097          	auipc	ra,0x1
    80005ae0:	87c080e7          	jalr	-1924(ra) # 80006358 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005ae4:	0ff57513          	andi	a0,a0,255
    80005ae8:	ffffd097          	auipc	ra,0xffffd
    80005aec:	fc0080e7          	jalr	-64(ra) # 80002aa8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005af0:	0209b783          	ld	a5,32(s3)
    80005af4:	0087b503          	ld	a0,8(a5)
    80005af8:	00001097          	auipc	ra,0x1
    80005afc:	8ec080e7          	jalr	-1812(ra) # 800063e4 <_ZN9BufferCPP6getCntEv>
    80005b00:	fca04ae3          	bgtz	a0,80005ad4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005b04:	01093503          	ld	a0,16(s2)
    80005b08:	ffffd097          	auipc	ra,0xffffd
    80005b0c:	ee0080e7          	jalr	-288(ra) # 800029e8 <_ZN9Semaphore6signalEv>
}
    80005b10:	02813083          	ld	ra,40(sp)
    80005b14:	02013403          	ld	s0,32(sp)
    80005b18:	01813483          	ld	s1,24(sp)
    80005b1c:	01013903          	ld	s2,16(sp)
    80005b20:	00813983          	ld	s3,8(sp)
    80005b24:	00013a03          	ld	s4,0(sp)
    80005b28:	03010113          	addi	sp,sp,48
    80005b2c:	00008067          	ret

0000000080005b30 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005b30:	f8010113          	addi	sp,sp,-128
    80005b34:	06113c23          	sd	ra,120(sp)
    80005b38:	06813823          	sd	s0,112(sp)
    80005b3c:	06913423          	sd	s1,104(sp)
    80005b40:	07213023          	sd	s2,96(sp)
    80005b44:	05313c23          	sd	s3,88(sp)
    80005b48:	05413823          	sd	s4,80(sp)
    80005b4c:	05513423          	sd	s5,72(sp)
    80005b50:	05613023          	sd	s6,64(sp)
    80005b54:	03713c23          	sd	s7,56(sp)
    80005b58:	03813823          	sd	s8,48(sp)
    80005b5c:	03913423          	sd	s9,40(sp)
    80005b60:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005b64:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005b68:	00005517          	auipc	a0,0x5
    80005b6c:	8b050513          	addi	a0,a0,-1872 # 8000a418 <CONSOLE_STATUS+0x408>
    80005b70:	ffffc097          	auipc	ra,0xffffc
    80005b74:	064080e7          	jalr	100(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80005b78:	01e00593          	li	a1,30
    80005b7c:	f8040493          	addi	s1,s0,-128
    80005b80:	00048513          	mv	a0,s1
    80005b84:	ffffc097          	auipc	ra,0xffffc
    80005b88:	160080e7          	jalr	352(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005b8c:	00048513          	mv	a0,s1
    80005b90:	ffffc097          	auipc	ra,0xffffc
    80005b94:	22c080e7          	jalr	556(ra) # 80001dbc <_Z11stringToIntPKc>
    80005b98:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005b9c:	00005517          	auipc	a0,0x5
    80005ba0:	89c50513          	addi	a0,a0,-1892 # 8000a438 <CONSOLE_STATUS+0x428>
    80005ba4:	ffffc097          	auipc	ra,0xffffc
    80005ba8:	030080e7          	jalr	48(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80005bac:	01e00593          	li	a1,30
    80005bb0:	00048513          	mv	a0,s1
    80005bb4:	ffffc097          	auipc	ra,0xffffc
    80005bb8:	130080e7          	jalr	304(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80005bbc:	00048513          	mv	a0,s1
    80005bc0:	ffffc097          	auipc	ra,0xffffc
    80005bc4:	1fc080e7          	jalr	508(ra) # 80001dbc <_Z11stringToIntPKc>
    80005bc8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005bcc:	00005517          	auipc	a0,0x5
    80005bd0:	88c50513          	addi	a0,a0,-1908 # 8000a458 <CONSOLE_STATUS+0x448>
    80005bd4:	ffffc097          	auipc	ra,0xffffc
    80005bd8:	000080e7          	jalr	ra # 80001bd4 <_Z11printStringPKc>
    80005bdc:	00000613          	li	a2,0
    80005be0:	00a00593          	li	a1,10
    80005be4:	00090513          	mv	a0,s2
    80005be8:	ffffc097          	auipc	ra,0xffffc
    80005bec:	224080e7          	jalr	548(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005bf0:	00005517          	auipc	a0,0x5
    80005bf4:	88050513          	addi	a0,a0,-1920 # 8000a470 <CONSOLE_STATUS+0x460>
    80005bf8:	ffffc097          	auipc	ra,0xffffc
    80005bfc:	fdc080e7          	jalr	-36(ra) # 80001bd4 <_Z11printStringPKc>
    80005c00:	00000613          	li	a2,0
    80005c04:	00a00593          	li	a1,10
    80005c08:	00048513          	mv	a0,s1
    80005c0c:	ffffc097          	auipc	ra,0xffffc
    80005c10:	200080e7          	jalr	512(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80005c14:	00005517          	auipc	a0,0x5
    80005c18:	87450513          	addi	a0,a0,-1932 # 8000a488 <CONSOLE_STATUS+0x478>
    80005c1c:	ffffc097          	auipc	ra,0xffffc
    80005c20:	fb8080e7          	jalr	-72(ra) # 80001bd4 <_Z11printStringPKc>
    if(threadNum > n) {
    80005c24:	0324c463          	blt	s1,s2,80005c4c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005c28:	03205c63          	blez	s2,80005c60 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005c2c:	03800513          	li	a0,56
    80005c30:	ffffd097          	auipc	ra,0xffffd
    80005c34:	ad4080e7          	jalr	-1324(ra) # 80002704 <_Znwm>
    80005c38:	00050a93          	mv	s5,a0
    80005c3c:	00048593          	mv	a1,s1
    80005c40:	00000097          	auipc	ra,0x0
    80005c44:	534080e7          	jalr	1332(ra) # 80006174 <_ZN9BufferCPPC1Ei>
    80005c48:	0300006f          	j	80005c78 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005c4c:	00005517          	auipc	a0,0x5
    80005c50:	84450513          	addi	a0,a0,-1980 # 8000a490 <CONSOLE_STATUS+0x480>
    80005c54:	ffffc097          	auipc	ra,0xffffc
    80005c58:	f80080e7          	jalr	-128(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80005c5c:	0140006f          	j	80005c70 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005c60:	00005517          	auipc	a0,0x5
    80005c64:	87050513          	addi	a0,a0,-1936 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80005c68:	ffffc097          	auipc	ra,0xffffc
    80005c6c:	f6c080e7          	jalr	-148(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80005c70:	000b8113          	mv	sp,s7
    80005c74:	2380006f          	j	80005eac <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005c78:	01000513          	li	a0,16
    80005c7c:	ffffd097          	auipc	ra,0xffffd
    80005c80:	a88080e7          	jalr	-1400(ra) # 80002704 <_Znwm>
    80005c84:	00050493          	mv	s1,a0
    80005c88:	00000593          	li	a1,0
    80005c8c:	ffffd097          	auipc	ra,0xffffd
    80005c90:	cf8080e7          	jalr	-776(ra) # 80002984 <_ZN9SemaphoreC1Ej>
    80005c94:	00007797          	auipc	a5,0x7
    80005c98:	0697ba23          	sd	s1,116(a5) # 8000cd08 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005c9c:	00391793          	slli	a5,s2,0x3
    80005ca0:	00f78793          	addi	a5,a5,15
    80005ca4:	ff07f793          	andi	a5,a5,-16
    80005ca8:	40f10133          	sub	sp,sp,a5
    80005cac:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005cb0:	0019071b          	addiw	a4,s2,1
    80005cb4:	00171793          	slli	a5,a4,0x1
    80005cb8:	00e787b3          	add	a5,a5,a4
    80005cbc:	00379793          	slli	a5,a5,0x3
    80005cc0:	00f78793          	addi	a5,a5,15
    80005cc4:	ff07f793          	andi	a5,a5,-16
    80005cc8:	40f10133          	sub	sp,sp,a5
    80005ccc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005cd0:	00191c13          	slli	s8,s2,0x1
    80005cd4:	012c07b3          	add	a5,s8,s2
    80005cd8:	00379793          	slli	a5,a5,0x3
    80005cdc:	00fa07b3          	add	a5,s4,a5
    80005ce0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005ce4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005ce8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005cec:	02800513          	li	a0,40
    80005cf0:	ffffd097          	auipc	ra,0xffffd
    80005cf4:	a14080e7          	jalr	-1516(ra) # 80002704 <_Znwm>
    80005cf8:	00050b13          	mv	s6,a0
    80005cfc:	012c0c33          	add	s8,s8,s2
    80005d00:	003c1c13          	slli	s8,s8,0x3
    80005d04:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005d08:	ffffd097          	auipc	ra,0xffffd
    80005d0c:	b4c080e7          	jalr	-1204(ra) # 80002854 <_ZN6ThreadC1Ev>
    80005d10:	00007797          	auipc	a5,0x7
    80005d14:	e6078793          	addi	a5,a5,-416 # 8000cb70 <_ZTV12ConsumerSync+0x10>
    80005d18:	00fb3023          	sd	a5,0(s6)
    80005d1c:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005d20:	000b0513          	mv	a0,s6
    80005d24:	ffffd097          	auipc	ra,0xffffd
    80005d28:	b68080e7          	jalr	-1176(ra) # 8000288c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005d2c:	00000493          	li	s1,0
    80005d30:	0380006f          	j	80005d68 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005d34:	00007797          	auipc	a5,0x7
    80005d38:	e1478793          	addi	a5,a5,-492 # 8000cb48 <_ZTV12ProducerSync+0x10>
    80005d3c:	00fcb023          	sd	a5,0(s9)
    80005d40:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005d44:	00349793          	slli	a5,s1,0x3
    80005d48:	00f987b3          	add	a5,s3,a5
    80005d4c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005d50:	00349793          	slli	a5,s1,0x3
    80005d54:	00f987b3          	add	a5,s3,a5
    80005d58:	0007b503          	ld	a0,0(a5)
    80005d5c:	ffffd097          	auipc	ra,0xffffd
    80005d60:	b30080e7          	jalr	-1232(ra) # 8000288c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005d64:	0014849b          	addiw	s1,s1,1
    80005d68:	0b24d063          	bge	s1,s2,80005e08 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005d6c:	00149793          	slli	a5,s1,0x1
    80005d70:	009787b3          	add	a5,a5,s1
    80005d74:	00379793          	slli	a5,a5,0x3
    80005d78:	00fa07b3          	add	a5,s4,a5
    80005d7c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005d80:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005d84:	00007717          	auipc	a4,0x7
    80005d88:	f8473703          	ld	a4,-124(a4) # 8000cd08 <_ZL10waitForAll>
    80005d8c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005d90:	02905863          	blez	s1,80005dc0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005d94:	02800513          	li	a0,40
    80005d98:	ffffd097          	auipc	ra,0xffffd
    80005d9c:	96c080e7          	jalr	-1684(ra) # 80002704 <_Znwm>
    80005da0:	00050c93          	mv	s9,a0
    80005da4:	00149c13          	slli	s8,s1,0x1
    80005da8:	009c0c33          	add	s8,s8,s1
    80005dac:	003c1c13          	slli	s8,s8,0x3
    80005db0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005db4:	ffffd097          	auipc	ra,0xffffd
    80005db8:	aa0080e7          	jalr	-1376(ra) # 80002854 <_ZN6ThreadC1Ev>
    80005dbc:	f79ff06f          	j	80005d34 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005dc0:	02800513          	li	a0,40
    80005dc4:	ffffd097          	auipc	ra,0xffffd
    80005dc8:	940080e7          	jalr	-1728(ra) # 80002704 <_Znwm>
    80005dcc:	00050c93          	mv	s9,a0
    80005dd0:	00149c13          	slli	s8,s1,0x1
    80005dd4:	009c0c33          	add	s8,s8,s1
    80005dd8:	003c1c13          	slli	s8,s8,0x3
    80005ddc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005de0:	ffffd097          	auipc	ra,0xffffd
    80005de4:	a74080e7          	jalr	-1420(ra) # 80002854 <_ZN6ThreadC1Ev>
    80005de8:	00007797          	auipc	a5,0x7
    80005dec:	d3878793          	addi	a5,a5,-712 # 8000cb20 <_ZTV16ProducerKeyboard+0x10>
    80005df0:	00fcb023          	sd	a5,0(s9)
    80005df4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005df8:	00349793          	slli	a5,s1,0x3
    80005dfc:	00f987b3          	add	a5,s3,a5
    80005e00:	0197b023          	sd	s9,0(a5)
    80005e04:	f4dff06f          	j	80005d50 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005e08:	ffffd097          	auipc	ra,0xffffd
    80005e0c:	ad8080e7          	jalr	-1320(ra) # 800028e0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005e10:	00000493          	li	s1,0
    80005e14:	00994e63          	blt	s2,s1,80005e30 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005e18:	00007517          	auipc	a0,0x7
    80005e1c:	ef053503          	ld	a0,-272(a0) # 8000cd08 <_ZL10waitForAll>
    80005e20:	ffffd097          	auipc	ra,0xffffd
    80005e24:	b9c080e7          	jalr	-1124(ra) # 800029bc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005e28:	0014849b          	addiw	s1,s1,1
    80005e2c:	fe9ff06f          	j	80005e14 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005e30:	00000493          	li	s1,0
    80005e34:	0080006f          	j	80005e3c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005e38:	0014849b          	addiw	s1,s1,1
    80005e3c:	0324d263          	bge	s1,s2,80005e60 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005e40:	00349793          	slli	a5,s1,0x3
    80005e44:	00f987b3          	add	a5,s3,a5
    80005e48:	0007b503          	ld	a0,0(a5)
    80005e4c:	fe0506e3          	beqz	a0,80005e38 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005e50:	00053783          	ld	a5,0(a0)
    80005e54:	0087b783          	ld	a5,8(a5)
    80005e58:	000780e7          	jalr	a5
    80005e5c:	fddff06f          	j	80005e38 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005e60:	000b0a63          	beqz	s6,80005e74 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005e64:	000b3783          	ld	a5,0(s6)
    80005e68:	0087b783          	ld	a5,8(a5)
    80005e6c:	000b0513          	mv	a0,s6
    80005e70:	000780e7          	jalr	a5
    delete waitForAll;
    80005e74:	00007517          	auipc	a0,0x7
    80005e78:	e9453503          	ld	a0,-364(a0) # 8000cd08 <_ZL10waitForAll>
    80005e7c:	00050863          	beqz	a0,80005e8c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005e80:	00053783          	ld	a5,0(a0)
    80005e84:	0087b783          	ld	a5,8(a5)
    80005e88:	000780e7          	jalr	a5
    delete buffer;
    80005e8c:	000a8e63          	beqz	s5,80005ea8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005e90:	000a8513          	mv	a0,s5
    80005e94:	00000097          	auipc	ra,0x0
    80005e98:	5d8080e7          	jalr	1496(ra) # 8000646c <_ZN9BufferCPPD1Ev>
    80005e9c:	000a8513          	mv	a0,s5
    80005ea0:	ffffd097          	auipc	ra,0xffffd
    80005ea4:	8b4080e7          	jalr	-1868(ra) # 80002754 <_ZdlPv>
    80005ea8:	000b8113          	mv	sp,s7

}
    80005eac:	f8040113          	addi	sp,s0,-128
    80005eb0:	07813083          	ld	ra,120(sp)
    80005eb4:	07013403          	ld	s0,112(sp)
    80005eb8:	06813483          	ld	s1,104(sp)
    80005ebc:	06013903          	ld	s2,96(sp)
    80005ec0:	05813983          	ld	s3,88(sp)
    80005ec4:	05013a03          	ld	s4,80(sp)
    80005ec8:	04813a83          	ld	s5,72(sp)
    80005ecc:	04013b03          	ld	s6,64(sp)
    80005ed0:	03813b83          	ld	s7,56(sp)
    80005ed4:	03013c03          	ld	s8,48(sp)
    80005ed8:	02813c83          	ld	s9,40(sp)
    80005edc:	08010113          	addi	sp,sp,128
    80005ee0:	00008067          	ret
    80005ee4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005ee8:	000a8513          	mv	a0,s5
    80005eec:	ffffd097          	auipc	ra,0xffffd
    80005ef0:	868080e7          	jalr	-1944(ra) # 80002754 <_ZdlPv>
    80005ef4:	00048513          	mv	a0,s1
    80005ef8:	00008097          	auipc	ra,0x8
    80005efc:	ef0080e7          	jalr	-272(ra) # 8000dde8 <_Unwind_Resume>
    80005f00:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005f04:	00048513          	mv	a0,s1
    80005f08:	ffffd097          	auipc	ra,0xffffd
    80005f0c:	84c080e7          	jalr	-1972(ra) # 80002754 <_ZdlPv>
    80005f10:	00090513          	mv	a0,s2
    80005f14:	00008097          	auipc	ra,0x8
    80005f18:	ed4080e7          	jalr	-300(ra) # 8000dde8 <_Unwind_Resume>
    80005f1c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005f20:	000b0513          	mv	a0,s6
    80005f24:	ffffd097          	auipc	ra,0xffffd
    80005f28:	830080e7          	jalr	-2000(ra) # 80002754 <_ZdlPv>
    80005f2c:	00048513          	mv	a0,s1
    80005f30:	00008097          	auipc	ra,0x8
    80005f34:	eb8080e7          	jalr	-328(ra) # 8000dde8 <_Unwind_Resume>
    80005f38:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005f3c:	000c8513          	mv	a0,s9
    80005f40:	ffffd097          	auipc	ra,0xffffd
    80005f44:	814080e7          	jalr	-2028(ra) # 80002754 <_ZdlPv>
    80005f48:	00048513          	mv	a0,s1
    80005f4c:	00008097          	auipc	ra,0x8
    80005f50:	e9c080e7          	jalr	-356(ra) # 8000dde8 <_Unwind_Resume>
    80005f54:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005f58:	000c8513          	mv	a0,s9
    80005f5c:	ffffc097          	auipc	ra,0xffffc
    80005f60:	7f8080e7          	jalr	2040(ra) # 80002754 <_ZdlPv>
    80005f64:	00048513          	mv	a0,s1
    80005f68:	00008097          	auipc	ra,0x8
    80005f6c:	e80080e7          	jalr	-384(ra) # 8000dde8 <_Unwind_Resume>

0000000080005f70 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005f70:	ff010113          	addi	sp,sp,-16
    80005f74:	00113423          	sd	ra,8(sp)
    80005f78:	00813023          	sd	s0,0(sp)
    80005f7c:	01010413          	addi	s0,sp,16
    80005f80:	00007797          	auipc	a5,0x7
    80005f84:	bf078793          	addi	a5,a5,-1040 # 8000cb70 <_ZTV12ConsumerSync+0x10>
    80005f88:	00f53023          	sd	a5,0(a0)
    80005f8c:	ffffc097          	auipc	ra,0xffffc
    80005f90:	6e4080e7          	jalr	1764(ra) # 80002670 <_ZN6ThreadD1Ev>
    80005f94:	00813083          	ld	ra,8(sp)
    80005f98:	00013403          	ld	s0,0(sp)
    80005f9c:	01010113          	addi	sp,sp,16
    80005fa0:	00008067          	ret

0000000080005fa4 <_ZN12ConsumerSyncD0Ev>:
    80005fa4:	fe010113          	addi	sp,sp,-32
    80005fa8:	00113c23          	sd	ra,24(sp)
    80005fac:	00813823          	sd	s0,16(sp)
    80005fb0:	00913423          	sd	s1,8(sp)
    80005fb4:	02010413          	addi	s0,sp,32
    80005fb8:	00050493          	mv	s1,a0
    80005fbc:	00007797          	auipc	a5,0x7
    80005fc0:	bb478793          	addi	a5,a5,-1100 # 8000cb70 <_ZTV12ConsumerSync+0x10>
    80005fc4:	00f53023          	sd	a5,0(a0)
    80005fc8:	ffffc097          	auipc	ra,0xffffc
    80005fcc:	6a8080e7          	jalr	1704(ra) # 80002670 <_ZN6ThreadD1Ev>
    80005fd0:	00048513          	mv	a0,s1
    80005fd4:	ffffc097          	auipc	ra,0xffffc
    80005fd8:	780080e7          	jalr	1920(ra) # 80002754 <_ZdlPv>
    80005fdc:	01813083          	ld	ra,24(sp)
    80005fe0:	01013403          	ld	s0,16(sp)
    80005fe4:	00813483          	ld	s1,8(sp)
    80005fe8:	02010113          	addi	sp,sp,32
    80005fec:	00008067          	ret

0000000080005ff0 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005ff0:	ff010113          	addi	sp,sp,-16
    80005ff4:	00113423          	sd	ra,8(sp)
    80005ff8:	00813023          	sd	s0,0(sp)
    80005ffc:	01010413          	addi	s0,sp,16
    80006000:	00007797          	auipc	a5,0x7
    80006004:	b4878793          	addi	a5,a5,-1208 # 8000cb48 <_ZTV12ProducerSync+0x10>
    80006008:	00f53023          	sd	a5,0(a0)
    8000600c:	ffffc097          	auipc	ra,0xffffc
    80006010:	664080e7          	jalr	1636(ra) # 80002670 <_ZN6ThreadD1Ev>
    80006014:	00813083          	ld	ra,8(sp)
    80006018:	00013403          	ld	s0,0(sp)
    8000601c:	01010113          	addi	sp,sp,16
    80006020:	00008067          	ret

0000000080006024 <_ZN12ProducerSyncD0Ev>:
    80006024:	fe010113          	addi	sp,sp,-32
    80006028:	00113c23          	sd	ra,24(sp)
    8000602c:	00813823          	sd	s0,16(sp)
    80006030:	00913423          	sd	s1,8(sp)
    80006034:	02010413          	addi	s0,sp,32
    80006038:	00050493          	mv	s1,a0
    8000603c:	00007797          	auipc	a5,0x7
    80006040:	b0c78793          	addi	a5,a5,-1268 # 8000cb48 <_ZTV12ProducerSync+0x10>
    80006044:	00f53023          	sd	a5,0(a0)
    80006048:	ffffc097          	auipc	ra,0xffffc
    8000604c:	628080e7          	jalr	1576(ra) # 80002670 <_ZN6ThreadD1Ev>
    80006050:	00048513          	mv	a0,s1
    80006054:	ffffc097          	auipc	ra,0xffffc
    80006058:	700080e7          	jalr	1792(ra) # 80002754 <_ZdlPv>
    8000605c:	01813083          	ld	ra,24(sp)
    80006060:	01013403          	ld	s0,16(sp)
    80006064:	00813483          	ld	s1,8(sp)
    80006068:	02010113          	addi	sp,sp,32
    8000606c:	00008067          	ret

0000000080006070 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80006070:	ff010113          	addi	sp,sp,-16
    80006074:	00113423          	sd	ra,8(sp)
    80006078:	00813023          	sd	s0,0(sp)
    8000607c:	01010413          	addi	s0,sp,16
    80006080:	00007797          	auipc	a5,0x7
    80006084:	aa078793          	addi	a5,a5,-1376 # 8000cb20 <_ZTV16ProducerKeyboard+0x10>
    80006088:	00f53023          	sd	a5,0(a0)
    8000608c:	ffffc097          	auipc	ra,0xffffc
    80006090:	5e4080e7          	jalr	1508(ra) # 80002670 <_ZN6ThreadD1Ev>
    80006094:	00813083          	ld	ra,8(sp)
    80006098:	00013403          	ld	s0,0(sp)
    8000609c:	01010113          	addi	sp,sp,16
    800060a0:	00008067          	ret

00000000800060a4 <_ZN16ProducerKeyboardD0Ev>:
    800060a4:	fe010113          	addi	sp,sp,-32
    800060a8:	00113c23          	sd	ra,24(sp)
    800060ac:	00813823          	sd	s0,16(sp)
    800060b0:	00913423          	sd	s1,8(sp)
    800060b4:	02010413          	addi	s0,sp,32
    800060b8:	00050493          	mv	s1,a0
    800060bc:	00007797          	auipc	a5,0x7
    800060c0:	a6478793          	addi	a5,a5,-1436 # 8000cb20 <_ZTV16ProducerKeyboard+0x10>
    800060c4:	00f53023          	sd	a5,0(a0)
    800060c8:	ffffc097          	auipc	ra,0xffffc
    800060cc:	5a8080e7          	jalr	1448(ra) # 80002670 <_ZN6ThreadD1Ev>
    800060d0:	00048513          	mv	a0,s1
    800060d4:	ffffc097          	auipc	ra,0xffffc
    800060d8:	680080e7          	jalr	1664(ra) # 80002754 <_ZdlPv>
    800060dc:	01813083          	ld	ra,24(sp)
    800060e0:	01013403          	ld	s0,16(sp)
    800060e4:	00813483          	ld	s1,8(sp)
    800060e8:	02010113          	addi	sp,sp,32
    800060ec:	00008067          	ret

00000000800060f0 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800060f0:	ff010113          	addi	sp,sp,-16
    800060f4:	00113423          	sd	ra,8(sp)
    800060f8:	00813023          	sd	s0,0(sp)
    800060fc:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80006100:	02053583          	ld	a1,32(a0)
    80006104:	fffff097          	auipc	ra,0xfffff
    80006108:	7e4080e7          	jalr	2020(ra) # 800058e8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000610c:	00813083          	ld	ra,8(sp)
    80006110:	00013403          	ld	s0,0(sp)
    80006114:	01010113          	addi	sp,sp,16
    80006118:	00008067          	ret

000000008000611c <_ZN12ProducerSync3runEv>:
    void run() override {
    8000611c:	ff010113          	addi	sp,sp,-16
    80006120:	00113423          	sd	ra,8(sp)
    80006124:	00813023          	sd	s0,0(sp)
    80006128:	01010413          	addi	s0,sp,16
        producer(td);
    8000612c:	02053583          	ld	a1,32(a0)
    80006130:	00000097          	auipc	ra,0x0
    80006134:	878080e7          	jalr	-1928(ra) # 800059a8 <_ZN12ProducerSync8producerEPv>
    }
    80006138:	00813083          	ld	ra,8(sp)
    8000613c:	00013403          	ld	s0,0(sp)
    80006140:	01010113          	addi	sp,sp,16
    80006144:	00008067          	ret

0000000080006148 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80006148:	ff010113          	addi	sp,sp,-16
    8000614c:	00113423          	sd	ra,8(sp)
    80006150:	00813023          	sd	s0,0(sp)
    80006154:	01010413          	addi	s0,sp,16
        consumer(td);
    80006158:	02053583          	ld	a1,32(a0)
    8000615c:	00000097          	auipc	ra,0x0
    80006160:	8e0080e7          	jalr	-1824(ra) # 80005a3c <_ZN12ConsumerSync8consumerEPv>
    }
    80006164:	00813083          	ld	ra,8(sp)
    80006168:	00013403          	ld	s0,0(sp)
    8000616c:	01010113          	addi	sp,sp,16
    80006170:	00008067          	ret

0000000080006174 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006174:	fd010113          	addi	sp,sp,-48
    80006178:	02113423          	sd	ra,40(sp)
    8000617c:	02813023          	sd	s0,32(sp)
    80006180:	00913c23          	sd	s1,24(sp)
    80006184:	01213823          	sd	s2,16(sp)
    80006188:	01313423          	sd	s3,8(sp)
    8000618c:	03010413          	addi	s0,sp,48
    80006190:	00050493          	mv	s1,a0
    80006194:	00058913          	mv	s2,a1
    80006198:	0015879b          	addiw	a5,a1,1
    8000619c:	0007851b          	sext.w	a0,a5
    800061a0:	00f4a023          	sw	a5,0(s1)
    800061a4:	0004a823          	sw	zero,16(s1)
    800061a8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800061ac:	00251513          	slli	a0,a0,0x2
    800061b0:	ffffb097          	auipc	ra,0xffffb
    800061b4:	0a8080e7          	jalr	168(ra) # 80001258 <_Z9mem_allocm>
    800061b8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800061bc:	01000513          	li	a0,16
    800061c0:	ffffc097          	auipc	ra,0xffffc
    800061c4:	544080e7          	jalr	1348(ra) # 80002704 <_Znwm>
    800061c8:	00050993          	mv	s3,a0
    800061cc:	00000593          	li	a1,0
    800061d0:	ffffc097          	auipc	ra,0xffffc
    800061d4:	7b4080e7          	jalr	1972(ra) # 80002984 <_ZN9SemaphoreC1Ej>
    800061d8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800061dc:	01000513          	li	a0,16
    800061e0:	ffffc097          	auipc	ra,0xffffc
    800061e4:	524080e7          	jalr	1316(ra) # 80002704 <_Znwm>
    800061e8:	00050993          	mv	s3,a0
    800061ec:	00090593          	mv	a1,s2
    800061f0:	ffffc097          	auipc	ra,0xffffc
    800061f4:	794080e7          	jalr	1940(ra) # 80002984 <_ZN9SemaphoreC1Ej>
    800061f8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800061fc:	01000513          	li	a0,16
    80006200:	ffffc097          	auipc	ra,0xffffc
    80006204:	504080e7          	jalr	1284(ra) # 80002704 <_Znwm>
    80006208:	00050913          	mv	s2,a0
    8000620c:	00100593          	li	a1,1
    80006210:	ffffc097          	auipc	ra,0xffffc
    80006214:	774080e7          	jalr	1908(ra) # 80002984 <_ZN9SemaphoreC1Ej>
    80006218:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000621c:	01000513          	li	a0,16
    80006220:	ffffc097          	auipc	ra,0xffffc
    80006224:	4e4080e7          	jalr	1252(ra) # 80002704 <_Znwm>
    80006228:	00050913          	mv	s2,a0
    8000622c:	00100593          	li	a1,1
    80006230:	ffffc097          	auipc	ra,0xffffc
    80006234:	754080e7          	jalr	1876(ra) # 80002984 <_ZN9SemaphoreC1Ej>
    80006238:	0324b823          	sd	s2,48(s1)
}
    8000623c:	02813083          	ld	ra,40(sp)
    80006240:	02013403          	ld	s0,32(sp)
    80006244:	01813483          	ld	s1,24(sp)
    80006248:	01013903          	ld	s2,16(sp)
    8000624c:	00813983          	ld	s3,8(sp)
    80006250:	03010113          	addi	sp,sp,48
    80006254:	00008067          	ret
    80006258:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000625c:	00098513          	mv	a0,s3
    80006260:	ffffc097          	auipc	ra,0xffffc
    80006264:	4f4080e7          	jalr	1268(ra) # 80002754 <_ZdlPv>
    80006268:	00048513          	mv	a0,s1
    8000626c:	00008097          	auipc	ra,0x8
    80006270:	b7c080e7          	jalr	-1156(ra) # 8000dde8 <_Unwind_Resume>
    80006274:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006278:	00098513          	mv	a0,s3
    8000627c:	ffffc097          	auipc	ra,0xffffc
    80006280:	4d8080e7          	jalr	1240(ra) # 80002754 <_ZdlPv>
    80006284:	00048513          	mv	a0,s1
    80006288:	00008097          	auipc	ra,0x8
    8000628c:	b60080e7          	jalr	-1184(ra) # 8000dde8 <_Unwind_Resume>
    80006290:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006294:	00090513          	mv	a0,s2
    80006298:	ffffc097          	auipc	ra,0xffffc
    8000629c:	4bc080e7          	jalr	1212(ra) # 80002754 <_ZdlPv>
    800062a0:	00048513          	mv	a0,s1
    800062a4:	00008097          	auipc	ra,0x8
    800062a8:	b44080e7          	jalr	-1212(ra) # 8000dde8 <_Unwind_Resume>
    800062ac:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800062b0:	00090513          	mv	a0,s2
    800062b4:	ffffc097          	auipc	ra,0xffffc
    800062b8:	4a0080e7          	jalr	1184(ra) # 80002754 <_ZdlPv>
    800062bc:	00048513          	mv	a0,s1
    800062c0:	00008097          	auipc	ra,0x8
    800062c4:	b28080e7          	jalr	-1240(ra) # 8000dde8 <_Unwind_Resume>

00000000800062c8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800062c8:	fe010113          	addi	sp,sp,-32
    800062cc:	00113c23          	sd	ra,24(sp)
    800062d0:	00813823          	sd	s0,16(sp)
    800062d4:	00913423          	sd	s1,8(sp)
    800062d8:	01213023          	sd	s2,0(sp)
    800062dc:	02010413          	addi	s0,sp,32
    800062e0:	00050493          	mv	s1,a0
    800062e4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800062e8:	01853503          	ld	a0,24(a0)
    800062ec:	ffffc097          	auipc	ra,0xffffc
    800062f0:	6d0080e7          	jalr	1744(ra) # 800029bc <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800062f4:	0304b503          	ld	a0,48(s1)
    800062f8:	ffffc097          	auipc	ra,0xffffc
    800062fc:	6c4080e7          	jalr	1732(ra) # 800029bc <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006300:	0084b783          	ld	a5,8(s1)
    80006304:	0144a703          	lw	a4,20(s1)
    80006308:	00271713          	slli	a4,a4,0x2
    8000630c:	00e787b3          	add	a5,a5,a4
    80006310:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006314:	0144a783          	lw	a5,20(s1)
    80006318:	0017879b          	addiw	a5,a5,1
    8000631c:	0004a703          	lw	a4,0(s1)
    80006320:	02e7e7bb          	remw	a5,a5,a4
    80006324:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006328:	0304b503          	ld	a0,48(s1)
    8000632c:	ffffc097          	auipc	ra,0xffffc
    80006330:	6bc080e7          	jalr	1724(ra) # 800029e8 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006334:	0204b503          	ld	a0,32(s1)
    80006338:	ffffc097          	auipc	ra,0xffffc
    8000633c:	6b0080e7          	jalr	1712(ra) # 800029e8 <_ZN9Semaphore6signalEv>

}
    80006340:	01813083          	ld	ra,24(sp)
    80006344:	01013403          	ld	s0,16(sp)
    80006348:	00813483          	ld	s1,8(sp)
    8000634c:	00013903          	ld	s2,0(sp)
    80006350:	02010113          	addi	sp,sp,32
    80006354:	00008067          	ret

0000000080006358 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006358:	fe010113          	addi	sp,sp,-32
    8000635c:	00113c23          	sd	ra,24(sp)
    80006360:	00813823          	sd	s0,16(sp)
    80006364:	00913423          	sd	s1,8(sp)
    80006368:	01213023          	sd	s2,0(sp)
    8000636c:	02010413          	addi	s0,sp,32
    80006370:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006374:	02053503          	ld	a0,32(a0)
    80006378:	ffffc097          	auipc	ra,0xffffc
    8000637c:	644080e7          	jalr	1604(ra) # 800029bc <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006380:	0284b503          	ld	a0,40(s1)
    80006384:	ffffc097          	auipc	ra,0xffffc
    80006388:	638080e7          	jalr	1592(ra) # 800029bc <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000638c:	0084b703          	ld	a4,8(s1)
    80006390:	0104a783          	lw	a5,16(s1)
    80006394:	00279693          	slli	a3,a5,0x2
    80006398:	00d70733          	add	a4,a4,a3
    8000639c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800063a0:	0017879b          	addiw	a5,a5,1
    800063a4:	0004a703          	lw	a4,0(s1)
    800063a8:	02e7e7bb          	remw	a5,a5,a4
    800063ac:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800063b0:	0284b503          	ld	a0,40(s1)
    800063b4:	ffffc097          	auipc	ra,0xffffc
    800063b8:	634080e7          	jalr	1588(ra) # 800029e8 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800063bc:	0184b503          	ld	a0,24(s1)
    800063c0:	ffffc097          	auipc	ra,0xffffc
    800063c4:	628080e7          	jalr	1576(ra) # 800029e8 <_ZN9Semaphore6signalEv>

    return ret;
}
    800063c8:	00090513          	mv	a0,s2
    800063cc:	01813083          	ld	ra,24(sp)
    800063d0:	01013403          	ld	s0,16(sp)
    800063d4:	00813483          	ld	s1,8(sp)
    800063d8:	00013903          	ld	s2,0(sp)
    800063dc:	02010113          	addi	sp,sp,32
    800063e0:	00008067          	ret

00000000800063e4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800063e4:	fe010113          	addi	sp,sp,-32
    800063e8:	00113c23          	sd	ra,24(sp)
    800063ec:	00813823          	sd	s0,16(sp)
    800063f0:	00913423          	sd	s1,8(sp)
    800063f4:	01213023          	sd	s2,0(sp)
    800063f8:	02010413          	addi	s0,sp,32
    800063fc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006400:	02853503          	ld	a0,40(a0)
    80006404:	ffffc097          	auipc	ra,0xffffc
    80006408:	5b8080e7          	jalr	1464(ra) # 800029bc <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    8000640c:	0304b503          	ld	a0,48(s1)
    80006410:	ffffc097          	auipc	ra,0xffffc
    80006414:	5ac080e7          	jalr	1452(ra) # 800029bc <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80006418:	0144a783          	lw	a5,20(s1)
    8000641c:	0104a903          	lw	s2,16(s1)
    80006420:	0327ce63          	blt	a5,s2,8000645c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006424:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006428:	0304b503          	ld	a0,48(s1)
    8000642c:	ffffc097          	auipc	ra,0xffffc
    80006430:	5bc080e7          	jalr	1468(ra) # 800029e8 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006434:	0284b503          	ld	a0,40(s1)
    80006438:	ffffc097          	auipc	ra,0xffffc
    8000643c:	5b0080e7          	jalr	1456(ra) # 800029e8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006440:	00090513          	mv	a0,s2
    80006444:	01813083          	ld	ra,24(sp)
    80006448:	01013403          	ld	s0,16(sp)
    8000644c:	00813483          	ld	s1,8(sp)
    80006450:	00013903          	ld	s2,0(sp)
    80006454:	02010113          	addi	sp,sp,32
    80006458:	00008067          	ret
        ret = cap - head + tail;
    8000645c:	0004a703          	lw	a4,0(s1)
    80006460:	4127093b          	subw	s2,a4,s2
    80006464:	00f9093b          	addw	s2,s2,a5
    80006468:	fc1ff06f          	j	80006428 <_ZN9BufferCPP6getCntEv+0x44>

000000008000646c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000646c:	fe010113          	addi	sp,sp,-32
    80006470:	00113c23          	sd	ra,24(sp)
    80006474:	00813823          	sd	s0,16(sp)
    80006478:	00913423          	sd	s1,8(sp)
    8000647c:	02010413          	addi	s0,sp,32
    80006480:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006484:	00a00513          	li	a0,10
    80006488:	ffffc097          	auipc	ra,0xffffc
    8000648c:	620080e7          	jalr	1568(ra) # 80002aa8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006490:	00004517          	auipc	a0,0x4
    80006494:	16850513          	addi	a0,a0,360 # 8000a5f8 <CONSOLE_STATUS+0x5e8>
    80006498:	ffffb097          	auipc	ra,0xffffb
    8000649c:	73c080e7          	jalr	1852(ra) # 80001bd4 <_Z11printStringPKc>
    while (getCnt()) {
    800064a0:	00048513          	mv	a0,s1
    800064a4:	00000097          	auipc	ra,0x0
    800064a8:	f40080e7          	jalr	-192(ra) # 800063e4 <_ZN9BufferCPP6getCntEv>
    800064ac:	02050c63          	beqz	a0,800064e4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800064b0:	0084b783          	ld	a5,8(s1)
    800064b4:	0104a703          	lw	a4,16(s1)
    800064b8:	00271713          	slli	a4,a4,0x2
    800064bc:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800064c0:	0007c503          	lbu	a0,0(a5)
    800064c4:	ffffc097          	auipc	ra,0xffffc
    800064c8:	5e4080e7          	jalr	1508(ra) # 80002aa8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800064cc:	0104a783          	lw	a5,16(s1)
    800064d0:	0017879b          	addiw	a5,a5,1
    800064d4:	0004a703          	lw	a4,0(s1)
    800064d8:	02e7e7bb          	remw	a5,a5,a4
    800064dc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800064e0:	fc1ff06f          	j	800064a0 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800064e4:	02100513          	li	a0,33
    800064e8:	ffffc097          	auipc	ra,0xffffc
    800064ec:	5c0080e7          	jalr	1472(ra) # 80002aa8 <_ZN7Console4putcEc>
    Console::putc('\n');
    800064f0:	00a00513          	li	a0,10
    800064f4:	ffffc097          	auipc	ra,0xffffc
    800064f8:	5b4080e7          	jalr	1460(ra) # 80002aa8 <_ZN7Console4putcEc>
    mem_free(buffer);
    800064fc:	0084b503          	ld	a0,8(s1)
    80006500:	ffffb097          	auipc	ra,0xffffb
    80006504:	dc4080e7          	jalr	-572(ra) # 800012c4 <_Z8mem_freePv>
    delete itemAvailable;
    80006508:	0204b503          	ld	a0,32(s1)
    8000650c:	00050863          	beqz	a0,8000651c <_ZN9BufferCPPD1Ev+0xb0>
    80006510:	00053783          	ld	a5,0(a0)
    80006514:	0087b783          	ld	a5,8(a5)
    80006518:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000651c:	0184b503          	ld	a0,24(s1)
    80006520:	00050863          	beqz	a0,80006530 <_ZN9BufferCPPD1Ev+0xc4>
    80006524:	00053783          	ld	a5,0(a0)
    80006528:	0087b783          	ld	a5,8(a5)
    8000652c:	000780e7          	jalr	a5
    delete mutexTail;
    80006530:	0304b503          	ld	a0,48(s1)
    80006534:	00050863          	beqz	a0,80006544 <_ZN9BufferCPPD1Ev+0xd8>
    80006538:	00053783          	ld	a5,0(a0)
    8000653c:	0087b783          	ld	a5,8(a5)
    80006540:	000780e7          	jalr	a5
    delete mutexHead;
    80006544:	0284b503          	ld	a0,40(s1)
    80006548:	00050863          	beqz	a0,80006558 <_ZN9BufferCPPD1Ev+0xec>
    8000654c:	00053783          	ld	a5,0(a0)
    80006550:	0087b783          	ld	a5,8(a5)
    80006554:	000780e7          	jalr	a5
}
    80006558:	01813083          	ld	ra,24(sp)
    8000655c:	01013403          	ld	s0,16(sp)
    80006560:	00813483          	ld	s1,8(sp)
    80006564:	02010113          	addi	sp,sp,32
    80006568:	00008067          	ret

000000008000656c <_ZL9sleepyRunPv>:

#include "../h/printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    8000656c:	fe010113          	addi	sp,sp,-32
    80006570:	00113c23          	sd	ra,24(sp)
    80006574:	00813823          	sd	s0,16(sp)
    80006578:	00913423          	sd	s1,8(sp)
    8000657c:	01213023          	sd	s2,0(sp)
    80006580:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006584:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006588:	00600493          	li	s1,6
    while (--i > 0) {
    8000658c:	fff4849b          	addiw	s1,s1,-1
    80006590:	04905463          	blez	s1,800065d8 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006594:	00004517          	auipc	a0,0x4
    80006598:	07c50513          	addi	a0,a0,124 # 8000a610 <CONSOLE_STATUS+0x600>
    8000659c:	ffffb097          	auipc	ra,0xffffb
    800065a0:	638080e7          	jalr	1592(ra) # 80001bd4 <_Z11printStringPKc>
        printInt(sleep_time);
    800065a4:	00000613          	li	a2,0
    800065a8:	00a00593          	li	a1,10
    800065ac:	0009051b          	sext.w	a0,s2
    800065b0:	ffffc097          	auipc	ra,0xffffc
    800065b4:	85c080e7          	jalr	-1956(ra) # 80001e0c <_Z8printIntiii>
        printString(" !\n");
    800065b8:	00004517          	auipc	a0,0x4
    800065bc:	06050513          	addi	a0,a0,96 # 8000a618 <CONSOLE_STATUS+0x608>
    800065c0:	ffffb097          	auipc	ra,0xffffb
    800065c4:	614080e7          	jalr	1556(ra) # 80001bd4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800065c8:	00090513          	mv	a0,s2
    800065cc:	ffffb097          	auipc	ra,0xffffb
    800065d0:	0f8080e7          	jalr	248(ra) # 800016c4 <_Z10time_sleepm>
    while (--i > 0) {
    800065d4:	fb9ff06f          	j	8000658c <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800065d8:	00a00793          	li	a5,10
    800065dc:	02f95933          	divu	s2,s2,a5
    800065e0:	fff90913          	addi	s2,s2,-1
    800065e4:	00006797          	auipc	a5,0x6
    800065e8:	72c78793          	addi	a5,a5,1836 # 8000cd10 <_ZL8finished>
    800065ec:	01278933          	add	s2,a5,s2
    800065f0:	00100793          	li	a5,1
    800065f4:	00f90023          	sb	a5,0(s2)
}
    800065f8:	01813083          	ld	ra,24(sp)
    800065fc:	01013403          	ld	s0,16(sp)
    80006600:	00813483          	ld	s1,8(sp)
    80006604:	00013903          	ld	s2,0(sp)
    80006608:	02010113          	addi	sp,sp,32
    8000660c:	00008067          	ret

0000000080006610 <_Z12testSleepingv>:

void testSleeping() {
    80006610:	fc010113          	addi	sp,sp,-64
    80006614:	02113c23          	sd	ra,56(sp)
    80006618:	02813823          	sd	s0,48(sp)
    8000661c:	02913423          	sd	s1,40(sp)
    80006620:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006624:	00a00793          	li	a5,10
    80006628:	fcf43823          	sd	a5,-48(s0)
    8000662c:	01400793          	li	a5,20
    80006630:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006634:	00000493          	li	s1,0
    80006638:	02c0006f          	j	80006664 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    8000663c:	00349793          	slli	a5,s1,0x3
    80006640:	fd040613          	addi	a2,s0,-48
    80006644:	00f60633          	add	a2,a2,a5
    80006648:	00000597          	auipc	a1,0x0
    8000664c:	f2458593          	addi	a1,a1,-220 # 8000656c <_ZL9sleepyRunPv>
    80006650:	fc040513          	addi	a0,s0,-64
    80006654:	00f50533          	add	a0,a0,a5
    80006658:	ffffb097          	auipc	ra,0xffffb
    8000665c:	d7c080e7          	jalr	-644(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006660:	0014849b          	addiw	s1,s1,1
    80006664:	00100793          	li	a5,1
    80006668:	fc97dae3          	bge	a5,s1,8000663c <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    8000666c:	00006797          	auipc	a5,0x6
    80006670:	6a47c783          	lbu	a5,1700(a5) # 8000cd10 <_ZL8finished>
    80006674:	fe078ce3          	beqz	a5,8000666c <_Z12testSleepingv+0x5c>
    80006678:	00006797          	auipc	a5,0x6
    8000667c:	6997c783          	lbu	a5,1689(a5) # 8000cd11 <_ZL8finished+0x1>
    80006680:	fe0786e3          	beqz	a5,8000666c <_Z12testSleepingv+0x5c>
}
    80006684:	03813083          	ld	ra,56(sp)
    80006688:	03013403          	ld	s0,48(sp)
    8000668c:	02813483          	ld	s1,40(sp)
    80006690:	04010113          	addi	sp,sp,64
    80006694:	00008067          	ret

0000000080006698 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006698:	fe010113          	addi	sp,sp,-32
    8000669c:	00113c23          	sd	ra,24(sp)
    800066a0:	00813823          	sd	s0,16(sp)
    800066a4:	00913423          	sd	s1,8(sp)
    800066a8:	01213023          	sd	s2,0(sp)
    800066ac:	02010413          	addi	s0,sp,32
    800066b0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800066b4:	00100793          	li	a5,1
    800066b8:	02a7f863          	bgeu	a5,a0,800066e8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800066bc:	00a00793          	li	a5,10
    800066c0:	02f577b3          	remu	a5,a0,a5
    800066c4:	02078e63          	beqz	a5,80006700 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800066c8:	fff48513          	addi	a0,s1,-1
    800066cc:	00000097          	auipc	ra,0x0
    800066d0:	fcc080e7          	jalr	-52(ra) # 80006698 <_ZL9fibonaccim>
    800066d4:	00050913          	mv	s2,a0
    800066d8:	ffe48513          	addi	a0,s1,-2
    800066dc:	00000097          	auipc	ra,0x0
    800066e0:	fbc080e7          	jalr	-68(ra) # 80006698 <_ZL9fibonaccim>
    800066e4:	00a90533          	add	a0,s2,a0
}
    800066e8:	01813083          	ld	ra,24(sp)
    800066ec:	01013403          	ld	s0,16(sp)
    800066f0:	00813483          	ld	s1,8(sp)
    800066f4:	00013903          	ld	s2,0(sp)
    800066f8:	02010113          	addi	sp,sp,32
    800066fc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006700:	ffffb097          	auipc	ra,0xffffb
    80006704:	de0080e7          	jalr	-544(ra) # 800014e0 <_Z15thread_dispatchv>
    80006708:	fc1ff06f          	j	800066c8 <_ZL9fibonaccim+0x30>

000000008000670c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000670c:	fe010113          	addi	sp,sp,-32
    80006710:	00113c23          	sd	ra,24(sp)
    80006714:	00813823          	sd	s0,16(sp)
    80006718:	00913423          	sd	s1,8(sp)
    8000671c:	01213023          	sd	s2,0(sp)
    80006720:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006724:	00a00493          	li	s1,10
    80006728:	0400006f          	j	80006768 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000672c:	00004517          	auipc	a0,0x4
    80006730:	e3450513          	addi	a0,a0,-460 # 8000a560 <CONSOLE_STATUS+0x550>
    80006734:	ffffb097          	auipc	ra,0xffffb
    80006738:	4a0080e7          	jalr	1184(ra) # 80001bd4 <_Z11printStringPKc>
    8000673c:	00000613          	li	a2,0
    80006740:	00a00593          	li	a1,10
    80006744:	00048513          	mv	a0,s1
    80006748:	ffffb097          	auipc	ra,0xffffb
    8000674c:	6c4080e7          	jalr	1732(ra) # 80001e0c <_Z8printIntiii>
    80006750:	00004517          	auipc	a0,0x4
    80006754:	b9050513          	addi	a0,a0,-1136 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006758:	ffffb097          	auipc	ra,0xffffb
    8000675c:	47c080e7          	jalr	1148(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006760:	0014849b          	addiw	s1,s1,1
    80006764:	0ff4f493          	andi	s1,s1,255
    80006768:	00c00793          	li	a5,12
    8000676c:	fc97f0e3          	bgeu	a5,s1,8000672c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006770:	00004517          	auipc	a0,0x4
    80006774:	df850513          	addi	a0,a0,-520 # 8000a568 <CONSOLE_STATUS+0x558>
    80006778:	ffffb097          	auipc	ra,0xffffb
    8000677c:	45c080e7          	jalr	1116(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006780:	00500313          	li	t1,5
    thread_dispatch();
    80006784:	ffffb097          	auipc	ra,0xffffb
    80006788:	d5c080e7          	jalr	-676(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000678c:	01000513          	li	a0,16
    80006790:	00000097          	auipc	ra,0x0
    80006794:	f08080e7          	jalr	-248(ra) # 80006698 <_ZL9fibonaccim>
    80006798:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000679c:	00004517          	auipc	a0,0x4
    800067a0:	ddc50513          	addi	a0,a0,-548 # 8000a578 <CONSOLE_STATUS+0x568>
    800067a4:	ffffb097          	auipc	ra,0xffffb
    800067a8:	430080e7          	jalr	1072(ra) # 80001bd4 <_Z11printStringPKc>
    800067ac:	00000613          	li	a2,0
    800067b0:	00a00593          	li	a1,10
    800067b4:	0009051b          	sext.w	a0,s2
    800067b8:	ffffb097          	auipc	ra,0xffffb
    800067bc:	654080e7          	jalr	1620(ra) # 80001e0c <_Z8printIntiii>
    800067c0:	00004517          	auipc	a0,0x4
    800067c4:	b2050513          	addi	a0,a0,-1248 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800067c8:	ffffb097          	auipc	ra,0xffffb
    800067cc:	40c080e7          	jalr	1036(ra) # 80001bd4 <_Z11printStringPKc>
    800067d0:	0400006f          	j	80006810 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800067d4:	00004517          	auipc	a0,0x4
    800067d8:	d8c50513          	addi	a0,a0,-628 # 8000a560 <CONSOLE_STATUS+0x550>
    800067dc:	ffffb097          	auipc	ra,0xffffb
    800067e0:	3f8080e7          	jalr	1016(ra) # 80001bd4 <_Z11printStringPKc>
    800067e4:	00000613          	li	a2,0
    800067e8:	00a00593          	li	a1,10
    800067ec:	00048513          	mv	a0,s1
    800067f0:	ffffb097          	auipc	ra,0xffffb
    800067f4:	61c080e7          	jalr	1564(ra) # 80001e0c <_Z8printIntiii>
    800067f8:	00004517          	auipc	a0,0x4
    800067fc:	ae850513          	addi	a0,a0,-1304 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006800:	ffffb097          	auipc	ra,0xffffb
    80006804:	3d4080e7          	jalr	980(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006808:	0014849b          	addiw	s1,s1,1
    8000680c:	0ff4f493          	andi	s1,s1,255
    80006810:	00f00793          	li	a5,15
    80006814:	fc97f0e3          	bgeu	a5,s1,800067d4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006818:	00004517          	auipc	a0,0x4
    8000681c:	d7050513          	addi	a0,a0,-656 # 8000a588 <CONSOLE_STATUS+0x578>
    80006820:	ffffb097          	auipc	ra,0xffffb
    80006824:	3b4080e7          	jalr	948(ra) # 80001bd4 <_Z11printStringPKc>
    finishedD = true;
    80006828:	00100793          	li	a5,1
    8000682c:	00006717          	auipc	a4,0x6
    80006830:	4ef70323          	sb	a5,1254(a4) # 8000cd12 <_ZL9finishedD>
    thread_dispatch();
    80006834:	ffffb097          	auipc	ra,0xffffb
    80006838:	cac080e7          	jalr	-852(ra) # 800014e0 <_Z15thread_dispatchv>
}
    8000683c:	01813083          	ld	ra,24(sp)
    80006840:	01013403          	ld	s0,16(sp)
    80006844:	00813483          	ld	s1,8(sp)
    80006848:	00013903          	ld	s2,0(sp)
    8000684c:	02010113          	addi	sp,sp,32
    80006850:	00008067          	ret

0000000080006854 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006854:	fe010113          	addi	sp,sp,-32
    80006858:	00113c23          	sd	ra,24(sp)
    8000685c:	00813823          	sd	s0,16(sp)
    80006860:	00913423          	sd	s1,8(sp)
    80006864:	01213023          	sd	s2,0(sp)
    80006868:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000686c:	00000493          	li	s1,0
    80006870:	0400006f          	j	800068b0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006874:	00004517          	auipc	a0,0x4
    80006878:	cbc50513          	addi	a0,a0,-836 # 8000a530 <CONSOLE_STATUS+0x520>
    8000687c:	ffffb097          	auipc	ra,0xffffb
    80006880:	358080e7          	jalr	856(ra) # 80001bd4 <_Z11printStringPKc>
    80006884:	00000613          	li	a2,0
    80006888:	00a00593          	li	a1,10
    8000688c:	00048513          	mv	a0,s1
    80006890:	ffffb097          	auipc	ra,0xffffb
    80006894:	57c080e7          	jalr	1404(ra) # 80001e0c <_Z8printIntiii>
    80006898:	00004517          	auipc	a0,0x4
    8000689c:	a4850513          	addi	a0,a0,-1464 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800068a0:	ffffb097          	auipc	ra,0xffffb
    800068a4:	334080e7          	jalr	820(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800068a8:	0014849b          	addiw	s1,s1,1
    800068ac:	0ff4f493          	andi	s1,s1,255
    800068b0:	00200793          	li	a5,2
    800068b4:	fc97f0e3          	bgeu	a5,s1,80006874 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800068b8:	00004517          	auipc	a0,0x4
    800068bc:	c8050513          	addi	a0,a0,-896 # 8000a538 <CONSOLE_STATUS+0x528>
    800068c0:	ffffb097          	auipc	ra,0xffffb
    800068c4:	314080e7          	jalr	788(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800068c8:	00700313          	li	t1,7
    thread_dispatch();
    800068cc:	ffffb097          	auipc	ra,0xffffb
    800068d0:	c14080e7          	jalr	-1004(ra) # 800014e0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800068d4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800068d8:	00004517          	auipc	a0,0x4
    800068dc:	c7050513          	addi	a0,a0,-912 # 8000a548 <CONSOLE_STATUS+0x538>
    800068e0:	ffffb097          	auipc	ra,0xffffb
    800068e4:	2f4080e7          	jalr	756(ra) # 80001bd4 <_Z11printStringPKc>
    800068e8:	00000613          	li	a2,0
    800068ec:	00a00593          	li	a1,10
    800068f0:	0009051b          	sext.w	a0,s2
    800068f4:	ffffb097          	auipc	ra,0xffffb
    800068f8:	518080e7          	jalr	1304(ra) # 80001e0c <_Z8printIntiii>
    800068fc:	00004517          	auipc	a0,0x4
    80006900:	9e450513          	addi	a0,a0,-1564 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006904:	ffffb097          	auipc	ra,0xffffb
    80006908:	2d0080e7          	jalr	720(ra) # 80001bd4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000690c:	00c00513          	li	a0,12
    80006910:	00000097          	auipc	ra,0x0
    80006914:	d88080e7          	jalr	-632(ra) # 80006698 <_ZL9fibonaccim>
    80006918:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000691c:	00004517          	auipc	a0,0x4
    80006920:	c3450513          	addi	a0,a0,-972 # 8000a550 <CONSOLE_STATUS+0x540>
    80006924:	ffffb097          	auipc	ra,0xffffb
    80006928:	2b0080e7          	jalr	688(ra) # 80001bd4 <_Z11printStringPKc>
    8000692c:	00000613          	li	a2,0
    80006930:	00a00593          	li	a1,10
    80006934:	0009051b          	sext.w	a0,s2
    80006938:	ffffb097          	auipc	ra,0xffffb
    8000693c:	4d4080e7          	jalr	1236(ra) # 80001e0c <_Z8printIntiii>
    80006940:	00004517          	auipc	a0,0x4
    80006944:	9a050513          	addi	a0,a0,-1632 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006948:	ffffb097          	auipc	ra,0xffffb
    8000694c:	28c080e7          	jalr	652(ra) # 80001bd4 <_Z11printStringPKc>
    80006950:	0400006f          	j	80006990 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006954:	00004517          	auipc	a0,0x4
    80006958:	bdc50513          	addi	a0,a0,-1060 # 8000a530 <CONSOLE_STATUS+0x520>
    8000695c:	ffffb097          	auipc	ra,0xffffb
    80006960:	278080e7          	jalr	632(ra) # 80001bd4 <_Z11printStringPKc>
    80006964:	00000613          	li	a2,0
    80006968:	00a00593          	li	a1,10
    8000696c:	00048513          	mv	a0,s1
    80006970:	ffffb097          	auipc	ra,0xffffb
    80006974:	49c080e7          	jalr	1180(ra) # 80001e0c <_Z8printIntiii>
    80006978:	00004517          	auipc	a0,0x4
    8000697c:	96850513          	addi	a0,a0,-1688 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006980:	ffffb097          	auipc	ra,0xffffb
    80006984:	254080e7          	jalr	596(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006988:	0014849b          	addiw	s1,s1,1
    8000698c:	0ff4f493          	andi	s1,s1,255
    80006990:	00500793          	li	a5,5
    80006994:	fc97f0e3          	bgeu	a5,s1,80006954 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006998:	00004517          	auipc	a0,0x4
    8000699c:	b7050513          	addi	a0,a0,-1168 # 8000a508 <CONSOLE_STATUS+0x4f8>
    800069a0:	ffffb097          	auipc	ra,0xffffb
    800069a4:	234080e7          	jalr	564(ra) # 80001bd4 <_Z11printStringPKc>
    finishedC = true;
    800069a8:	00100793          	li	a5,1
    800069ac:	00006717          	auipc	a4,0x6
    800069b0:	36f703a3          	sb	a5,871(a4) # 8000cd13 <_ZL9finishedC>
    thread_dispatch();
    800069b4:	ffffb097          	auipc	ra,0xffffb
    800069b8:	b2c080e7          	jalr	-1236(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800069bc:	01813083          	ld	ra,24(sp)
    800069c0:	01013403          	ld	s0,16(sp)
    800069c4:	00813483          	ld	s1,8(sp)
    800069c8:	00013903          	ld	s2,0(sp)
    800069cc:	02010113          	addi	sp,sp,32
    800069d0:	00008067          	ret

00000000800069d4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800069d4:	fe010113          	addi	sp,sp,-32
    800069d8:	00113c23          	sd	ra,24(sp)
    800069dc:	00813823          	sd	s0,16(sp)
    800069e0:	00913423          	sd	s1,8(sp)
    800069e4:	01213023          	sd	s2,0(sp)
    800069e8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800069ec:	00000913          	li	s2,0
    800069f0:	0400006f          	j	80006a30 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800069f4:	ffffb097          	auipc	ra,0xffffb
    800069f8:	aec080e7          	jalr	-1300(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800069fc:	00148493          	addi	s1,s1,1
    80006a00:	000027b7          	lui	a5,0x2
    80006a04:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a08:	0097ee63          	bltu	a5,s1,80006a24 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a0c:	00000713          	li	a4,0
    80006a10:	000077b7          	lui	a5,0x7
    80006a14:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a18:	fce7eee3          	bltu	a5,a4,800069f4 <_ZL11workerBodyBPv+0x20>
    80006a1c:	00170713          	addi	a4,a4,1
    80006a20:	ff1ff06f          	j	80006a10 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006a24:	00a00793          	li	a5,10
    80006a28:	04f90663          	beq	s2,a5,80006a74 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006a2c:	00190913          	addi	s2,s2,1
    80006a30:	00f00793          	li	a5,15
    80006a34:	0527e463          	bltu	a5,s2,80006a7c <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006a38:	00004517          	auipc	a0,0x4
    80006a3c:	ae050513          	addi	a0,a0,-1312 # 8000a518 <CONSOLE_STATUS+0x508>
    80006a40:	ffffb097          	auipc	ra,0xffffb
    80006a44:	194080e7          	jalr	404(ra) # 80001bd4 <_Z11printStringPKc>
    80006a48:	00000613          	li	a2,0
    80006a4c:	00a00593          	li	a1,10
    80006a50:	0009051b          	sext.w	a0,s2
    80006a54:	ffffb097          	auipc	ra,0xffffb
    80006a58:	3b8080e7          	jalr	952(ra) # 80001e0c <_Z8printIntiii>
    80006a5c:	00004517          	auipc	a0,0x4
    80006a60:	88450513          	addi	a0,a0,-1916 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006a64:	ffffb097          	auipc	ra,0xffffb
    80006a68:	170080e7          	jalr	368(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a6c:	00000493          	li	s1,0
    80006a70:	f91ff06f          	j	80006a00 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a74:	14102ff3          	csrr	t6,sepc
    80006a78:	fb5ff06f          	j	80006a2c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006a7c:	00004517          	auipc	a0,0x4
    80006a80:	aa450513          	addi	a0,a0,-1372 # 8000a520 <CONSOLE_STATUS+0x510>
    80006a84:	ffffb097          	auipc	ra,0xffffb
    80006a88:	150080e7          	jalr	336(ra) # 80001bd4 <_Z11printStringPKc>
    finishedB = true;
    80006a8c:	00100793          	li	a5,1
    80006a90:	00006717          	auipc	a4,0x6
    80006a94:	28f70223          	sb	a5,644(a4) # 8000cd14 <_ZL9finishedB>
    thread_dispatch();
    80006a98:	ffffb097          	auipc	ra,0xffffb
    80006a9c:	a48080e7          	jalr	-1464(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80006aa0:	01813083          	ld	ra,24(sp)
    80006aa4:	01013403          	ld	s0,16(sp)
    80006aa8:	00813483          	ld	s1,8(sp)
    80006aac:	00013903          	ld	s2,0(sp)
    80006ab0:	02010113          	addi	sp,sp,32
    80006ab4:	00008067          	ret

0000000080006ab8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006ab8:	fe010113          	addi	sp,sp,-32
    80006abc:	00113c23          	sd	ra,24(sp)
    80006ac0:	00813823          	sd	s0,16(sp)
    80006ac4:	00913423          	sd	s1,8(sp)
    80006ac8:	01213023          	sd	s2,0(sp)
    80006acc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006ad0:	00000913          	li	s2,0
    80006ad4:	0380006f          	j	80006b0c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006ad8:	ffffb097          	auipc	ra,0xffffb
    80006adc:	a08080e7          	jalr	-1528(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006ae0:	00148493          	addi	s1,s1,1
    80006ae4:	000027b7          	lui	a5,0x2
    80006ae8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006aec:	0097ee63          	bltu	a5,s1,80006b08 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006af0:	00000713          	li	a4,0
    80006af4:	000077b7          	lui	a5,0x7
    80006af8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006afc:	fce7eee3          	bltu	a5,a4,80006ad8 <_ZL11workerBodyAPv+0x20>
    80006b00:	00170713          	addi	a4,a4,1
    80006b04:	ff1ff06f          	j	80006af4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006b08:	00190913          	addi	s2,s2,1
    80006b0c:	00900793          	li	a5,9
    80006b10:	0527e063          	bltu	a5,s2,80006b50 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006b14:	00004517          	auipc	a0,0x4
    80006b18:	9ec50513          	addi	a0,a0,-1556 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80006b1c:	ffffb097          	auipc	ra,0xffffb
    80006b20:	0b8080e7          	jalr	184(ra) # 80001bd4 <_Z11printStringPKc>
    80006b24:	00000613          	li	a2,0
    80006b28:	00a00593          	li	a1,10
    80006b2c:	0009051b          	sext.w	a0,s2
    80006b30:	ffffb097          	auipc	ra,0xffffb
    80006b34:	2dc080e7          	jalr	732(ra) # 80001e0c <_Z8printIntiii>
    80006b38:	00003517          	auipc	a0,0x3
    80006b3c:	7a850513          	addi	a0,a0,1960 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006b40:	ffffb097          	auipc	ra,0xffffb
    80006b44:	094080e7          	jalr	148(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b48:	00000493          	li	s1,0
    80006b4c:	f99ff06f          	j	80006ae4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006b50:	00004517          	auipc	a0,0x4
    80006b54:	9b850513          	addi	a0,a0,-1608 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80006b58:	ffffb097          	auipc	ra,0xffffb
    80006b5c:	07c080e7          	jalr	124(ra) # 80001bd4 <_Z11printStringPKc>
    finishedA = true;
    80006b60:	00100793          	li	a5,1
    80006b64:	00006717          	auipc	a4,0x6
    80006b68:	1af708a3          	sb	a5,433(a4) # 8000cd15 <_ZL9finishedA>
}
    80006b6c:	01813083          	ld	ra,24(sp)
    80006b70:	01013403          	ld	s0,16(sp)
    80006b74:	00813483          	ld	s1,8(sp)
    80006b78:	00013903          	ld	s2,0(sp)
    80006b7c:	02010113          	addi	sp,sp,32
    80006b80:	00008067          	ret

0000000080006b84 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006b84:	fd010113          	addi	sp,sp,-48
    80006b88:	02113423          	sd	ra,40(sp)
    80006b8c:	02813023          	sd	s0,32(sp)
    80006b90:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006b94:	00000613          	li	a2,0
    80006b98:	00000597          	auipc	a1,0x0
    80006b9c:	f2058593          	addi	a1,a1,-224 # 80006ab8 <_ZL11workerBodyAPv>
    80006ba0:	fd040513          	addi	a0,s0,-48
    80006ba4:	ffffb097          	auipc	ra,0xffffb
    80006ba8:	830080e7          	jalr	-2000(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006bac:	00004517          	auipc	a0,0x4
    80006bb0:	9ec50513          	addi	a0,a0,-1556 # 8000a598 <CONSOLE_STATUS+0x588>
    80006bb4:	ffffb097          	auipc	ra,0xffffb
    80006bb8:	020080e7          	jalr	32(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006bbc:	00000613          	li	a2,0
    80006bc0:	00000597          	auipc	a1,0x0
    80006bc4:	e1458593          	addi	a1,a1,-492 # 800069d4 <_ZL11workerBodyBPv>
    80006bc8:	fd840513          	addi	a0,s0,-40
    80006bcc:	ffffb097          	auipc	ra,0xffffb
    80006bd0:	808080e7          	jalr	-2040(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006bd4:	00004517          	auipc	a0,0x4
    80006bd8:	9dc50513          	addi	a0,a0,-1572 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    80006bdc:	ffffb097          	auipc	ra,0xffffb
    80006be0:	ff8080e7          	jalr	-8(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006be4:	00000613          	li	a2,0
    80006be8:	00000597          	auipc	a1,0x0
    80006bec:	c6c58593          	addi	a1,a1,-916 # 80006854 <_ZL11workerBodyCPv>
    80006bf0:	fe040513          	addi	a0,s0,-32
    80006bf4:	ffffa097          	auipc	ra,0xffffa
    80006bf8:	7e0080e7          	jalr	2016(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006bfc:	00004517          	auipc	a0,0x4
    80006c00:	9cc50513          	addi	a0,a0,-1588 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    80006c04:	ffffb097          	auipc	ra,0xffffb
    80006c08:	fd0080e7          	jalr	-48(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c0c:	00000613          	li	a2,0
    80006c10:	00000597          	auipc	a1,0x0
    80006c14:	afc58593          	addi	a1,a1,-1284 # 8000670c <_ZL11workerBodyDPv>
    80006c18:	fe840513          	addi	a0,s0,-24
    80006c1c:	ffffa097          	auipc	ra,0xffffa
    80006c20:	7b8080e7          	jalr	1976(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006c24:	00004517          	auipc	a0,0x4
    80006c28:	9bc50513          	addi	a0,a0,-1604 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    80006c2c:	ffffb097          	auipc	ra,0xffffb
    80006c30:	fa8080e7          	jalr	-88(ra) # 80001bd4 <_Z11printStringPKc>
    80006c34:	00c0006f          	j	80006c40 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c38:	ffffb097          	auipc	ra,0xffffb
    80006c3c:	8a8080e7          	jalr	-1880(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c40:	00006797          	auipc	a5,0x6
    80006c44:	0d57c783          	lbu	a5,213(a5) # 8000cd15 <_ZL9finishedA>
    80006c48:	fe0788e3          	beqz	a5,80006c38 <_Z16System_Mode_testv+0xb4>
    80006c4c:	00006797          	auipc	a5,0x6
    80006c50:	0c87c783          	lbu	a5,200(a5) # 8000cd14 <_ZL9finishedB>
    80006c54:	fe0782e3          	beqz	a5,80006c38 <_Z16System_Mode_testv+0xb4>
    80006c58:	00006797          	auipc	a5,0x6
    80006c5c:	0bb7c783          	lbu	a5,187(a5) # 8000cd13 <_ZL9finishedC>
    80006c60:	fc078ce3          	beqz	a5,80006c38 <_Z16System_Mode_testv+0xb4>
    80006c64:	00006797          	auipc	a5,0x6
    80006c68:	0ae7c783          	lbu	a5,174(a5) # 8000cd12 <_ZL9finishedD>
    80006c6c:	fc0786e3          	beqz	a5,80006c38 <_Z16System_Mode_testv+0xb4>
    }

}
    80006c70:	02813083          	ld	ra,40(sp)
    80006c74:	02013403          	ld	s0,32(sp)
    80006c78:	03010113          	addi	sp,sp,48
    80006c7c:	00008067          	ret

0000000080006c80 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c80:	fe010113          	addi	sp,sp,-32
    80006c84:	00113c23          	sd	ra,24(sp)
    80006c88:	00813823          	sd	s0,16(sp)
    80006c8c:	00913423          	sd	s1,8(sp)
    80006c90:	01213023          	sd	s2,0(sp)
    80006c94:	02010413          	addi	s0,sp,32
    80006c98:	00050493          	mv	s1,a0
    80006c9c:	00058913          	mv	s2,a1
    80006ca0:	0015879b          	addiw	a5,a1,1
    80006ca4:	0007851b          	sext.w	a0,a5
    80006ca8:	00f4a023          	sw	a5,0(s1)
    80006cac:	0004a823          	sw	zero,16(s1)
    80006cb0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006cb4:	00251513          	slli	a0,a0,0x2
    80006cb8:	ffffa097          	auipc	ra,0xffffa
    80006cbc:	5a0080e7          	jalr	1440(ra) # 80001258 <_Z9mem_allocm>
    80006cc0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006cc4:	00000593          	li	a1,0
    80006cc8:	02048513          	addi	a0,s1,32
    80006ccc:	ffffb097          	auipc	ra,0xffffb
    80006cd0:	854080e7          	jalr	-1964(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&spaceAvailable, _cap);
    80006cd4:	00090593          	mv	a1,s2
    80006cd8:	01848513          	addi	a0,s1,24
    80006cdc:	ffffb097          	auipc	ra,0xffffb
    80006ce0:	844080e7          	jalr	-1980(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&mutexHead, 1);
    80006ce4:	00100593          	li	a1,1
    80006ce8:	02848513          	addi	a0,s1,40
    80006cec:	ffffb097          	auipc	ra,0xffffb
    80006cf0:	834080e7          	jalr	-1996(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&mutexTail, 1);
    80006cf4:	00100593          	li	a1,1
    80006cf8:	03048513          	addi	a0,s1,48
    80006cfc:	ffffb097          	auipc	ra,0xffffb
    80006d00:	824080e7          	jalr	-2012(ra) # 80001520 <_Z8sem_openPP3Semj>
}
    80006d04:	01813083          	ld	ra,24(sp)
    80006d08:	01013403          	ld	s0,16(sp)
    80006d0c:	00813483          	ld	s1,8(sp)
    80006d10:	00013903          	ld	s2,0(sp)
    80006d14:	02010113          	addi	sp,sp,32
    80006d18:	00008067          	ret

0000000080006d1c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006d1c:	fe010113          	addi	sp,sp,-32
    80006d20:	00113c23          	sd	ra,24(sp)
    80006d24:	00813823          	sd	s0,16(sp)
    80006d28:	00913423          	sd	s1,8(sp)
    80006d2c:	01213023          	sd	s2,0(sp)
    80006d30:	02010413          	addi	s0,sp,32
    80006d34:	00050493          	mv	s1,a0
    80006d38:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006d3c:	01853503          	ld	a0,24(a0)
    80006d40:	ffffb097          	auipc	ra,0xffffb
    80006d44:	8b4080e7          	jalr	-1868(ra) # 800015f4 <_Z8sem_waitP3Sem>

    sem_wait(mutexTail);
    80006d48:	0304b503          	ld	a0,48(s1)
    80006d4c:	ffffb097          	auipc	ra,0xffffb
    80006d50:	8a8080e7          	jalr	-1880(ra) # 800015f4 <_Z8sem_waitP3Sem>
    buffer[tail] = val;
    80006d54:	0084b783          	ld	a5,8(s1)
    80006d58:	0144a703          	lw	a4,20(s1)
    80006d5c:	00271713          	slli	a4,a4,0x2
    80006d60:	00e787b3          	add	a5,a5,a4
    80006d64:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d68:	0144a783          	lw	a5,20(s1)
    80006d6c:	0017879b          	addiw	a5,a5,1
    80006d70:	0004a703          	lw	a4,0(s1)
    80006d74:	02e7e7bb          	remw	a5,a5,a4
    80006d78:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006d7c:	0304b503          	ld	a0,48(s1)
    80006d80:	ffffb097          	auipc	ra,0xffffb
    80006d84:	8dc080e7          	jalr	-1828(ra) # 8000165c <_Z10sem_signalP3Sem>

    sem_signal(itemAvailable);
    80006d88:	0204b503          	ld	a0,32(s1)
    80006d8c:	ffffb097          	auipc	ra,0xffffb
    80006d90:	8d0080e7          	jalr	-1840(ra) # 8000165c <_Z10sem_signalP3Sem>

}
    80006d94:	01813083          	ld	ra,24(sp)
    80006d98:	01013403          	ld	s0,16(sp)
    80006d9c:	00813483          	ld	s1,8(sp)
    80006da0:	00013903          	ld	s2,0(sp)
    80006da4:	02010113          	addi	sp,sp,32
    80006da8:	00008067          	ret

0000000080006dac <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006dac:	fe010113          	addi	sp,sp,-32
    80006db0:	00113c23          	sd	ra,24(sp)
    80006db4:	00813823          	sd	s0,16(sp)
    80006db8:	00913423          	sd	s1,8(sp)
    80006dbc:	01213023          	sd	s2,0(sp)
    80006dc0:	02010413          	addi	s0,sp,32
    80006dc4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006dc8:	02053503          	ld	a0,32(a0)
    80006dcc:	ffffb097          	auipc	ra,0xffffb
    80006dd0:	828080e7          	jalr	-2008(ra) # 800015f4 <_Z8sem_waitP3Sem>

    sem_wait(mutexHead);
    80006dd4:	0284b503          	ld	a0,40(s1)
    80006dd8:	ffffb097          	auipc	ra,0xffffb
    80006ddc:	81c080e7          	jalr	-2020(ra) # 800015f4 <_Z8sem_waitP3Sem>

    int ret = buffer[head];
    80006de0:	0084b703          	ld	a4,8(s1)
    80006de4:	0104a783          	lw	a5,16(s1)
    80006de8:	00279693          	slli	a3,a5,0x2
    80006dec:	00d70733          	add	a4,a4,a3
    80006df0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006df4:	0017879b          	addiw	a5,a5,1
    80006df8:	0004a703          	lw	a4,0(s1)
    80006dfc:	02e7e7bb          	remw	a5,a5,a4
    80006e00:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006e04:	0284b503          	ld	a0,40(s1)
    80006e08:	ffffb097          	auipc	ra,0xffffb
    80006e0c:	854080e7          	jalr	-1964(ra) # 8000165c <_Z10sem_signalP3Sem>

    sem_signal(spaceAvailable);
    80006e10:	0184b503          	ld	a0,24(s1)
    80006e14:	ffffb097          	auipc	ra,0xffffb
    80006e18:	848080e7          	jalr	-1976(ra) # 8000165c <_Z10sem_signalP3Sem>

    return ret;
}
    80006e1c:	00090513          	mv	a0,s2
    80006e20:	01813083          	ld	ra,24(sp)
    80006e24:	01013403          	ld	s0,16(sp)
    80006e28:	00813483          	ld	s1,8(sp)
    80006e2c:	00013903          	ld	s2,0(sp)
    80006e30:	02010113          	addi	sp,sp,32
    80006e34:	00008067          	ret

0000000080006e38 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006e38:	fe010113          	addi	sp,sp,-32
    80006e3c:	00113c23          	sd	ra,24(sp)
    80006e40:	00813823          	sd	s0,16(sp)
    80006e44:	00913423          	sd	s1,8(sp)
    80006e48:	01213023          	sd	s2,0(sp)
    80006e4c:	02010413          	addi	s0,sp,32
    80006e50:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006e54:	02853503          	ld	a0,40(a0)
    80006e58:	ffffa097          	auipc	ra,0xffffa
    80006e5c:	79c080e7          	jalr	1948(ra) # 800015f4 <_Z8sem_waitP3Sem>
    sem_wait(mutexTail);
    80006e60:	0304b503          	ld	a0,48(s1)
    80006e64:	ffffa097          	auipc	ra,0xffffa
    80006e68:	790080e7          	jalr	1936(ra) # 800015f4 <_Z8sem_waitP3Sem>

    if (tail >= head) {
    80006e6c:	0144a783          	lw	a5,20(s1)
    80006e70:	0104a903          	lw	s2,16(s1)
    80006e74:	0327ce63          	blt	a5,s2,80006eb0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e78:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006e7c:	0304b503          	ld	a0,48(s1)
    80006e80:	ffffa097          	auipc	ra,0xffffa
    80006e84:	7dc080e7          	jalr	2012(ra) # 8000165c <_Z10sem_signalP3Sem>
    sem_signal(mutexHead);
    80006e88:	0284b503          	ld	a0,40(s1)
    80006e8c:	ffffa097          	auipc	ra,0xffffa
    80006e90:	7d0080e7          	jalr	2000(ra) # 8000165c <_Z10sem_signalP3Sem>

    return ret;
}
    80006e94:	00090513          	mv	a0,s2
    80006e98:	01813083          	ld	ra,24(sp)
    80006e9c:	01013403          	ld	s0,16(sp)
    80006ea0:	00813483          	ld	s1,8(sp)
    80006ea4:	00013903          	ld	s2,0(sp)
    80006ea8:	02010113          	addi	sp,sp,32
    80006eac:	00008067          	ret
        ret = cap - head + tail;
    80006eb0:	0004a703          	lw	a4,0(s1)
    80006eb4:	4127093b          	subw	s2,a4,s2
    80006eb8:	00f9093b          	addw	s2,s2,a5
    80006ebc:	fc1ff06f          	j	80006e7c <_ZN6Buffer6getCntEv+0x44>

0000000080006ec0 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006ec0:	fe010113          	addi	sp,sp,-32
    80006ec4:	00113c23          	sd	ra,24(sp)
    80006ec8:	00813823          	sd	s0,16(sp)
    80006ecc:	00913423          	sd	s1,8(sp)
    80006ed0:	02010413          	addi	s0,sp,32
    80006ed4:	00050493          	mv	s1,a0
    putc('\n');
    80006ed8:	00a00513          	li	a0,10
    80006edc:	ffffb097          	auipc	ra,0xffffb
    80006ee0:	894080e7          	jalr	-1900(ra) # 80001770 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006ee4:	00003517          	auipc	a0,0x3
    80006ee8:	71450513          	addi	a0,a0,1812 # 8000a5f8 <CONSOLE_STATUS+0x5e8>
    80006eec:	ffffb097          	auipc	ra,0xffffb
    80006ef0:	ce8080e7          	jalr	-792(ra) # 80001bd4 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006ef4:	00048513          	mv	a0,s1
    80006ef8:	00000097          	auipc	ra,0x0
    80006efc:	f40080e7          	jalr	-192(ra) # 80006e38 <_ZN6Buffer6getCntEv>
    80006f00:	02a05c63          	blez	a0,80006f38 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006f04:	0084b783          	ld	a5,8(s1)
    80006f08:	0104a703          	lw	a4,16(s1)
    80006f0c:	00271713          	slli	a4,a4,0x2
    80006f10:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006f14:	0007c503          	lbu	a0,0(a5)
    80006f18:	ffffb097          	auipc	ra,0xffffb
    80006f1c:	858080e7          	jalr	-1960(ra) # 80001770 <_Z4putcc>
        head = (head + 1) % cap;
    80006f20:	0104a783          	lw	a5,16(s1)
    80006f24:	0017879b          	addiw	a5,a5,1
    80006f28:	0004a703          	lw	a4,0(s1)
    80006f2c:	02e7e7bb          	remw	a5,a5,a4
    80006f30:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006f34:	fc1ff06f          	j	80006ef4 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006f38:	02100513          	li	a0,33
    80006f3c:	ffffb097          	auipc	ra,0xffffb
    80006f40:	834080e7          	jalr	-1996(ra) # 80001770 <_Z4putcc>
    putc('\n');
    80006f44:	00a00513          	li	a0,10
    80006f48:	ffffb097          	auipc	ra,0xffffb
    80006f4c:	828080e7          	jalr	-2008(ra) # 80001770 <_Z4putcc>
    mem_free(buffer);
    80006f50:	0084b503          	ld	a0,8(s1)
    80006f54:	ffffa097          	auipc	ra,0xffffa
    80006f58:	370080e7          	jalr	880(ra) # 800012c4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006f5c:	0204b503          	ld	a0,32(s1)
    80006f60:	ffffa097          	auipc	ra,0xffffa
    80006f64:	62c080e7          	jalr	1580(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(spaceAvailable);
    80006f68:	0184b503          	ld	a0,24(s1)
    80006f6c:	ffffa097          	auipc	ra,0xffffa
    80006f70:	620080e7          	jalr	1568(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(mutexTail);
    80006f74:	0304b503          	ld	a0,48(s1)
    80006f78:	ffffa097          	auipc	ra,0xffffa
    80006f7c:	614080e7          	jalr	1556(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(mutexHead);
    80006f80:	0284b503          	ld	a0,40(s1)
    80006f84:	ffffa097          	auipc	ra,0xffffa
    80006f88:	608080e7          	jalr	1544(ra) # 8000158c <_Z9sem_closeP3Sem>
}
    80006f8c:	01813083          	ld	ra,24(sp)
    80006f90:	01013403          	ld	s0,16(sp)
    80006f94:	00813483          	ld	s1,8(sp)
    80006f98:	02010113          	addi	sp,sp,32
    80006f9c:	00008067          	ret

0000000080006fa0 <start>:
    80006fa0:	ff010113          	addi	sp,sp,-16
    80006fa4:	00813423          	sd	s0,8(sp)
    80006fa8:	01010413          	addi	s0,sp,16
    80006fac:	300027f3          	csrr	a5,mstatus
    80006fb0:	ffffe737          	lui	a4,0xffffe
    80006fb4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff087f>
    80006fb8:	00e7f7b3          	and	a5,a5,a4
    80006fbc:	00001737          	lui	a4,0x1
    80006fc0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006fc4:	00e7e7b3          	or	a5,a5,a4
    80006fc8:	30079073          	csrw	mstatus,a5
    80006fcc:	00000797          	auipc	a5,0x0
    80006fd0:	16078793          	addi	a5,a5,352 # 8000712c <system_main>
    80006fd4:	34179073          	csrw	mepc,a5
    80006fd8:	00000793          	li	a5,0
    80006fdc:	18079073          	csrw	satp,a5
    80006fe0:	000107b7          	lui	a5,0x10
    80006fe4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006fe8:	30279073          	csrw	medeleg,a5
    80006fec:	30379073          	csrw	mideleg,a5
    80006ff0:	104027f3          	csrr	a5,sie
    80006ff4:	2227e793          	ori	a5,a5,546
    80006ff8:	10479073          	csrw	sie,a5
    80006ffc:	fff00793          	li	a5,-1
    80007000:	00a7d793          	srli	a5,a5,0xa
    80007004:	3b079073          	csrw	pmpaddr0,a5
    80007008:	00f00793          	li	a5,15
    8000700c:	3a079073          	csrw	pmpcfg0,a5
    80007010:	f14027f3          	csrr	a5,mhartid
    80007014:	0200c737          	lui	a4,0x200c
    80007018:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000701c:	0007869b          	sext.w	a3,a5
    80007020:	00269713          	slli	a4,a3,0x2
    80007024:	000f4637          	lui	a2,0xf4
    80007028:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000702c:	00d70733          	add	a4,a4,a3
    80007030:	0037979b          	slliw	a5,a5,0x3
    80007034:	020046b7          	lui	a3,0x2004
    80007038:	00d787b3          	add	a5,a5,a3
    8000703c:	00c585b3          	add	a1,a1,a2
    80007040:	00371693          	slli	a3,a4,0x3
    80007044:	00006717          	auipc	a4,0x6
    80007048:	cdc70713          	addi	a4,a4,-804 # 8000cd20 <timer_scratch>
    8000704c:	00b7b023          	sd	a1,0(a5)
    80007050:	00d70733          	add	a4,a4,a3
    80007054:	00f73c23          	sd	a5,24(a4)
    80007058:	02c73023          	sd	a2,32(a4)
    8000705c:	34071073          	csrw	mscratch,a4
    80007060:	00000797          	auipc	a5,0x0
    80007064:	6e078793          	addi	a5,a5,1760 # 80007740 <timervec>
    80007068:	30579073          	csrw	mtvec,a5
    8000706c:	300027f3          	csrr	a5,mstatus
    80007070:	0087e793          	ori	a5,a5,8
    80007074:	30079073          	csrw	mstatus,a5
    80007078:	304027f3          	csrr	a5,mie
    8000707c:	0807e793          	ori	a5,a5,128
    80007080:	30479073          	csrw	mie,a5
    80007084:	f14027f3          	csrr	a5,mhartid
    80007088:	0007879b          	sext.w	a5,a5
    8000708c:	00078213          	mv	tp,a5
    80007090:	30200073          	mret
    80007094:	00813403          	ld	s0,8(sp)
    80007098:	01010113          	addi	sp,sp,16
    8000709c:	00008067          	ret

00000000800070a0 <timerinit>:
    800070a0:	ff010113          	addi	sp,sp,-16
    800070a4:	00813423          	sd	s0,8(sp)
    800070a8:	01010413          	addi	s0,sp,16
    800070ac:	f14027f3          	csrr	a5,mhartid
    800070b0:	0200c737          	lui	a4,0x200c
    800070b4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800070b8:	0007869b          	sext.w	a3,a5
    800070bc:	00269713          	slli	a4,a3,0x2
    800070c0:	000f4637          	lui	a2,0xf4
    800070c4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800070c8:	00d70733          	add	a4,a4,a3
    800070cc:	0037979b          	slliw	a5,a5,0x3
    800070d0:	020046b7          	lui	a3,0x2004
    800070d4:	00d787b3          	add	a5,a5,a3
    800070d8:	00c585b3          	add	a1,a1,a2
    800070dc:	00371693          	slli	a3,a4,0x3
    800070e0:	00006717          	auipc	a4,0x6
    800070e4:	c4070713          	addi	a4,a4,-960 # 8000cd20 <timer_scratch>
    800070e8:	00b7b023          	sd	a1,0(a5)
    800070ec:	00d70733          	add	a4,a4,a3
    800070f0:	00f73c23          	sd	a5,24(a4)
    800070f4:	02c73023          	sd	a2,32(a4)
    800070f8:	34071073          	csrw	mscratch,a4
    800070fc:	00000797          	auipc	a5,0x0
    80007100:	64478793          	addi	a5,a5,1604 # 80007740 <timervec>
    80007104:	30579073          	csrw	mtvec,a5
    80007108:	300027f3          	csrr	a5,mstatus
    8000710c:	0087e793          	ori	a5,a5,8
    80007110:	30079073          	csrw	mstatus,a5
    80007114:	304027f3          	csrr	a5,mie
    80007118:	0807e793          	ori	a5,a5,128
    8000711c:	30479073          	csrw	mie,a5
    80007120:	00813403          	ld	s0,8(sp)
    80007124:	01010113          	addi	sp,sp,16
    80007128:	00008067          	ret

000000008000712c <system_main>:
    8000712c:	fe010113          	addi	sp,sp,-32
    80007130:	00813823          	sd	s0,16(sp)
    80007134:	00913423          	sd	s1,8(sp)
    80007138:	00113c23          	sd	ra,24(sp)
    8000713c:	02010413          	addi	s0,sp,32
    80007140:	00000097          	auipc	ra,0x0
    80007144:	0c4080e7          	jalr	196(ra) # 80007204 <cpuid>
    80007148:	00006497          	auipc	s1,0x6
    8000714c:	ac848493          	addi	s1,s1,-1336 # 8000cc10 <started>
    80007150:	02050263          	beqz	a0,80007174 <system_main+0x48>
    80007154:	0004a783          	lw	a5,0(s1)
    80007158:	0007879b          	sext.w	a5,a5
    8000715c:	fe078ce3          	beqz	a5,80007154 <system_main+0x28>
    80007160:	0ff0000f          	fence
    80007164:	00003517          	auipc	a0,0x3
    80007168:	4ec50513          	addi	a0,a0,1260 # 8000a650 <CONSOLE_STATUS+0x640>
    8000716c:	00001097          	auipc	ra,0x1
    80007170:	a70080e7          	jalr	-1424(ra) # 80007bdc <panic>
    80007174:	00001097          	auipc	ra,0x1
    80007178:	9c4080e7          	jalr	-1596(ra) # 80007b38 <consoleinit>
    8000717c:	00001097          	auipc	ra,0x1
    80007180:	150080e7          	jalr	336(ra) # 800082cc <printfinit>
    80007184:	00003517          	auipc	a0,0x3
    80007188:	15c50513          	addi	a0,a0,348 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000718c:	00001097          	auipc	ra,0x1
    80007190:	aac080e7          	jalr	-1364(ra) # 80007c38 <__printf>
    80007194:	00003517          	auipc	a0,0x3
    80007198:	48c50513          	addi	a0,a0,1164 # 8000a620 <CONSOLE_STATUS+0x610>
    8000719c:	00001097          	auipc	ra,0x1
    800071a0:	a9c080e7          	jalr	-1380(ra) # 80007c38 <__printf>
    800071a4:	00003517          	auipc	a0,0x3
    800071a8:	13c50513          	addi	a0,a0,316 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800071ac:	00001097          	auipc	ra,0x1
    800071b0:	a8c080e7          	jalr	-1396(ra) # 80007c38 <__printf>
    800071b4:	00001097          	auipc	ra,0x1
    800071b8:	4a4080e7          	jalr	1188(ra) # 80008658 <kinit>
    800071bc:	00000097          	auipc	ra,0x0
    800071c0:	148080e7          	jalr	328(ra) # 80007304 <trapinit>
    800071c4:	00000097          	auipc	ra,0x0
    800071c8:	16c080e7          	jalr	364(ra) # 80007330 <trapinithart>
    800071cc:	00000097          	auipc	ra,0x0
    800071d0:	5b4080e7          	jalr	1460(ra) # 80007780 <plicinit>
    800071d4:	00000097          	auipc	ra,0x0
    800071d8:	5d4080e7          	jalr	1492(ra) # 800077a8 <plicinithart>
    800071dc:	00000097          	auipc	ra,0x0
    800071e0:	078080e7          	jalr	120(ra) # 80007254 <userinit>
    800071e4:	0ff0000f          	fence
    800071e8:	00100793          	li	a5,1
    800071ec:	00003517          	auipc	a0,0x3
    800071f0:	44c50513          	addi	a0,a0,1100 # 8000a638 <CONSOLE_STATUS+0x628>
    800071f4:	00f4a023          	sw	a5,0(s1)
    800071f8:	00001097          	auipc	ra,0x1
    800071fc:	a40080e7          	jalr	-1472(ra) # 80007c38 <__printf>
    80007200:	0000006f          	j	80007200 <system_main+0xd4>

0000000080007204 <cpuid>:
    80007204:	ff010113          	addi	sp,sp,-16
    80007208:	00813423          	sd	s0,8(sp)
    8000720c:	01010413          	addi	s0,sp,16
    80007210:	00020513          	mv	a0,tp
    80007214:	00813403          	ld	s0,8(sp)
    80007218:	0005051b          	sext.w	a0,a0
    8000721c:	01010113          	addi	sp,sp,16
    80007220:	00008067          	ret

0000000080007224 <mycpu>:
    80007224:	ff010113          	addi	sp,sp,-16
    80007228:	00813423          	sd	s0,8(sp)
    8000722c:	01010413          	addi	s0,sp,16
    80007230:	00020793          	mv	a5,tp
    80007234:	00813403          	ld	s0,8(sp)
    80007238:	0007879b          	sext.w	a5,a5
    8000723c:	00779793          	slli	a5,a5,0x7
    80007240:	00007517          	auipc	a0,0x7
    80007244:	b1050513          	addi	a0,a0,-1264 # 8000dd50 <cpus>
    80007248:	00f50533          	add	a0,a0,a5
    8000724c:	01010113          	addi	sp,sp,16
    80007250:	00008067          	ret

0000000080007254 <userinit>:
    80007254:	ff010113          	addi	sp,sp,-16
    80007258:	00813423          	sd	s0,8(sp)
    8000725c:	01010413          	addi	s0,sp,16
    80007260:	00813403          	ld	s0,8(sp)
    80007264:	01010113          	addi	sp,sp,16
    80007268:	ffffb317          	auipc	t1,0xffffb
    8000726c:	2d430067          	jr	724(t1) # 8000253c <main>

0000000080007270 <either_copyout>:
    80007270:	ff010113          	addi	sp,sp,-16
    80007274:	00813023          	sd	s0,0(sp)
    80007278:	00113423          	sd	ra,8(sp)
    8000727c:	01010413          	addi	s0,sp,16
    80007280:	02051663          	bnez	a0,800072ac <either_copyout+0x3c>
    80007284:	00058513          	mv	a0,a1
    80007288:	00060593          	mv	a1,a2
    8000728c:	0006861b          	sext.w	a2,a3
    80007290:	00002097          	auipc	ra,0x2
    80007294:	c54080e7          	jalr	-940(ra) # 80008ee4 <__memmove>
    80007298:	00813083          	ld	ra,8(sp)
    8000729c:	00013403          	ld	s0,0(sp)
    800072a0:	00000513          	li	a0,0
    800072a4:	01010113          	addi	sp,sp,16
    800072a8:	00008067          	ret
    800072ac:	00003517          	auipc	a0,0x3
    800072b0:	3cc50513          	addi	a0,a0,972 # 8000a678 <CONSOLE_STATUS+0x668>
    800072b4:	00001097          	auipc	ra,0x1
    800072b8:	928080e7          	jalr	-1752(ra) # 80007bdc <panic>

00000000800072bc <either_copyin>:
    800072bc:	ff010113          	addi	sp,sp,-16
    800072c0:	00813023          	sd	s0,0(sp)
    800072c4:	00113423          	sd	ra,8(sp)
    800072c8:	01010413          	addi	s0,sp,16
    800072cc:	02059463          	bnez	a1,800072f4 <either_copyin+0x38>
    800072d0:	00060593          	mv	a1,a2
    800072d4:	0006861b          	sext.w	a2,a3
    800072d8:	00002097          	auipc	ra,0x2
    800072dc:	c0c080e7          	jalr	-1012(ra) # 80008ee4 <__memmove>
    800072e0:	00813083          	ld	ra,8(sp)
    800072e4:	00013403          	ld	s0,0(sp)
    800072e8:	00000513          	li	a0,0
    800072ec:	01010113          	addi	sp,sp,16
    800072f0:	00008067          	ret
    800072f4:	00003517          	auipc	a0,0x3
    800072f8:	3ac50513          	addi	a0,a0,940 # 8000a6a0 <CONSOLE_STATUS+0x690>
    800072fc:	00001097          	auipc	ra,0x1
    80007300:	8e0080e7          	jalr	-1824(ra) # 80007bdc <panic>

0000000080007304 <trapinit>:
    80007304:	ff010113          	addi	sp,sp,-16
    80007308:	00813423          	sd	s0,8(sp)
    8000730c:	01010413          	addi	s0,sp,16
    80007310:	00813403          	ld	s0,8(sp)
    80007314:	00003597          	auipc	a1,0x3
    80007318:	3b458593          	addi	a1,a1,948 # 8000a6c8 <CONSOLE_STATUS+0x6b8>
    8000731c:	00007517          	auipc	a0,0x7
    80007320:	ab450513          	addi	a0,a0,-1356 # 8000ddd0 <tickslock>
    80007324:	01010113          	addi	sp,sp,16
    80007328:	00001317          	auipc	t1,0x1
    8000732c:	5c030067          	jr	1472(t1) # 800088e8 <initlock>

0000000080007330 <trapinithart>:
    80007330:	ff010113          	addi	sp,sp,-16
    80007334:	00813423          	sd	s0,8(sp)
    80007338:	01010413          	addi	s0,sp,16
    8000733c:	00000797          	auipc	a5,0x0
    80007340:	2f478793          	addi	a5,a5,756 # 80007630 <kernelvec>
    80007344:	10579073          	csrw	stvec,a5
    80007348:	00813403          	ld	s0,8(sp)
    8000734c:	01010113          	addi	sp,sp,16
    80007350:	00008067          	ret

0000000080007354 <usertrap>:
    80007354:	ff010113          	addi	sp,sp,-16
    80007358:	00813423          	sd	s0,8(sp)
    8000735c:	01010413          	addi	s0,sp,16
    80007360:	00813403          	ld	s0,8(sp)
    80007364:	01010113          	addi	sp,sp,16
    80007368:	00008067          	ret

000000008000736c <usertrapret>:
    8000736c:	ff010113          	addi	sp,sp,-16
    80007370:	00813423          	sd	s0,8(sp)
    80007374:	01010413          	addi	s0,sp,16
    80007378:	00813403          	ld	s0,8(sp)
    8000737c:	01010113          	addi	sp,sp,16
    80007380:	00008067          	ret

0000000080007384 <kerneltrap>:
    80007384:	fe010113          	addi	sp,sp,-32
    80007388:	00813823          	sd	s0,16(sp)
    8000738c:	00113c23          	sd	ra,24(sp)
    80007390:	00913423          	sd	s1,8(sp)
    80007394:	02010413          	addi	s0,sp,32
    80007398:	142025f3          	csrr	a1,scause
    8000739c:	100027f3          	csrr	a5,sstatus
    800073a0:	0027f793          	andi	a5,a5,2
    800073a4:	10079c63          	bnez	a5,800074bc <kerneltrap+0x138>
    800073a8:	142027f3          	csrr	a5,scause
    800073ac:	0207ce63          	bltz	a5,800073e8 <kerneltrap+0x64>
    800073b0:	00003517          	auipc	a0,0x3
    800073b4:	36050513          	addi	a0,a0,864 # 8000a710 <CONSOLE_STATUS+0x700>
    800073b8:	00001097          	auipc	ra,0x1
    800073bc:	880080e7          	jalr	-1920(ra) # 80007c38 <__printf>
    800073c0:	141025f3          	csrr	a1,sepc
    800073c4:	14302673          	csrr	a2,stval
    800073c8:	00003517          	auipc	a0,0x3
    800073cc:	35850513          	addi	a0,a0,856 # 8000a720 <CONSOLE_STATUS+0x710>
    800073d0:	00001097          	auipc	ra,0x1
    800073d4:	868080e7          	jalr	-1944(ra) # 80007c38 <__printf>
    800073d8:	00003517          	auipc	a0,0x3
    800073dc:	36050513          	addi	a0,a0,864 # 8000a738 <CONSOLE_STATUS+0x728>
    800073e0:	00000097          	auipc	ra,0x0
    800073e4:	7fc080e7          	jalr	2044(ra) # 80007bdc <panic>
    800073e8:	0ff7f713          	andi	a4,a5,255
    800073ec:	00900693          	li	a3,9
    800073f0:	04d70063          	beq	a4,a3,80007430 <kerneltrap+0xac>
    800073f4:	fff00713          	li	a4,-1
    800073f8:	03f71713          	slli	a4,a4,0x3f
    800073fc:	00170713          	addi	a4,a4,1
    80007400:	fae798e3          	bne	a5,a4,800073b0 <kerneltrap+0x2c>
    80007404:	00000097          	auipc	ra,0x0
    80007408:	e00080e7          	jalr	-512(ra) # 80007204 <cpuid>
    8000740c:	06050663          	beqz	a0,80007478 <kerneltrap+0xf4>
    80007410:	144027f3          	csrr	a5,sip
    80007414:	ffd7f793          	andi	a5,a5,-3
    80007418:	14479073          	csrw	sip,a5
    8000741c:	01813083          	ld	ra,24(sp)
    80007420:	01013403          	ld	s0,16(sp)
    80007424:	00813483          	ld	s1,8(sp)
    80007428:	02010113          	addi	sp,sp,32
    8000742c:	00008067          	ret
    80007430:	00000097          	auipc	ra,0x0
    80007434:	3c4080e7          	jalr	964(ra) # 800077f4 <plic_claim>
    80007438:	00a00793          	li	a5,10
    8000743c:	00050493          	mv	s1,a0
    80007440:	06f50863          	beq	a0,a5,800074b0 <kerneltrap+0x12c>
    80007444:	fc050ce3          	beqz	a0,8000741c <kerneltrap+0x98>
    80007448:	00050593          	mv	a1,a0
    8000744c:	00003517          	auipc	a0,0x3
    80007450:	2a450513          	addi	a0,a0,676 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80007454:	00000097          	auipc	ra,0x0
    80007458:	7e4080e7          	jalr	2020(ra) # 80007c38 <__printf>
    8000745c:	01013403          	ld	s0,16(sp)
    80007460:	01813083          	ld	ra,24(sp)
    80007464:	00048513          	mv	a0,s1
    80007468:	00813483          	ld	s1,8(sp)
    8000746c:	02010113          	addi	sp,sp,32
    80007470:	00000317          	auipc	t1,0x0
    80007474:	3bc30067          	jr	956(t1) # 8000782c <plic_complete>
    80007478:	00007517          	auipc	a0,0x7
    8000747c:	95850513          	addi	a0,a0,-1704 # 8000ddd0 <tickslock>
    80007480:	00001097          	auipc	ra,0x1
    80007484:	48c080e7          	jalr	1164(ra) # 8000890c <acquire>
    80007488:	00005717          	auipc	a4,0x5
    8000748c:	78c70713          	addi	a4,a4,1932 # 8000cc14 <ticks>
    80007490:	00072783          	lw	a5,0(a4)
    80007494:	00007517          	auipc	a0,0x7
    80007498:	93c50513          	addi	a0,a0,-1732 # 8000ddd0 <tickslock>
    8000749c:	0017879b          	addiw	a5,a5,1
    800074a0:	00f72023          	sw	a5,0(a4)
    800074a4:	00001097          	auipc	ra,0x1
    800074a8:	534080e7          	jalr	1332(ra) # 800089d8 <release>
    800074ac:	f65ff06f          	j	80007410 <kerneltrap+0x8c>
    800074b0:	00001097          	auipc	ra,0x1
    800074b4:	090080e7          	jalr	144(ra) # 80008540 <uartintr>
    800074b8:	fa5ff06f          	j	8000745c <kerneltrap+0xd8>
    800074bc:	00003517          	auipc	a0,0x3
    800074c0:	21450513          	addi	a0,a0,532 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    800074c4:	00000097          	auipc	ra,0x0
    800074c8:	718080e7          	jalr	1816(ra) # 80007bdc <panic>

00000000800074cc <clockintr>:
    800074cc:	fe010113          	addi	sp,sp,-32
    800074d0:	00813823          	sd	s0,16(sp)
    800074d4:	00913423          	sd	s1,8(sp)
    800074d8:	00113c23          	sd	ra,24(sp)
    800074dc:	02010413          	addi	s0,sp,32
    800074e0:	00007497          	auipc	s1,0x7
    800074e4:	8f048493          	addi	s1,s1,-1808 # 8000ddd0 <tickslock>
    800074e8:	00048513          	mv	a0,s1
    800074ec:	00001097          	auipc	ra,0x1
    800074f0:	420080e7          	jalr	1056(ra) # 8000890c <acquire>
    800074f4:	00005717          	auipc	a4,0x5
    800074f8:	72070713          	addi	a4,a4,1824 # 8000cc14 <ticks>
    800074fc:	00072783          	lw	a5,0(a4)
    80007500:	01013403          	ld	s0,16(sp)
    80007504:	01813083          	ld	ra,24(sp)
    80007508:	00048513          	mv	a0,s1
    8000750c:	0017879b          	addiw	a5,a5,1
    80007510:	00813483          	ld	s1,8(sp)
    80007514:	00f72023          	sw	a5,0(a4)
    80007518:	02010113          	addi	sp,sp,32
    8000751c:	00001317          	auipc	t1,0x1
    80007520:	4bc30067          	jr	1212(t1) # 800089d8 <release>

0000000080007524 <devintr>:
    80007524:	142027f3          	csrr	a5,scause
    80007528:	00000513          	li	a0,0
    8000752c:	0007c463          	bltz	a5,80007534 <devintr+0x10>
    80007530:	00008067          	ret
    80007534:	fe010113          	addi	sp,sp,-32
    80007538:	00813823          	sd	s0,16(sp)
    8000753c:	00113c23          	sd	ra,24(sp)
    80007540:	00913423          	sd	s1,8(sp)
    80007544:	02010413          	addi	s0,sp,32
    80007548:	0ff7f713          	andi	a4,a5,255
    8000754c:	00900693          	li	a3,9
    80007550:	04d70c63          	beq	a4,a3,800075a8 <devintr+0x84>
    80007554:	fff00713          	li	a4,-1
    80007558:	03f71713          	slli	a4,a4,0x3f
    8000755c:	00170713          	addi	a4,a4,1
    80007560:	00e78c63          	beq	a5,a4,80007578 <devintr+0x54>
    80007564:	01813083          	ld	ra,24(sp)
    80007568:	01013403          	ld	s0,16(sp)
    8000756c:	00813483          	ld	s1,8(sp)
    80007570:	02010113          	addi	sp,sp,32
    80007574:	00008067          	ret
    80007578:	00000097          	auipc	ra,0x0
    8000757c:	c8c080e7          	jalr	-884(ra) # 80007204 <cpuid>
    80007580:	06050663          	beqz	a0,800075ec <devintr+0xc8>
    80007584:	144027f3          	csrr	a5,sip
    80007588:	ffd7f793          	andi	a5,a5,-3
    8000758c:	14479073          	csrw	sip,a5
    80007590:	01813083          	ld	ra,24(sp)
    80007594:	01013403          	ld	s0,16(sp)
    80007598:	00813483          	ld	s1,8(sp)
    8000759c:	00200513          	li	a0,2
    800075a0:	02010113          	addi	sp,sp,32
    800075a4:	00008067          	ret
    800075a8:	00000097          	auipc	ra,0x0
    800075ac:	24c080e7          	jalr	588(ra) # 800077f4 <plic_claim>
    800075b0:	00a00793          	li	a5,10
    800075b4:	00050493          	mv	s1,a0
    800075b8:	06f50663          	beq	a0,a5,80007624 <devintr+0x100>
    800075bc:	00100513          	li	a0,1
    800075c0:	fa0482e3          	beqz	s1,80007564 <devintr+0x40>
    800075c4:	00048593          	mv	a1,s1
    800075c8:	00003517          	auipc	a0,0x3
    800075cc:	12850513          	addi	a0,a0,296 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    800075d0:	00000097          	auipc	ra,0x0
    800075d4:	668080e7          	jalr	1640(ra) # 80007c38 <__printf>
    800075d8:	00048513          	mv	a0,s1
    800075dc:	00000097          	auipc	ra,0x0
    800075e0:	250080e7          	jalr	592(ra) # 8000782c <plic_complete>
    800075e4:	00100513          	li	a0,1
    800075e8:	f7dff06f          	j	80007564 <devintr+0x40>
    800075ec:	00006517          	auipc	a0,0x6
    800075f0:	7e450513          	addi	a0,a0,2020 # 8000ddd0 <tickslock>
    800075f4:	00001097          	auipc	ra,0x1
    800075f8:	318080e7          	jalr	792(ra) # 8000890c <acquire>
    800075fc:	00005717          	auipc	a4,0x5
    80007600:	61870713          	addi	a4,a4,1560 # 8000cc14 <ticks>
    80007604:	00072783          	lw	a5,0(a4)
    80007608:	00006517          	auipc	a0,0x6
    8000760c:	7c850513          	addi	a0,a0,1992 # 8000ddd0 <tickslock>
    80007610:	0017879b          	addiw	a5,a5,1
    80007614:	00f72023          	sw	a5,0(a4)
    80007618:	00001097          	auipc	ra,0x1
    8000761c:	3c0080e7          	jalr	960(ra) # 800089d8 <release>
    80007620:	f65ff06f          	j	80007584 <devintr+0x60>
    80007624:	00001097          	auipc	ra,0x1
    80007628:	f1c080e7          	jalr	-228(ra) # 80008540 <uartintr>
    8000762c:	fadff06f          	j	800075d8 <devintr+0xb4>

0000000080007630 <kernelvec>:
    80007630:	f0010113          	addi	sp,sp,-256
    80007634:	00113023          	sd	ra,0(sp)
    80007638:	00213423          	sd	sp,8(sp)
    8000763c:	00313823          	sd	gp,16(sp)
    80007640:	00413c23          	sd	tp,24(sp)
    80007644:	02513023          	sd	t0,32(sp)
    80007648:	02613423          	sd	t1,40(sp)
    8000764c:	02713823          	sd	t2,48(sp)
    80007650:	02813c23          	sd	s0,56(sp)
    80007654:	04913023          	sd	s1,64(sp)
    80007658:	04a13423          	sd	a0,72(sp)
    8000765c:	04b13823          	sd	a1,80(sp)
    80007660:	04c13c23          	sd	a2,88(sp)
    80007664:	06d13023          	sd	a3,96(sp)
    80007668:	06e13423          	sd	a4,104(sp)
    8000766c:	06f13823          	sd	a5,112(sp)
    80007670:	07013c23          	sd	a6,120(sp)
    80007674:	09113023          	sd	a7,128(sp)
    80007678:	09213423          	sd	s2,136(sp)
    8000767c:	09313823          	sd	s3,144(sp)
    80007680:	09413c23          	sd	s4,152(sp)
    80007684:	0b513023          	sd	s5,160(sp)
    80007688:	0b613423          	sd	s6,168(sp)
    8000768c:	0b713823          	sd	s7,176(sp)
    80007690:	0b813c23          	sd	s8,184(sp)
    80007694:	0d913023          	sd	s9,192(sp)
    80007698:	0da13423          	sd	s10,200(sp)
    8000769c:	0db13823          	sd	s11,208(sp)
    800076a0:	0dc13c23          	sd	t3,216(sp)
    800076a4:	0fd13023          	sd	t4,224(sp)
    800076a8:	0fe13423          	sd	t5,232(sp)
    800076ac:	0ff13823          	sd	t6,240(sp)
    800076b0:	cd5ff0ef          	jal	ra,80007384 <kerneltrap>
    800076b4:	00013083          	ld	ra,0(sp)
    800076b8:	00813103          	ld	sp,8(sp)
    800076bc:	01013183          	ld	gp,16(sp)
    800076c0:	02013283          	ld	t0,32(sp)
    800076c4:	02813303          	ld	t1,40(sp)
    800076c8:	03013383          	ld	t2,48(sp)
    800076cc:	03813403          	ld	s0,56(sp)
    800076d0:	04013483          	ld	s1,64(sp)
    800076d4:	04813503          	ld	a0,72(sp)
    800076d8:	05013583          	ld	a1,80(sp)
    800076dc:	05813603          	ld	a2,88(sp)
    800076e0:	06013683          	ld	a3,96(sp)
    800076e4:	06813703          	ld	a4,104(sp)
    800076e8:	07013783          	ld	a5,112(sp)
    800076ec:	07813803          	ld	a6,120(sp)
    800076f0:	08013883          	ld	a7,128(sp)
    800076f4:	08813903          	ld	s2,136(sp)
    800076f8:	09013983          	ld	s3,144(sp)
    800076fc:	09813a03          	ld	s4,152(sp)
    80007700:	0a013a83          	ld	s5,160(sp)
    80007704:	0a813b03          	ld	s6,168(sp)
    80007708:	0b013b83          	ld	s7,176(sp)
    8000770c:	0b813c03          	ld	s8,184(sp)
    80007710:	0c013c83          	ld	s9,192(sp)
    80007714:	0c813d03          	ld	s10,200(sp)
    80007718:	0d013d83          	ld	s11,208(sp)
    8000771c:	0d813e03          	ld	t3,216(sp)
    80007720:	0e013e83          	ld	t4,224(sp)
    80007724:	0e813f03          	ld	t5,232(sp)
    80007728:	0f013f83          	ld	t6,240(sp)
    8000772c:	10010113          	addi	sp,sp,256
    80007730:	10200073          	sret
    80007734:	00000013          	nop
    80007738:	00000013          	nop
    8000773c:	00000013          	nop

0000000080007740 <timervec>:
    80007740:	34051573          	csrrw	a0,mscratch,a0
    80007744:	00b53023          	sd	a1,0(a0)
    80007748:	00c53423          	sd	a2,8(a0)
    8000774c:	00d53823          	sd	a3,16(a0)
    80007750:	01853583          	ld	a1,24(a0)
    80007754:	02053603          	ld	a2,32(a0)
    80007758:	0005b683          	ld	a3,0(a1)
    8000775c:	00c686b3          	add	a3,a3,a2
    80007760:	00d5b023          	sd	a3,0(a1)
    80007764:	00200593          	li	a1,2
    80007768:	14459073          	csrw	sip,a1
    8000776c:	01053683          	ld	a3,16(a0)
    80007770:	00853603          	ld	a2,8(a0)
    80007774:	00053583          	ld	a1,0(a0)
    80007778:	34051573          	csrrw	a0,mscratch,a0
    8000777c:	30200073          	mret

0000000080007780 <plicinit>:
    80007780:	ff010113          	addi	sp,sp,-16
    80007784:	00813423          	sd	s0,8(sp)
    80007788:	01010413          	addi	s0,sp,16
    8000778c:	00813403          	ld	s0,8(sp)
    80007790:	0c0007b7          	lui	a5,0xc000
    80007794:	00100713          	li	a4,1
    80007798:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000779c:	00e7a223          	sw	a4,4(a5)
    800077a0:	01010113          	addi	sp,sp,16
    800077a4:	00008067          	ret

00000000800077a8 <plicinithart>:
    800077a8:	ff010113          	addi	sp,sp,-16
    800077ac:	00813023          	sd	s0,0(sp)
    800077b0:	00113423          	sd	ra,8(sp)
    800077b4:	01010413          	addi	s0,sp,16
    800077b8:	00000097          	auipc	ra,0x0
    800077bc:	a4c080e7          	jalr	-1460(ra) # 80007204 <cpuid>
    800077c0:	0085171b          	slliw	a4,a0,0x8
    800077c4:	0c0027b7          	lui	a5,0xc002
    800077c8:	00e787b3          	add	a5,a5,a4
    800077cc:	40200713          	li	a4,1026
    800077d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800077d4:	00813083          	ld	ra,8(sp)
    800077d8:	00013403          	ld	s0,0(sp)
    800077dc:	00d5151b          	slliw	a0,a0,0xd
    800077e0:	0c2017b7          	lui	a5,0xc201
    800077e4:	00a78533          	add	a0,a5,a0
    800077e8:	00052023          	sw	zero,0(a0)
    800077ec:	01010113          	addi	sp,sp,16
    800077f0:	00008067          	ret

00000000800077f4 <plic_claim>:
    800077f4:	ff010113          	addi	sp,sp,-16
    800077f8:	00813023          	sd	s0,0(sp)
    800077fc:	00113423          	sd	ra,8(sp)
    80007800:	01010413          	addi	s0,sp,16
    80007804:	00000097          	auipc	ra,0x0
    80007808:	a00080e7          	jalr	-1536(ra) # 80007204 <cpuid>
    8000780c:	00813083          	ld	ra,8(sp)
    80007810:	00013403          	ld	s0,0(sp)
    80007814:	00d5151b          	slliw	a0,a0,0xd
    80007818:	0c2017b7          	lui	a5,0xc201
    8000781c:	00a78533          	add	a0,a5,a0
    80007820:	00452503          	lw	a0,4(a0)
    80007824:	01010113          	addi	sp,sp,16
    80007828:	00008067          	ret

000000008000782c <plic_complete>:
    8000782c:	fe010113          	addi	sp,sp,-32
    80007830:	00813823          	sd	s0,16(sp)
    80007834:	00913423          	sd	s1,8(sp)
    80007838:	00113c23          	sd	ra,24(sp)
    8000783c:	02010413          	addi	s0,sp,32
    80007840:	00050493          	mv	s1,a0
    80007844:	00000097          	auipc	ra,0x0
    80007848:	9c0080e7          	jalr	-1600(ra) # 80007204 <cpuid>
    8000784c:	01813083          	ld	ra,24(sp)
    80007850:	01013403          	ld	s0,16(sp)
    80007854:	00d5179b          	slliw	a5,a0,0xd
    80007858:	0c201737          	lui	a4,0xc201
    8000785c:	00f707b3          	add	a5,a4,a5
    80007860:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007864:	00813483          	ld	s1,8(sp)
    80007868:	02010113          	addi	sp,sp,32
    8000786c:	00008067          	ret

0000000080007870 <consolewrite>:
    80007870:	fb010113          	addi	sp,sp,-80
    80007874:	04813023          	sd	s0,64(sp)
    80007878:	04113423          	sd	ra,72(sp)
    8000787c:	02913c23          	sd	s1,56(sp)
    80007880:	03213823          	sd	s2,48(sp)
    80007884:	03313423          	sd	s3,40(sp)
    80007888:	03413023          	sd	s4,32(sp)
    8000788c:	01513c23          	sd	s5,24(sp)
    80007890:	05010413          	addi	s0,sp,80
    80007894:	06c05c63          	blez	a2,8000790c <consolewrite+0x9c>
    80007898:	00060993          	mv	s3,a2
    8000789c:	00050a13          	mv	s4,a0
    800078a0:	00058493          	mv	s1,a1
    800078a4:	00000913          	li	s2,0
    800078a8:	fff00a93          	li	s5,-1
    800078ac:	01c0006f          	j	800078c8 <consolewrite+0x58>
    800078b0:	fbf44503          	lbu	a0,-65(s0)
    800078b4:	0019091b          	addiw	s2,s2,1
    800078b8:	00148493          	addi	s1,s1,1
    800078bc:	00001097          	auipc	ra,0x1
    800078c0:	a9c080e7          	jalr	-1380(ra) # 80008358 <uartputc>
    800078c4:	03298063          	beq	s3,s2,800078e4 <consolewrite+0x74>
    800078c8:	00048613          	mv	a2,s1
    800078cc:	00100693          	li	a3,1
    800078d0:	000a0593          	mv	a1,s4
    800078d4:	fbf40513          	addi	a0,s0,-65
    800078d8:	00000097          	auipc	ra,0x0
    800078dc:	9e4080e7          	jalr	-1564(ra) # 800072bc <either_copyin>
    800078e0:	fd5518e3          	bne	a0,s5,800078b0 <consolewrite+0x40>
    800078e4:	04813083          	ld	ra,72(sp)
    800078e8:	04013403          	ld	s0,64(sp)
    800078ec:	03813483          	ld	s1,56(sp)
    800078f0:	02813983          	ld	s3,40(sp)
    800078f4:	02013a03          	ld	s4,32(sp)
    800078f8:	01813a83          	ld	s5,24(sp)
    800078fc:	00090513          	mv	a0,s2
    80007900:	03013903          	ld	s2,48(sp)
    80007904:	05010113          	addi	sp,sp,80
    80007908:	00008067          	ret
    8000790c:	00000913          	li	s2,0
    80007910:	fd5ff06f          	j	800078e4 <consolewrite+0x74>

0000000080007914 <consoleread>:
    80007914:	f9010113          	addi	sp,sp,-112
    80007918:	06813023          	sd	s0,96(sp)
    8000791c:	04913c23          	sd	s1,88(sp)
    80007920:	05213823          	sd	s2,80(sp)
    80007924:	05313423          	sd	s3,72(sp)
    80007928:	05413023          	sd	s4,64(sp)
    8000792c:	03513c23          	sd	s5,56(sp)
    80007930:	03613823          	sd	s6,48(sp)
    80007934:	03713423          	sd	s7,40(sp)
    80007938:	03813023          	sd	s8,32(sp)
    8000793c:	06113423          	sd	ra,104(sp)
    80007940:	01913c23          	sd	s9,24(sp)
    80007944:	07010413          	addi	s0,sp,112
    80007948:	00060b93          	mv	s7,a2
    8000794c:	00050913          	mv	s2,a0
    80007950:	00058c13          	mv	s8,a1
    80007954:	00060b1b          	sext.w	s6,a2
    80007958:	00006497          	auipc	s1,0x6
    8000795c:	4a048493          	addi	s1,s1,1184 # 8000ddf8 <cons>
    80007960:	00400993          	li	s3,4
    80007964:	fff00a13          	li	s4,-1
    80007968:	00a00a93          	li	s5,10
    8000796c:	05705e63          	blez	s7,800079c8 <consoleread+0xb4>
    80007970:	09c4a703          	lw	a4,156(s1)
    80007974:	0984a783          	lw	a5,152(s1)
    80007978:	0007071b          	sext.w	a4,a4
    8000797c:	08e78463          	beq	a5,a4,80007a04 <consoleread+0xf0>
    80007980:	07f7f713          	andi	a4,a5,127
    80007984:	00e48733          	add	a4,s1,a4
    80007988:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000798c:	0017869b          	addiw	a3,a5,1
    80007990:	08d4ac23          	sw	a3,152(s1)
    80007994:	00070c9b          	sext.w	s9,a4
    80007998:	0b370663          	beq	a4,s3,80007a44 <consoleread+0x130>
    8000799c:	00100693          	li	a3,1
    800079a0:	f9f40613          	addi	a2,s0,-97
    800079a4:	000c0593          	mv	a1,s8
    800079a8:	00090513          	mv	a0,s2
    800079ac:	f8e40fa3          	sb	a4,-97(s0)
    800079b0:	00000097          	auipc	ra,0x0
    800079b4:	8c0080e7          	jalr	-1856(ra) # 80007270 <either_copyout>
    800079b8:	01450863          	beq	a0,s4,800079c8 <consoleread+0xb4>
    800079bc:	001c0c13          	addi	s8,s8,1
    800079c0:	fffb8b9b          	addiw	s7,s7,-1
    800079c4:	fb5c94e3          	bne	s9,s5,8000796c <consoleread+0x58>
    800079c8:	000b851b          	sext.w	a0,s7
    800079cc:	06813083          	ld	ra,104(sp)
    800079d0:	06013403          	ld	s0,96(sp)
    800079d4:	05813483          	ld	s1,88(sp)
    800079d8:	05013903          	ld	s2,80(sp)
    800079dc:	04813983          	ld	s3,72(sp)
    800079e0:	04013a03          	ld	s4,64(sp)
    800079e4:	03813a83          	ld	s5,56(sp)
    800079e8:	02813b83          	ld	s7,40(sp)
    800079ec:	02013c03          	ld	s8,32(sp)
    800079f0:	01813c83          	ld	s9,24(sp)
    800079f4:	40ab053b          	subw	a0,s6,a0
    800079f8:	03013b03          	ld	s6,48(sp)
    800079fc:	07010113          	addi	sp,sp,112
    80007a00:	00008067          	ret
    80007a04:	00001097          	auipc	ra,0x1
    80007a08:	1d8080e7          	jalr	472(ra) # 80008bdc <push_on>
    80007a0c:	0984a703          	lw	a4,152(s1)
    80007a10:	09c4a783          	lw	a5,156(s1)
    80007a14:	0007879b          	sext.w	a5,a5
    80007a18:	fef70ce3          	beq	a4,a5,80007a10 <consoleread+0xfc>
    80007a1c:	00001097          	auipc	ra,0x1
    80007a20:	234080e7          	jalr	564(ra) # 80008c50 <pop_on>
    80007a24:	0984a783          	lw	a5,152(s1)
    80007a28:	07f7f713          	andi	a4,a5,127
    80007a2c:	00e48733          	add	a4,s1,a4
    80007a30:	01874703          	lbu	a4,24(a4)
    80007a34:	0017869b          	addiw	a3,a5,1
    80007a38:	08d4ac23          	sw	a3,152(s1)
    80007a3c:	00070c9b          	sext.w	s9,a4
    80007a40:	f5371ee3          	bne	a4,s3,8000799c <consoleread+0x88>
    80007a44:	000b851b          	sext.w	a0,s7
    80007a48:	f96bf2e3          	bgeu	s7,s6,800079cc <consoleread+0xb8>
    80007a4c:	08f4ac23          	sw	a5,152(s1)
    80007a50:	f7dff06f          	j	800079cc <consoleread+0xb8>

0000000080007a54 <consputc>:
    80007a54:	10000793          	li	a5,256
    80007a58:	00f50663          	beq	a0,a5,80007a64 <consputc+0x10>
    80007a5c:	00001317          	auipc	t1,0x1
    80007a60:	9f430067          	jr	-1548(t1) # 80008450 <uartputc_sync>
    80007a64:	ff010113          	addi	sp,sp,-16
    80007a68:	00113423          	sd	ra,8(sp)
    80007a6c:	00813023          	sd	s0,0(sp)
    80007a70:	01010413          	addi	s0,sp,16
    80007a74:	00800513          	li	a0,8
    80007a78:	00001097          	auipc	ra,0x1
    80007a7c:	9d8080e7          	jalr	-1576(ra) # 80008450 <uartputc_sync>
    80007a80:	02000513          	li	a0,32
    80007a84:	00001097          	auipc	ra,0x1
    80007a88:	9cc080e7          	jalr	-1588(ra) # 80008450 <uartputc_sync>
    80007a8c:	00013403          	ld	s0,0(sp)
    80007a90:	00813083          	ld	ra,8(sp)
    80007a94:	00800513          	li	a0,8
    80007a98:	01010113          	addi	sp,sp,16
    80007a9c:	00001317          	auipc	t1,0x1
    80007aa0:	9b430067          	jr	-1612(t1) # 80008450 <uartputc_sync>

0000000080007aa4 <consoleintr>:
    80007aa4:	fe010113          	addi	sp,sp,-32
    80007aa8:	00813823          	sd	s0,16(sp)
    80007aac:	00913423          	sd	s1,8(sp)
    80007ab0:	01213023          	sd	s2,0(sp)
    80007ab4:	00113c23          	sd	ra,24(sp)
    80007ab8:	02010413          	addi	s0,sp,32
    80007abc:	00006917          	auipc	s2,0x6
    80007ac0:	33c90913          	addi	s2,s2,828 # 8000ddf8 <cons>
    80007ac4:	00050493          	mv	s1,a0
    80007ac8:	00090513          	mv	a0,s2
    80007acc:	00001097          	auipc	ra,0x1
    80007ad0:	e40080e7          	jalr	-448(ra) # 8000890c <acquire>
    80007ad4:	02048c63          	beqz	s1,80007b0c <consoleintr+0x68>
    80007ad8:	0a092783          	lw	a5,160(s2)
    80007adc:	09892703          	lw	a4,152(s2)
    80007ae0:	07f00693          	li	a3,127
    80007ae4:	40e7873b          	subw	a4,a5,a4
    80007ae8:	02e6e263          	bltu	a3,a4,80007b0c <consoleintr+0x68>
    80007aec:	00d00713          	li	a4,13
    80007af0:	04e48063          	beq	s1,a4,80007b30 <consoleintr+0x8c>
    80007af4:	07f7f713          	andi	a4,a5,127
    80007af8:	00e90733          	add	a4,s2,a4
    80007afc:	0017879b          	addiw	a5,a5,1
    80007b00:	0af92023          	sw	a5,160(s2)
    80007b04:	00970c23          	sb	s1,24(a4)
    80007b08:	08f92e23          	sw	a5,156(s2)
    80007b0c:	01013403          	ld	s0,16(sp)
    80007b10:	01813083          	ld	ra,24(sp)
    80007b14:	00813483          	ld	s1,8(sp)
    80007b18:	00013903          	ld	s2,0(sp)
    80007b1c:	00006517          	auipc	a0,0x6
    80007b20:	2dc50513          	addi	a0,a0,732 # 8000ddf8 <cons>
    80007b24:	02010113          	addi	sp,sp,32
    80007b28:	00001317          	auipc	t1,0x1
    80007b2c:	eb030067          	jr	-336(t1) # 800089d8 <release>
    80007b30:	00a00493          	li	s1,10
    80007b34:	fc1ff06f          	j	80007af4 <consoleintr+0x50>

0000000080007b38 <consoleinit>:
    80007b38:	fe010113          	addi	sp,sp,-32
    80007b3c:	00113c23          	sd	ra,24(sp)
    80007b40:	00813823          	sd	s0,16(sp)
    80007b44:	00913423          	sd	s1,8(sp)
    80007b48:	02010413          	addi	s0,sp,32
    80007b4c:	00006497          	auipc	s1,0x6
    80007b50:	2ac48493          	addi	s1,s1,684 # 8000ddf8 <cons>
    80007b54:	00048513          	mv	a0,s1
    80007b58:	00003597          	auipc	a1,0x3
    80007b5c:	bf058593          	addi	a1,a1,-1040 # 8000a748 <CONSOLE_STATUS+0x738>
    80007b60:	00001097          	auipc	ra,0x1
    80007b64:	d88080e7          	jalr	-632(ra) # 800088e8 <initlock>
    80007b68:	00000097          	auipc	ra,0x0
    80007b6c:	7ac080e7          	jalr	1964(ra) # 80008314 <uartinit>
    80007b70:	01813083          	ld	ra,24(sp)
    80007b74:	01013403          	ld	s0,16(sp)
    80007b78:	00000797          	auipc	a5,0x0
    80007b7c:	d9c78793          	addi	a5,a5,-612 # 80007914 <consoleread>
    80007b80:	0af4bc23          	sd	a5,184(s1)
    80007b84:	00000797          	auipc	a5,0x0
    80007b88:	cec78793          	addi	a5,a5,-788 # 80007870 <consolewrite>
    80007b8c:	0cf4b023          	sd	a5,192(s1)
    80007b90:	00813483          	ld	s1,8(sp)
    80007b94:	02010113          	addi	sp,sp,32
    80007b98:	00008067          	ret

0000000080007b9c <console_read>:
    80007b9c:	ff010113          	addi	sp,sp,-16
    80007ba0:	00813423          	sd	s0,8(sp)
    80007ba4:	01010413          	addi	s0,sp,16
    80007ba8:	00813403          	ld	s0,8(sp)
    80007bac:	00006317          	auipc	t1,0x6
    80007bb0:	30433303          	ld	t1,772(t1) # 8000deb0 <devsw+0x10>
    80007bb4:	01010113          	addi	sp,sp,16
    80007bb8:	00030067          	jr	t1

0000000080007bbc <console_write>:
    80007bbc:	ff010113          	addi	sp,sp,-16
    80007bc0:	00813423          	sd	s0,8(sp)
    80007bc4:	01010413          	addi	s0,sp,16
    80007bc8:	00813403          	ld	s0,8(sp)
    80007bcc:	00006317          	auipc	t1,0x6
    80007bd0:	2ec33303          	ld	t1,748(t1) # 8000deb8 <devsw+0x18>
    80007bd4:	01010113          	addi	sp,sp,16
    80007bd8:	00030067          	jr	t1

0000000080007bdc <panic>:
    80007bdc:	fe010113          	addi	sp,sp,-32
    80007be0:	00113c23          	sd	ra,24(sp)
    80007be4:	00813823          	sd	s0,16(sp)
    80007be8:	00913423          	sd	s1,8(sp)
    80007bec:	02010413          	addi	s0,sp,32
    80007bf0:	00050493          	mv	s1,a0
    80007bf4:	00003517          	auipc	a0,0x3
    80007bf8:	b5c50513          	addi	a0,a0,-1188 # 8000a750 <CONSOLE_STATUS+0x740>
    80007bfc:	00006797          	auipc	a5,0x6
    80007c00:	3407ae23          	sw	zero,860(a5) # 8000df58 <pr+0x18>
    80007c04:	00000097          	auipc	ra,0x0
    80007c08:	034080e7          	jalr	52(ra) # 80007c38 <__printf>
    80007c0c:	00048513          	mv	a0,s1
    80007c10:	00000097          	auipc	ra,0x0
    80007c14:	028080e7          	jalr	40(ra) # 80007c38 <__printf>
    80007c18:	00002517          	auipc	a0,0x2
    80007c1c:	6c850513          	addi	a0,a0,1736 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80007c20:	00000097          	auipc	ra,0x0
    80007c24:	018080e7          	jalr	24(ra) # 80007c38 <__printf>
    80007c28:	00100793          	li	a5,1
    80007c2c:	00005717          	auipc	a4,0x5
    80007c30:	fef72623          	sw	a5,-20(a4) # 8000cc18 <panicked>
    80007c34:	0000006f          	j	80007c34 <panic+0x58>

0000000080007c38 <__printf>:
    80007c38:	f3010113          	addi	sp,sp,-208
    80007c3c:	08813023          	sd	s0,128(sp)
    80007c40:	07313423          	sd	s3,104(sp)
    80007c44:	09010413          	addi	s0,sp,144
    80007c48:	05813023          	sd	s8,64(sp)
    80007c4c:	08113423          	sd	ra,136(sp)
    80007c50:	06913c23          	sd	s1,120(sp)
    80007c54:	07213823          	sd	s2,112(sp)
    80007c58:	07413023          	sd	s4,96(sp)
    80007c5c:	05513c23          	sd	s5,88(sp)
    80007c60:	05613823          	sd	s6,80(sp)
    80007c64:	05713423          	sd	s7,72(sp)
    80007c68:	03913c23          	sd	s9,56(sp)
    80007c6c:	03a13823          	sd	s10,48(sp)
    80007c70:	03b13423          	sd	s11,40(sp)
    80007c74:	00006317          	auipc	t1,0x6
    80007c78:	2cc30313          	addi	t1,t1,716 # 8000df40 <pr>
    80007c7c:	01832c03          	lw	s8,24(t1)
    80007c80:	00b43423          	sd	a1,8(s0)
    80007c84:	00c43823          	sd	a2,16(s0)
    80007c88:	00d43c23          	sd	a3,24(s0)
    80007c8c:	02e43023          	sd	a4,32(s0)
    80007c90:	02f43423          	sd	a5,40(s0)
    80007c94:	03043823          	sd	a6,48(s0)
    80007c98:	03143c23          	sd	a7,56(s0)
    80007c9c:	00050993          	mv	s3,a0
    80007ca0:	4a0c1663          	bnez	s8,8000814c <__printf+0x514>
    80007ca4:	60098c63          	beqz	s3,800082bc <__printf+0x684>
    80007ca8:	0009c503          	lbu	a0,0(s3)
    80007cac:	00840793          	addi	a5,s0,8
    80007cb0:	f6f43c23          	sd	a5,-136(s0)
    80007cb4:	00000493          	li	s1,0
    80007cb8:	22050063          	beqz	a0,80007ed8 <__printf+0x2a0>
    80007cbc:	00002a37          	lui	s4,0x2
    80007cc0:	00018ab7          	lui	s5,0x18
    80007cc4:	000f4b37          	lui	s6,0xf4
    80007cc8:	00989bb7          	lui	s7,0x989
    80007ccc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007cd0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007cd4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007cd8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007cdc:	00148c9b          	addiw	s9,s1,1
    80007ce0:	02500793          	li	a5,37
    80007ce4:	01998933          	add	s2,s3,s9
    80007ce8:	38f51263          	bne	a0,a5,8000806c <__printf+0x434>
    80007cec:	00094783          	lbu	a5,0(s2)
    80007cf0:	00078c9b          	sext.w	s9,a5
    80007cf4:	1e078263          	beqz	a5,80007ed8 <__printf+0x2a0>
    80007cf8:	0024849b          	addiw	s1,s1,2
    80007cfc:	07000713          	li	a4,112
    80007d00:	00998933          	add	s2,s3,s1
    80007d04:	38e78a63          	beq	a5,a4,80008098 <__printf+0x460>
    80007d08:	20f76863          	bltu	a4,a5,80007f18 <__printf+0x2e0>
    80007d0c:	42a78863          	beq	a5,a0,8000813c <__printf+0x504>
    80007d10:	06400713          	li	a4,100
    80007d14:	40e79663          	bne	a5,a4,80008120 <__printf+0x4e8>
    80007d18:	f7843783          	ld	a5,-136(s0)
    80007d1c:	0007a603          	lw	a2,0(a5)
    80007d20:	00878793          	addi	a5,a5,8
    80007d24:	f6f43c23          	sd	a5,-136(s0)
    80007d28:	42064a63          	bltz	a2,8000815c <__printf+0x524>
    80007d2c:	00a00713          	li	a4,10
    80007d30:	02e677bb          	remuw	a5,a2,a4
    80007d34:	00003d97          	auipc	s11,0x3
    80007d38:	a44d8d93          	addi	s11,s11,-1468 # 8000a778 <digits>
    80007d3c:	00900593          	li	a1,9
    80007d40:	0006051b          	sext.w	a0,a2
    80007d44:	00000c93          	li	s9,0
    80007d48:	02079793          	slli	a5,a5,0x20
    80007d4c:	0207d793          	srli	a5,a5,0x20
    80007d50:	00fd87b3          	add	a5,s11,a5
    80007d54:	0007c783          	lbu	a5,0(a5)
    80007d58:	02e656bb          	divuw	a3,a2,a4
    80007d5c:	f8f40023          	sb	a5,-128(s0)
    80007d60:	14c5d863          	bge	a1,a2,80007eb0 <__printf+0x278>
    80007d64:	06300593          	li	a1,99
    80007d68:	00100c93          	li	s9,1
    80007d6c:	02e6f7bb          	remuw	a5,a3,a4
    80007d70:	02079793          	slli	a5,a5,0x20
    80007d74:	0207d793          	srli	a5,a5,0x20
    80007d78:	00fd87b3          	add	a5,s11,a5
    80007d7c:	0007c783          	lbu	a5,0(a5)
    80007d80:	02e6d73b          	divuw	a4,a3,a4
    80007d84:	f8f400a3          	sb	a5,-127(s0)
    80007d88:	12a5f463          	bgeu	a1,a0,80007eb0 <__printf+0x278>
    80007d8c:	00a00693          	li	a3,10
    80007d90:	00900593          	li	a1,9
    80007d94:	02d777bb          	remuw	a5,a4,a3
    80007d98:	02079793          	slli	a5,a5,0x20
    80007d9c:	0207d793          	srli	a5,a5,0x20
    80007da0:	00fd87b3          	add	a5,s11,a5
    80007da4:	0007c503          	lbu	a0,0(a5)
    80007da8:	02d757bb          	divuw	a5,a4,a3
    80007dac:	f8a40123          	sb	a0,-126(s0)
    80007db0:	48e5f263          	bgeu	a1,a4,80008234 <__printf+0x5fc>
    80007db4:	06300513          	li	a0,99
    80007db8:	02d7f5bb          	remuw	a1,a5,a3
    80007dbc:	02059593          	slli	a1,a1,0x20
    80007dc0:	0205d593          	srli	a1,a1,0x20
    80007dc4:	00bd85b3          	add	a1,s11,a1
    80007dc8:	0005c583          	lbu	a1,0(a1)
    80007dcc:	02d7d7bb          	divuw	a5,a5,a3
    80007dd0:	f8b401a3          	sb	a1,-125(s0)
    80007dd4:	48e57263          	bgeu	a0,a4,80008258 <__printf+0x620>
    80007dd8:	3e700513          	li	a0,999
    80007ddc:	02d7f5bb          	remuw	a1,a5,a3
    80007de0:	02059593          	slli	a1,a1,0x20
    80007de4:	0205d593          	srli	a1,a1,0x20
    80007de8:	00bd85b3          	add	a1,s11,a1
    80007dec:	0005c583          	lbu	a1,0(a1)
    80007df0:	02d7d7bb          	divuw	a5,a5,a3
    80007df4:	f8b40223          	sb	a1,-124(s0)
    80007df8:	46e57663          	bgeu	a0,a4,80008264 <__printf+0x62c>
    80007dfc:	02d7f5bb          	remuw	a1,a5,a3
    80007e00:	02059593          	slli	a1,a1,0x20
    80007e04:	0205d593          	srli	a1,a1,0x20
    80007e08:	00bd85b3          	add	a1,s11,a1
    80007e0c:	0005c583          	lbu	a1,0(a1)
    80007e10:	02d7d7bb          	divuw	a5,a5,a3
    80007e14:	f8b402a3          	sb	a1,-123(s0)
    80007e18:	46ea7863          	bgeu	s4,a4,80008288 <__printf+0x650>
    80007e1c:	02d7f5bb          	remuw	a1,a5,a3
    80007e20:	02059593          	slli	a1,a1,0x20
    80007e24:	0205d593          	srli	a1,a1,0x20
    80007e28:	00bd85b3          	add	a1,s11,a1
    80007e2c:	0005c583          	lbu	a1,0(a1)
    80007e30:	02d7d7bb          	divuw	a5,a5,a3
    80007e34:	f8b40323          	sb	a1,-122(s0)
    80007e38:	3eeaf863          	bgeu	s5,a4,80008228 <__printf+0x5f0>
    80007e3c:	02d7f5bb          	remuw	a1,a5,a3
    80007e40:	02059593          	slli	a1,a1,0x20
    80007e44:	0205d593          	srli	a1,a1,0x20
    80007e48:	00bd85b3          	add	a1,s11,a1
    80007e4c:	0005c583          	lbu	a1,0(a1)
    80007e50:	02d7d7bb          	divuw	a5,a5,a3
    80007e54:	f8b403a3          	sb	a1,-121(s0)
    80007e58:	42eb7e63          	bgeu	s6,a4,80008294 <__printf+0x65c>
    80007e5c:	02d7f5bb          	remuw	a1,a5,a3
    80007e60:	02059593          	slli	a1,a1,0x20
    80007e64:	0205d593          	srli	a1,a1,0x20
    80007e68:	00bd85b3          	add	a1,s11,a1
    80007e6c:	0005c583          	lbu	a1,0(a1)
    80007e70:	02d7d7bb          	divuw	a5,a5,a3
    80007e74:	f8b40423          	sb	a1,-120(s0)
    80007e78:	42ebfc63          	bgeu	s7,a4,800082b0 <__printf+0x678>
    80007e7c:	02079793          	slli	a5,a5,0x20
    80007e80:	0207d793          	srli	a5,a5,0x20
    80007e84:	00fd8db3          	add	s11,s11,a5
    80007e88:	000dc703          	lbu	a4,0(s11)
    80007e8c:	00a00793          	li	a5,10
    80007e90:	00900c93          	li	s9,9
    80007e94:	f8e404a3          	sb	a4,-119(s0)
    80007e98:	00065c63          	bgez	a2,80007eb0 <__printf+0x278>
    80007e9c:	f9040713          	addi	a4,s0,-112
    80007ea0:	00f70733          	add	a4,a4,a5
    80007ea4:	02d00693          	li	a3,45
    80007ea8:	fed70823          	sb	a3,-16(a4)
    80007eac:	00078c93          	mv	s9,a5
    80007eb0:	f8040793          	addi	a5,s0,-128
    80007eb4:	01978cb3          	add	s9,a5,s9
    80007eb8:	f7f40d13          	addi	s10,s0,-129
    80007ebc:	000cc503          	lbu	a0,0(s9)
    80007ec0:	fffc8c93          	addi	s9,s9,-1
    80007ec4:	00000097          	auipc	ra,0x0
    80007ec8:	b90080e7          	jalr	-1136(ra) # 80007a54 <consputc>
    80007ecc:	ffac98e3          	bne	s9,s10,80007ebc <__printf+0x284>
    80007ed0:	00094503          	lbu	a0,0(s2)
    80007ed4:	e00514e3          	bnez	a0,80007cdc <__printf+0xa4>
    80007ed8:	1a0c1663          	bnez	s8,80008084 <__printf+0x44c>
    80007edc:	08813083          	ld	ra,136(sp)
    80007ee0:	08013403          	ld	s0,128(sp)
    80007ee4:	07813483          	ld	s1,120(sp)
    80007ee8:	07013903          	ld	s2,112(sp)
    80007eec:	06813983          	ld	s3,104(sp)
    80007ef0:	06013a03          	ld	s4,96(sp)
    80007ef4:	05813a83          	ld	s5,88(sp)
    80007ef8:	05013b03          	ld	s6,80(sp)
    80007efc:	04813b83          	ld	s7,72(sp)
    80007f00:	04013c03          	ld	s8,64(sp)
    80007f04:	03813c83          	ld	s9,56(sp)
    80007f08:	03013d03          	ld	s10,48(sp)
    80007f0c:	02813d83          	ld	s11,40(sp)
    80007f10:	0d010113          	addi	sp,sp,208
    80007f14:	00008067          	ret
    80007f18:	07300713          	li	a4,115
    80007f1c:	1ce78a63          	beq	a5,a4,800080f0 <__printf+0x4b8>
    80007f20:	07800713          	li	a4,120
    80007f24:	1ee79e63          	bne	a5,a4,80008120 <__printf+0x4e8>
    80007f28:	f7843783          	ld	a5,-136(s0)
    80007f2c:	0007a703          	lw	a4,0(a5)
    80007f30:	00878793          	addi	a5,a5,8
    80007f34:	f6f43c23          	sd	a5,-136(s0)
    80007f38:	28074263          	bltz	a4,800081bc <__printf+0x584>
    80007f3c:	00003d97          	auipc	s11,0x3
    80007f40:	83cd8d93          	addi	s11,s11,-1988 # 8000a778 <digits>
    80007f44:	00f77793          	andi	a5,a4,15
    80007f48:	00fd87b3          	add	a5,s11,a5
    80007f4c:	0007c683          	lbu	a3,0(a5)
    80007f50:	00f00613          	li	a2,15
    80007f54:	0007079b          	sext.w	a5,a4
    80007f58:	f8d40023          	sb	a3,-128(s0)
    80007f5c:	0047559b          	srliw	a1,a4,0x4
    80007f60:	0047569b          	srliw	a3,a4,0x4
    80007f64:	00000c93          	li	s9,0
    80007f68:	0ee65063          	bge	a2,a4,80008048 <__printf+0x410>
    80007f6c:	00f6f693          	andi	a3,a3,15
    80007f70:	00dd86b3          	add	a3,s11,a3
    80007f74:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007f78:	0087d79b          	srliw	a5,a5,0x8
    80007f7c:	00100c93          	li	s9,1
    80007f80:	f8d400a3          	sb	a3,-127(s0)
    80007f84:	0cb67263          	bgeu	a2,a1,80008048 <__printf+0x410>
    80007f88:	00f7f693          	andi	a3,a5,15
    80007f8c:	00dd86b3          	add	a3,s11,a3
    80007f90:	0006c583          	lbu	a1,0(a3)
    80007f94:	00f00613          	li	a2,15
    80007f98:	0047d69b          	srliw	a3,a5,0x4
    80007f9c:	f8b40123          	sb	a1,-126(s0)
    80007fa0:	0047d593          	srli	a1,a5,0x4
    80007fa4:	28f67e63          	bgeu	a2,a5,80008240 <__printf+0x608>
    80007fa8:	00f6f693          	andi	a3,a3,15
    80007fac:	00dd86b3          	add	a3,s11,a3
    80007fb0:	0006c503          	lbu	a0,0(a3)
    80007fb4:	0087d813          	srli	a6,a5,0x8
    80007fb8:	0087d69b          	srliw	a3,a5,0x8
    80007fbc:	f8a401a3          	sb	a0,-125(s0)
    80007fc0:	28b67663          	bgeu	a2,a1,8000824c <__printf+0x614>
    80007fc4:	00f6f693          	andi	a3,a3,15
    80007fc8:	00dd86b3          	add	a3,s11,a3
    80007fcc:	0006c583          	lbu	a1,0(a3)
    80007fd0:	00c7d513          	srli	a0,a5,0xc
    80007fd4:	00c7d69b          	srliw	a3,a5,0xc
    80007fd8:	f8b40223          	sb	a1,-124(s0)
    80007fdc:	29067a63          	bgeu	a2,a6,80008270 <__printf+0x638>
    80007fe0:	00f6f693          	andi	a3,a3,15
    80007fe4:	00dd86b3          	add	a3,s11,a3
    80007fe8:	0006c583          	lbu	a1,0(a3)
    80007fec:	0107d813          	srli	a6,a5,0x10
    80007ff0:	0107d69b          	srliw	a3,a5,0x10
    80007ff4:	f8b402a3          	sb	a1,-123(s0)
    80007ff8:	28a67263          	bgeu	a2,a0,8000827c <__printf+0x644>
    80007ffc:	00f6f693          	andi	a3,a3,15
    80008000:	00dd86b3          	add	a3,s11,a3
    80008004:	0006c683          	lbu	a3,0(a3)
    80008008:	0147d79b          	srliw	a5,a5,0x14
    8000800c:	f8d40323          	sb	a3,-122(s0)
    80008010:	21067663          	bgeu	a2,a6,8000821c <__printf+0x5e4>
    80008014:	02079793          	slli	a5,a5,0x20
    80008018:	0207d793          	srli	a5,a5,0x20
    8000801c:	00fd8db3          	add	s11,s11,a5
    80008020:	000dc683          	lbu	a3,0(s11)
    80008024:	00800793          	li	a5,8
    80008028:	00700c93          	li	s9,7
    8000802c:	f8d403a3          	sb	a3,-121(s0)
    80008030:	00075c63          	bgez	a4,80008048 <__printf+0x410>
    80008034:	f9040713          	addi	a4,s0,-112
    80008038:	00f70733          	add	a4,a4,a5
    8000803c:	02d00693          	li	a3,45
    80008040:	fed70823          	sb	a3,-16(a4)
    80008044:	00078c93          	mv	s9,a5
    80008048:	f8040793          	addi	a5,s0,-128
    8000804c:	01978cb3          	add	s9,a5,s9
    80008050:	f7f40d13          	addi	s10,s0,-129
    80008054:	000cc503          	lbu	a0,0(s9)
    80008058:	fffc8c93          	addi	s9,s9,-1
    8000805c:	00000097          	auipc	ra,0x0
    80008060:	9f8080e7          	jalr	-1544(ra) # 80007a54 <consputc>
    80008064:	ff9d18e3          	bne	s10,s9,80008054 <__printf+0x41c>
    80008068:	0100006f          	j	80008078 <__printf+0x440>
    8000806c:	00000097          	auipc	ra,0x0
    80008070:	9e8080e7          	jalr	-1560(ra) # 80007a54 <consputc>
    80008074:	000c8493          	mv	s1,s9
    80008078:	00094503          	lbu	a0,0(s2)
    8000807c:	c60510e3          	bnez	a0,80007cdc <__printf+0xa4>
    80008080:	e40c0ee3          	beqz	s8,80007edc <__printf+0x2a4>
    80008084:	00006517          	auipc	a0,0x6
    80008088:	ebc50513          	addi	a0,a0,-324 # 8000df40 <pr>
    8000808c:	00001097          	auipc	ra,0x1
    80008090:	94c080e7          	jalr	-1716(ra) # 800089d8 <release>
    80008094:	e49ff06f          	j	80007edc <__printf+0x2a4>
    80008098:	f7843783          	ld	a5,-136(s0)
    8000809c:	03000513          	li	a0,48
    800080a0:	01000d13          	li	s10,16
    800080a4:	00878713          	addi	a4,a5,8
    800080a8:	0007bc83          	ld	s9,0(a5)
    800080ac:	f6e43c23          	sd	a4,-136(s0)
    800080b0:	00000097          	auipc	ra,0x0
    800080b4:	9a4080e7          	jalr	-1628(ra) # 80007a54 <consputc>
    800080b8:	07800513          	li	a0,120
    800080bc:	00000097          	auipc	ra,0x0
    800080c0:	998080e7          	jalr	-1640(ra) # 80007a54 <consputc>
    800080c4:	00002d97          	auipc	s11,0x2
    800080c8:	6b4d8d93          	addi	s11,s11,1716 # 8000a778 <digits>
    800080cc:	03ccd793          	srli	a5,s9,0x3c
    800080d0:	00fd87b3          	add	a5,s11,a5
    800080d4:	0007c503          	lbu	a0,0(a5)
    800080d8:	fffd0d1b          	addiw	s10,s10,-1
    800080dc:	004c9c93          	slli	s9,s9,0x4
    800080e0:	00000097          	auipc	ra,0x0
    800080e4:	974080e7          	jalr	-1676(ra) # 80007a54 <consputc>
    800080e8:	fe0d12e3          	bnez	s10,800080cc <__printf+0x494>
    800080ec:	f8dff06f          	j	80008078 <__printf+0x440>
    800080f0:	f7843783          	ld	a5,-136(s0)
    800080f4:	0007bc83          	ld	s9,0(a5)
    800080f8:	00878793          	addi	a5,a5,8
    800080fc:	f6f43c23          	sd	a5,-136(s0)
    80008100:	000c9a63          	bnez	s9,80008114 <__printf+0x4dc>
    80008104:	1080006f          	j	8000820c <__printf+0x5d4>
    80008108:	001c8c93          	addi	s9,s9,1
    8000810c:	00000097          	auipc	ra,0x0
    80008110:	948080e7          	jalr	-1720(ra) # 80007a54 <consputc>
    80008114:	000cc503          	lbu	a0,0(s9)
    80008118:	fe0518e3          	bnez	a0,80008108 <__printf+0x4d0>
    8000811c:	f5dff06f          	j	80008078 <__printf+0x440>
    80008120:	02500513          	li	a0,37
    80008124:	00000097          	auipc	ra,0x0
    80008128:	930080e7          	jalr	-1744(ra) # 80007a54 <consputc>
    8000812c:	000c8513          	mv	a0,s9
    80008130:	00000097          	auipc	ra,0x0
    80008134:	924080e7          	jalr	-1756(ra) # 80007a54 <consputc>
    80008138:	f41ff06f          	j	80008078 <__printf+0x440>
    8000813c:	02500513          	li	a0,37
    80008140:	00000097          	auipc	ra,0x0
    80008144:	914080e7          	jalr	-1772(ra) # 80007a54 <consputc>
    80008148:	f31ff06f          	j	80008078 <__printf+0x440>
    8000814c:	00030513          	mv	a0,t1
    80008150:	00000097          	auipc	ra,0x0
    80008154:	7bc080e7          	jalr	1980(ra) # 8000890c <acquire>
    80008158:	b4dff06f          	j	80007ca4 <__printf+0x6c>
    8000815c:	40c0053b          	negw	a0,a2
    80008160:	00a00713          	li	a4,10
    80008164:	02e576bb          	remuw	a3,a0,a4
    80008168:	00002d97          	auipc	s11,0x2
    8000816c:	610d8d93          	addi	s11,s11,1552 # 8000a778 <digits>
    80008170:	ff700593          	li	a1,-9
    80008174:	02069693          	slli	a3,a3,0x20
    80008178:	0206d693          	srli	a3,a3,0x20
    8000817c:	00dd86b3          	add	a3,s11,a3
    80008180:	0006c683          	lbu	a3,0(a3)
    80008184:	02e557bb          	divuw	a5,a0,a4
    80008188:	f8d40023          	sb	a3,-128(s0)
    8000818c:	10b65e63          	bge	a2,a1,800082a8 <__printf+0x670>
    80008190:	06300593          	li	a1,99
    80008194:	02e7f6bb          	remuw	a3,a5,a4
    80008198:	02069693          	slli	a3,a3,0x20
    8000819c:	0206d693          	srli	a3,a3,0x20
    800081a0:	00dd86b3          	add	a3,s11,a3
    800081a4:	0006c683          	lbu	a3,0(a3)
    800081a8:	02e7d73b          	divuw	a4,a5,a4
    800081ac:	00200793          	li	a5,2
    800081b0:	f8d400a3          	sb	a3,-127(s0)
    800081b4:	bca5ece3          	bltu	a1,a0,80007d8c <__printf+0x154>
    800081b8:	ce5ff06f          	j	80007e9c <__printf+0x264>
    800081bc:	40e007bb          	negw	a5,a4
    800081c0:	00002d97          	auipc	s11,0x2
    800081c4:	5b8d8d93          	addi	s11,s11,1464 # 8000a778 <digits>
    800081c8:	00f7f693          	andi	a3,a5,15
    800081cc:	00dd86b3          	add	a3,s11,a3
    800081d0:	0006c583          	lbu	a1,0(a3)
    800081d4:	ff100613          	li	a2,-15
    800081d8:	0047d69b          	srliw	a3,a5,0x4
    800081dc:	f8b40023          	sb	a1,-128(s0)
    800081e0:	0047d59b          	srliw	a1,a5,0x4
    800081e4:	0ac75e63          	bge	a4,a2,800082a0 <__printf+0x668>
    800081e8:	00f6f693          	andi	a3,a3,15
    800081ec:	00dd86b3          	add	a3,s11,a3
    800081f0:	0006c603          	lbu	a2,0(a3)
    800081f4:	00f00693          	li	a3,15
    800081f8:	0087d79b          	srliw	a5,a5,0x8
    800081fc:	f8c400a3          	sb	a2,-127(s0)
    80008200:	d8b6e4e3          	bltu	a3,a1,80007f88 <__printf+0x350>
    80008204:	00200793          	li	a5,2
    80008208:	e2dff06f          	j	80008034 <__printf+0x3fc>
    8000820c:	00002c97          	auipc	s9,0x2
    80008210:	54cc8c93          	addi	s9,s9,1356 # 8000a758 <CONSOLE_STATUS+0x748>
    80008214:	02800513          	li	a0,40
    80008218:	ef1ff06f          	j	80008108 <__printf+0x4d0>
    8000821c:	00700793          	li	a5,7
    80008220:	00600c93          	li	s9,6
    80008224:	e0dff06f          	j	80008030 <__printf+0x3f8>
    80008228:	00700793          	li	a5,7
    8000822c:	00600c93          	li	s9,6
    80008230:	c69ff06f          	j	80007e98 <__printf+0x260>
    80008234:	00300793          	li	a5,3
    80008238:	00200c93          	li	s9,2
    8000823c:	c5dff06f          	j	80007e98 <__printf+0x260>
    80008240:	00300793          	li	a5,3
    80008244:	00200c93          	li	s9,2
    80008248:	de9ff06f          	j	80008030 <__printf+0x3f8>
    8000824c:	00400793          	li	a5,4
    80008250:	00300c93          	li	s9,3
    80008254:	dddff06f          	j	80008030 <__printf+0x3f8>
    80008258:	00400793          	li	a5,4
    8000825c:	00300c93          	li	s9,3
    80008260:	c39ff06f          	j	80007e98 <__printf+0x260>
    80008264:	00500793          	li	a5,5
    80008268:	00400c93          	li	s9,4
    8000826c:	c2dff06f          	j	80007e98 <__printf+0x260>
    80008270:	00500793          	li	a5,5
    80008274:	00400c93          	li	s9,4
    80008278:	db9ff06f          	j	80008030 <__printf+0x3f8>
    8000827c:	00600793          	li	a5,6
    80008280:	00500c93          	li	s9,5
    80008284:	dadff06f          	j	80008030 <__printf+0x3f8>
    80008288:	00600793          	li	a5,6
    8000828c:	00500c93          	li	s9,5
    80008290:	c09ff06f          	j	80007e98 <__printf+0x260>
    80008294:	00800793          	li	a5,8
    80008298:	00700c93          	li	s9,7
    8000829c:	bfdff06f          	j	80007e98 <__printf+0x260>
    800082a0:	00100793          	li	a5,1
    800082a4:	d91ff06f          	j	80008034 <__printf+0x3fc>
    800082a8:	00100793          	li	a5,1
    800082ac:	bf1ff06f          	j	80007e9c <__printf+0x264>
    800082b0:	00900793          	li	a5,9
    800082b4:	00800c93          	li	s9,8
    800082b8:	be1ff06f          	j	80007e98 <__printf+0x260>
    800082bc:	00002517          	auipc	a0,0x2
    800082c0:	4a450513          	addi	a0,a0,1188 # 8000a760 <CONSOLE_STATUS+0x750>
    800082c4:	00000097          	auipc	ra,0x0
    800082c8:	918080e7          	jalr	-1768(ra) # 80007bdc <panic>

00000000800082cc <printfinit>:
    800082cc:	fe010113          	addi	sp,sp,-32
    800082d0:	00813823          	sd	s0,16(sp)
    800082d4:	00913423          	sd	s1,8(sp)
    800082d8:	00113c23          	sd	ra,24(sp)
    800082dc:	02010413          	addi	s0,sp,32
    800082e0:	00006497          	auipc	s1,0x6
    800082e4:	c6048493          	addi	s1,s1,-928 # 8000df40 <pr>
    800082e8:	00048513          	mv	a0,s1
    800082ec:	00002597          	auipc	a1,0x2
    800082f0:	48458593          	addi	a1,a1,1156 # 8000a770 <CONSOLE_STATUS+0x760>
    800082f4:	00000097          	auipc	ra,0x0
    800082f8:	5f4080e7          	jalr	1524(ra) # 800088e8 <initlock>
    800082fc:	01813083          	ld	ra,24(sp)
    80008300:	01013403          	ld	s0,16(sp)
    80008304:	0004ac23          	sw	zero,24(s1)
    80008308:	00813483          	ld	s1,8(sp)
    8000830c:	02010113          	addi	sp,sp,32
    80008310:	00008067          	ret

0000000080008314 <uartinit>:
    80008314:	ff010113          	addi	sp,sp,-16
    80008318:	00813423          	sd	s0,8(sp)
    8000831c:	01010413          	addi	s0,sp,16
    80008320:	100007b7          	lui	a5,0x10000
    80008324:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008328:	f8000713          	li	a4,-128
    8000832c:	00e781a3          	sb	a4,3(a5)
    80008330:	00300713          	li	a4,3
    80008334:	00e78023          	sb	a4,0(a5)
    80008338:	000780a3          	sb	zero,1(a5)
    8000833c:	00e781a3          	sb	a4,3(a5)
    80008340:	00700693          	li	a3,7
    80008344:	00d78123          	sb	a3,2(a5)
    80008348:	00e780a3          	sb	a4,1(a5)
    8000834c:	00813403          	ld	s0,8(sp)
    80008350:	01010113          	addi	sp,sp,16
    80008354:	00008067          	ret

0000000080008358 <uartputc>:
    80008358:	00005797          	auipc	a5,0x5
    8000835c:	8c07a783          	lw	a5,-1856(a5) # 8000cc18 <panicked>
    80008360:	00078463          	beqz	a5,80008368 <uartputc+0x10>
    80008364:	0000006f          	j	80008364 <uartputc+0xc>
    80008368:	fd010113          	addi	sp,sp,-48
    8000836c:	02813023          	sd	s0,32(sp)
    80008370:	00913c23          	sd	s1,24(sp)
    80008374:	01213823          	sd	s2,16(sp)
    80008378:	01313423          	sd	s3,8(sp)
    8000837c:	02113423          	sd	ra,40(sp)
    80008380:	03010413          	addi	s0,sp,48
    80008384:	00005917          	auipc	s2,0x5
    80008388:	89c90913          	addi	s2,s2,-1892 # 8000cc20 <uart_tx_r>
    8000838c:	00093783          	ld	a5,0(s2)
    80008390:	00005497          	auipc	s1,0x5
    80008394:	89848493          	addi	s1,s1,-1896 # 8000cc28 <uart_tx_w>
    80008398:	0004b703          	ld	a4,0(s1)
    8000839c:	02078693          	addi	a3,a5,32
    800083a0:	00050993          	mv	s3,a0
    800083a4:	02e69c63          	bne	a3,a4,800083dc <uartputc+0x84>
    800083a8:	00001097          	auipc	ra,0x1
    800083ac:	834080e7          	jalr	-1996(ra) # 80008bdc <push_on>
    800083b0:	00093783          	ld	a5,0(s2)
    800083b4:	0004b703          	ld	a4,0(s1)
    800083b8:	02078793          	addi	a5,a5,32
    800083bc:	00e79463          	bne	a5,a4,800083c4 <uartputc+0x6c>
    800083c0:	0000006f          	j	800083c0 <uartputc+0x68>
    800083c4:	00001097          	auipc	ra,0x1
    800083c8:	88c080e7          	jalr	-1908(ra) # 80008c50 <pop_on>
    800083cc:	00093783          	ld	a5,0(s2)
    800083d0:	0004b703          	ld	a4,0(s1)
    800083d4:	02078693          	addi	a3,a5,32
    800083d8:	fce688e3          	beq	a3,a4,800083a8 <uartputc+0x50>
    800083dc:	01f77693          	andi	a3,a4,31
    800083e0:	00006597          	auipc	a1,0x6
    800083e4:	b8058593          	addi	a1,a1,-1152 # 8000df60 <uart_tx_buf>
    800083e8:	00d586b3          	add	a3,a1,a3
    800083ec:	00170713          	addi	a4,a4,1
    800083f0:	01368023          	sb	s3,0(a3)
    800083f4:	00e4b023          	sd	a4,0(s1)
    800083f8:	10000637          	lui	a2,0x10000
    800083fc:	02f71063          	bne	a4,a5,8000841c <uartputc+0xc4>
    80008400:	0340006f          	j	80008434 <uartputc+0xdc>
    80008404:	00074703          	lbu	a4,0(a4)
    80008408:	00f93023          	sd	a5,0(s2)
    8000840c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008410:	00093783          	ld	a5,0(s2)
    80008414:	0004b703          	ld	a4,0(s1)
    80008418:	00f70e63          	beq	a4,a5,80008434 <uartputc+0xdc>
    8000841c:	00564683          	lbu	a3,5(a2)
    80008420:	01f7f713          	andi	a4,a5,31
    80008424:	00e58733          	add	a4,a1,a4
    80008428:	0206f693          	andi	a3,a3,32
    8000842c:	00178793          	addi	a5,a5,1
    80008430:	fc069ae3          	bnez	a3,80008404 <uartputc+0xac>
    80008434:	02813083          	ld	ra,40(sp)
    80008438:	02013403          	ld	s0,32(sp)
    8000843c:	01813483          	ld	s1,24(sp)
    80008440:	01013903          	ld	s2,16(sp)
    80008444:	00813983          	ld	s3,8(sp)
    80008448:	03010113          	addi	sp,sp,48
    8000844c:	00008067          	ret

0000000080008450 <uartputc_sync>:
    80008450:	ff010113          	addi	sp,sp,-16
    80008454:	00813423          	sd	s0,8(sp)
    80008458:	01010413          	addi	s0,sp,16
    8000845c:	00004717          	auipc	a4,0x4
    80008460:	7bc72703          	lw	a4,1980(a4) # 8000cc18 <panicked>
    80008464:	02071663          	bnez	a4,80008490 <uartputc_sync+0x40>
    80008468:	00050793          	mv	a5,a0
    8000846c:	100006b7          	lui	a3,0x10000
    80008470:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008474:	02077713          	andi	a4,a4,32
    80008478:	fe070ce3          	beqz	a4,80008470 <uartputc_sync+0x20>
    8000847c:	0ff7f793          	andi	a5,a5,255
    80008480:	00f68023          	sb	a5,0(a3)
    80008484:	00813403          	ld	s0,8(sp)
    80008488:	01010113          	addi	sp,sp,16
    8000848c:	00008067          	ret
    80008490:	0000006f          	j	80008490 <uartputc_sync+0x40>

0000000080008494 <uartstart>:
    80008494:	ff010113          	addi	sp,sp,-16
    80008498:	00813423          	sd	s0,8(sp)
    8000849c:	01010413          	addi	s0,sp,16
    800084a0:	00004617          	auipc	a2,0x4
    800084a4:	78060613          	addi	a2,a2,1920 # 8000cc20 <uart_tx_r>
    800084a8:	00004517          	auipc	a0,0x4
    800084ac:	78050513          	addi	a0,a0,1920 # 8000cc28 <uart_tx_w>
    800084b0:	00063783          	ld	a5,0(a2)
    800084b4:	00053703          	ld	a4,0(a0)
    800084b8:	04f70263          	beq	a4,a5,800084fc <uartstart+0x68>
    800084bc:	100005b7          	lui	a1,0x10000
    800084c0:	00006817          	auipc	a6,0x6
    800084c4:	aa080813          	addi	a6,a6,-1376 # 8000df60 <uart_tx_buf>
    800084c8:	01c0006f          	j	800084e4 <uartstart+0x50>
    800084cc:	0006c703          	lbu	a4,0(a3)
    800084d0:	00f63023          	sd	a5,0(a2)
    800084d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800084d8:	00063783          	ld	a5,0(a2)
    800084dc:	00053703          	ld	a4,0(a0)
    800084e0:	00f70e63          	beq	a4,a5,800084fc <uartstart+0x68>
    800084e4:	01f7f713          	andi	a4,a5,31
    800084e8:	00e806b3          	add	a3,a6,a4
    800084ec:	0055c703          	lbu	a4,5(a1)
    800084f0:	00178793          	addi	a5,a5,1
    800084f4:	02077713          	andi	a4,a4,32
    800084f8:	fc071ae3          	bnez	a4,800084cc <uartstart+0x38>
    800084fc:	00813403          	ld	s0,8(sp)
    80008500:	01010113          	addi	sp,sp,16
    80008504:	00008067          	ret

0000000080008508 <uartgetc>:
    80008508:	ff010113          	addi	sp,sp,-16
    8000850c:	00813423          	sd	s0,8(sp)
    80008510:	01010413          	addi	s0,sp,16
    80008514:	10000737          	lui	a4,0x10000
    80008518:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000851c:	0017f793          	andi	a5,a5,1
    80008520:	00078c63          	beqz	a5,80008538 <uartgetc+0x30>
    80008524:	00074503          	lbu	a0,0(a4)
    80008528:	0ff57513          	andi	a0,a0,255
    8000852c:	00813403          	ld	s0,8(sp)
    80008530:	01010113          	addi	sp,sp,16
    80008534:	00008067          	ret
    80008538:	fff00513          	li	a0,-1
    8000853c:	ff1ff06f          	j	8000852c <uartgetc+0x24>

0000000080008540 <uartintr>:
    80008540:	100007b7          	lui	a5,0x10000
    80008544:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008548:	0017f793          	andi	a5,a5,1
    8000854c:	0a078463          	beqz	a5,800085f4 <uartintr+0xb4>
    80008550:	fe010113          	addi	sp,sp,-32
    80008554:	00813823          	sd	s0,16(sp)
    80008558:	00913423          	sd	s1,8(sp)
    8000855c:	00113c23          	sd	ra,24(sp)
    80008560:	02010413          	addi	s0,sp,32
    80008564:	100004b7          	lui	s1,0x10000
    80008568:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000856c:	0ff57513          	andi	a0,a0,255
    80008570:	fffff097          	auipc	ra,0xfffff
    80008574:	534080e7          	jalr	1332(ra) # 80007aa4 <consoleintr>
    80008578:	0054c783          	lbu	a5,5(s1)
    8000857c:	0017f793          	andi	a5,a5,1
    80008580:	fe0794e3          	bnez	a5,80008568 <uartintr+0x28>
    80008584:	00004617          	auipc	a2,0x4
    80008588:	69c60613          	addi	a2,a2,1692 # 8000cc20 <uart_tx_r>
    8000858c:	00004517          	auipc	a0,0x4
    80008590:	69c50513          	addi	a0,a0,1692 # 8000cc28 <uart_tx_w>
    80008594:	00063783          	ld	a5,0(a2)
    80008598:	00053703          	ld	a4,0(a0)
    8000859c:	04f70263          	beq	a4,a5,800085e0 <uartintr+0xa0>
    800085a0:	100005b7          	lui	a1,0x10000
    800085a4:	00006817          	auipc	a6,0x6
    800085a8:	9bc80813          	addi	a6,a6,-1604 # 8000df60 <uart_tx_buf>
    800085ac:	01c0006f          	j	800085c8 <uartintr+0x88>
    800085b0:	0006c703          	lbu	a4,0(a3)
    800085b4:	00f63023          	sd	a5,0(a2)
    800085b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800085bc:	00063783          	ld	a5,0(a2)
    800085c0:	00053703          	ld	a4,0(a0)
    800085c4:	00f70e63          	beq	a4,a5,800085e0 <uartintr+0xa0>
    800085c8:	01f7f713          	andi	a4,a5,31
    800085cc:	00e806b3          	add	a3,a6,a4
    800085d0:	0055c703          	lbu	a4,5(a1)
    800085d4:	00178793          	addi	a5,a5,1
    800085d8:	02077713          	andi	a4,a4,32
    800085dc:	fc071ae3          	bnez	a4,800085b0 <uartintr+0x70>
    800085e0:	01813083          	ld	ra,24(sp)
    800085e4:	01013403          	ld	s0,16(sp)
    800085e8:	00813483          	ld	s1,8(sp)
    800085ec:	02010113          	addi	sp,sp,32
    800085f0:	00008067          	ret
    800085f4:	00004617          	auipc	a2,0x4
    800085f8:	62c60613          	addi	a2,a2,1580 # 8000cc20 <uart_tx_r>
    800085fc:	00004517          	auipc	a0,0x4
    80008600:	62c50513          	addi	a0,a0,1580 # 8000cc28 <uart_tx_w>
    80008604:	00063783          	ld	a5,0(a2)
    80008608:	00053703          	ld	a4,0(a0)
    8000860c:	04f70263          	beq	a4,a5,80008650 <uartintr+0x110>
    80008610:	100005b7          	lui	a1,0x10000
    80008614:	00006817          	auipc	a6,0x6
    80008618:	94c80813          	addi	a6,a6,-1716 # 8000df60 <uart_tx_buf>
    8000861c:	01c0006f          	j	80008638 <uartintr+0xf8>
    80008620:	0006c703          	lbu	a4,0(a3)
    80008624:	00f63023          	sd	a5,0(a2)
    80008628:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000862c:	00063783          	ld	a5,0(a2)
    80008630:	00053703          	ld	a4,0(a0)
    80008634:	02f70063          	beq	a4,a5,80008654 <uartintr+0x114>
    80008638:	01f7f713          	andi	a4,a5,31
    8000863c:	00e806b3          	add	a3,a6,a4
    80008640:	0055c703          	lbu	a4,5(a1)
    80008644:	00178793          	addi	a5,a5,1
    80008648:	02077713          	andi	a4,a4,32
    8000864c:	fc071ae3          	bnez	a4,80008620 <uartintr+0xe0>
    80008650:	00008067          	ret
    80008654:	00008067          	ret

0000000080008658 <kinit>:
    80008658:	fc010113          	addi	sp,sp,-64
    8000865c:	02913423          	sd	s1,40(sp)
    80008660:	fffff7b7          	lui	a5,0xfffff
    80008664:	00007497          	auipc	s1,0x7
    80008668:	91b48493          	addi	s1,s1,-1765 # 8000ef7f <end+0xfff>
    8000866c:	02813823          	sd	s0,48(sp)
    80008670:	01313c23          	sd	s3,24(sp)
    80008674:	00f4f4b3          	and	s1,s1,a5
    80008678:	02113c23          	sd	ra,56(sp)
    8000867c:	03213023          	sd	s2,32(sp)
    80008680:	01413823          	sd	s4,16(sp)
    80008684:	01513423          	sd	s5,8(sp)
    80008688:	04010413          	addi	s0,sp,64
    8000868c:	000017b7          	lui	a5,0x1
    80008690:	01100993          	li	s3,17
    80008694:	00f487b3          	add	a5,s1,a5
    80008698:	01b99993          	slli	s3,s3,0x1b
    8000869c:	06f9e063          	bltu	s3,a5,800086fc <kinit+0xa4>
    800086a0:	00006a97          	auipc	s5,0x6
    800086a4:	8e0a8a93          	addi	s5,s5,-1824 # 8000df80 <end>
    800086a8:	0754ec63          	bltu	s1,s5,80008720 <kinit+0xc8>
    800086ac:	0734fa63          	bgeu	s1,s3,80008720 <kinit+0xc8>
    800086b0:	00088a37          	lui	s4,0x88
    800086b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800086b8:	00004917          	auipc	s2,0x4
    800086bc:	57890913          	addi	s2,s2,1400 # 8000cc30 <kmem>
    800086c0:	00ca1a13          	slli	s4,s4,0xc
    800086c4:	0140006f          	j	800086d8 <kinit+0x80>
    800086c8:	000017b7          	lui	a5,0x1
    800086cc:	00f484b3          	add	s1,s1,a5
    800086d0:	0554e863          	bltu	s1,s5,80008720 <kinit+0xc8>
    800086d4:	0534f663          	bgeu	s1,s3,80008720 <kinit+0xc8>
    800086d8:	00001637          	lui	a2,0x1
    800086dc:	00100593          	li	a1,1
    800086e0:	00048513          	mv	a0,s1
    800086e4:	00000097          	auipc	ra,0x0
    800086e8:	5e4080e7          	jalr	1508(ra) # 80008cc8 <__memset>
    800086ec:	00093783          	ld	a5,0(s2)
    800086f0:	00f4b023          	sd	a5,0(s1)
    800086f4:	00993023          	sd	s1,0(s2)
    800086f8:	fd4498e3          	bne	s1,s4,800086c8 <kinit+0x70>
    800086fc:	03813083          	ld	ra,56(sp)
    80008700:	03013403          	ld	s0,48(sp)
    80008704:	02813483          	ld	s1,40(sp)
    80008708:	02013903          	ld	s2,32(sp)
    8000870c:	01813983          	ld	s3,24(sp)
    80008710:	01013a03          	ld	s4,16(sp)
    80008714:	00813a83          	ld	s5,8(sp)
    80008718:	04010113          	addi	sp,sp,64
    8000871c:	00008067          	ret
    80008720:	00002517          	auipc	a0,0x2
    80008724:	07050513          	addi	a0,a0,112 # 8000a790 <digits+0x18>
    80008728:	fffff097          	auipc	ra,0xfffff
    8000872c:	4b4080e7          	jalr	1204(ra) # 80007bdc <panic>

0000000080008730 <freerange>:
    80008730:	fc010113          	addi	sp,sp,-64
    80008734:	000017b7          	lui	a5,0x1
    80008738:	02913423          	sd	s1,40(sp)
    8000873c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008740:	009504b3          	add	s1,a0,s1
    80008744:	fffff537          	lui	a0,0xfffff
    80008748:	02813823          	sd	s0,48(sp)
    8000874c:	02113c23          	sd	ra,56(sp)
    80008750:	03213023          	sd	s2,32(sp)
    80008754:	01313c23          	sd	s3,24(sp)
    80008758:	01413823          	sd	s4,16(sp)
    8000875c:	01513423          	sd	s5,8(sp)
    80008760:	01613023          	sd	s6,0(sp)
    80008764:	04010413          	addi	s0,sp,64
    80008768:	00a4f4b3          	and	s1,s1,a0
    8000876c:	00f487b3          	add	a5,s1,a5
    80008770:	06f5e463          	bltu	a1,a5,800087d8 <freerange+0xa8>
    80008774:	00006a97          	auipc	s5,0x6
    80008778:	80ca8a93          	addi	s5,s5,-2036 # 8000df80 <end>
    8000877c:	0954e263          	bltu	s1,s5,80008800 <freerange+0xd0>
    80008780:	01100993          	li	s3,17
    80008784:	01b99993          	slli	s3,s3,0x1b
    80008788:	0734fc63          	bgeu	s1,s3,80008800 <freerange+0xd0>
    8000878c:	00058a13          	mv	s4,a1
    80008790:	00004917          	auipc	s2,0x4
    80008794:	4a090913          	addi	s2,s2,1184 # 8000cc30 <kmem>
    80008798:	00002b37          	lui	s6,0x2
    8000879c:	0140006f          	j	800087b0 <freerange+0x80>
    800087a0:	000017b7          	lui	a5,0x1
    800087a4:	00f484b3          	add	s1,s1,a5
    800087a8:	0554ec63          	bltu	s1,s5,80008800 <freerange+0xd0>
    800087ac:	0534fa63          	bgeu	s1,s3,80008800 <freerange+0xd0>
    800087b0:	00001637          	lui	a2,0x1
    800087b4:	00100593          	li	a1,1
    800087b8:	00048513          	mv	a0,s1
    800087bc:	00000097          	auipc	ra,0x0
    800087c0:	50c080e7          	jalr	1292(ra) # 80008cc8 <__memset>
    800087c4:	00093703          	ld	a4,0(s2)
    800087c8:	016487b3          	add	a5,s1,s6
    800087cc:	00e4b023          	sd	a4,0(s1)
    800087d0:	00993023          	sd	s1,0(s2)
    800087d4:	fcfa76e3          	bgeu	s4,a5,800087a0 <freerange+0x70>
    800087d8:	03813083          	ld	ra,56(sp)
    800087dc:	03013403          	ld	s0,48(sp)
    800087e0:	02813483          	ld	s1,40(sp)
    800087e4:	02013903          	ld	s2,32(sp)
    800087e8:	01813983          	ld	s3,24(sp)
    800087ec:	01013a03          	ld	s4,16(sp)
    800087f0:	00813a83          	ld	s5,8(sp)
    800087f4:	00013b03          	ld	s6,0(sp)
    800087f8:	04010113          	addi	sp,sp,64
    800087fc:	00008067          	ret
    80008800:	00002517          	auipc	a0,0x2
    80008804:	f9050513          	addi	a0,a0,-112 # 8000a790 <digits+0x18>
    80008808:	fffff097          	auipc	ra,0xfffff
    8000880c:	3d4080e7          	jalr	980(ra) # 80007bdc <panic>

0000000080008810 <kfree>:
    80008810:	fe010113          	addi	sp,sp,-32
    80008814:	00813823          	sd	s0,16(sp)
    80008818:	00113c23          	sd	ra,24(sp)
    8000881c:	00913423          	sd	s1,8(sp)
    80008820:	02010413          	addi	s0,sp,32
    80008824:	03451793          	slli	a5,a0,0x34
    80008828:	04079c63          	bnez	a5,80008880 <kfree+0x70>
    8000882c:	00005797          	auipc	a5,0x5
    80008830:	75478793          	addi	a5,a5,1876 # 8000df80 <end>
    80008834:	00050493          	mv	s1,a0
    80008838:	04f56463          	bltu	a0,a5,80008880 <kfree+0x70>
    8000883c:	01100793          	li	a5,17
    80008840:	01b79793          	slli	a5,a5,0x1b
    80008844:	02f57e63          	bgeu	a0,a5,80008880 <kfree+0x70>
    80008848:	00001637          	lui	a2,0x1
    8000884c:	00100593          	li	a1,1
    80008850:	00000097          	auipc	ra,0x0
    80008854:	478080e7          	jalr	1144(ra) # 80008cc8 <__memset>
    80008858:	00004797          	auipc	a5,0x4
    8000885c:	3d878793          	addi	a5,a5,984 # 8000cc30 <kmem>
    80008860:	0007b703          	ld	a4,0(a5)
    80008864:	01813083          	ld	ra,24(sp)
    80008868:	01013403          	ld	s0,16(sp)
    8000886c:	00e4b023          	sd	a4,0(s1)
    80008870:	0097b023          	sd	s1,0(a5)
    80008874:	00813483          	ld	s1,8(sp)
    80008878:	02010113          	addi	sp,sp,32
    8000887c:	00008067          	ret
    80008880:	00002517          	auipc	a0,0x2
    80008884:	f1050513          	addi	a0,a0,-240 # 8000a790 <digits+0x18>
    80008888:	fffff097          	auipc	ra,0xfffff
    8000888c:	354080e7          	jalr	852(ra) # 80007bdc <panic>

0000000080008890 <kalloc>:
    80008890:	fe010113          	addi	sp,sp,-32
    80008894:	00813823          	sd	s0,16(sp)
    80008898:	00913423          	sd	s1,8(sp)
    8000889c:	00113c23          	sd	ra,24(sp)
    800088a0:	02010413          	addi	s0,sp,32
    800088a4:	00004797          	auipc	a5,0x4
    800088a8:	38c78793          	addi	a5,a5,908 # 8000cc30 <kmem>
    800088ac:	0007b483          	ld	s1,0(a5)
    800088b0:	02048063          	beqz	s1,800088d0 <kalloc+0x40>
    800088b4:	0004b703          	ld	a4,0(s1)
    800088b8:	00001637          	lui	a2,0x1
    800088bc:	00500593          	li	a1,5
    800088c0:	00048513          	mv	a0,s1
    800088c4:	00e7b023          	sd	a4,0(a5)
    800088c8:	00000097          	auipc	ra,0x0
    800088cc:	400080e7          	jalr	1024(ra) # 80008cc8 <__memset>
    800088d0:	01813083          	ld	ra,24(sp)
    800088d4:	01013403          	ld	s0,16(sp)
    800088d8:	00048513          	mv	a0,s1
    800088dc:	00813483          	ld	s1,8(sp)
    800088e0:	02010113          	addi	sp,sp,32
    800088e4:	00008067          	ret

00000000800088e8 <initlock>:
    800088e8:	ff010113          	addi	sp,sp,-16
    800088ec:	00813423          	sd	s0,8(sp)
    800088f0:	01010413          	addi	s0,sp,16
    800088f4:	00813403          	ld	s0,8(sp)
    800088f8:	00b53423          	sd	a1,8(a0)
    800088fc:	00052023          	sw	zero,0(a0)
    80008900:	00053823          	sd	zero,16(a0)
    80008904:	01010113          	addi	sp,sp,16
    80008908:	00008067          	ret

000000008000890c <acquire>:
    8000890c:	fe010113          	addi	sp,sp,-32
    80008910:	00813823          	sd	s0,16(sp)
    80008914:	00913423          	sd	s1,8(sp)
    80008918:	00113c23          	sd	ra,24(sp)
    8000891c:	01213023          	sd	s2,0(sp)
    80008920:	02010413          	addi	s0,sp,32
    80008924:	00050493          	mv	s1,a0
    80008928:	10002973          	csrr	s2,sstatus
    8000892c:	100027f3          	csrr	a5,sstatus
    80008930:	ffd7f793          	andi	a5,a5,-3
    80008934:	10079073          	csrw	sstatus,a5
    80008938:	fffff097          	auipc	ra,0xfffff
    8000893c:	8ec080e7          	jalr	-1812(ra) # 80007224 <mycpu>
    80008940:	07852783          	lw	a5,120(a0)
    80008944:	06078e63          	beqz	a5,800089c0 <acquire+0xb4>
    80008948:	fffff097          	auipc	ra,0xfffff
    8000894c:	8dc080e7          	jalr	-1828(ra) # 80007224 <mycpu>
    80008950:	07852783          	lw	a5,120(a0)
    80008954:	0004a703          	lw	a4,0(s1)
    80008958:	0017879b          	addiw	a5,a5,1
    8000895c:	06f52c23          	sw	a5,120(a0)
    80008960:	04071063          	bnez	a4,800089a0 <acquire+0x94>
    80008964:	00100713          	li	a4,1
    80008968:	00070793          	mv	a5,a4
    8000896c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008970:	0007879b          	sext.w	a5,a5
    80008974:	fe079ae3          	bnez	a5,80008968 <acquire+0x5c>
    80008978:	0ff0000f          	fence
    8000897c:	fffff097          	auipc	ra,0xfffff
    80008980:	8a8080e7          	jalr	-1880(ra) # 80007224 <mycpu>
    80008984:	01813083          	ld	ra,24(sp)
    80008988:	01013403          	ld	s0,16(sp)
    8000898c:	00a4b823          	sd	a0,16(s1)
    80008990:	00013903          	ld	s2,0(sp)
    80008994:	00813483          	ld	s1,8(sp)
    80008998:	02010113          	addi	sp,sp,32
    8000899c:	00008067          	ret
    800089a0:	0104b903          	ld	s2,16(s1)
    800089a4:	fffff097          	auipc	ra,0xfffff
    800089a8:	880080e7          	jalr	-1920(ra) # 80007224 <mycpu>
    800089ac:	faa91ce3          	bne	s2,a0,80008964 <acquire+0x58>
    800089b0:	00002517          	auipc	a0,0x2
    800089b4:	de850513          	addi	a0,a0,-536 # 8000a798 <digits+0x20>
    800089b8:	fffff097          	auipc	ra,0xfffff
    800089bc:	224080e7          	jalr	548(ra) # 80007bdc <panic>
    800089c0:	00195913          	srli	s2,s2,0x1
    800089c4:	fffff097          	auipc	ra,0xfffff
    800089c8:	860080e7          	jalr	-1952(ra) # 80007224 <mycpu>
    800089cc:	00197913          	andi	s2,s2,1
    800089d0:	07252e23          	sw	s2,124(a0)
    800089d4:	f75ff06f          	j	80008948 <acquire+0x3c>

00000000800089d8 <release>:
    800089d8:	fe010113          	addi	sp,sp,-32
    800089dc:	00813823          	sd	s0,16(sp)
    800089e0:	00113c23          	sd	ra,24(sp)
    800089e4:	00913423          	sd	s1,8(sp)
    800089e8:	01213023          	sd	s2,0(sp)
    800089ec:	02010413          	addi	s0,sp,32
    800089f0:	00052783          	lw	a5,0(a0)
    800089f4:	00079a63          	bnez	a5,80008a08 <release+0x30>
    800089f8:	00002517          	auipc	a0,0x2
    800089fc:	da850513          	addi	a0,a0,-600 # 8000a7a0 <digits+0x28>
    80008a00:	fffff097          	auipc	ra,0xfffff
    80008a04:	1dc080e7          	jalr	476(ra) # 80007bdc <panic>
    80008a08:	01053903          	ld	s2,16(a0)
    80008a0c:	00050493          	mv	s1,a0
    80008a10:	fffff097          	auipc	ra,0xfffff
    80008a14:	814080e7          	jalr	-2028(ra) # 80007224 <mycpu>
    80008a18:	fea910e3          	bne	s2,a0,800089f8 <release+0x20>
    80008a1c:	0004b823          	sd	zero,16(s1)
    80008a20:	0ff0000f          	fence
    80008a24:	0f50000f          	fence	iorw,ow
    80008a28:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008a2c:	ffffe097          	auipc	ra,0xffffe
    80008a30:	7f8080e7          	jalr	2040(ra) # 80007224 <mycpu>
    80008a34:	100027f3          	csrr	a5,sstatus
    80008a38:	0027f793          	andi	a5,a5,2
    80008a3c:	04079a63          	bnez	a5,80008a90 <release+0xb8>
    80008a40:	07852783          	lw	a5,120(a0)
    80008a44:	02f05e63          	blez	a5,80008a80 <release+0xa8>
    80008a48:	fff7871b          	addiw	a4,a5,-1
    80008a4c:	06e52c23          	sw	a4,120(a0)
    80008a50:	00071c63          	bnez	a4,80008a68 <release+0x90>
    80008a54:	07c52783          	lw	a5,124(a0)
    80008a58:	00078863          	beqz	a5,80008a68 <release+0x90>
    80008a5c:	100027f3          	csrr	a5,sstatus
    80008a60:	0027e793          	ori	a5,a5,2
    80008a64:	10079073          	csrw	sstatus,a5
    80008a68:	01813083          	ld	ra,24(sp)
    80008a6c:	01013403          	ld	s0,16(sp)
    80008a70:	00813483          	ld	s1,8(sp)
    80008a74:	00013903          	ld	s2,0(sp)
    80008a78:	02010113          	addi	sp,sp,32
    80008a7c:	00008067          	ret
    80008a80:	00002517          	auipc	a0,0x2
    80008a84:	d4050513          	addi	a0,a0,-704 # 8000a7c0 <digits+0x48>
    80008a88:	fffff097          	auipc	ra,0xfffff
    80008a8c:	154080e7          	jalr	340(ra) # 80007bdc <panic>
    80008a90:	00002517          	auipc	a0,0x2
    80008a94:	d1850513          	addi	a0,a0,-744 # 8000a7a8 <digits+0x30>
    80008a98:	fffff097          	auipc	ra,0xfffff
    80008a9c:	144080e7          	jalr	324(ra) # 80007bdc <panic>

0000000080008aa0 <holding>:
    80008aa0:	00052783          	lw	a5,0(a0)
    80008aa4:	00079663          	bnez	a5,80008ab0 <holding+0x10>
    80008aa8:	00000513          	li	a0,0
    80008aac:	00008067          	ret
    80008ab0:	fe010113          	addi	sp,sp,-32
    80008ab4:	00813823          	sd	s0,16(sp)
    80008ab8:	00913423          	sd	s1,8(sp)
    80008abc:	00113c23          	sd	ra,24(sp)
    80008ac0:	02010413          	addi	s0,sp,32
    80008ac4:	01053483          	ld	s1,16(a0)
    80008ac8:	ffffe097          	auipc	ra,0xffffe
    80008acc:	75c080e7          	jalr	1884(ra) # 80007224 <mycpu>
    80008ad0:	01813083          	ld	ra,24(sp)
    80008ad4:	01013403          	ld	s0,16(sp)
    80008ad8:	40a48533          	sub	a0,s1,a0
    80008adc:	00153513          	seqz	a0,a0
    80008ae0:	00813483          	ld	s1,8(sp)
    80008ae4:	02010113          	addi	sp,sp,32
    80008ae8:	00008067          	ret

0000000080008aec <push_off>:
    80008aec:	fe010113          	addi	sp,sp,-32
    80008af0:	00813823          	sd	s0,16(sp)
    80008af4:	00113c23          	sd	ra,24(sp)
    80008af8:	00913423          	sd	s1,8(sp)
    80008afc:	02010413          	addi	s0,sp,32
    80008b00:	100024f3          	csrr	s1,sstatus
    80008b04:	100027f3          	csrr	a5,sstatus
    80008b08:	ffd7f793          	andi	a5,a5,-3
    80008b0c:	10079073          	csrw	sstatus,a5
    80008b10:	ffffe097          	auipc	ra,0xffffe
    80008b14:	714080e7          	jalr	1812(ra) # 80007224 <mycpu>
    80008b18:	07852783          	lw	a5,120(a0)
    80008b1c:	02078663          	beqz	a5,80008b48 <push_off+0x5c>
    80008b20:	ffffe097          	auipc	ra,0xffffe
    80008b24:	704080e7          	jalr	1796(ra) # 80007224 <mycpu>
    80008b28:	07852783          	lw	a5,120(a0)
    80008b2c:	01813083          	ld	ra,24(sp)
    80008b30:	01013403          	ld	s0,16(sp)
    80008b34:	0017879b          	addiw	a5,a5,1
    80008b38:	06f52c23          	sw	a5,120(a0)
    80008b3c:	00813483          	ld	s1,8(sp)
    80008b40:	02010113          	addi	sp,sp,32
    80008b44:	00008067          	ret
    80008b48:	0014d493          	srli	s1,s1,0x1
    80008b4c:	ffffe097          	auipc	ra,0xffffe
    80008b50:	6d8080e7          	jalr	1752(ra) # 80007224 <mycpu>
    80008b54:	0014f493          	andi	s1,s1,1
    80008b58:	06952e23          	sw	s1,124(a0)
    80008b5c:	fc5ff06f          	j	80008b20 <push_off+0x34>

0000000080008b60 <pop_off>:
    80008b60:	ff010113          	addi	sp,sp,-16
    80008b64:	00813023          	sd	s0,0(sp)
    80008b68:	00113423          	sd	ra,8(sp)
    80008b6c:	01010413          	addi	s0,sp,16
    80008b70:	ffffe097          	auipc	ra,0xffffe
    80008b74:	6b4080e7          	jalr	1716(ra) # 80007224 <mycpu>
    80008b78:	100027f3          	csrr	a5,sstatus
    80008b7c:	0027f793          	andi	a5,a5,2
    80008b80:	04079663          	bnez	a5,80008bcc <pop_off+0x6c>
    80008b84:	07852783          	lw	a5,120(a0)
    80008b88:	02f05a63          	blez	a5,80008bbc <pop_off+0x5c>
    80008b8c:	fff7871b          	addiw	a4,a5,-1
    80008b90:	06e52c23          	sw	a4,120(a0)
    80008b94:	00071c63          	bnez	a4,80008bac <pop_off+0x4c>
    80008b98:	07c52783          	lw	a5,124(a0)
    80008b9c:	00078863          	beqz	a5,80008bac <pop_off+0x4c>
    80008ba0:	100027f3          	csrr	a5,sstatus
    80008ba4:	0027e793          	ori	a5,a5,2
    80008ba8:	10079073          	csrw	sstatus,a5
    80008bac:	00813083          	ld	ra,8(sp)
    80008bb0:	00013403          	ld	s0,0(sp)
    80008bb4:	01010113          	addi	sp,sp,16
    80008bb8:	00008067          	ret
    80008bbc:	00002517          	auipc	a0,0x2
    80008bc0:	c0450513          	addi	a0,a0,-1020 # 8000a7c0 <digits+0x48>
    80008bc4:	fffff097          	auipc	ra,0xfffff
    80008bc8:	018080e7          	jalr	24(ra) # 80007bdc <panic>
    80008bcc:	00002517          	auipc	a0,0x2
    80008bd0:	bdc50513          	addi	a0,a0,-1060 # 8000a7a8 <digits+0x30>
    80008bd4:	fffff097          	auipc	ra,0xfffff
    80008bd8:	008080e7          	jalr	8(ra) # 80007bdc <panic>

0000000080008bdc <push_on>:
    80008bdc:	fe010113          	addi	sp,sp,-32
    80008be0:	00813823          	sd	s0,16(sp)
    80008be4:	00113c23          	sd	ra,24(sp)
    80008be8:	00913423          	sd	s1,8(sp)
    80008bec:	02010413          	addi	s0,sp,32
    80008bf0:	100024f3          	csrr	s1,sstatus
    80008bf4:	100027f3          	csrr	a5,sstatus
    80008bf8:	0027e793          	ori	a5,a5,2
    80008bfc:	10079073          	csrw	sstatus,a5
    80008c00:	ffffe097          	auipc	ra,0xffffe
    80008c04:	624080e7          	jalr	1572(ra) # 80007224 <mycpu>
    80008c08:	07852783          	lw	a5,120(a0)
    80008c0c:	02078663          	beqz	a5,80008c38 <push_on+0x5c>
    80008c10:	ffffe097          	auipc	ra,0xffffe
    80008c14:	614080e7          	jalr	1556(ra) # 80007224 <mycpu>
    80008c18:	07852783          	lw	a5,120(a0)
    80008c1c:	01813083          	ld	ra,24(sp)
    80008c20:	01013403          	ld	s0,16(sp)
    80008c24:	0017879b          	addiw	a5,a5,1
    80008c28:	06f52c23          	sw	a5,120(a0)
    80008c2c:	00813483          	ld	s1,8(sp)
    80008c30:	02010113          	addi	sp,sp,32
    80008c34:	00008067          	ret
    80008c38:	0014d493          	srli	s1,s1,0x1
    80008c3c:	ffffe097          	auipc	ra,0xffffe
    80008c40:	5e8080e7          	jalr	1512(ra) # 80007224 <mycpu>
    80008c44:	0014f493          	andi	s1,s1,1
    80008c48:	06952e23          	sw	s1,124(a0)
    80008c4c:	fc5ff06f          	j	80008c10 <push_on+0x34>

0000000080008c50 <pop_on>:
    80008c50:	ff010113          	addi	sp,sp,-16
    80008c54:	00813023          	sd	s0,0(sp)
    80008c58:	00113423          	sd	ra,8(sp)
    80008c5c:	01010413          	addi	s0,sp,16
    80008c60:	ffffe097          	auipc	ra,0xffffe
    80008c64:	5c4080e7          	jalr	1476(ra) # 80007224 <mycpu>
    80008c68:	100027f3          	csrr	a5,sstatus
    80008c6c:	0027f793          	andi	a5,a5,2
    80008c70:	04078463          	beqz	a5,80008cb8 <pop_on+0x68>
    80008c74:	07852783          	lw	a5,120(a0)
    80008c78:	02f05863          	blez	a5,80008ca8 <pop_on+0x58>
    80008c7c:	fff7879b          	addiw	a5,a5,-1
    80008c80:	06f52c23          	sw	a5,120(a0)
    80008c84:	07853783          	ld	a5,120(a0)
    80008c88:	00079863          	bnez	a5,80008c98 <pop_on+0x48>
    80008c8c:	100027f3          	csrr	a5,sstatus
    80008c90:	ffd7f793          	andi	a5,a5,-3
    80008c94:	10079073          	csrw	sstatus,a5
    80008c98:	00813083          	ld	ra,8(sp)
    80008c9c:	00013403          	ld	s0,0(sp)
    80008ca0:	01010113          	addi	sp,sp,16
    80008ca4:	00008067          	ret
    80008ca8:	00002517          	auipc	a0,0x2
    80008cac:	b4050513          	addi	a0,a0,-1216 # 8000a7e8 <digits+0x70>
    80008cb0:	fffff097          	auipc	ra,0xfffff
    80008cb4:	f2c080e7          	jalr	-212(ra) # 80007bdc <panic>
    80008cb8:	00002517          	auipc	a0,0x2
    80008cbc:	b1050513          	addi	a0,a0,-1264 # 8000a7c8 <digits+0x50>
    80008cc0:	fffff097          	auipc	ra,0xfffff
    80008cc4:	f1c080e7          	jalr	-228(ra) # 80007bdc <panic>

0000000080008cc8 <__memset>:
    80008cc8:	ff010113          	addi	sp,sp,-16
    80008ccc:	00813423          	sd	s0,8(sp)
    80008cd0:	01010413          	addi	s0,sp,16
    80008cd4:	1a060e63          	beqz	a2,80008e90 <__memset+0x1c8>
    80008cd8:	40a007b3          	neg	a5,a0
    80008cdc:	0077f793          	andi	a5,a5,7
    80008ce0:	00778693          	addi	a3,a5,7
    80008ce4:	00b00813          	li	a6,11
    80008ce8:	0ff5f593          	andi	a1,a1,255
    80008cec:	fff6071b          	addiw	a4,a2,-1
    80008cf0:	1b06e663          	bltu	a3,a6,80008e9c <__memset+0x1d4>
    80008cf4:	1cd76463          	bltu	a4,a3,80008ebc <__memset+0x1f4>
    80008cf8:	1a078e63          	beqz	a5,80008eb4 <__memset+0x1ec>
    80008cfc:	00b50023          	sb	a1,0(a0)
    80008d00:	00100713          	li	a4,1
    80008d04:	1ae78463          	beq	a5,a4,80008eac <__memset+0x1e4>
    80008d08:	00b500a3          	sb	a1,1(a0)
    80008d0c:	00200713          	li	a4,2
    80008d10:	1ae78a63          	beq	a5,a4,80008ec4 <__memset+0x1fc>
    80008d14:	00b50123          	sb	a1,2(a0)
    80008d18:	00300713          	li	a4,3
    80008d1c:	18e78463          	beq	a5,a4,80008ea4 <__memset+0x1dc>
    80008d20:	00b501a3          	sb	a1,3(a0)
    80008d24:	00400713          	li	a4,4
    80008d28:	1ae78263          	beq	a5,a4,80008ecc <__memset+0x204>
    80008d2c:	00b50223          	sb	a1,4(a0)
    80008d30:	00500713          	li	a4,5
    80008d34:	1ae78063          	beq	a5,a4,80008ed4 <__memset+0x20c>
    80008d38:	00b502a3          	sb	a1,5(a0)
    80008d3c:	00700713          	li	a4,7
    80008d40:	18e79e63          	bne	a5,a4,80008edc <__memset+0x214>
    80008d44:	00b50323          	sb	a1,6(a0)
    80008d48:	00700e93          	li	t4,7
    80008d4c:	00859713          	slli	a4,a1,0x8
    80008d50:	00e5e733          	or	a4,a1,a4
    80008d54:	01059e13          	slli	t3,a1,0x10
    80008d58:	01c76e33          	or	t3,a4,t3
    80008d5c:	01859313          	slli	t1,a1,0x18
    80008d60:	006e6333          	or	t1,t3,t1
    80008d64:	02059893          	slli	a7,a1,0x20
    80008d68:	40f60e3b          	subw	t3,a2,a5
    80008d6c:	011368b3          	or	a7,t1,a7
    80008d70:	02859813          	slli	a6,a1,0x28
    80008d74:	0108e833          	or	a6,a7,a6
    80008d78:	03059693          	slli	a3,a1,0x30
    80008d7c:	003e589b          	srliw	a7,t3,0x3
    80008d80:	00d866b3          	or	a3,a6,a3
    80008d84:	03859713          	slli	a4,a1,0x38
    80008d88:	00389813          	slli	a6,a7,0x3
    80008d8c:	00f507b3          	add	a5,a0,a5
    80008d90:	00e6e733          	or	a4,a3,a4
    80008d94:	000e089b          	sext.w	a7,t3
    80008d98:	00f806b3          	add	a3,a6,a5
    80008d9c:	00e7b023          	sd	a4,0(a5)
    80008da0:	00878793          	addi	a5,a5,8
    80008da4:	fed79ce3          	bne	a5,a3,80008d9c <__memset+0xd4>
    80008da8:	ff8e7793          	andi	a5,t3,-8
    80008dac:	0007871b          	sext.w	a4,a5
    80008db0:	01d787bb          	addw	a5,a5,t4
    80008db4:	0ce88e63          	beq	a7,a4,80008e90 <__memset+0x1c8>
    80008db8:	00f50733          	add	a4,a0,a5
    80008dbc:	00b70023          	sb	a1,0(a4)
    80008dc0:	0017871b          	addiw	a4,a5,1
    80008dc4:	0cc77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008dc8:	00e50733          	add	a4,a0,a4
    80008dcc:	00b70023          	sb	a1,0(a4)
    80008dd0:	0027871b          	addiw	a4,a5,2
    80008dd4:	0ac77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008dd8:	00e50733          	add	a4,a0,a4
    80008ddc:	00b70023          	sb	a1,0(a4)
    80008de0:	0037871b          	addiw	a4,a5,3
    80008de4:	0ac77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008de8:	00e50733          	add	a4,a0,a4
    80008dec:	00b70023          	sb	a1,0(a4)
    80008df0:	0047871b          	addiw	a4,a5,4
    80008df4:	08c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008df8:	00e50733          	add	a4,a0,a4
    80008dfc:	00b70023          	sb	a1,0(a4)
    80008e00:	0057871b          	addiw	a4,a5,5
    80008e04:	08c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e08:	00e50733          	add	a4,a0,a4
    80008e0c:	00b70023          	sb	a1,0(a4)
    80008e10:	0067871b          	addiw	a4,a5,6
    80008e14:	06c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e18:	00e50733          	add	a4,a0,a4
    80008e1c:	00b70023          	sb	a1,0(a4)
    80008e20:	0077871b          	addiw	a4,a5,7
    80008e24:	06c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e28:	00e50733          	add	a4,a0,a4
    80008e2c:	00b70023          	sb	a1,0(a4)
    80008e30:	0087871b          	addiw	a4,a5,8
    80008e34:	04c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e38:	00e50733          	add	a4,a0,a4
    80008e3c:	00b70023          	sb	a1,0(a4)
    80008e40:	0097871b          	addiw	a4,a5,9
    80008e44:	04c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00b70023          	sb	a1,0(a4)
    80008e50:	00a7871b          	addiw	a4,a5,10
    80008e54:	02c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e58:	00e50733          	add	a4,a0,a4
    80008e5c:	00b70023          	sb	a1,0(a4)
    80008e60:	00b7871b          	addiw	a4,a5,11
    80008e64:	02c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e68:	00e50733          	add	a4,a0,a4
    80008e6c:	00b70023          	sb	a1,0(a4)
    80008e70:	00c7871b          	addiw	a4,a5,12
    80008e74:	00c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e78:	00e50733          	add	a4,a0,a4
    80008e7c:	00b70023          	sb	a1,0(a4)
    80008e80:	00d7879b          	addiw	a5,a5,13
    80008e84:	00c7f663          	bgeu	a5,a2,80008e90 <__memset+0x1c8>
    80008e88:	00f507b3          	add	a5,a0,a5
    80008e8c:	00b78023          	sb	a1,0(a5)
    80008e90:	00813403          	ld	s0,8(sp)
    80008e94:	01010113          	addi	sp,sp,16
    80008e98:	00008067          	ret
    80008e9c:	00b00693          	li	a3,11
    80008ea0:	e55ff06f          	j	80008cf4 <__memset+0x2c>
    80008ea4:	00300e93          	li	t4,3
    80008ea8:	ea5ff06f          	j	80008d4c <__memset+0x84>
    80008eac:	00100e93          	li	t4,1
    80008eb0:	e9dff06f          	j	80008d4c <__memset+0x84>
    80008eb4:	00000e93          	li	t4,0
    80008eb8:	e95ff06f          	j	80008d4c <__memset+0x84>
    80008ebc:	00000793          	li	a5,0
    80008ec0:	ef9ff06f          	j	80008db8 <__memset+0xf0>
    80008ec4:	00200e93          	li	t4,2
    80008ec8:	e85ff06f          	j	80008d4c <__memset+0x84>
    80008ecc:	00400e93          	li	t4,4
    80008ed0:	e7dff06f          	j	80008d4c <__memset+0x84>
    80008ed4:	00500e93          	li	t4,5
    80008ed8:	e75ff06f          	j	80008d4c <__memset+0x84>
    80008edc:	00600e93          	li	t4,6
    80008ee0:	e6dff06f          	j	80008d4c <__memset+0x84>

0000000080008ee4 <__memmove>:
    80008ee4:	ff010113          	addi	sp,sp,-16
    80008ee8:	00813423          	sd	s0,8(sp)
    80008eec:	01010413          	addi	s0,sp,16
    80008ef0:	0e060863          	beqz	a2,80008fe0 <__memmove+0xfc>
    80008ef4:	fff6069b          	addiw	a3,a2,-1
    80008ef8:	0006881b          	sext.w	a6,a3
    80008efc:	0ea5e863          	bltu	a1,a0,80008fec <__memmove+0x108>
    80008f00:	00758713          	addi	a4,a1,7
    80008f04:	00a5e7b3          	or	a5,a1,a0
    80008f08:	40a70733          	sub	a4,a4,a0
    80008f0c:	0077f793          	andi	a5,a5,7
    80008f10:	00f73713          	sltiu	a4,a4,15
    80008f14:	00174713          	xori	a4,a4,1
    80008f18:	0017b793          	seqz	a5,a5
    80008f1c:	00e7f7b3          	and	a5,a5,a4
    80008f20:	10078863          	beqz	a5,80009030 <__memmove+0x14c>
    80008f24:	00900793          	li	a5,9
    80008f28:	1107f463          	bgeu	a5,a6,80009030 <__memmove+0x14c>
    80008f2c:	0036581b          	srliw	a6,a2,0x3
    80008f30:	fff8081b          	addiw	a6,a6,-1
    80008f34:	02081813          	slli	a6,a6,0x20
    80008f38:	01d85893          	srli	a7,a6,0x1d
    80008f3c:	00858813          	addi	a6,a1,8
    80008f40:	00058793          	mv	a5,a1
    80008f44:	00050713          	mv	a4,a0
    80008f48:	01088833          	add	a6,a7,a6
    80008f4c:	0007b883          	ld	a7,0(a5)
    80008f50:	00878793          	addi	a5,a5,8
    80008f54:	00870713          	addi	a4,a4,8
    80008f58:	ff173c23          	sd	a7,-8(a4)
    80008f5c:	ff0798e3          	bne	a5,a6,80008f4c <__memmove+0x68>
    80008f60:	ff867713          	andi	a4,a2,-8
    80008f64:	02071793          	slli	a5,a4,0x20
    80008f68:	0207d793          	srli	a5,a5,0x20
    80008f6c:	00f585b3          	add	a1,a1,a5
    80008f70:	40e686bb          	subw	a3,a3,a4
    80008f74:	00f507b3          	add	a5,a0,a5
    80008f78:	06e60463          	beq	a2,a4,80008fe0 <__memmove+0xfc>
    80008f7c:	0005c703          	lbu	a4,0(a1)
    80008f80:	00e78023          	sb	a4,0(a5)
    80008f84:	04068e63          	beqz	a3,80008fe0 <__memmove+0xfc>
    80008f88:	0015c603          	lbu	a2,1(a1)
    80008f8c:	00100713          	li	a4,1
    80008f90:	00c780a3          	sb	a2,1(a5)
    80008f94:	04e68663          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008f98:	0025c603          	lbu	a2,2(a1)
    80008f9c:	00200713          	li	a4,2
    80008fa0:	00c78123          	sb	a2,2(a5)
    80008fa4:	02e68e63          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fa8:	0035c603          	lbu	a2,3(a1)
    80008fac:	00300713          	li	a4,3
    80008fb0:	00c781a3          	sb	a2,3(a5)
    80008fb4:	02e68663          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fb8:	0045c603          	lbu	a2,4(a1)
    80008fbc:	00400713          	li	a4,4
    80008fc0:	00c78223          	sb	a2,4(a5)
    80008fc4:	00e68e63          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fc8:	0055c603          	lbu	a2,5(a1)
    80008fcc:	00500713          	li	a4,5
    80008fd0:	00c782a3          	sb	a2,5(a5)
    80008fd4:	00e68663          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fd8:	0065c703          	lbu	a4,6(a1)
    80008fdc:	00e78323          	sb	a4,6(a5)
    80008fe0:	00813403          	ld	s0,8(sp)
    80008fe4:	01010113          	addi	sp,sp,16
    80008fe8:	00008067          	ret
    80008fec:	02061713          	slli	a4,a2,0x20
    80008ff0:	02075713          	srli	a4,a4,0x20
    80008ff4:	00e587b3          	add	a5,a1,a4
    80008ff8:	f0f574e3          	bgeu	a0,a5,80008f00 <__memmove+0x1c>
    80008ffc:	02069613          	slli	a2,a3,0x20
    80009000:	02065613          	srli	a2,a2,0x20
    80009004:	fff64613          	not	a2,a2
    80009008:	00e50733          	add	a4,a0,a4
    8000900c:	00c78633          	add	a2,a5,a2
    80009010:	fff7c683          	lbu	a3,-1(a5)
    80009014:	fff78793          	addi	a5,a5,-1
    80009018:	fff70713          	addi	a4,a4,-1
    8000901c:	00d70023          	sb	a3,0(a4)
    80009020:	fec798e3          	bne	a5,a2,80009010 <__memmove+0x12c>
    80009024:	00813403          	ld	s0,8(sp)
    80009028:	01010113          	addi	sp,sp,16
    8000902c:	00008067          	ret
    80009030:	02069713          	slli	a4,a3,0x20
    80009034:	02075713          	srli	a4,a4,0x20
    80009038:	00170713          	addi	a4,a4,1
    8000903c:	00e50733          	add	a4,a0,a4
    80009040:	00050793          	mv	a5,a0
    80009044:	0005c683          	lbu	a3,0(a1)
    80009048:	00178793          	addi	a5,a5,1
    8000904c:	00158593          	addi	a1,a1,1
    80009050:	fed78fa3          	sb	a3,-1(a5)
    80009054:	fee798e3          	bne	a5,a4,80009044 <__memmove+0x160>
    80009058:	f89ff06f          	j	80008fe0 <__memmove+0xfc>
	...
