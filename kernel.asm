
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	b9013103          	ld	sp,-1136(sp) # 8000cb90 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	751060ef          	jal	ra,80006f6c <start>

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
    800010a4:	309010ef          	jal	ra,80002bac <_ZN5RISCV20handleSupervisorTrapEv>


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
    800017e0:	43478793          	addi	a5,a5,1076 # 8000cc10 <_ZN9Semaphore18allSemaphoresQueueE>
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

    int semTryToWait();
    int semTimeWait(time_t t);

    void* operator new(size_t size) {
        return MemoryAllocator::mem_alloc(size);
    8000181c:	03800513          	li	a0,56
    80001820:	00002097          	auipc	ra,0x2
    80001824:	e1c080e7          	jalr	-484(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
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
    80001860:	de0080e7          	jalr	-544(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
    List(const List<T> &)= delete;

    List<T> &operator=(const List<T> &)=delete;

    void addFirst(T *data) {
        Elem *el =new Elem(data,head);
    80001864:	0000b797          	auipc	a5,0xb
    80001868:	3ac78793          	addi	a5,a5,940 # 8000cc10 <_ZN9Semaphore18allSemaphoresQueueE>
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
    800018a8:	36a7ba23          	sd	a0,884(a5) # 8000cc18 <_ZN9Semaphore18allSemaphoresQueueE+0x8>
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
    800018f8:	ea8080e7          	jalr	-344(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
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
    80001974:	2387b783          	ld	a5,568(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001978:	0007b903          	ld	s2,0(a5)
            return MemoryAllocator::mem_alloc(size);
    8000197c:	01000513          	li	a0,16
    80001980:	00002097          	auipc	ra,0x2
    80001984:	cbc080e7          	jalr	-836(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
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
    800019ac:	2007b783          	ld	a5,512(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x50>
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
    80001a7c:	d24080e7          	jalr	-732(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
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
    80001bf8:	03c50513          	addi	a0,a0,60 # 8000cc30 <lockPrint>
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
    80001c38:	ffc50513          	addi	a0,a0,-4 # 8000cc30 <lockPrint>
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
    80001c80:	fb450513          	addi	a0,a0,-76 # 8000cc30 <lockPrint>
    80001c84:	fffff097          	auipc	ra,0xfffff
    80001c88:	37c080e7          	jalr	892(ra) # 80001000 <copy_and_swap>
    80001c8c:	00050863          	beqz	a0,80001c9c <_Z12printStringSPKc+0x40>
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	850080e7          	jalr	-1968(ra) # 800014e0 <_Z15thread_dispatchv>
    80001c98:	fddff06f          	j	80001c74 <_Z12printStringSPKc+0x18>
    while (*string != '\0') {
    80001c9c:	0004c503          	lbu	a0,0(s1)
    80001ca0:	00050a63          	beqz	a0,80001cb4 <_Z12printStringSPKc+0x58>
        Console::putc_S(*string);
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	7d4080e7          	jalr	2004(ra) # 80002478 <_ZN7Console6putc_SEc>
        string++;
    80001cac:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80001cb0:	fedff06f          	j	80001c9c <_Z12printStringSPKc+0x40>
    }
    UNLOCK();
    80001cb4:	00000613          	li	a2,0
    80001cb8:	00100593          	li	a1,1
    80001cbc:	0000b517          	auipc	a0,0xb
    80001cc0:	f7450513          	addi	a0,a0,-140 # 8000cc30 <lockPrint>
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
    80001d18:	f1c50513          	addi	a0,a0,-228 # 8000cc30 <lockPrint>
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
    80001d88:	eac50513          	addi	a0,a0,-340 # 8000cc30 <lockPrint>
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
    80001e40:	df450513          	addi	a0,a0,-524 # 8000cc30 <lockPrint>
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
    80001e8c:	aa870713          	addi	a4,a4,-1368 # 8000c930 <digits>
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
    80001f00:	d3450513          	addi	a0,a0,-716 # 8000cc30 <lockPrint>
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
    80001f60:	cd450513          	addi	a0,a0,-812 # 8000cc30 <lockPrint>
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
    80001fac:	98870713          	addi	a4,a4,-1656 # 8000c930 <digits>
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
        Console::putc_S(buf[i]);
    80001ff0:	fd040793          	addi	a5,s0,-48
    80001ff4:	009787b3          	add	a5,a5,s1
    80001ff8:	ff07c503          	lbu	a0,-16(a5)
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	47c080e7          	jalr	1148(ra) # 80002478 <_ZN7Console6putc_SEc>
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
    80002020:	c1450513          	addi	a0,a0,-1004 # 8000cc30 <lockPrint>
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
void Scheduler::put(TCB *ccb) {
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
    800020c8:	b7478793          	addi	a5,a5,-1164 # 8000cc38 <_ZN9Scheduler17readyThreadsQueueE>
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
    800020f8:	b4453503          	ld	a0,-1212(a0) # 8000cc38 <_ZN9Scheduler17readyThreadsQueueE>
    800020fc:	04050263          	beqz	a0,80002140 <_ZN9Scheduler3getEv+0x60>
        head=head->next;
    80002100:	00853783          	ld	a5,8(a0)
    80002104:	0000b717          	auipc	a4,0xb
    80002108:	b2f73a23          	sd	a5,-1228(a4) # 8000cc38 <_ZN9Scheduler17readyThreadsQueueE>
        if (!head) tail=0;
    8000210c:	02078463          	beqz	a5,80002134 <_ZN9Scheduler3getEv+0x54>
        T *ret=el->data;
    80002110:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80002114:	00001097          	auipc	ra,0x1
    80002118:	688080e7          	jalr	1672(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000211c:	00048513          	mv	a0,s1
    80002120:	01813083          	ld	ra,24(sp)
    80002124:	01013403          	ld	s0,16(sp)
    80002128:	00813483          	ld	s1,8(sp)
    8000212c:	02010113          	addi	sp,sp,32
    80002130:	00008067          	ret
        if (!head) tail=0;
    80002134:	0000b797          	auipc	a5,0xb
    80002138:	b007b623          	sd	zero,-1268(a5) # 8000cc40 <_ZN9Scheduler17readyThreadsQueueE+0x8>
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
    80002168:	4d8080e7          	jalr	1240(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
        Elem(T *data, Elem *next):data(data),next(next){}
    8000216c:	00953023          	sd	s1,0(a0)
    80002170:	00053423          	sd	zero,8(a0)
        if (tail) {
    80002174:	0000b797          	auipc	a5,0xb
    80002178:	acc7b783          	ld	a5,-1332(a5) # 8000cc40 <_ZN9Scheduler17readyThreadsQueueE+0x8>
    8000217c:	02078263          	beqz	a5,800021a0 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next=el;
    80002180:	00a7b423          	sd	a0,8(a5)
            tail=el;
    80002184:	0000b797          	auipc	a5,0xb
    80002188:	aaa7be23          	sd	a0,-1348(a5) # 8000cc40 <_ZN9Scheduler17readyThreadsQueueE+0x8>
}
    8000218c:	01813083          	ld	ra,24(sp)
    80002190:	01013403          	ld	s0,16(sp)
    80002194:	00813483          	ld	s1,8(sp)
    80002198:	02010113          	addi	sp,sp,32
    8000219c:	00008067          	ret
            head=tail=el;
    800021a0:	0000b797          	auipc	a5,0xb
    800021a4:	a9878793          	addi	a5,a5,-1384 # 8000cc38 <_ZN9Scheduler17readyThreadsQueueE>
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
    800021c4:	a7853503          	ld	a0,-1416(a0) # 8000cc38 <_ZN9Scheduler17readyThreadsQueueE>
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

0000000080002210 <_ZN7Console6putThrEPv>:
    return  inputBuff;
}

void Console::putThr(void * arg) {
    while (true) {  //system background thread dedicated to outputting data
        while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}//Poll the console status reg until transmit buffer is ready (busy-wait)
    80002210:	0000b797          	auipc	a5,0xb
    80002214:	9607b783          	ld	a5,-1696(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002218:	0007b783          	ld	a5,0(a5)
    8000221c:	0007c783          	lbu	a5,0(a5)
    80002220:	0207f793          	andi	a5,a5,32
    80002224:	fe0786e3          	beqz	a5,80002210 <_ZN7Console6putThrEPv>
void Console::putThr(void * arg) {
    80002228:	fe010113          	addi	sp,sp,-32
    8000222c:	00113c23          	sd	ra,24(sp)
    80002230:	00813823          	sd	s0,16(sp)
    80002234:	00913423          	sd	s1,8(sp)
    80002238:	02010413          	addi	s0,sp,32
        *((char*)CONSOLE_TX_DATA) = outputBuff->take(); //Take the next character from output buffer and writes to reg
    8000223c:	0000b797          	auipc	a5,0xb
    80002240:	94c7b783          	ld	a5,-1716(a5) # 8000cb88 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002244:	0007b483          	ld	s1,0(a5)
    80002248:	0000b517          	auipc	a0,0xb
    8000224c:	a1053503          	ld	a0,-1520(a0) # 8000cc58 <_ZN7Console10outputBuffE>
    80002250:	00002097          	auipc	ra,0x2
    80002254:	89c080e7          	jalr	-1892(ra) # 80003aec <_ZN20ConsoleBoundedBuffer4takeEv>
    80002258:	00a48023          	sb	a0,0(s1)
        while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}//Poll the console status reg until transmit buffer is ready (busy-wait)
    8000225c:	0000b797          	auipc	a5,0xb
    80002260:	9147b783          	ld	a5,-1772(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002264:	0007b783          	ld	a5,0(a5)
    80002268:	0007c783          	lbu	a5,0(a5)
    8000226c:	0207f793          	andi	a5,a5,32
    80002270:	fe0786e3          	beqz	a5,8000225c <_ZN7Console6putThrEPv+0x4c>
    80002274:	fc9ff06f          	j	8000223c <_ZN7Console6putThrEPv+0x2c>

0000000080002278 <_ZN7Console15consoleGetcBuffEv>:
char Console::consoleGetcBuff() {
    80002278:	ff010113          	addi	sp,sp,-16
    8000227c:	00113423          	sd	ra,8(sp)
    80002280:	00813023          	sd	s0,0(sp)
    80002284:	01010413          	addi	s0,sp,16
    return inputBuff->take();
    80002288:	0000b517          	auipc	a0,0xb
    8000228c:	9d853503          	ld	a0,-1576(a0) # 8000cc60 <_ZN7Console9inputBuffE>
    80002290:	00002097          	auipc	ra,0x2
    80002294:	85c080e7          	jalr	-1956(ra) # 80003aec <_ZN20ConsoleBoundedBuffer4takeEv>
}
    80002298:	00813083          	ld	ra,8(sp)
    8000229c:	00013403          	ld	s0,0(sp)
    800022a0:	01010113          	addi	sp,sp,16
    800022a4:	00008067          	ret

00000000800022a8 <_ZN7Console15consolePutcBuffEc>:
void Console::consolePutcBuff(char character) {
    800022a8:	ff010113          	addi	sp,sp,-16
    800022ac:	00113423          	sd	ra,8(sp)
    800022b0:	00813023          	sd	s0,0(sp)
    800022b4:	01010413          	addi	s0,sp,16
    800022b8:	00050593          	mv	a1,a0
    outputBuff->append(character);
    800022bc:	0000b517          	auipc	a0,0xb
    800022c0:	99c53503          	ld	a0,-1636(a0) # 8000cc58 <_ZN7Console10outputBuffE>
    800022c4:	00001097          	auipc	ra,0x1
    800022c8:	79c080e7          	jalr	1948(ra) # 80003a60 <_ZN20ConsoleBoundedBuffer6appendEc>
}
    800022cc:	00813083          	ld	ra,8(sp)
    800022d0:	00013403          	ld	s0,0(sp)
    800022d4:	01010113          	addi	sp,sp,16
    800022d8:	00008067          	ret

00000000800022dc <_ZN7Console12setInputBuffEv>:
void Console::setInputBuff() {
    800022dc:	fe010113          	addi	sp,sp,-32
    800022e0:	00113c23          	sd	ra,24(sp)
    800022e4:	00813823          	sd	s0,16(sp)
    800022e8:	00913423          	sd	s1,8(sp)
    800022ec:	01213023          	sd	s2,0(sp)
    800022f0:	02010413          	addi	s0,sp,32
    inputBuff=new ConsoleBoundedBuffer(256);
    800022f4:	03800513          	li	a0,56
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	3f0080e7          	jalr	1008(ra) # 800026e8 <_Znwm>
    80002300:	00050493          	mv	s1,a0
    80002304:	10000593          	li	a1,256
    80002308:	00001097          	auipc	ra,0x1
    8000230c:	618080e7          	jalr	1560(ra) # 80003920 <_ZN20ConsoleBoundedBufferC1Ei>
    80002310:	0000b797          	auipc	a5,0xb
    80002314:	9497b823          	sd	s1,-1712(a5) # 8000cc60 <_ZN7Console9inputBuffE>
}
    80002318:	01813083          	ld	ra,24(sp)
    8000231c:	01013403          	ld	s0,16(sp)
    80002320:	00813483          	ld	s1,8(sp)
    80002324:	00013903          	ld	s2,0(sp)
    80002328:	02010113          	addi	sp,sp,32
    8000232c:	00008067          	ret
    80002330:	00050913          	mv	s2,a0
    inputBuff=new ConsoleBoundedBuffer(256);
    80002334:	00048513          	mv	a0,s1
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	400080e7          	jalr	1024(ra) # 80002738 <_ZdlPv>
    80002340:	00090513          	mv	a0,s2
    80002344:	0000c097          	auipc	ra,0xc
    80002348:	a74080e7          	jalr	-1420(ra) # 8000ddb8 <_Unwind_Resume>

000000008000234c <_ZN7Console15startPutcThreadEPP3TCB>:
int Console::startPutcThread(thread_t *threadHandle) {
    8000234c:	fd010113          	addi	sp,sp,-48
    80002350:	02113423          	sd	ra,40(sp)
    80002354:	02813023          	sd	s0,32(sp)
    80002358:	00913c23          	sd	s1,24(sp)
    8000235c:	01213823          	sd	s2,16(sp)
    80002360:	01313423          	sd	s3,8(sp)
    80002364:	03010413          	addi	s0,sp,48
    80002368:	00050993          	mv	s3,a0
    outputBuff=new ConsoleBoundedBuffer(256);
    8000236c:	03800513          	li	a0,56
    80002370:	00000097          	auipc	ra,0x0
    80002374:	378080e7          	jalr	888(ra) # 800026e8 <_Znwm>
    80002378:	00050493          	mv	s1,a0
    8000237c:	10000593          	li	a1,256
    80002380:	00001097          	auipc	ra,0x1
    80002384:	5a0080e7          	jalr	1440(ra) # 80003920 <_ZN20ConsoleBoundedBufferC1Ei>
    80002388:	0000b797          	auipc	a5,0xb
    8000238c:	8c97b823          	sd	s1,-1840(a5) # 8000cc58 <_ZN7Console10outputBuffE>
    char *stack=(char*)MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE);
    80002390:	00001537          	lui	a0,0x1
    80002394:	00001097          	auipc	ra,0x1
    80002398:	2a8080e7          	jalr	680(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
    8000239c:	00050493          	mv	s1,a0
    if (stack==nullptr) {
    800023a0:	06050263          	beqz	a0,80002404 <_ZN7Console15startPutcThreadEPP3TCB+0xb8>
    static bool schedulerIsEmpty();

    static TCB *running;

    void* operator new(size_t size) {
        return MemoryAllocator::mem_alloc(size);
    800023a4:	03800513          	li	a0,56
    800023a8:	00001097          	auipc	ra,0x1
    800023ac:	294080e7          	jalr	660(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
    800023b0:	00050913          	mv	s2,a0
    TCB *thread=new TCB(putThr,nullptr,stack,true);
    800023b4:	00100713          	li	a4,1
    800023b8:	00048693          	mv	a3,s1
    800023bc:	00000613          	li	a2,0
    800023c0:	00000597          	auipc	a1,0x0
    800023c4:	e5058593          	addi	a1,a1,-432 # 80002210 <_ZN7Console6putThrEPv>
    800023c8:	00001097          	auipc	ra,0x1
    800023cc:	e94080e7          	jalr	-364(ra) # 8000325c <_ZN3TCBC1EPFvPvES0_Pcb>
    if (thread==nullptr) {
    800023d0:	02090463          	beqz	s2,800023f8 <_ZN7Console15startPutcThreadEPP3TCB+0xac>
    *threadHandle=thread;
    800023d4:	0129b023          	sd	s2,0(s3)
    return 0;
    800023d8:	00000513          	li	a0,0
}
    800023dc:	02813083          	ld	ra,40(sp)
    800023e0:	02013403          	ld	s0,32(sp)
    800023e4:	01813483          	ld	s1,24(sp)
    800023e8:	01013903          	ld	s2,16(sp)
    800023ec:	00813983          	ld	s3,8(sp)
    800023f0:	03010113          	addi	sp,sp,48
    800023f4:	00008067          	ret
        *threadHandle=nullptr;
    800023f8:	0009b023          	sd	zero,0(s3)
        return -1;
    800023fc:	fff00513          	li	a0,-1
    80002400:	fddff06f          	j	800023dc <_ZN7Console15startPutcThreadEPP3TCB+0x90>
        return -1;
    80002404:	fff00513          	li	a0,-1
    80002408:	fd5ff06f          	j	800023dc <_ZN7Console15startPutcThreadEPP3TCB+0x90>
    8000240c:	00050913          	mv	s2,a0
    outputBuff=new ConsoleBoundedBuffer(256);
    80002410:	00048513          	mv	a0,s1
    80002414:	00000097          	auipc	ra,0x0
    80002418:	324080e7          	jalr	804(ra) # 80002738 <_ZdlPv>
    8000241c:	00090513          	mv	a0,s2
    80002420:	0000c097          	auipc	ra,0xc
    80002424:	998080e7          	jalr	-1640(ra) # 8000ddb8 <_Unwind_Resume>
    80002428:	00050493          	mv	s1,a0
    void* operator new[](size_t size) {
        return MemoryAllocator::mem_alloc(size);
    }

    void operator delete(void *ptr) {
        MemoryAllocator::mem_free(ptr);
    8000242c:	00090513          	mv	a0,s2
    80002430:	00001097          	auipc	ra,0x1
    80002434:	36c080e7          	jalr	876(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    80002438:	00048513          	mv	a0,s1
    8000243c:	0000c097          	auipc	ra,0xc
    80002440:	97c080e7          	jalr	-1668(ra) # 8000ddb8 <_Unwind_Resume>

0000000080002444 <_ZN7Console15inputBuffAppendEc>:
void Console::inputBuffAppend(char character) {
    80002444:	ff010113          	addi	sp,sp,-16
    80002448:	00113423          	sd	ra,8(sp)
    8000244c:	00813023          	sd	s0,0(sp)
    80002450:	01010413          	addi	s0,sp,16
    80002454:	00050593          	mv	a1,a0
    inputBuff->append(character);
    80002458:	0000b517          	auipc	a0,0xb
    8000245c:	80853503          	ld	a0,-2040(a0) # 8000cc60 <_ZN7Console9inputBuffE>
    80002460:	00001097          	auipc	ra,0x1
    80002464:	600080e7          	jalr	1536(ra) # 80003a60 <_ZN20ConsoleBoundedBuffer6appendEc>
}
    80002468:	00813083          	ld	ra,8(sp)
    8000246c:	00013403          	ld	s0,0(sp)
    80002470:	01010113          	addi	sp,sp,16
    80002474:	00008067          	ret

0000000080002478 <_ZN7Console6putc_SEc>:
void Console::putc_S(char character) {
    80002478:	ff010113          	addi	sp,sp,-16
    8000247c:	00813423          	sd	s0,8(sp)
    80002480:	01010413          	addi	s0,sp,16
    while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {
    80002484:	0000a797          	auipc	a5,0xa
    80002488:	6ec7b783          	ld	a5,1772(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000248c:	0007b783          	ld	a5,0(a5)
    80002490:	0007c783          	lbu	a5,0(a5)
    80002494:	0207f793          	andi	a5,a5,32
    80002498:	fe0786e3          	beqz	a5,80002484 <_ZN7Console6putc_SEc+0xc>
    *((char*)CONSOLE_TX_DATA) = character;//Write character to the console data register
    8000249c:	0000a797          	auipc	a5,0xa
    800024a0:	6ec7b783          	ld	a5,1772(a5) # 8000cb88 <_GLOBAL_OFFSET_TABLE_+0x30>
    800024a4:	0007b783          	ld	a5,0(a5)
    800024a8:	00a78023          	sb	a0,0(a5)
}
    800024ac:	00813403          	ld	s0,8(sp)
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <_ZN7Console13getOutputBuffEv>:
ConsoleBoundedBuffer* Console::getOutputBuff() {
    800024b8:	ff010113          	addi	sp,sp,-16
    800024bc:	00813423          	sd	s0,8(sp)
    800024c0:	01010413          	addi	s0,sp,16
}
    800024c4:	0000a517          	auipc	a0,0xa
    800024c8:	79453503          	ld	a0,1940(a0) # 8000cc58 <_ZN7Console10outputBuffE>
    800024cc:	00813403          	ld	s0,8(sp)
    800024d0:	01010113          	addi	sp,sp,16
    800024d4:	00008067          	ret

00000000800024d8 <_ZN7Console12getInputBuffEv>:
ConsoleBoundedBuffer* Console::getInputBuff() {
    800024d8:	ff010113          	addi	sp,sp,-16
    800024dc:	00813423          	sd	s0,8(sp)
    800024e0:	01010413          	addi	s0,sp,16
}
    800024e4:	0000a517          	auipc	a0,0xa
    800024e8:	77c53503          	ld	a0,1916(a0) # 8000cc60 <_ZN7Console9inputBuffE>
    800024ec:	00813403          	ld	s0,8(sp)
    800024f0:	01010113          	addi	sp,sp,16
    800024f4:	00008067          	ret

00000000800024f8 <_Z15userMainWrapperPv>:

void userMain();

void userMainTests();

void userMainWrapper(void* arg) {
    800024f8:	ff010113          	addi	sp,sp,-16
    800024fc:	00113423          	sd	ra,8(sp)
    80002500:	00813023          	sd	s0,0(sp)
    80002504:	01010413          	addi	s0,sp,16
    //    userMain();
    userMainTests();
    80002508:	00001097          	auipc	ra,0x1
    8000250c:	66c080e7          	jalr	1644(ra) # 80003b74 <_Z13userMainTestsv>
}
    80002510:	00813083          	ld	ra,8(sp)
    80002514:	00013403          	ld	s0,0(sp)
    80002518:	01010113          	addi	sp,sp,16
    8000251c:	00008067          	ret

0000000080002520 <main>:

void main() {
    80002520:	fc010113          	addi	sp,sp,-64
    80002524:	02113c23          	sd	ra,56(sp)
    80002528:	02813823          	sd	s0,48(sp)
    8000252c:	02913423          	sd	s1,40(sp)
    80002530:	03213023          	sd	s2,32(sp)
    80002534:	04010413          	addi	s0,sp,64
    // initialize the kernel
    MemoryAllocator::Initialize();
    80002538:	00001097          	auipc	ra,0x1
    8000253c:	0b8080e7          	jalr	184(ra) # 800035f0 <_ZN15MemoryAllocator10InitializeEv>
    RISCV::w_stvec((size_t)(&RISCV::supervisorTrap));
    80002540:	0000a797          	auipc	a5,0xa
    80002544:	6607b783          	ld	a5,1632(a5) # 8000cba0 <_GLOBAL_OFFSET_TABLE_+0x48>
    __asm__ volatile("csrw stvec, %[stvec]" : : [stvec] "r" (stvec));
    80002548:	10579073          	csrw	stvec,a5

    thread_t threads[4];
    thread_create(&threads[0], nullptr, nullptr);
    8000254c:	00000613          	li	a2,0
    80002550:	00000593          	li	a1,0
    80002554:	fc040513          	addi	a0,s0,-64
    80002558:	fffff097          	auipc	ra,0xfffff
    8000255c:	e7c080e7          	jalr	-388(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = threads[0]; // must be init. imm. after we create a thread for main
    80002560:	fc043703          	ld	a4,-64(s0)
    80002564:	0000a797          	auipc	a5,0xa
    80002568:	6447b783          	ld	a5,1604(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000256c:	00e7b023          	sd	a4,0(a5)

    // terminal thread for putc and initialize buffer for getc
    Console::setInputBuff();
    80002570:	00000097          	auipc	ra,0x0
    80002574:	d6c080e7          	jalr	-660(ra) # 800022dc <_ZN7Console12setInputBuffEv>
    Console::startPutcThread(&threads[2]);
    80002578:	fd040513          	addi	a0,s0,-48
    8000257c:	00000097          	auipc	ra,0x0
    80002580:	dd0080e7          	jalr	-560(ra) # 8000234c <_ZN7Console15startPutcThreadEPP3TCB>

    thread_create(&threads[1], &userMainWrapper, nullptr);
    80002584:	00000613          	li	a2,0
    80002588:	00000597          	auipc	a1,0x0
    8000258c:	f7058593          	addi	a1,a1,-144 # 800024f8 <_Z15userMainWrapperPv>
    80002590:	fc840513          	addi	a0,s0,-56
    80002594:	fffff097          	auipc	ra,0xfffff
    80002598:	e40080e7          	jalr	-448(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
inline void RISCV::mc_sstatus(size_t mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void RISCV::ms_sstatus(size_t mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
    8000259c:	00200793          	li	a5,2
    800025a0:	1007a073          	csrs	sstatus,a5
}
    800025a4:	00c0006f          	j	800025b0 <main+0x90>

    RISCV::ms_sstatus(RISCV::SSTATUS_SIE);

    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
        thread_dispatch();
    800025a8:	fffff097          	auipc	ra,0xfffff
    800025ac:	f38080e7          	jalr	-200(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
    800025b0:	fc843783          	ld	a5,-56(s0)
    bool isFinished() const {return finished;}
    800025b4:	0207c783          	lbu	a5,32(a5)
    800025b8:	fe0788e3          	beqz	a5,800025a8 <main+0x88>
    800025bc:	00001097          	auipc	ra,0x1
    800025c0:	df0080e7          	jalr	-528(ra) # 800033ac <_ZN3TCB16schedulerIsEmptyEv>
    800025c4:	fe0502e3          	beqz	a0,800025a8 <main+0x88>
    800025c8:	fc040493          	addi	s1,s0,-64
    800025cc:	0080006f          	j	800025d4 <main+0xb4>
    }

    for (auto &thread : threads) {
    800025d0:	00848493          	addi	s1,s1,8
    800025d4:	fe040793          	addi	a5,s0,-32
    800025d8:	02f48463          	beq	s1,a5,80002600 <main+0xe0>
        delete thread;
    800025dc:	0004b903          	ld	s2,0(s1)
    800025e0:	fe0908e3          	beqz	s2,800025d0 <main+0xb0>
    800025e4:	00090513          	mv	a0,s2
    800025e8:	00001097          	auipc	ra,0x1
    800025ec:	ce8080e7          	jalr	-792(ra) # 800032d0 <_ZN3TCBD1Ev>
        MemoryAllocator::mem_free(ptr);
    800025f0:	00090513          	mv	a0,s2
    800025f4:	00001097          	auipc	ra,0x1
    800025f8:	1a8080e7          	jalr	424(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    }
    800025fc:	fd5ff06f          	j	800025d0 <main+0xb0>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    __asm__ volatile ("sw t0, 80(x8)");
}

inline void RISCV::halt() {
    __asm__ volatile("li t0, 0x5555");
    80002600:	000052b7          	lui	t0,0x5
    80002604:	5552829b          	addiw	t0,t0,1365
    __asm__ volatile("li t1, 0x100000");
    80002608:	00100337          	lui	t1,0x100
    __asm__ volatile("sw t0, 0(t1)");
    8000260c:	00532023          	sw	t0,0(t1) # 100000 <_entry-0x7ff00000>
    }

    RISCV::halt();
    80002610:	03813083          	ld	ra,56(sp)
    80002614:	03013403          	ld	s0,48(sp)
    80002618:	02813483          	ld	s1,40(sp)
    8000261c:	02013903          	ld	s2,32(sp)
    80002620:	04010113          	addi	sp,sp,64
    80002624:	00008067          	ret

0000000080002628 <_ZN6Thread10runWrapperEPv>:

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

void Thread::runWrapper(void* thisObj) {
    80002628:	ff010113          	addi	sp,sp,-16
    8000262c:	00113423          	sd	ra,8(sp)
    80002630:	00813023          	sd	s0,0(sp)
    80002634:	01010413          	addi	s0,sp,16
    ((Thread*)thisObj)->run();
    80002638:	00053783          	ld	a5,0(a0)
    8000263c:	0107b783          	ld	a5,16(a5)
    80002640:	000780e7          	jalr	a5
}
    80002644:	00813083          	ld	ra,8(sp)
    80002648:	00013403          	ld	s0,0(sp)
    8000264c:	01010113          	addi	sp,sp,16
    80002650:	00008067          	ret

0000000080002654 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002654:	fe010113          	addi	sp,sp,-32
    80002658:	00113c23          	sd	ra,24(sp)
    8000265c:	00813823          	sd	s0,16(sp)
    80002660:	00913423          	sd	s1,8(sp)
    80002664:	02010413          	addi	s0,sp,32
    80002668:	0000a797          	auipc	a5,0xa
    8000266c:	2f878793          	addi	a5,a5,760 # 8000c960 <_ZTV6Thread+0x10>
    80002670:	00f53023          	sd	a5,0(a0)
    if (myHandle->isFinished()) delete myHandle;
    80002674:	00853483          	ld	s1,8(a0)
    bool isFinished() const {return finished;}
    80002678:	0204c783          	lbu	a5,32(s1)
    8000267c:	02078063          	beqz	a5,8000269c <_ZN6ThreadD1Ev+0x48>
    80002680:	00048e63          	beqz	s1,8000269c <_ZN6ThreadD1Ev+0x48>
    80002684:	00048513          	mv	a0,s1
    80002688:	00001097          	auipc	ra,0x1
    8000268c:	c48080e7          	jalr	-952(ra) # 800032d0 <_ZN3TCBD1Ev>
        MemoryAllocator::mem_free(ptr);
    80002690:	00048513          	mv	a0,s1
    80002694:	00001097          	auipc	ra,0x1
    80002698:	108080e7          	jalr	264(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000269c:	01813083          	ld	ra,24(sp)
    800026a0:	01013403          	ld	s0,16(sp)
    800026a4:	00813483          	ld	s1,8(sp)
    800026a8:	02010113          	addi	sp,sp,32
    800026ac:	00008067          	ret

00000000800026b0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore() {
    800026b0:	ff010113          	addi	sp,sp,-16
    800026b4:	00113423          	sd	ra,8(sp)
    800026b8:	00813023          	sd	s0,0(sp)
    800026bc:	01010413          	addi	s0,sp,16
    800026c0:	0000a797          	auipc	a5,0xa
    800026c4:	2c878793          	addi	a5,a5,712 # 8000c988 <_ZTV9Semaphore+0x10>
    800026c8:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800026cc:	00853503          	ld	a0,8(a0)
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	ebc080e7          	jalr	-324(ra) # 8000158c <_Z9sem_closeP3Sem>
}
    800026d8:	00813083          	ld	ra,8(sp)
    800026dc:	00013403          	ld	s0,0(sp)
    800026e0:	01010113          	addi	sp,sp,16
    800026e4:	00008067          	ret

00000000800026e8 <_Znwm>:
void *operator new(size_t size) {
    800026e8:	ff010113          	addi	sp,sp,-16
    800026ec:	00113423          	sd	ra,8(sp)
    800026f0:	00813023          	sd	s0,0(sp)
    800026f4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800026f8:	fffff097          	auipc	ra,0xfffff
    800026fc:	b60080e7          	jalr	-1184(ra) # 80001258 <_Z9mem_allocm>
}
    80002700:	00813083          	ld	ra,8(sp)
    80002704:	00013403          	ld	s0,0(sp)
    80002708:	01010113          	addi	sp,sp,16
    8000270c:	00008067          	ret

0000000080002710 <_Znam>:
void *operator new[](size_t size) {
    80002710:	ff010113          	addi	sp,sp,-16
    80002714:	00113423          	sd	ra,8(sp)
    80002718:	00813023          	sd	s0,0(sp)
    8000271c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b38080e7          	jalr	-1224(ra) # 80001258 <_Z9mem_allocm>
}
    80002728:	00813083          	ld	ra,8(sp)
    8000272c:	00013403          	ld	s0,0(sp)
    80002730:	01010113          	addi	sp,sp,16
    80002734:	00008067          	ret

0000000080002738 <_ZdlPv>:
void operator delete(void *mem) noexcept {
    80002738:	ff010113          	addi	sp,sp,-16
    8000273c:	00113423          	sd	ra,8(sp)
    80002740:	00813023          	sd	s0,0(sp)
    80002744:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80002748:	fffff097          	auipc	ra,0xfffff
    8000274c:	b7c080e7          	jalr	-1156(ra) # 800012c4 <_Z8mem_freePv>
}
    80002750:	00813083          	ld	ra,8(sp)
    80002754:	00013403          	ld	s0,0(sp)
    80002758:	01010113          	addi	sp,sp,16
    8000275c:	00008067          	ret

0000000080002760 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002760:	fe010113          	addi	sp,sp,-32
    80002764:	00113c23          	sd	ra,24(sp)
    80002768:	00813823          	sd	s0,16(sp)
    8000276c:	00913423          	sd	s1,8(sp)
    80002770:	02010413          	addi	s0,sp,32
    80002774:	00050493          	mv	s1,a0
}
    80002778:	00000097          	auipc	ra,0x0
    8000277c:	edc080e7          	jalr	-292(ra) # 80002654 <_ZN6ThreadD1Ev>
    80002780:	00048513          	mv	a0,s1
    80002784:	00000097          	auipc	ra,0x0
    80002788:	fb4080e7          	jalr	-76(ra) # 80002738 <_ZdlPv>
    8000278c:	01813083          	ld	ra,24(sp)
    80002790:	01013403          	ld	s0,16(sp)
    80002794:	00813483          	ld	s1,8(sp)
    80002798:	02010113          	addi	sp,sp,32
    8000279c:	00008067          	ret

00000000800027a0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800027a0:	fe010113          	addi	sp,sp,-32
    800027a4:	00113c23          	sd	ra,24(sp)
    800027a8:	00813823          	sd	s0,16(sp)
    800027ac:	00913423          	sd	s1,8(sp)
    800027b0:	02010413          	addi	s0,sp,32
    800027b4:	00050493          	mv	s1,a0
}
    800027b8:	00000097          	auipc	ra,0x0
    800027bc:	ef8080e7          	jalr	-264(ra) # 800026b0 <_ZN9SemaphoreD1Ev>
    800027c0:	00048513          	mv	a0,s1
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	f74080e7          	jalr	-140(ra) # 80002738 <_ZdlPv>
    800027cc:	01813083          	ld	ra,24(sp)
    800027d0:	01013403          	ld	s0,16(sp)
    800027d4:	00813483          	ld	s1,8(sp)
    800027d8:	02010113          	addi	sp,sp,32
    800027dc:	00008067          	ret

00000000800027e0 <_ZdaPv>:
void operator delete[](void *mem) noexcept {
    800027e0:	ff010113          	addi	sp,sp,-16
    800027e4:	00113423          	sd	ra,8(sp)
    800027e8:	00813023          	sd	s0,0(sp)
    800027ec:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	ad4080e7          	jalr	-1324(ra) # 800012c4 <_Z8mem_freePv>
}
    800027f8:	00813083          	ld	ra,8(sp)
    800027fc:	00013403          	ld	s0,0(sp)
    80002800:	01010113          	addi	sp,sp,16
    80002804:	00008067          	ret

0000000080002808 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002808:	ff010113          	addi	sp,sp,-16
    8000280c:	00813423          	sd	s0,8(sp)
    80002810:	01010413          	addi	s0,sp,16
    80002814:	0000a797          	auipc	a5,0xa
    80002818:	14c78793          	addi	a5,a5,332 # 8000c960 <_ZTV6Thread+0x10>
    8000281c:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80002820:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80002824:	00c53c23          	sd	a2,24(a0)
    this->myHandle = nullptr;
    80002828:	00053423          	sd	zero,8(a0)
}
    8000282c:	00813403          	ld	s0,8(sp)
    80002830:	01010113          	addi	sp,sp,16
    80002834:	00008067          	ret

0000000080002838 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002838:	ff010113          	addi	sp,sp,-16
    8000283c:	00813423          	sd	s0,8(sp)
    80002840:	01010413          	addi	s0,sp,16
    80002844:	0000a797          	auipc	a5,0xa
    80002848:	11c78793          	addi	a5,a5,284 # 8000c960 <_ZTV6Thread+0x10>
    8000284c:	00f53023          	sd	a5,0(a0)
    this->body = runWrapper;
    80002850:	00000797          	auipc	a5,0x0
    80002854:	dd878793          	addi	a5,a5,-552 # 80002628 <_ZN6Thread10runWrapperEPv>
    80002858:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    8000285c:	00a53c23          	sd	a0,24(a0)
    this->myHandle = nullptr;
    80002860:	00053423          	sd	zero,8(a0)
}
    80002864:	00813403          	ld	s0,8(sp)
    80002868:	01010113          	addi	sp,sp,16
    8000286c:	00008067          	ret

0000000080002870 <_ZN6Thread5startEv>:
int Thread::start() {
    80002870:	fe010113          	addi	sp,sp,-32
    80002874:	00113c23          	sd	ra,24(sp)
    80002878:	00813823          	sd	s0,16(sp)
    8000287c:	00913423          	sd	s1,8(sp)
    80002880:	02010413          	addi	s0,sp,32
    80002884:	00050493          	mv	s1,a0
    thread_create(&this->myHandle, this->body, this->arg);
    80002888:	01853603          	ld	a2,24(a0)
    8000288c:	01053583          	ld	a1,16(a0)
    80002890:	00850513          	addi	a0,a0,8
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	b40080e7          	jalr	-1216(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    if (this->myHandle) return 0;
    8000289c:	0084b783          	ld	a5,8(s1)
    800028a0:	00078e63          	beqz	a5,800028bc <_ZN6Thread5startEv+0x4c>
    800028a4:	00000513          	li	a0,0
}
    800028a8:	01813083          	ld	ra,24(sp)
    800028ac:	01013403          	ld	s0,16(sp)
    800028b0:	00813483          	ld	s1,8(sp)
    800028b4:	02010113          	addi	sp,sp,32
    800028b8:	00008067          	ret
    else return -1;
    800028bc:	fff00513          	li	a0,-1
    800028c0:	fe9ff06f          	j	800028a8 <_ZN6Thread5startEv+0x38>

00000000800028c4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800028c4:	ff010113          	addi	sp,sp,-16
    800028c8:	00113423          	sd	ra,8(sp)
    800028cc:	00813023          	sd	s0,0(sp)
    800028d0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800028d4:	fffff097          	auipc	ra,0xfffff
    800028d8:	c0c080e7          	jalr	-1012(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800028dc:	00813083          	ld	ra,8(sp)
    800028e0:	00013403          	ld	s0,0(sp)
    800028e4:	01010113          	addi	sp,sp,16
    800028e8:	00008067          	ret

00000000800028ec <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    800028ec:	ff010113          	addi	sp,sp,-16
    800028f0:	00113423          	sd	ra,8(sp)
    800028f4:	00813023          	sd	s0,0(sp)
    800028f8:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	dc8080e7          	jalr	-568(ra) # 800016c4 <_Z10time_sleepm>
}
    80002904:	00813083          	ld	ra,8(sp)
    80002908:	00013403          	ld	s0,0(sp)
    8000290c:	01010113          	addi	sp,sp,16
    80002910:	00008067          	ret

0000000080002914 <_ZN14PeriodicThread3runEv>:

void PeriodicThread::terminate() {
    period = 0;
}

void PeriodicThread::run() {
    80002914:	fe010113          	addi	sp,sp,-32
    80002918:	00113c23          	sd	ra,24(sp)
    8000291c:	00813823          	sd	s0,16(sp)
    80002920:	00913423          	sd	s1,8(sp)
    80002924:	02010413          	addi	s0,sp,32
    80002928:	00050493          	mv	s1,a0
    while (period != 0) {
    8000292c:	0204b783          	ld	a5,32(s1)
    80002930:	02078263          	beqz	a5,80002954 <_ZN14PeriodicThread3runEv+0x40>
        periodicActivation();
    80002934:	0004b783          	ld	a5,0(s1)
    80002938:	0187b783          	ld	a5,24(a5)
    8000293c:	00048513          	mv	a0,s1
    80002940:	000780e7          	jalr	a5
        if (Thread::sleep(period) < 0) break;
    80002944:	0204b503          	ld	a0,32(s1)
    80002948:	00000097          	auipc	ra,0x0
    8000294c:	fa4080e7          	jalr	-92(ra) # 800028ec <_ZN6Thread5sleepEm>
    80002950:	fc055ee3          	bgez	a0,8000292c <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80002954:	01813083          	ld	ra,24(sp)
    80002958:	01013403          	ld	s0,16(sp)
    8000295c:	00813483          	ld	s1,8(sp)
    80002960:	02010113          	addi	sp,sp,32
    80002964:	00008067          	ret

0000000080002968 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002968:	ff010113          	addi	sp,sp,-16
    8000296c:	00113423          	sd	ra,8(sp)
    80002970:	00813023          	sd	s0,0(sp)
    80002974:	01010413          	addi	s0,sp,16
    80002978:	0000a797          	auipc	a5,0xa
    8000297c:	01078793          	addi	a5,a5,16 # 8000c988 <_ZTV9Semaphore+0x10>
    80002980:	00f53023          	sd	a5,0(a0)
    sem_open(&this->myHandle, init);
    80002984:	00850513          	addi	a0,a0,8
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	b98080e7          	jalr	-1128(ra) # 80001520 <_Z8sem_openPP3Semj>
}
    80002990:	00813083          	ld	ra,8(sp)
    80002994:	00013403          	ld	s0,0(sp)
    80002998:	01010113          	addi	sp,sp,16
    8000299c:	00008067          	ret

00000000800029a0 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800029a0:	ff010113          	addi	sp,sp,-16
    800029a4:	00113423          	sd	ra,8(sp)
    800029a8:	00813023          	sd	s0,0(sp)
    800029ac:	01010413          	addi	s0,sp,16
    return sem_wait(this->myHandle);
    800029b0:	00853503          	ld	a0,8(a0)
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	c40080e7          	jalr	-960(ra) # 800015f4 <_Z8sem_waitP3Sem>
}
    800029bc:	00813083          	ld	ra,8(sp)
    800029c0:	00013403          	ld	s0,0(sp)
    800029c4:	01010113          	addi	sp,sp,16
    800029c8:	00008067          	ret

00000000800029cc <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800029cc:	ff010113          	addi	sp,sp,-16
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	00813023          	sd	s0,0(sp)
    800029d8:	01010413          	addi	s0,sp,16
    return sem_signal(this->myHandle);
    800029dc:	00853503          	ld	a0,8(a0)
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	c7c080e7          	jalr	-900(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    800029e8:	00813083          	ld	ra,8(sp)
    800029ec:	00013403          	ld	s0,0(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret

00000000800029f8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period): Thread() {
    800029f8:	fe010113          	addi	sp,sp,-32
    800029fc:	00113c23          	sd	ra,24(sp)
    80002a00:	00813823          	sd	s0,16(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	01213023          	sd	s2,0(sp)
    80002a0c:	02010413          	addi	s0,sp,32
    80002a10:	00050493          	mv	s1,a0
    80002a14:	00058913          	mv	s2,a1
    80002a18:	00000097          	auipc	ra,0x0
    80002a1c:	e20080e7          	jalr	-480(ra) # 80002838 <_ZN6ThreadC1Ev>
    80002a20:	0000a797          	auipc	a5,0xa
    80002a24:	f8878793          	addi	a5,a5,-120 # 8000c9a8 <_ZTV14PeriodicThread+0x10>
    80002a28:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    80002a2c:	0324b023          	sd	s2,32(s1)
}
    80002a30:	01813083          	ld	ra,24(sp)
    80002a34:	01013403          	ld	s0,16(sp)
    80002a38:	00813483          	ld	s1,8(sp)
    80002a3c:	00013903          	ld	s2,0(sp)
    80002a40:	02010113          	addi	sp,sp,32
    80002a44:	00008067          	ret

0000000080002a48 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00813423          	sd	s0,8(sp)
    80002a50:	01010413          	addi	s0,sp,16
    period = 0;
    80002a54:	02053023          	sd	zero,32(a0)
}
    80002a58:	00813403          	ld	s0,8(sp)
    80002a5c:	01010113          	addi	sp,sp,16
    80002a60:	00008067          	ret

0000000080002a64 <_ZN7Console4getcEv>:

char Console::getc() {
    80002a64:	ff010113          	addi	sp,sp,-16
    80002a68:	00113423          	sd	ra,8(sp)
    80002a6c:	00813023          	sd	s0,0(sp)
    80002a70:	01010413          	addi	s0,sp,16
    return ::getc();
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	ca0080e7          	jalr	-864(ra) # 80001714 <_Z4getcv>
}
    80002a7c:	00813083          	ld	ra,8(sp)
    80002a80:	00013403          	ld	s0,0(sp)
    80002a84:	01010113          	addi	sp,sp,16
    80002a88:	00008067          	ret

0000000080002a8c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002a8c:	ff010113          	addi	sp,sp,-16
    80002a90:	00113423          	sd	ra,8(sp)
    80002a94:	00813023          	sd	s0,0(sp)
    80002a98:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002a9c:	fffff097          	auipc	ra,0xfffff
    80002aa0:	cd4080e7          	jalr	-812(ra) # 80001770 <_Z4putcc>
}
    80002aa4:	00813083          	ld	ra,8(sp)
    80002aa8:	00013403          	ld	s0,0(sp)
    80002aac:	01010113          	addi	sp,sp,16
    80002ab0:	00008067          	ret

0000000080002ab4 <_ZN6Thread3runEv>:

    static void runWrapper(void*);
    thread_t getMyHandle() const { return myHandle; }
protected:
    Thread();
    virtual void run() {}
    80002ab4:	ff010113          	addi	sp,sp,-16
    80002ab8:	00813423          	sd	s0,8(sp)
    80002abc:	01010413          	addi	s0,sp,16
    80002ac0:	00813403          	ld	s0,8(sp)
    80002ac4:	01010113          	addi	sp,sp,16
    80002ac8:	00008067          	ret

0000000080002acc <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate();

protected:
    PeriodicThread(time_t period);
    virtual void periodicActivation () {}
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00813423          	sd	s0,8(sp)
    80002ad4:	01010413          	addi	s0,sp,16
    80002ad8:	00813403          	ld	s0,8(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret

0000000080002ae4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002ae4:	ff010113          	addi	sp,sp,-16
    80002ae8:	00113423          	sd	ra,8(sp)
    80002aec:	00813023          	sd	s0,0(sp)
    80002af0:	01010413          	addi	s0,sp,16
    80002af4:	0000a797          	auipc	a5,0xa
    80002af8:	eb478793          	addi	a5,a5,-332 # 8000c9a8 <_ZTV14PeriodicThread+0x10>
    80002afc:	00f53023          	sd	a5,0(a0)
    80002b00:	00000097          	auipc	ra,0x0
    80002b04:	b54080e7          	jalr	-1196(ra) # 80002654 <_ZN6ThreadD1Ev>
    80002b08:	00813083          	ld	ra,8(sp)
    80002b0c:	00013403          	ld	s0,0(sp)
    80002b10:	01010113          	addi	sp,sp,16
    80002b14:	00008067          	ret

0000000080002b18 <_ZN14PeriodicThreadD0Ev>:
    80002b18:	fe010113          	addi	sp,sp,-32
    80002b1c:	00113c23          	sd	ra,24(sp)
    80002b20:	00813823          	sd	s0,16(sp)
    80002b24:	00913423          	sd	s1,8(sp)
    80002b28:	02010413          	addi	s0,sp,32
    80002b2c:	00050493          	mv	s1,a0
    80002b30:	0000a797          	auipc	a5,0xa
    80002b34:	e7878793          	addi	a5,a5,-392 # 8000c9a8 <_ZTV14PeriodicThread+0x10>
    80002b38:	00f53023          	sd	a5,0(a0)
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	b18080e7          	jalr	-1256(ra) # 80002654 <_ZN6ThreadD1Ev>
    80002b44:	00048513          	mv	a0,s1
    80002b48:	00000097          	auipc	ra,0x0
    80002b4c:	bf0080e7          	jalr	-1040(ra) # 80002738 <_ZdlPv>
    80002b50:	01813083          	ld	ra,24(sp)
    80002b54:	01013403          	ld	s0,16(sp)
    80002b58:	00813483          	ld	s1,8(sp)
    80002b5c:	02010113          	addi	sp,sp,32
    80002b60:	00008067          	ret

0000000080002b64 <_ZN5RISCV10popSppSpieEv>:
#include "../h/printing.hpp"
#include "../h/Scheduler.hpp"
#include "../h/Semaphore.hpp"
#include "../h/MemoryAllocator.hpp"

void RISCV::popSppSpie() {
    80002b64:	ff010113          	addi	sp,sp,-16
    80002b68:	00813423          	sd	s0,8(sp)
    80002b6c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80002b70:	10000793          	li	a5,256
    80002b74:	1007b073          	csrc	sstatus,a5
     mc_sstatus(SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80002b78:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002b7c:	10200073          	sret
}
    80002b80:	00813403          	ld	s0,8(sp)
    80002b84:	01010113          	addi	sp,sp,16
    80002b88:	00008067          	ret

0000000080002b8c <_ZN5RISCV16systemPopSppSpieEv>:

void RISCV::systemPopSppSpie() {
    80002b8c:	ff010113          	addi	sp,sp,-16
    80002b90:	00813423          	sd	s0,8(sp)
    80002b94:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80002b98:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002b9c:	10200073          	sret
}
    80002ba0:	00813403          	ld	s0,8(sp)
    80002ba4:	01010113          	addi	sp,sp,16
    80002ba8:	00008067          	ret

0000000080002bac <_ZN5RISCV20handleSupervisorTrapEv>:
void RISCV::handleSupervisorTrap() {
    80002bac:	f0010113          	addi	sp,sp,-256
    80002bb0:	0e113c23          	sd	ra,248(sp)
    80002bb4:	0e813823          	sd	s0,240(sp)
    80002bb8:	0e913423          	sd	s1,232(sp)
    80002bbc:	0f213023          	sd	s2,224(sp)
    80002bc0:	10010413          	addi	s0,sp,256
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r" (scause));
    80002bc4:	142027f3          	csrr	a5,scause
    80002bc8:	f6f43423          	sd	a5,-152(s0)
    return scause;
    80002bcc:	f6843783          	ld	a5,-152(s0)
    uint64  volatile scause = r_scause();
    80002bd0:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("mv %0, a0" : "=r" (a0));
    80002bd4:	00050793          	mv	a5,a0
    80002bd8:	f6f43023          	sd	a5,-160(s0)
    return a0;
    80002bdc:	f6043783          	ld	a5,-160(s0)
    uint64 volatile code=r_a0();
    80002be0:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80002be4:	00058793          	mv	a5,a1
    80002be8:	f4f43c23          	sd	a5,-168(s0)
    return a1;
    80002bec:	f5843783          	ld	a5,-168(s0)
    uint64 volatile arg1=r_a1();
    80002bf0:	fcf43423          	sd	a5,-56(s0)
    __asm__ volatile ("mv %0, a2" : "=r" (a2));
    80002bf4:	00060793          	mv	a5,a2
    80002bf8:	f4f43823          	sd	a5,-176(s0)
    return a2;
    80002bfc:	f5043783          	ld	a5,-176(s0)
    uint64 volatile arg2=r_a2();
    80002c00:	fcf43023          	sd	a5,-64(s0)
    __asm__ volatile ("mv %0, a3" : "=r" (a3));
    80002c04:	00068793          	mv	a5,a3
    80002c08:	f4f43423          	sd	a5,-184(s0)
    return a3;
    80002c0c:	f4843783          	ld	a5,-184(s0)
    uint64 volatile arg3=r_a3();
    80002c10:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("mv %0, a4" : "=r" (a4));
    80002c14:	00070793          	mv	a5,a4
    80002c18:	f4f43023          	sd	a5,-192(s0)
    return a4;
    80002c1c:	f4043783          	ld	a5,-192(s0)
    uint64 volatile arg4=r_a4();
    80002c20:	faf43823          	sd	a5,-80(s0)

    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL ) {
    80002c24:	fd843703          	ld	a4,-40(s0)
    80002c28:	00900793          	li	a5,9
    80002c2c:	08f70e63          	beq	a4,a5,80002cc8 <_ZN5RISCV20handleSupervisorTrapEv+0x11c>
    80002c30:	fd843703          	ld	a4,-40(s0)
    80002c34:	00800793          	li	a5,8
    80002c38:	08f70863          	beq	a4,a5,80002cc8 <_ZN5RISCV20handleSupervisorTrapEv+0x11c>
        w_sstatus(sstatus);
        w_sepc(sepc);
        w_scause(scause);
    }

    else if (scause == 0x8000000000000001UL) {
    80002c3c:	fd843703          	ld	a4,-40(s0)
    80002c40:	fff00793          	li	a5,-1
    80002c44:	03f79793          	slli	a5,a5,0x3f
    80002c48:	00178793          	addi	a5,a5,1
    80002c4c:	28f70863          	beq	a4,a5,80002edc <_ZN5RISCV20handleSupervisorTrapEv+0x330>
        }
       // mc_sip(SIP_SSIP);


    }
    else if (scause == 0x8000000000000009UL) {
    80002c50:	fd843703          	ld	a4,-40(s0)
    80002c54:	fff00793          	li	a5,-1
    80002c58:	03f79793          	slli	a5,a5,0x3f
    80002c5c:	00978793          	addi	a5,a5,9
    80002c60:	50f70863          	beq	a4,a5,80003170 <_ZN5RISCV20handleSupervisorTrapEv+0x5c4>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002c64:	141027f3          	csrr	a5,sepc
    80002c68:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002c6c:	fa843783          	ld	a5,-88(s0)
        w_sstatus(sstatus);
        w_scause(scause);
    }
    else {
        //Unexpected trap cause
        size_t volatile sepc = r_sepc();
    80002c70:	faf43023          	sd	a5,-96(s0)
        printStringS("Exception!!! scause: ");
    80002c74:	00007517          	auipc	a0,0x7
    80002c78:	3fc50513          	addi	a0,a0,1020 # 8000a070 <CONSOLE_STATUS+0x60>
    80002c7c:	fffff097          	auipc	ra,0xfffff
    80002c80:	fe0080e7          	jalr	-32(ra) # 80001c5c <_Z12printStringSPKc>
        printIntS(scause);
    80002c84:	fd843503          	ld	a0,-40(s0)
    80002c88:	00000613          	li	a2,0
    80002c8c:	00a00593          	li	a1,10
    80002c90:	0005051b          	sext.w	a0,a0
    80002c94:	fffff097          	auipc	ra,0xfffff
    80002c98:	298080e7          	jalr	664(ra) # 80001f2c <_Z9printIntSiii>
        printStringS("\n sepc: ");
    80002c9c:	00007517          	auipc	a0,0x7
    80002ca0:	3ec50513          	addi	a0,a0,1004 # 8000a088 <CONSOLE_STATUS+0x78>
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	fb8080e7          	jalr	-72(ra) # 80001c5c <_Z12printStringSPKc>
        printIntS(sepc);
    80002cac:	fa043503          	ld	a0,-96(s0)
    80002cb0:	00000613          	li	a2,0
    80002cb4:	00a00593          	li	a1,10
    80002cb8:	0005051b          	sext.w	a0,a0
    80002cbc:	fffff097          	auipc	ra,0xfffff
    80002cc0:	270080e7          	jalr	624(ra) # 80001f2c <_Z9printIntSiii>
        while (true) {}
    80002cc4:	0000006f          	j	80002cc4 <_ZN5RISCV20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002cc8:	141027f3          	csrr	a5,sepc
    80002ccc:	f6f43c23          	sd	a5,-136(s0)
    return sepc;
    80002cd0:	f7843783          	ld	a5,-136(s0)
        uint64 volatile sepc = r_sepc()+4;
    80002cd4:	00478793          	addi	a5,a5,4
    80002cd8:	f0f43023          	sd	a5,-256(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002cdc:	100027f3          	csrr	a5,sstatus
    80002ce0:	f6f43823          	sd	a5,-144(s0)
    return sstatus;
    80002ce4:	f7043783          	ld	a5,-144(s0)
        uint64 volatile sstatus = r_sstatus();
    80002ce8:	f0f43423          	sd	a5,-248(s0)
        switch (code) {
    80002cec:	fd043783          	ld	a5,-48(s0)
    80002cf0:	04200713          	li	a4,66
    80002cf4:	1cf76a63          	bltu	a4,a5,80002ec8 <_ZN5RISCV20handleSupervisorTrapEv+0x31c>
    80002cf8:	00279793          	slli	a5,a5,0x2
    80002cfc:	00007717          	auipc	a4,0x7
    80002d00:	39870713          	addi	a4,a4,920 # 8000a094 <CONSOLE_STATUS+0x84>
    80002d04:	00e787b3          	add	a5,a5,a4
    80002d08:	0007a783          	lw	a5,0(a5)
    80002d0c:	00e787b3          	add	a5,a5,a4
    80002d10:	00078067          	jr	a5
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80002d14:	00058793          	mv	a5,a1
    80002d18:	f8f43023          	sd	a5,-128(s0)
    return a1;
    80002d1c:	f8043783          	ld	a5,-128(s0)
                size_t volatile size_in_bytes=r_a1()*MEM_BLOCK_SIZE;
    80002d20:	00679793          	slli	a5,a5,0x6
    80002d24:	f0f43823          	sd	a5,-240(s0)
                void *ret=MemoryAllocator::mem_alloc(size_in_bytes);
    80002d28:	f1043503          	ld	a0,-240(s0)
    80002d2c:	00001097          	auipc	ra,0x1
    80002d30:	910080e7          	jalr	-1776(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002d34:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002d38:	04542823          	sw	t0,80(s0)
        w_sstatus(sstatus);
    80002d3c:	f0843783          	ld	a5,-248(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002d40:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80002d44:	f0043783          	ld	a5,-256(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002d48:	14179073          	csrw	sepc,a5
        w_scause(scause);
    80002d4c:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
    80002d50:	14279073          	csrw	scause,a5
    }
}
    80002d54:	0f813083          	ld	ra,248(sp)
    80002d58:	0f013403          	ld	s0,240(sp)
    80002d5c:	0e813483          	ld	s1,232(sp)
    80002d60:	0e013903          	ld	s2,224(sp)
    80002d64:	10010113          	addi	sp,sp,256
    80002d68:	00008067          	ret
    __asm__ volatile ("mv %0, a1" : "=r" (a1));
    80002d6c:	00058793          	mv	a5,a1
    80002d70:	f8f43423          	sd	a5,-120(s0)
    return a1;
    80002d74:	f8843783          	ld	a5,-120(s0)
                void* volatile start=(void*)r_a1();
    80002d78:	f0f43c23          	sd	a5,-232(s0)
                int ret=MemoryAllocator::mem_free(start);
    80002d7c:	f1843503          	ld	a0,-232(s0)
    80002d80:	00001097          	auipc	ra,0x1
    80002d84:	a1c080e7          	jalr	-1508(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002d88:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002d8c:	04542823          	sw	t0,80(s0)
}
    80002d90:	fadff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                size_t ret=MemoryAllocator::mem_get_free_space();
    80002d94:	00001097          	auipc	ra,0x1
    80002d98:	b50080e7          	jalr	-1200(ra) # 800038e4 <_ZN15MemoryAllocator18mem_get_free_spaceEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002d9c:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002da0:	04542823          	sw	t0,80(s0)
}
    80002da4:	f99ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                size_t ret=MemoryAllocator::mem_get_largest_free_block();
    80002da8:	00001097          	auipc	ra,0x1
    80002dac:	af8080e7          	jalr	-1288(ra) # 800038a0 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002db0:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002db4:	04542823          	sw	t0,80(s0)
}
    80002db8:	f85ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                TCB **threadcreatHandle=(TCB**)arg1;
    80002dbc:	fc843503          	ld	a0,-56(s0)
                TCB::Body routine=(TCB::Body)arg2;
    80002dc0:	fc043583          	ld	a1,-64(s0)
                void *arg=(void*)arg3;
    80002dc4:	fb843603          	ld	a2,-72(s0)
                char *stack=(char*)arg4;
    80002dc8:	fb043683          	ld	a3,-80(s0)
                int ret = TCB::createThread(threadcreatHandle,routine,arg,stack);
    80002dcc:	00000097          	auipc	ra,0x0
    80002dd0:	530080e7          	jalr	1328(ra) # 800032fc <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002dd4:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002dd8:	04542823          	sw	t0,80(s0)
}
    80002ddc:	f61ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                TCB::running->setFinished(true);
    80002de0:	0000a797          	auipc	a5,0xa
    80002de4:	dc87b783          	ld	a5,-568(a5) # 8000cba8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002de8:	0007b783          	ld	a5,0(a5)
    void setFinished(bool finished) {this->finished = finished;}
    80002dec:	00100713          	li	a4,1
    80002df0:	02e78023          	sb	a4,32(a5)
                TCB::dispatch();
    80002df4:	00000097          	auipc	ra,0x0
    80002df8:	6c8080e7          	jalr	1736(ra) # 800034bc <_ZN3TCB8dispatchEv>
                break;
    80002dfc:	f41ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                TCB::dispatch();
    80002e00:	00000097          	auipc	ra,0x0
    80002e04:	6bc080e7          	jalr	1724(ra) # 800034bc <_ZN3TCB8dispatchEv>
                break;
    80002e08:	f35ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                Semaphore **semHandle=(Semaphore**)arg1;
    80002e0c:	fc843503          	ld	a0,-56(s0)
                unsigned initialize=(unsigned)arg2;
    80002e10:	fc043583          	ld	a1,-64(s0)
                int ret=Semaphore::createSemaphore(semHandle,initialize);
    80002e14:	0005859b          	sext.w	a1,a1
    80002e18:	fffff097          	auipc	ra,0xfffff
    80002e1c:	9e0080e7          	jalr	-1568(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e20:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002e24:	04542823          	sw	t0,80(s0)
}
    80002e28:	f15ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                Semaphore *semId=(Semaphore*)arg1;
    80002e2c:	fc843903          	ld	s2,-56(s0)
                int ret=Semaphore::closeSemaphore(semId);
    80002e30:	00090513          	mv	a0,s2
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	a88080e7          	jalr	-1400(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    80002e3c:	00050493          	mv	s1,a0
                delete semId;
    80002e40:	00091863          	bnez	s2,80002e50 <_ZN5RISCV20handleSupervisorTrapEv+0x2a4>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e44:	00048293          	mv	t0,s1
    __asm__ volatile ("sw t0, 80(x8)");
    80002e48:	04542823          	sw	t0,80(s0)
}
    80002e4c:	ef1ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
    void* operator new[](size_t size) {
        return MemoryAllocator::mem_alloc(size);
    }

    void operator delete(void *ptr) {
        MemoryAllocator::mem_free(ptr);
    80002e50:	00090513          	mv	a0,s2
    80002e54:	00001097          	auipc	ra,0x1
    80002e58:	948080e7          	jalr	-1720(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    }
    80002e5c:	fe9ff06f          	j	80002e44 <_ZN5RISCV20handleSupervisorTrapEv+0x298>
                Semaphore *semId=(Semaphore*)arg1;
    80002e60:	fc843503          	ld	a0,-56(s0)
                int ret=semId->sem_wait();
    80002e64:	fffff097          	auipc	ra,0xfffff
    80002e68:	b84080e7          	jalr	-1148(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e6c:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002e70:	04542823          	sw	t0,80(s0)
}
    80002e74:	ec9ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                Semaphore *semId=(Semaphore*)arg1;
    80002e78:	fc843503          	ld	a0,-56(s0)
                int ret=semId->sem_signal();
    80002e7c:	fffff097          	auipc	ra,0xfffff
    80002e80:	c34080e7          	jalr	-972(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002e84:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002e88:	04542823          	sw	t0,80(s0)
}
    80002e8c:	eb1ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                time_t time=(time_t)arg1;
    80002e90:	fc843503          	ld	a0,-56(s0)
                TCB::timeSleep(time);
    80002e94:	00000097          	auipc	ra,0x0
    80002e98:	690080e7          	jalr	1680(ra) # 80003524 <_ZN3TCB9timeSleepEm>
                break;
    80002e9c:	ea1ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                char ret=Console::consoleGetcBuff();
    80002ea0:	fffff097          	auipc	ra,0xfffff
    80002ea4:	3d8080e7          	jalr	984(ra) # 80002278 <_ZN7Console15consoleGetcBuffEv>
    __asm__ volatile("mv t0, %0" : : "r" (retVal));
    80002ea8:	00050293          	mv	t0,a0
    __asm__ volatile ("sw t0, 80(x8)");
    80002eac:	04542823          	sw	t0,80(s0)
}
    80002eb0:	e8dff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                char character=(char)arg1;
    80002eb4:	fc843503          	ld	a0,-56(s0)
                Console::consolePutcBuff(character);
    80002eb8:	0ff57513          	andi	a0,a0,255
    80002ebc:	fffff097          	auipc	ra,0xfffff
    80002ec0:	3ec080e7          	jalr	1004(ra) # 800022a8 <_ZN7Console15consolePutcBuffEc>
                break;
    80002ec4:	e79ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
                printStringS("Unsupported system-call code.");
    80002ec8:	00007517          	auipc	a0,0x7
    80002ecc:	18850513          	addi	a0,a0,392 # 8000a050 <CONSOLE_STATUS+0x40>
    80002ed0:	fffff097          	auipc	ra,0xfffff
    80002ed4:	d8c080e7          	jalr	-628(ra) # 80001c5c <_Z12printStringSPKc>
                break;
    80002ed8:	e65ff06f          	j	80002d3c <_ZN5RISCV20handleSupervisorTrapEv+0x190>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r" (mask));
    80002edc:	00200793          	li	a5,2
    80002ee0:	1447b073          	csrc	sip,a5
    T *peekLast() {
        if (!tail)return 0;
        return tail->data;
    }
    void setFirst() {
        curr = head;
    80002ee4:	0000a797          	auipc	a5,0xa
    80002ee8:	cb47b783          	ld	a5,-844(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002eec:	0007b703          	ld	a4,0(a5)
    80002ef0:	00e7b823          	sd	a4,16(a5)
        prev = 0;
    80002ef4:	0007bc23          	sd	zero,24(a5)
    }

    T* getCurrent() {
        if (curr) return curr->data;
    80002ef8:	0000a797          	auipc	a5,0xa
    80002efc:	ca07b783          	ld	a5,-864(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f00:	0107b783          	ld	a5,16(a5)
    80002f04:	0a078c63          	beqz	a5,80002fbc <_ZN5RISCV20handleSupervisorTrapEv+0x410>
    80002f08:	0007b783          	ld	a5,0(a5)
        while (Semaphore::allSemaphoresQueue.getCurrent()!=nullptr) {
    80002f0c:	0a078863          	beqz	a5,80002fbc <_ZN5RISCV20handleSupervisorTrapEv+0x410>
            if (Semaphore::allSemaphoresQueue.getCurrent()->timeout<0) {
    80002f10:	0087b703          	ld	a4,8(a5)
            Semaphore::allSemaphoresQueue.getCurrent()->timeout-=1;
    80002f14:	fff70713          	addi	a4,a4,-1
    80002f18:	00e7b423          	sd	a4,8(a5)
    80002f1c:	0000a797          	auipc	a5,0xa
    80002f20:	c7c7b783          	ld	a5,-900(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f24:	0107b783          	ld	a5,16(a5)
    80002f28:	00078463          	beqz	a5,80002f30 <_ZN5RISCV20handleSupervisorTrapEv+0x384>
    80002f2c:	0007b783          	ld	a5,0(a5)
            if (Semaphore::allSemaphoresQueue.getCurrent()->timeout==0) {
    80002f30:	0087b783          	ld	a5,8(a5)
    80002f34:	04078263          	beqz	a5,80002f78 <_ZN5RISCV20handleSupervisorTrapEv+0x3cc>
        delete curr;
        return ret;
    }

    void next() {
        if (curr) {
    80002f38:	0000a797          	auipc	a5,0xa
    80002f3c:	c607b783          	ld	a5,-928(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f40:	0107b783          	ld	a5,16(a5)
    80002f44:	fa078ae3          	beqz	a5,80002ef8 <_ZN5RISCV20handleSupervisorTrapEv+0x34c>
            prev = curr;
    80002f48:	0000a717          	auipc	a4,0xa
    80002f4c:	c5073703          	ld	a4,-944(a4) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f50:	00f73c23          	sd	a5,24(a4)
            curr = curr->next;
    80002f54:	0087b783          	ld	a5,8(a5)
    80002f58:	00f73823          	sd	a5,16(a4)
    80002f5c:	f9dff06f          	j	80002ef8 <_ZN5RISCV20handleSupervisorTrapEv+0x34c>
        T *ret=el->data;
    80002f60:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80002f64:	00001097          	auipc	ra,0x1
    80002f68:	838080e7          	jalr	-1992(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
                    Scheduler::put(Semaphore::allSemaphoresQueue.getCurrent()->blockedQueue.removeFIrst());
    80002f6c:	00048513          	mv	a0,s1
    80002f70:	fffff097          	auipc	ra,0xfffff
    80002f74:	1d8080e7          	jalr	472(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
        if (curr) return curr->data;
    80002f78:	0000a797          	auipc	a5,0xa
    80002f7c:	c207b783          	ld	a5,-992(a5) # 8000cb98 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002f80:	0107b783          	ld	a5,16(a5)
    80002f84:	00078463          	beqz	a5,80002f8c <_ZN5RISCV20handleSupervisorTrapEv+0x3e0>
    80002f88:	0007b783          	ld	a5,0(a5)
        if (!head)return  0;
    80002f8c:	0187b503          	ld	a0,24(a5)
    80002f90:	02050063          	beqz	a0,80002fb0 <_ZN5RISCV20handleSupervisorTrapEv+0x404>
        return head->data;
    80002f94:	00053703          	ld	a4,0(a0)
                while (Semaphore::allSemaphoresQueue.getCurrent()->blockedQueue.peekFirst()) {
    80002f98:	00070c63          	beqz	a4,80002fb0 <_ZN5RISCV20handleSupervisorTrapEv+0x404>
        head=head->next;
    80002f9c:	00853703          	ld	a4,8(a0)
    80002fa0:	00e7bc23          	sd	a4,24(a5)
        if (!head) tail=0;
    80002fa4:	fa071ee3          	bnez	a4,80002f60 <_ZN5RISCV20handleSupervisorTrapEv+0x3b4>
    80002fa8:	0207b023          	sd	zero,32(a5)
    80002fac:	fb5ff06f          	j	80002f60 <_ZN5RISCV20handleSupervisorTrapEv+0x3b4>
                Semaphore::allSemaphoresQueue.getCurrent()->timedOut=true;
    80002fb0:	00100713          	li	a4,1
    80002fb4:	00e78823          	sb	a4,16(a5)
    80002fb8:	f81ff06f          	j	80002f38 <_ZN5RISCV20handleSupervisorTrapEv+0x38c>
        curr = head;
    80002fbc:	0000a797          	auipc	a5,0xa
    80002fc0:	ba47b783          	ld	a5,-1116(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fc4:	0007b703          	ld	a4,0(a5)
    80002fc8:	00e7b823          	sd	a4,16(a5)
        prev = 0;
    80002fcc:	0007bc23          	sd	zero,24(a5)
    }
    80002fd0:	0540006f          	j	80003024 <_ZN5RISCV20handleSupervisorTrapEv+0x478>
            head = head->next;
    80002fd4:	0087b783          	ld	a5,8(a5)
    80002fd8:	0000a717          	auipc	a4,0xa
    80002fdc:	b8873703          	ld	a4,-1144(a4) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fe0:	00f73023          	sd	a5,0(a4)
            if (!head) tail = 0;
    80002fe4:	0c078263          	beqz	a5,800030a8 <_ZN5RISCV20handleSupervisorTrapEv+0x4fc>
            T* ret = curr->data;
    80002fe8:	00053483          	ld	s1,0(a0)
            MemoryAllocator::mem_free(ptr);
    80002fec:	00000097          	auipc	ra,0x0
    80002ff0:	7b0080e7          	jalr	1968(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
                Scheduler::put(TCB::sleepingThreads.removeCurrent());
    80002ff4:	00048513          	mv	a0,s1
    80002ff8:	fffff097          	auipc	ra,0xfffff
    80002ffc:	150080e7          	jalr	336(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
        if (curr) {
    80003000:	0000a797          	auipc	a5,0xa
    80003004:	b607b783          	ld	a5,-1184(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003008:	0107b783          	ld	a5,16(a5)
    8000300c:	00078c63          	beqz	a5,80003024 <_ZN5RISCV20handleSupervisorTrapEv+0x478>
            prev = curr;
    80003010:	0000a717          	auipc	a4,0xa
    80003014:	b5073703          	ld	a4,-1200(a4) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003018:	00f73c23          	sd	a5,24(a4)
            curr = curr->next;
    8000301c:	0087b783          	ld	a5,8(a5)
    80003020:	00f73823          	sd	a5,16(a4)
        if (curr) return curr->data;
    80003024:	0000a797          	auipc	a5,0xa
    80003028:	b3c7b783          	ld	a5,-1220(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000302c:	0107b783          	ld	a5,16(a5)
    80003030:	0c078a63          	beqz	a5,80003104 <_ZN5RISCV20handleSupervisorTrapEv+0x558>
    80003034:	0007b703          	ld	a4,0(a5)
        while (TCB::sleepingThreads.getCurrent()!=nullptr) {
    80003038:	0c070663          	beqz	a4,80003104 <_ZN5RISCV20handleSupervisorTrapEv+0x558>
            TCB::sleepingThreads.getCurrent()->timeSleeping-=1;
    8000303c:	03073683          	ld	a3,48(a4)
    80003040:	fff68693          	addi	a3,a3,-1
    80003044:	02d73823          	sd	a3,48(a4)
    80003048:	0007b783          	ld	a5,0(a5)
            if (TCB::sleepingThreads.getCurrent()->timeSleeping==0) {
    8000304c:	0307b783          	ld	a5,48(a5)
    80003050:	fa0798e3          	bnez	a5,80003000 <_ZN5RISCV20handleSupervisorTrapEv+0x454>
        if (!curr) return 0;
    80003054:	0000a797          	auipc	a5,0xa
    80003058:	b0c7b783          	ld	a5,-1268(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000305c:	0107b503          	ld	a0,16(a5)
    80003060:	08050e63          	beqz	a0,800030fc <_ZN5RISCV20handleSupervisorTrapEv+0x550>
        if (curr == head) {
    80003064:	0007b783          	ld	a5,0(a5)
    80003068:	f6f506e3          	beq	a0,a5,80002fd4 <_ZN5RISCV20handleSupervisorTrapEv+0x428>
        if (curr == tail) {
    8000306c:	0000a797          	auipc	a5,0xa
    80003070:	af47b783          	ld	a5,-1292(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003074:	0087b783          	ld	a5,8(a5)
    80003078:	02f50c63          	beq	a0,a5,800030b0 <_ZN5RISCV20handleSupervisorTrapEv+0x504>
        T* ret = curr->data;
    8000307c:	00053483          	ld	s1,0(a0)
        prev->next = curr->next;
    80003080:	0000a797          	auipc	a5,0xa
    80003084:	ae07b783          	ld	a5,-1312(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003088:	0187b703          	ld	a4,24(a5)
    8000308c:	00853683          	ld	a3,8(a0)
    80003090:	00d73423          	sd	a3,8(a4)
        delete curr;
    80003094:	0107b503          	ld	a0,16(a5)
    80003098:	f4050ee3          	beqz	a0,80002ff4 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            MemoryAllocator::mem_free(ptr);
    8000309c:	00000097          	auipc	ra,0x0
    800030a0:	700080e7          	jalr	1792(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
        }
    800030a4:	f51ff06f          	j	80002ff4 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            if (!head) tail = 0;
    800030a8:	00073423          	sd	zero,8(a4)
    800030ac:	f3dff06f          	j	80002fe8 <_ZN5RISCV20handleSupervisorTrapEv+0x43c>
            if (prev) prev->next = 0;
    800030b0:	0000a797          	auipc	a5,0xa
    800030b4:	ab07b783          	ld	a5,-1360(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030b8:	0187b783          	ld	a5,24(a5)
    800030bc:	02078863          	beqz	a5,800030ec <_ZN5RISCV20handleSupervisorTrapEv+0x540>
    800030c0:	0007b423          	sd	zero,8(a5)
            tail = prev;
    800030c4:	0000a797          	auipc	a5,0xa
    800030c8:	a9c7b783          	ld	a5,-1380(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030cc:	0187b703          	ld	a4,24(a5)
    800030d0:	00e7b423          	sd	a4,8(a5)
            T* ret = curr->data;
    800030d4:	0107b503          	ld	a0,16(a5)
    800030d8:	00053483          	ld	s1,0(a0)
            delete curr;
    800030dc:	f0050ce3          	beqz	a0,80002ff4 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            MemoryAllocator::mem_free(ptr);
    800030e0:	00000097          	auipc	ra,0x0
    800030e4:	6bc080e7          	jalr	1724(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
            return ret;
    800030e8:	f0dff06f          	j	80002ff4 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
            else head = 0;
    800030ec:	0000a797          	auipc	a5,0xa
    800030f0:	a747b783          	ld	a5,-1420(a5) # 8000cb60 <_GLOBAL_OFFSET_TABLE_+0x8>
    800030f4:	0007b023          	sd	zero,0(a5)
    800030f8:	fcdff06f          	j	800030c4 <_ZN5RISCV20handleSupervisorTrapEv+0x518>
        if (!curr) return 0;
    800030fc:	00050493          	mv	s1,a0
    80003100:	ef5ff06f          	j	80002ff4 <_ZN5RISCV20handleSupervisorTrapEv+0x448>
        TCB::timeSliceCounter++;
    80003104:	0000a717          	auipc	a4,0xa
    80003108:	a7c73703          	ld	a4,-1412(a4) # 8000cb80 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000310c:	00073783          	ld	a5,0(a4)
    80003110:	00178793          	addi	a5,a5,1
    80003114:	00f73023          	sd	a5,0(a4)
        if (TCB::timeSliceCounter>=DEFAULT_TIME_SLICE) {
    80003118:	00100713          	li	a4,1
    8000311c:	c2f77ce3          	bgeu	a4,a5,80002d54 <_ZN5RISCV20handleSupervisorTrapEv+0x1a8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003120:	141027f3          	csrr	a5,sepc
    80003124:	f8f43c23          	sd	a5,-104(s0)
    return sepc;
    80003128:	f9843783          	ld	a5,-104(s0)
            uint64 volatile sepc = r_sepc();
    8000312c:	f2f43023          	sd	a5,-224(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80003130:	100027f3          	csrr	a5,sstatus
    80003134:	f8f43823          	sd	a5,-112(s0)
    return sstatus;
    80003138:	f9043783          	ld	a5,-112(s0)
            uint64 volatile sstatus = r_sstatus();
    8000313c:	f2f43423          	sd	a5,-216(s0)
            TCB::timeSliceCounter = 0;
    80003140:	0000a797          	auipc	a5,0xa
    80003144:	a407b783          	ld	a5,-1472(a5) # 8000cb80 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003148:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    8000314c:	00000097          	auipc	ra,0x0
    80003150:	370080e7          	jalr	880(ra) # 800034bc <_ZN3TCB8dispatchEv>
            w_sstatus(sstatus);
    80003154:	f2843783          	ld	a5,-216(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80003158:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    8000315c:	f2043783          	ld	a5,-224(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003160:	14179073          	csrw	sepc,a5
            w_scause(scause);
    80003164:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
    80003168:	14279073          	csrw	scause,a5
}
    8000316c:	be9ff06f          	j	80002d54 <_ZN5RISCV20handleSupervisorTrapEv+0x1a8>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003170:	141027f3          	csrr	a5,sepc
    80003174:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80003178:	fa843783          	ld	a5,-88(s0)
        uint64 volatile sepc=r_sepc();
    8000317c:	f2f43823          	sd	a5,-208(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80003180:	100027f3          	csrr	a5,sstatus
    80003184:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    80003188:	fa043783          	ld	a5,-96(s0)
        uint64 volatile sstatus=r_sstatus();
    8000318c:	f2f43c23          	sd	a5,-200(s0)
        int interrupt=plic_claim();
    80003190:	00004097          	auipc	ra,0x4
    80003194:	634080e7          	jalr	1588(ra) # 800077c4 <plic_claim>
    80003198:	00050493          	mv	s1,a0
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r" (mask));
    8000319c:	20000793          	li	a5,512
    800031a0:	1447b073          	csrc	sip,a5
        if (interrupt==CONSOLE_IRQ) {
    800031a4:	00a00793          	li	a5,10
    800031a8:	02f50a63          	beq	a0,a5,800031dc <_ZN5RISCV20handleSupervisorTrapEv+0x630>
        plic_complete(interrupt);
    800031ac:	00048513          	mv	a0,s1
    800031b0:	00004097          	auipc	ra,0x4
    800031b4:	64c080e7          	jalr	1612(ra) # 800077fc <plic_complete>
        w_sepc(sepc);
    800031b8:	f3043783          	ld	a5,-208(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800031bc:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    800031c0:	f3843783          	ld	a5,-200(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    800031c4:	10079073          	csrw	sstatus,a5
        w_scause(scause);
    800031c8:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r" (scause));
    800031cc:	14279073          	csrw	scause,a5
}
    800031d0:	b85ff06f          	j	80002d54 <_ZN5RISCV20handleSupervisorTrapEv+0x1a8>
                Console::inputBuffAppend(character);
    800031d4:	fffff097          	auipc	ra,0xfffff
    800031d8:	270080e7          	jalr	624(ra) # 80002444 <_ZN7Console15inputBuffAppendEc>
            while ((*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    800031dc:	0000a797          	auipc	a5,0xa
    800031e0:	9947b783          	ld	a5,-1644(a5) # 8000cb70 <_GLOBAL_OFFSET_TABLE_+0x18>
    800031e4:	0007b783          	ld	a5,0(a5)
    800031e8:	0007c783          	lbu	a5,0(a5)
    800031ec:	0017f793          	andi	a5,a5,1
    800031f0:	fa078ee3          	beqz	a5,800031ac <_ZN5RISCV20handleSupervisorTrapEv+0x600>
                char character = (char)(*((char*)CONSOLE_RX_DATA));
    800031f4:	0000a797          	auipc	a5,0xa
    800031f8:	9747b783          	ld	a5,-1676(a5) # 8000cb68 <_GLOBAL_OFFSET_TABLE_+0x10>
    800031fc:	0007b783          	ld	a5,0(a5)
    80003200:	0007c503          	lbu	a0,0(a5)
                if ((int)character == 13) character = '\n';
    80003204:	00d00793          	li	a5,13
    80003208:	fcf516e3          	bne	a0,a5,800031d4 <_ZN5RISCV20handleSupervisorTrapEv+0x628>
    8000320c:	00a00513          	li	a0,10
    80003210:	fc5ff06f          	j	800031d4 <_ZN5RISCV20handleSupervisorTrapEv+0x628>

0000000080003214 <_Z41__static_initialization_and_destruction_0ii>:
    sleepingThreads.addFirst(running);

    TCB* oldThr=running;
    running=Scheduler::get();
    contextSwitch(&oldThr->context,&running->context);
    80003214:	ff010113          	addi	sp,sp,-16
    80003218:	00813423          	sd	s0,8(sp)
    8000321c:	01010413          	addi	s0,sp,16
    80003220:	00100793          	li	a5,1
    80003224:	00f50863          	beq	a0,a5,80003234 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003228:	00813403          	ld	s0,8(sp)
    8000322c:	01010113          	addi	sp,sp,16
    80003230:	00008067          	ret
    80003234:	000107b7          	lui	a5,0x10
    80003238:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000323c:	fef596e3          	bne	a1,a5,80003228 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0), curr(0), prev(0) {}
    80003240:	0000a797          	auipc	a5,0xa
    80003244:	a2878793          	addi	a5,a5,-1496 # 8000cc68 <_ZN3TCB15sleepingThreadsE>
    80003248:	0007b023          	sd	zero,0(a5)
    8000324c:	0007b423          	sd	zero,8(a5)
    80003250:	0007b823          	sd	zero,16(a5)
    80003254:	0007bc23          	sd	zero,24(a5)
    80003258:	fd1ff06f          	j	80003228 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000325c <_ZN3TCBC1EPFvPvES0_Pcb>:
    this->body = b;
    8000325c:	00b53023          	sd	a1,0(a0)
    this->stack = stack_space;
    80003260:	00d53423          	sd	a3,8(a0)
    this->arg = arg;
    80003264:	02c53423          	sd	a2,40(a0)
    this->finished = false;
    80003268:	02050023          	sb	zero,32(a0)
        !system_mode ? (size_t)threadWrapper : (size_t)systemThreadWrapper,
    8000326c:	04070663          	beqz	a4,800032b8 <_ZN3TCBC1EPFvPvES0_Pcb+0x5c>
    80003270:	00000797          	auipc	a5,0x0
    80003274:	1e878793          	addi	a5,a5,488 # 80003458 <_ZN3TCB19systemThreadWrapperEv>
        stack ? (size_t)&stack[DEFAULT_STACK_SIZE] : 0
    80003278:	04068663          	beqz	a3,800032c4 <_ZN3TCBC1EPFvPvES0_Pcb+0x68>
    8000327c:	00001737          	lui	a4,0x1
    80003280:	00e686b3          	add	a3,a3,a4
    this->context = {
    80003284:	00f53823          	sd	a5,16(a0)
    80003288:	00d53c23          	sd	a3,24(a0)
    if (body!=nullptr) Scheduler::put(this);
    8000328c:	04058063          	beqz	a1,800032cc <_ZN3TCBC1EPFvPvES0_Pcb+0x70>
TCB::TCB(Body b, void *arg, char *stack_space, bool system_mode) {
    80003290:	ff010113          	addi	sp,sp,-16
    80003294:	00113423          	sd	ra,8(sp)
    80003298:	00813023          	sd	s0,0(sp)
    8000329c:	01010413          	addi	s0,sp,16
    if (body!=nullptr) Scheduler::put(this);
    800032a0:	fffff097          	auipc	ra,0xfffff
    800032a4:	ea8080e7          	jalr	-344(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
}
    800032a8:	00813083          	ld	ra,8(sp)
    800032ac:	00013403          	ld	s0,0(sp)
    800032b0:	01010113          	addi	sp,sp,16
    800032b4:	00008067          	ret
        !system_mode ? (size_t)threadWrapper : (size_t)systemThreadWrapper,
    800032b8:	00000797          	auipc	a5,0x0
    800032bc:	13c78793          	addi	a5,a5,316 # 800033f4 <_ZN3TCB13threadWrapperEv>
    800032c0:	fb9ff06f          	j	80003278 <_ZN3TCBC1EPFvPvES0_Pcb+0x1c>
        stack ? (size_t)&stack[DEFAULT_STACK_SIZE] : 0
    800032c4:	00000693          	li	a3,0
    800032c8:	fbdff06f          	j	80003284 <_ZN3TCBC1EPFvPvES0_Pcb+0x28>
    800032cc:	00008067          	ret

00000000800032d0 <_ZN3TCBD1Ev>:
TCB::~TCB() {
    800032d0:	ff010113          	addi	sp,sp,-16
    800032d4:	00113423          	sd	ra,8(sp)
    800032d8:	00813023          	sd	s0,0(sp)
    800032dc:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(stack);
    800032e0:	00853503          	ld	a0,8(a0)
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	4b8080e7          	jalr	1208(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
}
    800032ec:	00813083          	ld	ra,8(sp)
    800032f0:	00013403          	ld	s0,0(sp)
    800032f4:	01010113          	addi	sp,sp,16
    800032f8:	00008067          	ret

00000000800032fc <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc>:
int TCB::createThread(TCB** thrHandle,Body b,void*arg,char *stack_space) {
    800032fc:	fc010113          	addi	sp,sp,-64
    80003300:	02113c23          	sd	ra,56(sp)
    80003304:	02813823          	sd	s0,48(sp)
    80003308:	02913423          	sd	s1,40(sp)
    8000330c:	03213023          	sd	s2,32(sp)
    80003310:	01313c23          	sd	s3,24(sp)
    80003314:	01413823          	sd	s4,16(sp)
    80003318:	01513423          	sd	s5,8(sp)
    8000331c:	04010413          	addi	s0,sp,64
    80003320:	00050a93          	mv	s5,a0
    80003324:	00058913          	mv	s2,a1
    80003328:	00060993          	mv	s3,a2
    8000332c:	00068a13          	mv	s4,a3
        return MemoryAllocator::mem_alloc(size);
    80003330:	03800513          	li	a0,56
    80003334:	00000097          	auipc	ra,0x0
    80003338:	308080e7          	jalr	776(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
    8000333c:	00050493          	mv	s1,a0
    TCB *newT=new TCB(b,arg,stack_space,true);
    80003340:	00100713          	li	a4,1
    80003344:	000a0693          	mv	a3,s4
    80003348:	00098613          	mv	a2,s3
    8000334c:	00090593          	mv	a1,s2
    80003350:	00000097          	auipc	ra,0x0
    80003354:	f0c080e7          	jalr	-244(ra) # 8000325c <_ZN3TCBC1EPFvPvES0_Pcb>
    if (newT==nullptr){thrHandle=nullptr;return -1;}
    80003358:	02048863          	beqz	s1,80003388 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc+0x8c>
    *thrHandle=newT;
    8000335c:	009ab023          	sd	s1,0(s5)
    return 0;
    80003360:	00000513          	li	a0,0
}
    80003364:	03813083          	ld	ra,56(sp)
    80003368:	03013403          	ld	s0,48(sp)
    8000336c:	02813483          	ld	s1,40(sp)
    80003370:	02013903          	ld	s2,32(sp)
    80003374:	01813983          	ld	s3,24(sp)
    80003378:	01013a03          	ld	s4,16(sp)
    8000337c:	00813a83          	ld	s5,8(sp)
    80003380:	04010113          	addi	sp,sp,64
    80003384:	00008067          	ret
    if (newT==nullptr){thrHandle=nullptr;return -1;}
    80003388:	fff00513          	li	a0,-1
    8000338c:	fd9ff06f          	j	80003364 <_ZN3TCB12createThreadEPPS_PFvPvES2_Pc+0x68>
    80003390:	00050913          	mv	s2,a0
        MemoryAllocator::mem_free(ptr);
    80003394:	00048513          	mv	a0,s1
    80003398:	00000097          	auipc	ra,0x0
    8000339c:	404080e7          	jalr	1028(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    800033a0:	00090513          	mv	a0,s2
    800033a4:	0000b097          	auipc	ra,0xb
    800033a8:	a14080e7          	jalr	-1516(ra) # 8000ddb8 <_Unwind_Resume>

00000000800033ac <_ZN3TCB16schedulerIsEmptyEv>:
bool TCB::schedulerIsEmpty() {
    800033ac:	ff010113          	addi	sp,sp,-16
    800033b0:	00113423          	sd	ra,8(sp)
    800033b4:	00813023          	sd	s0,0(sp)
    800033b8:	01010413          	addi	s0,sp,16
    return Scheduler::peekFirst() == nullptr;
    800033bc:	fffff097          	auipc	ra,0xfffff
    800033c0:	df8080e7          	jalr	-520(ra) # 800021b4 <_ZN9Scheduler9peekFirstEv>
}
    800033c4:	00153513          	seqz	a0,a0
    800033c8:	00813083          	ld	ra,8(sp)
    800033cc:	00013403          	ld	s0,0(sp)
    800033d0:	01010113          	addi	sp,sp,16
    800033d4:	00008067          	ret

00000000800033d8 <_ZN3TCB5yieldEv>:
void TCB::yield(){
    800033d8:	ff010113          	addi	sp,sp,-16
    800033dc:	00813423          	sd	s0,8(sp)
    800033e0:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall");
    800033e4:	00000073          	ecall
}
    800033e8:	00813403          	ld	s0,8(sp)
    800033ec:	01010113          	addi	sp,sp,16
    800033f0:	00008067          	ret

00000000800033f4 <_ZN3TCB13threadWrapperEv>:
void TCB::threadWrapper() {
    800033f4:	fe010113          	addi	sp,sp,-32
    800033f8:	00113c23          	sd	ra,24(sp)
    800033fc:	00813823          	sd	s0,16(sp)
    80003400:	00913423          	sd	s1,8(sp)
    80003404:	02010413          	addi	s0,sp,32
    RISCV::popSppSpie();
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	75c080e7          	jalr	1884(ra) # 80002b64 <_ZN5RISCV10popSppSpieEv>
    running->body(running->arg);
    80003410:	0000a497          	auipc	s1,0xa
    80003414:	85848493          	addi	s1,s1,-1960 # 8000cc68 <_ZN3TCB15sleepingThreadsE>
    80003418:	0204b783          	ld	a5,32(s1)
    8000341c:	0007b703          	ld	a4,0(a5)
    80003420:	0287b503          	ld	a0,40(a5)
    80003424:	000700e7          	jalr	a4 # 1000 <_entry-0x7ffff000>
    running->setFinished(true);
    80003428:	0204b783          	ld	a5,32(s1)
    void setFinished(bool finished) {this->finished = finished;}
    8000342c:	00100713          	li	a4,1
    80003430:	02e78023          	sb	a4,32(a5)
    __asm__ volatile ("mv a0, %0" : : "r" (val));
    80003434:	01300793          	li	a5,19
    80003438:	00078513          	mv	a0,a5
    TCB::yield();
    8000343c:	00000097          	auipc	ra,0x0
    80003440:	f9c080e7          	jalr	-100(ra) # 800033d8 <_ZN3TCB5yieldEv>
}
    80003444:	01813083          	ld	ra,24(sp)
    80003448:	01013403          	ld	s0,16(sp)
    8000344c:	00813483          	ld	s1,8(sp)
    80003450:	02010113          	addi	sp,sp,32
    80003454:	00008067          	ret

0000000080003458 <_ZN3TCB19systemThreadWrapperEv>:
void TCB::systemThreadWrapper() {
    80003458:	fe010113          	addi	sp,sp,-32
    8000345c:	00113c23          	sd	ra,24(sp)
    80003460:	00813823          	sd	s0,16(sp)
    80003464:	00913423          	sd	s1,8(sp)
    80003468:	02010413          	addi	s0,sp,32
    RISCV::systemPopSppSpie();
    8000346c:	fffff097          	auipc	ra,0xfffff
    80003470:	720080e7          	jalr	1824(ra) # 80002b8c <_ZN5RISCV16systemPopSppSpieEv>
    running->body(running->arg);
    80003474:	00009497          	auipc	s1,0x9
    80003478:	7f448493          	addi	s1,s1,2036 # 8000cc68 <_ZN3TCB15sleepingThreadsE>
    8000347c:	0204b783          	ld	a5,32(s1)
    80003480:	0007b703          	ld	a4,0(a5)
    80003484:	0287b503          	ld	a0,40(a5)
    80003488:	000700e7          	jalr	a4
    running->setFinished(true);
    8000348c:	0204b783          	ld	a5,32(s1)
    80003490:	00100713          	li	a4,1
    80003494:	02e78023          	sb	a4,32(a5)
    80003498:	01300793          	li	a5,19
    8000349c:	00078513          	mv	a0,a5
    TCB::yield();
    800034a0:	00000097          	auipc	ra,0x0
    800034a4:	f38080e7          	jalr	-200(ra) # 800033d8 <_ZN3TCB5yieldEv>
}
    800034a8:	01813083          	ld	ra,24(sp)
    800034ac:	01013403          	ld	s0,16(sp)
    800034b0:	00813483          	ld	s1,8(sp)
    800034b4:	02010113          	addi	sp,sp,32
    800034b8:	00008067          	ret

00000000800034bc <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800034bc:	fe010113          	addi	sp,sp,-32
    800034c0:	00113c23          	sd	ra,24(sp)
    800034c4:	00813823          	sd	s0,16(sp)
    800034c8:	00913423          	sd	s1,8(sp)
    800034cc:	02010413          	addi	s0,sp,32
    TCB *old=running;
    800034d0:	00009497          	auipc	s1,0x9
    800034d4:	7b84b483          	ld	s1,1976(s1) # 8000cc88 <_ZN3TCB7runningE>
    bool isFinished() const {return finished;}
    800034d8:	0204c783          	lbu	a5,32(s1)
    if (!old->isFinished() ) {
    800034dc:	02078c63          	beqz	a5,80003514 <_ZN3TCB8dispatchEv+0x58>
    running=Scheduler::get();
    800034e0:	fffff097          	auipc	ra,0xfffff
    800034e4:	c00080e7          	jalr	-1024(ra) # 800020e0 <_ZN9Scheduler3getEv>
    800034e8:	00009797          	auipc	a5,0x9
    800034ec:	7aa7b023          	sd	a0,1952(a5) # 8000cc88 <_ZN3TCB7runningE>
    contextSwitch(&old->context,&running->context);
    800034f0:	01050593          	addi	a1,a0,16
    800034f4:	01048513          	addi	a0,s1,16
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	c38080e7          	jalr	-968(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003500:	01813083          	ld	ra,24(sp)
    80003504:	01013403          	ld	s0,16(sp)
    80003508:	00813483          	ld	s1,8(sp)
    8000350c:	02010113          	addi	sp,sp,32
    80003510:	00008067          	ret
        Scheduler::put(old);
    80003514:	00048513          	mv	a0,s1
    80003518:	fffff097          	auipc	ra,0xfffff
    8000351c:	c30080e7          	jalr	-976(ra) # 80002148 <_ZN9Scheduler3putEP3TCB>
    80003520:	fc1ff06f          	j	800034e0 <_ZN3TCB8dispatchEv+0x24>

0000000080003524 <_ZN3TCB9timeSleepEm>:
void TCB::timeSleep(time_t time) {
    80003524:	fe010113          	addi	sp,sp,-32
    80003528:	00113c23          	sd	ra,24(sp)
    8000352c:	00813823          	sd	s0,16(sp)
    80003530:	00913423          	sd	s1,8(sp)
    80003534:	01213023          	sd	s2,0(sp)
    80003538:	02010413          	addi	s0,sp,32
    running->timeSleeping=time;
    8000353c:	00009497          	auipc	s1,0x9
    80003540:	72c48493          	addi	s1,s1,1836 # 8000cc68 <_ZN3TCB15sleepingThreadsE>
    80003544:	0204b903          	ld	s2,32(s1)
    80003548:	02a93823          	sd	a0,48(s2)
            return MemoryAllocator::mem_alloc(size);
    8000354c:	01000513          	li	a0,16
    80003550:	00000097          	auipc	ra,0x0
    80003554:	0ec080e7          	jalr	236(ra) # 8000363c <_ZN15MemoryAllocator9mem_allocEm>
        Elem *el =new Elem(data,head);
    80003558:	0004b783          	ld	a5,0(s1)
        Elem(T *data, Elem *next):data(data),next(next){}
    8000355c:	01253023          	sd	s2,0(a0)
    80003560:	00f53423          	sd	a5,8(a0)
        head=el;
    80003564:	00a4b023          	sd	a0,0(s1)
        if (!tail){tail=head;}
    80003568:	0084b783          	ld	a5,8(s1)
    8000356c:	04078263          	beqz	a5,800035b0 <_ZN3TCB9timeSleepEm+0x8c>
    TCB* oldThr=running;
    80003570:	00009497          	auipc	s1,0x9
    80003574:	6f848493          	addi	s1,s1,1784 # 8000cc68 <_ZN3TCB15sleepingThreadsE>
    80003578:	0204b903          	ld	s2,32(s1)
    running=Scheduler::get();
    8000357c:	fffff097          	auipc	ra,0xfffff
    80003580:	b64080e7          	jalr	-1180(ra) # 800020e0 <_ZN9Scheduler3getEv>
    80003584:	02a4b023          	sd	a0,32(s1)
    contextSwitch(&oldThr->context,&running->context);
    80003588:	01050593          	addi	a1,a0,16
    8000358c:	01090513          	addi	a0,s2,16
    80003590:	ffffe097          	auipc	ra,0xffffe
    80003594:	ba0080e7          	jalr	-1120(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    80003598:	01813083          	ld	ra,24(sp)
    8000359c:	01013403          	ld	s0,16(sp)
    800035a0:	00813483          	ld	s1,8(sp)
    800035a4:	00013903          	ld	s2,0(sp)
    800035a8:	02010113          	addi	sp,sp,32
    800035ac:	00008067          	ret
    800035b0:	00009797          	auipc	a5,0x9
    800035b4:	6ca7b023          	sd	a0,1728(a5) # 8000cc70 <_ZN3TCB15sleepingThreadsE+0x8>
    800035b8:	fb9ff06f          	j	80003570 <_ZN3TCB9timeSleepEm+0x4c>

00000000800035bc <_GLOBAL__sub_I__ZN3TCB15sleepingThreadsE>:
    800035bc:	ff010113          	addi	sp,sp,-16
    800035c0:	00113423          	sd	ra,8(sp)
    800035c4:	00813023          	sd	s0,0(sp)
    800035c8:	01010413          	addi	s0,sp,16
    800035cc:	000105b7          	lui	a1,0x10
    800035d0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800035d4:	00100513          	li	a0,1
    800035d8:	00000097          	auipc	ra,0x0
    800035dc:	c3c080e7          	jalr	-964(ra) # 80003214 <_Z41__static_initialization_and_destruction_0ii>
    800035e0:	00813083          	ld	ra,8(sp)
    800035e4:	00013403          	ld	s0,0(sp)
    800035e8:	01010113          	addi	sp,sp,16
    800035ec:	00008067          	ret

00000000800035f0 <_ZN15MemoryAllocator10InitializeEv>:
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeMemBlk* MemoryAllocator::freeMemHead = nullptr;
void MemoryAllocator::Initialize() {
    800035f0:	ff010113          	addi	sp,sp,-16
    800035f4:	00813423          	sd	s0,8(sp)
    800035f8:	01010413          	addi	s0,sp,16
    freeMemHead = (FreeMemBlk*)HEAP_START_ADDR;
    800035fc:	00009797          	auipc	a5,0x9
    80003600:	57c7b783          	ld	a5,1404(a5) # 8000cb78 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003604:	0007b703          	ld	a4,0(a5)
    80003608:	00009797          	auipc	a5,0x9
    8000360c:	68e7b823          	sd	a4,1680(a5) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
    *freeMemHead = {
            nullptr,
            ((size_t)(HEAP_END_ADDR) - (size_t)(HEAP_START_ADDR) - sizeof(FreeMemBlk)) / MEM_BLOCK_SIZE
    80003610:	00009797          	auipc	a5,0x9
    80003614:	5a07b783          	ld	a5,1440(a5) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80003618:	0007b783          	ld	a5,0(a5)
    8000361c:	40e787b3          	sub	a5,a5,a4
    80003620:	ff078793          	addi	a5,a5,-16
    80003624:	0067d793          	srli	a5,a5,0x6
    *freeMemHead = {
    80003628:	00073023          	sd	zero,0(a4)
    8000362c:	00f73423          	sd	a5,8(a4)
    };
}
    80003630:	00813403          	ld	s0,8(sp)
    80003634:	01010113          	addi	sp,sp,16
    80003638:	00008067          	ret

000000008000363c <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    8000363c:	ff010113          	addi	sp,sp,-16
    80003640:	00813423          	sd	s0,8(sp)
    80003644:	01010413          	addi	s0,sp,16
    void* new_blk = nullptr;

    size_t needed_size = size + sizeof(FreeMemBlk);
    80003648:	01050513          	addi	a0,a0,16
    size_t size_in_blk = (needed_size / MEM_BLOCK_SIZE) + (needed_size % MEM_BLOCK_SIZE == 0 ? 0 : 1);
    8000364c:	00655713          	srli	a4,a0,0x6
    80003650:	03f57513          	andi	a0,a0,63
    80003654:	00a03533          	snez	a0,a0
    80003658:	00a70733          	add	a4,a4,a0
    
    
    if (!freeMemHead) return nullptr;
    8000365c:	00009617          	auipc	a2,0x9
    80003660:	63c63603          	ld	a2,1596(a2) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
    80003664:	0e060263          	beqz	a2,80003748 <_ZN15MemoryAllocator9mem_allocEm+0x10c>

    
    FreeMemBlk* prev = nullptr;
    FreeMemBlk* curr = freeMemHead;
    80003668:	00060513          	mv	a0,a2
    FreeMemBlk* prev = nullptr;
    8000366c:	00000693          	li	a3,0

    //First-fit
    while (curr) {
    80003670:	04050663          	beqz	a0,800036bc <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if (curr->size >= size_in_blk) {  //Found a big enough fragment
    80003674:	00853783          	ld	a5,8(a0)
    80003678:	00e7f863          	bgeu	a5,a4,80003688 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                }
                new_blk = curr;
            }
            break;
        }
        prev = curr;
    8000367c:	00050693          	mv	a3,a0
        curr = curr->next;
    80003680:	00053503          	ld	a0,0(a0)
    while (curr) {
    80003684:	fedff06f          	j	80003670 <_ZN15MemoryAllocator9mem_allocEm+0x34>
            if (!prev) { //It's the first element in the list
    80003688:	04068463          	beqz	a3,800036d0 <_ZN15MemoryAllocator9mem_allocEm+0x94>
            else if (!curr->next) { //It's the last element in the list
    8000368c:	00053603          	ld	a2,0(a0)
    80003690:	06060e63          	beqz	a2,8000370c <_ZN15MemoryAllocator9mem_allocEm+0xd0>
                if (curr->size - size_in_blk > 0) {
    80003694:	0ae78663          	beq	a5,a4,80003740 <_ZN15MemoryAllocator9mem_allocEm+0x104>
                    FreeMemBlk* newFreeFragmentAddr = curr + size_in_blk * MEM_BLOCK_SIZE;
    80003698:	00a71793          	slli	a5,a4,0xa
    8000369c:	00f507b3          	add	a5,a0,a5
                    prev->next = newFreeFragmentAddr;
    800036a0:	00f6b023          	sd	a5,0(a3)
                    newFreeFragmentAddr->size = curr->size - size_in_blk;
    800036a4:	00853683          	ld	a3,8(a0)
    800036a8:	40e686b3          	sub	a3,a3,a4
    800036ac:	00d7b423          	sd	a3,8(a5)
                    newFreeFragmentAddr->next = curr->next;
    800036b0:	00053683          	ld	a3,0(a0)
    800036b4:	00d7b023          	sd	a3,0(a5)
                    curr->size = size_in_blk; // update the allocated fragment size
    800036b8:	00e53423          	sd	a4,8(a0)
    }

    return (new_blk ? ((FreeMemBlk*)new_blk + 1) : nullptr);
    800036bc:	00050463          	beqz	a0,800036c4 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    800036c0:	01050513          	addi	a0,a0,16
}
    800036c4:	00813403          	ld	s0,8(sp)
    800036c8:	01010113          	addi	sp,sp,16
    800036cc:	00008067          	ret
                if (curr->size - size_in_blk > 0) {
    800036d0:	02e78663          	beq	a5,a4,800036fc <_ZN15MemoryAllocator9mem_allocEm+0xc0>
                    freeMemHead = curr + size_in_blk * MEM_BLOCK_SIZE;
    800036d4:	00a71693          	slli	a3,a4,0xa
    800036d8:	00d506b3          	add	a3,a0,a3
    800036dc:	00009617          	auipc	a2,0x9
    800036e0:	5ad63e23          	sd	a3,1468(a2) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
                    freeMemHead->size = curr->size - size_in_blk;
    800036e4:	40e787b3          	sub	a5,a5,a4
    800036e8:	00f6b423          	sd	a5,8(a3)
                    freeMemHead->next = curr->next;
    800036ec:	00053783          	ld	a5,0(a0)
    800036f0:	00f6b023          	sd	a5,0(a3)
                    curr->size = size_in_blk; //Update the new fragment size
    800036f4:	00e53423          	sd	a4,8(a0)
    800036f8:	fc5ff06f          	j	800036bc <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    freeMemHead = freeMemHead->next;
    800036fc:	00063783          	ld	a5,0(a2)
    80003700:	00009717          	auipc	a4,0x9
    80003704:	58f73c23          	sd	a5,1432(a4) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
    80003708:	fb5ff06f          	j	800036bc <_ZN15MemoryAllocator9mem_allocEm+0x80>
                if (curr->size - size_in_blk > 0) {
    8000370c:	02e78663          	beq	a5,a4,80003738 <_ZN15MemoryAllocator9mem_allocEm+0xfc>
                    FreeMemBlk* newFreeFragmentAddr = curr + size_in_blk * MEM_BLOCK_SIZE;
    80003710:	00a71793          	slli	a5,a4,0xa
    80003714:	00f507b3          	add	a5,a0,a5
                    prev->next = newFreeFragmentAddr;
    80003718:	00f6b023          	sd	a5,0(a3)
                    newFreeFragmentAddr->size = curr->size - size_in_blk;
    8000371c:	00853683          	ld	a3,8(a0)
    80003720:	40e686b3          	sub	a3,a3,a4
    80003724:	00d7b423          	sd	a3,8(a5)
                    newFreeFragmentAddr->next = curr->next;
    80003728:	00053683          	ld	a3,0(a0)
    8000372c:	00d7b023          	sd	a3,0(a5)
                    curr->size = size_in_blk; //Update the new fragment size
    80003730:	00e53423          	sd	a4,8(a0)
    80003734:	f89ff06f          	j	800036bc <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    prev->next = nullptr;
    80003738:	0006b023          	sd	zero,0(a3)
    8000373c:	f81ff06f          	j	800036bc <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    prev->next = curr->next;
    80003740:	00c6b023          	sd	a2,0(a3)
    80003744:	f79ff06f          	j	800036bc <_ZN15MemoryAllocator9mem_allocEm+0x80>
    if (!freeMemHead) return nullptr;
    80003748:	00060513          	mv	a0,a2
    8000374c:	f79ff06f          	j	800036c4 <_ZN15MemoryAllocator9mem_allocEm+0x88>

0000000080003750 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>:
    merge(prev);
    return 0;
}

//Implementation was taken from "OS1 KLK2 SEPT2015 2"
void MemoryAllocator::merge(FreeMemBlk* f) {
    80003750:	ff010113          	addi	sp,sp,-16
    80003754:	00813423          	sd	s0,8(sp)
    80003758:	01010413          	addi	s0,sp,16
    if (!f) return;
    8000375c:	00050e63          	beqz	a0,80003778 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x28>
    if (f->next && (char*)f + f->size * MEM_BLOCK_SIZE == (char*)f->next) {
    80003760:	00053783          	ld	a5,0(a0)
    80003764:	00078a63          	beqz	a5,80003778 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x28>
    80003768:	00853683          	ld	a3,8(a0)
    8000376c:	00669713          	slli	a4,a3,0x6
    80003770:	00e50733          	add	a4,a0,a4
    80003774:	00e78863          	beq	a5,a4,80003784 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x34>
            // remove the fragment->next
            f->size += f->next->size;
            f->next = f->next->next;
    } else return;
}
    80003778:	00813403          	ld	s0,8(sp)
    8000377c:	01010113          	addi	sp,sp,16
    80003780:	00008067          	ret
            f->size += f->next->size;
    80003784:	0087b703          	ld	a4,8(a5)
    80003788:	00e686b3          	add	a3,a3,a4
    8000378c:	00d53423          	sd	a3,8(a0)
            f->next = f->next->next;
    80003790:	0007b783          	ld	a5,0(a5)
    80003794:	00f53023          	sd	a5,0(a0)
    80003798:	fe1ff06f          	j	80003778 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE+0x28>

000000008000379c <_ZN15MemoryAllocator8mem_freeEPv>:
    if (!ptr) return -1;
    8000379c:	0e050663          	beqz	a0,80003888 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    800037a0:	00050713          	mv	a4,a0
    FreeMemBlk* curr = freeMemHead;
    800037a4:	00009797          	auipc	a5,0x9
    800037a8:	4f47b783          	ld	a5,1268(a5) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
    FreeMemBlk* free_blk = (FreeMemBlk*)ptr - 1;
    800037ac:	ff050513          	addi	a0,a0,-16
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;
    800037b0:	00009697          	auipc	a3,0x9
    800037b4:	3c86b683          	ld	a3,968(a3) # 8000cb78 <_GLOBAL_OFFSET_TABLE_+0x20>
    800037b8:	0006b683          	ld	a3,0(a3)
    800037bc:	0cd76a63          	bltu	a4,a3,80003890 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    800037c0:	00009697          	auipc	a3,0x9
    800037c4:	3f06b683          	ld	a3,1008(a3) # 8000cbb0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800037c8:	0006b683          	ld	a3,0(a3)
    800037cc:	0cd77663          	bgeu	a4,a3,80003898 <_ZN15MemoryAllocator8mem_freeEPv+0xfc>
    if (!curr) {
    800037d0:	02078a63          	beqz	a5,80003804 <_ZN15MemoryAllocator8mem_freeEPv+0x68>
int MemoryAllocator::mem_free(void *ptr) {
    800037d4:	fe010113          	addi	sp,sp,-32
    800037d8:	00113c23          	sd	ra,24(sp)
    800037dc:	00813823          	sd	s0,16(sp)
    800037e0:	00913423          	sd	s1,8(sp)
    800037e4:	02010413          	addi	s0,sp,32
    if (free_blk < curr) {
    800037e8:	02f56863          	bltu	a0,a5,80003818 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    FreeMemBlk* prev = nullptr;
    800037ec:	00000493          	li	s1,0
    while (curr != nullptr && free_blk > curr) {
    800037f0:	04078263          	beqz	a5,80003834 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    800037f4:	04a7f063          	bgeu	a5,a0,80003834 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
        prev = curr;
    800037f8:	00078493          	mv	s1,a5
        curr = curr->next;
    800037fc:	0007b783          	ld	a5,0(a5)
    while (curr != nullptr && free_blk > curr) {
    80003800:	ff1ff06f          	j	800037f0 <_ZN15MemoryAllocator8mem_freeEPv+0x54>
        freeMemHead = free_blk;
    80003804:	00009797          	auipc	a5,0x9
    80003808:	48a7ba23          	sd	a0,1172(a5) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
        free_blk->next = nullptr;
    8000380c:	fe073823          	sd	zero,-16(a4)
        return 0;
    80003810:	00000513          	li	a0,0
    80003814:	00008067          	ret
        free_blk->next = freeMemHead;
    80003818:	fef73823          	sd	a5,-16(a4)
        freeMemHead = free_blk;
    8000381c:	00009797          	auipc	a5,0x9
    80003820:	46a7be23          	sd	a0,1148(a5) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
        merge(freeMemHead);
    80003824:	00000097          	auipc	ra,0x0
    80003828:	f2c080e7          	jalr	-212(ra) # 80003750 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
        return 0;
    8000382c:	00000513          	li	a0,0
    80003830:	0280006f          	j	80003858 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    if (curr == nullptr) {
    80003834:	02078c63          	beqz	a5,8000386c <_ZN15MemoryAllocator8mem_freeEPv+0xd0>
    prev->next = free_blk;
    80003838:	00a4b023          	sd	a0,0(s1)
    free_blk->next = curr;
    8000383c:	fef73823          	sd	a5,-16(a4)
    merge(free_blk);
    80003840:	00000097          	auipc	ra,0x0
    80003844:	f10080e7          	jalr	-240(ra) # 80003750 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
    merge(prev);
    80003848:	00048513          	mv	a0,s1
    8000384c:	00000097          	auipc	ra,0x0
    80003850:	f04080e7          	jalr	-252(ra) # 80003750 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
    return 0;
    80003854:	00000513          	li	a0,0
}
    80003858:	01813083          	ld	ra,24(sp)
    8000385c:	01013403          	ld	s0,16(sp)
    80003860:	00813483          	ld	s1,8(sp)
    80003864:	02010113          	addi	sp,sp,32
    80003868:	00008067          	ret
        prev->next = free_blk;
    8000386c:	00a4b023          	sd	a0,0(s1)
        free_blk->next = nullptr;
    80003870:	fe073823          	sd	zero,-16(a4)
        merge(prev);
    80003874:	00048513          	mv	a0,s1
    80003878:	00000097          	auipc	ra,0x0
    8000387c:	ed8080e7          	jalr	-296(ra) # 80003750 <_ZN15MemoryAllocator5mergeEPNS_10FreeMemBlkE>
        return 0;
    80003880:	00000513          	li	a0,0
    80003884:	fd5ff06f          	j	80003858 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    if (!ptr) return -1;
    80003888:	fff00513          	li	a0,-1
    8000388c:	00008067          	ret
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;
    80003890:	fff00513          	li	a0,-1
    80003894:	00008067          	ret
    80003898:	fff00513          	li	a0,-1
}
    8000389c:	00008067          	ret

00000000800038a0 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv>:

size_t MemoryAllocator::mem_get_largest_free_block() {
    800038a0:	ff010113          	addi	sp,sp,-16
    800038a4:	00813423          	sd	s0,8(sp)
    800038a8:	01010413          	addi	s0,sp,16
    FreeMemBlk *ptr=freeMemHead;
    800038ac:	00009797          	auipc	a5,0x9
    800038b0:	3ec7b783          	ld	a5,1004(a5) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
    size_t max_size=0;
    800038b4:	00000513          	li	a0,0
    800038b8:	0080006f          	j	800038c0 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x20>
    while (ptr) {
        if (ptr->size>max_size) {
            max_size=ptr->size;
        }
        ptr=ptr->next;
    800038bc:	0007b783          	ld	a5,0(a5)
    while (ptr) {
    800038c0:	00078a63          	beqz	a5,800038d4 <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x34>
        if (ptr->size>max_size) {
    800038c4:	0087b703          	ld	a4,8(a5)
    800038c8:	fee57ae3          	bgeu	a0,a4,800038bc <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x1c>
            max_size=ptr->size;
    800038cc:	00070513          	mv	a0,a4
    800038d0:	fedff06f          	j	800038bc <_ZN15MemoryAllocator26mem_get_largest_free_blockEv+0x1c>
    }
    return max_size*MEM_BLOCK_SIZE;
}
    800038d4:	00651513          	slli	a0,a0,0x6
    800038d8:	00813403          	ld	s0,8(sp)
    800038dc:	01010113          	addi	sp,sp,16
    800038e0:	00008067          	ret

00000000800038e4 <_ZN15MemoryAllocator18mem_get_free_spaceEv>:
size_t MemoryAllocator::mem_get_free_space() {
    800038e4:	ff010113          	addi	sp,sp,-16
    800038e8:	00813423          	sd	s0,8(sp)
    800038ec:	01010413          	addi	s0,sp,16
    FreeMemBlk *ptr=freeMemHead;
    800038f0:	00009797          	auipc	a5,0x9
    800038f4:	3a87b783          	ld	a5,936(a5) # 8000cc98 <_ZN15MemoryAllocator11freeMemHeadE>
    size_t space=0;
    800038f8:	00000513          	li	a0,0
    while (ptr) {
    800038fc:	00078a63          	beqz	a5,80003910 <_ZN15MemoryAllocator18mem_get_free_spaceEv+0x2c>
        space+=ptr->size;
    80003900:	0087b703          	ld	a4,8(a5)
    80003904:	00e50533          	add	a0,a0,a4
        ptr=ptr->next;
    80003908:	0007b783          	ld	a5,0(a5)
    while (ptr) {
    8000390c:	ff1ff06f          	j	800038fc <_ZN15MemoryAllocator18mem_get_free_spaceEv+0x18>
    }
    return space*MEM_BLOCK_SIZE;
    80003910:	00651513          	slli	a0,a0,0x6
    80003914:	00813403          	ld	s0,8(sp)
    80003918:	01010113          	addi	sp,sp,16
    8000391c:	00008067          	ret

0000000080003920 <_ZN20ConsoleBoundedBufferC1Ei>:

#include "../h/ConsoleBoundedBuffer.hpp"

//Implementacija uzeta iz 278 strane knjige OS1, BoundedBuffer

ConsoleBoundedBuffer::ConsoleBoundedBuffer(int len):len(len),head(0),tail(0) {
    80003920:	fe010113          	addi	sp,sp,-32
    80003924:	00113c23          	sd	ra,24(sp)
    80003928:	00813823          	sd	s0,16(sp)
    8000392c:	00913423          	sd	s1,8(sp)
    80003930:	01213023          	sd	s2,0(sp)
    80003934:	02010413          	addi	s0,sp,32
    80003938:	00050493          	mv	s1,a0
    8000393c:	00058913          	mv	s2,a1
    80003940:	00b52023          	sw	a1,0(a0)
    80003944:	00052823          	sw	zero,16(a0)
    80003948:	00052a23          	sw	zero,20(a0)
    buff=new char[len];
    8000394c:	00058513          	mv	a0,a1
    80003950:	fffff097          	auipc	ra,0xfffff
    80003954:	dc0080e7          	jalr	-576(ra) # 80002710 <_Znam>
    80003958:	00a4b423          	sd	a0,8(s1)
    Semaphore::createSemaphore(&mutexT,1);
    8000395c:	00100593          	li	a1,1
    80003960:	02048513          	addi	a0,s1,32
    80003964:	ffffe097          	auipc	ra,0xffffe
    80003968:	e94080e7          	jalr	-364(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    Semaphore::createSemaphore(&mutexH,1);
    8000396c:	00100593          	li	a1,1
    80003970:	01848513          	addi	a0,s1,24
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	e84080e7          	jalr	-380(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    Semaphore::createSemaphore(&input,0);
    8000397c:	00000593          	li	a1,0
    80003980:	02848513          	addi	a0,s1,40
    80003984:	ffffe097          	auipc	ra,0xffffe
    80003988:	e74080e7          	jalr	-396(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
    Semaphore::createSemaphore(&output,len);
    8000398c:	00090593          	mv	a1,s2
    80003990:	03048513          	addi	a0,s1,48
    80003994:	ffffe097          	auipc	ra,0xffffe
    80003998:	e64080e7          	jalr	-412(ra) # 800017f8 <_ZN9Semaphore15createSemaphoreEPPS_j>
}
    8000399c:	01813083          	ld	ra,24(sp)
    800039a0:	01013403          	ld	s0,16(sp)
    800039a4:	00813483          	ld	s1,8(sp)
    800039a8:	00013903          	ld	s2,0(sp)
    800039ac:	02010113          	addi	sp,sp,32
    800039b0:	00008067          	ret

00000000800039b4 <_ZN20ConsoleBoundedBufferD1Ev>:

ConsoleBoundedBuffer::~ConsoleBoundedBuffer() {
    800039b4:	fe010113          	addi	sp,sp,-32
    800039b8:	00113c23          	sd	ra,24(sp)
    800039bc:	00813823          	sd	s0,16(sp)
    800039c0:	00913423          	sd	s1,8(sp)
    800039c4:	02010413          	addi	s0,sp,32
    800039c8:	00050493          	mv	s1,a0
    delete buff;
    800039cc:	00853503          	ld	a0,8(a0)
    800039d0:	00050663          	beqz	a0,800039dc <_ZN20ConsoleBoundedBufferD1Ev+0x28>
    800039d4:	fffff097          	auipc	ra,0xfffff
    800039d8:	d64080e7          	jalr	-668(ra) # 80002738 <_ZdlPv>
    Semaphore::closeSemaphore(output);
    800039dc:	0304b503          	ld	a0,48(s1)
    800039e0:	ffffe097          	auipc	ra,0xffffe
    800039e4:	edc080e7          	jalr	-292(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    Semaphore::closeSemaphore(input);
    800039e8:	0284b503          	ld	a0,40(s1)
    800039ec:	ffffe097          	auipc	ra,0xffffe
    800039f0:	ed0080e7          	jalr	-304(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    Semaphore::closeSemaphore(mutexT);
    800039f4:	0204b503          	ld	a0,32(s1)
    800039f8:	ffffe097          	auipc	ra,0xffffe
    800039fc:	ec4080e7          	jalr	-316(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>
    Semaphore::closeSemaphore(mutexH);
    80003a00:	0184b503          	ld	a0,24(s1)
    80003a04:	ffffe097          	auipc	ra,0xffffe
    80003a08:	eb8080e7          	jalr	-328(ra) # 800018bc <_ZN9Semaphore14closeSemaphoreEPS_>

    delete input;
    80003a0c:	0284b503          	ld	a0,40(s1)
    80003a10:	00050663          	beqz	a0,80003a1c <_ZN20ConsoleBoundedBufferD1Ev+0x68>
        MemoryAllocator::mem_free(ptr);
    80003a14:	00000097          	auipc	ra,0x0
    80003a18:	d88080e7          	jalr	-632(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    delete output;
    80003a1c:	0304b503          	ld	a0,48(s1)
    80003a20:	00050663          	beqz	a0,80003a2c <_ZN20ConsoleBoundedBufferD1Ev+0x78>
    80003a24:	00000097          	auipc	ra,0x0
    80003a28:	d78080e7          	jalr	-648(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    delete mutexT;
    80003a2c:	0204b503          	ld	a0,32(s1)
    80003a30:	00050663          	beqz	a0,80003a3c <_ZN20ConsoleBoundedBufferD1Ev+0x88>
    80003a34:	00000097          	auipc	ra,0x0
    80003a38:	d68080e7          	jalr	-664(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
    delete mutexH;
    80003a3c:	0184b503          	ld	a0,24(s1)
    80003a40:	00050663          	beqz	a0,80003a4c <_ZN20ConsoleBoundedBufferD1Ev+0x98>
    80003a44:	00000097          	auipc	ra,0x0
    80003a48:	d58080e7          	jalr	-680(ra) # 8000379c <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003a4c:	01813083          	ld	ra,24(sp)
    80003a50:	01013403          	ld	s0,16(sp)
    80003a54:	00813483          	ld	s1,8(sp)
    80003a58:	02010113          	addi	sp,sp,32
    80003a5c:	00008067          	ret

0000000080003a60 <_ZN20ConsoleBoundedBuffer6appendEc>:

void ConsoleBoundedBuffer::append(char character) {
    80003a60:	fe010113          	addi	sp,sp,-32
    80003a64:	00113c23          	sd	ra,24(sp)
    80003a68:	00813823          	sd	s0,16(sp)
    80003a6c:	00913423          	sd	s1,8(sp)
    80003a70:	01213023          	sd	s2,0(sp)
    80003a74:	02010413          	addi	s0,sp,32
    80003a78:	00050493          	mv	s1,a0
    80003a7c:	00058913          	mv	s2,a1
    output->sem_wait();
    80003a80:	03053503          	ld	a0,48(a0)
    80003a84:	ffffe097          	auipc	ra,0xffffe
    80003a88:	f64080e7          	jalr	-156(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    mutexT->sem_wait();
    80003a8c:	0204b503          	ld	a0,32(s1)
    80003a90:	ffffe097          	auipc	ra,0xffffe
    80003a94:	f58080e7          	jalr	-168(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    buff[tail]=character;
    80003a98:	0084b783          	ld	a5,8(s1)
    80003a9c:	0144a703          	lw	a4,20(s1)
    80003aa0:	00e787b3          	add	a5,a5,a4
    80003aa4:	01278023          	sb	s2,0(a5)
    tail=(tail+1)% len;
    80003aa8:	0144a783          	lw	a5,20(s1)
    80003aac:	0017879b          	addiw	a5,a5,1
    80003ab0:	0004a703          	lw	a4,0(s1)
    80003ab4:	02e7e7bb          	remw	a5,a5,a4
    80003ab8:	00f4aa23          	sw	a5,20(s1)
    mutexT->sem_signal();
    80003abc:	0204b503          	ld	a0,32(s1)
    80003ac0:	ffffe097          	auipc	ra,0xffffe
    80003ac4:	ff0080e7          	jalr	-16(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    input->sem_signal();
    80003ac8:	0284b503          	ld	a0,40(s1)
    80003acc:	ffffe097          	auipc	ra,0xffffe
    80003ad0:	fe4080e7          	jalr	-28(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
}
    80003ad4:	01813083          	ld	ra,24(sp)
    80003ad8:	01013403          	ld	s0,16(sp)
    80003adc:	00813483          	ld	s1,8(sp)
    80003ae0:	00013903          	ld	s2,0(sp)
    80003ae4:	02010113          	addi	sp,sp,32
    80003ae8:	00008067          	ret

0000000080003aec <_ZN20ConsoleBoundedBuffer4takeEv>:

char ConsoleBoundedBuffer::take() {
    80003aec:	fe010113          	addi	sp,sp,-32
    80003af0:	00113c23          	sd	ra,24(sp)
    80003af4:	00813823          	sd	s0,16(sp)
    80003af8:	00913423          	sd	s1,8(sp)
    80003afc:	01213023          	sd	s2,0(sp)
    80003b00:	02010413          	addi	s0,sp,32
    80003b04:	00050493          	mv	s1,a0
    input->sem_wait();
    80003b08:	02853503          	ld	a0,40(a0)
    80003b0c:	ffffe097          	auipc	ra,0xffffe
    80003b10:	edc080e7          	jalr	-292(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    mutexH->sem_wait();
    80003b14:	0184b503          	ld	a0,24(s1)
    80003b18:	ffffe097          	auipc	ra,0xffffe
    80003b1c:	ed0080e7          	jalr	-304(ra) # 800019e8 <_ZN9Semaphore8sem_waitEv>
    char temp=buff[head];
    80003b20:	0084b703          	ld	a4,8(s1)
    80003b24:	0104a783          	lw	a5,16(s1)
    80003b28:	00f70733          	add	a4,a4,a5
    80003b2c:	00074903          	lbu	s2,0(a4)
    head=(head+1)% len;
    80003b30:	0017879b          	addiw	a5,a5,1
    80003b34:	0004a703          	lw	a4,0(s1)
    80003b38:	02e7e7bb          	remw	a5,a5,a4
    80003b3c:	00f4a823          	sw	a5,16(s1)
    mutexH->sem_signal();
    80003b40:	0184b503          	ld	a0,24(s1)
    80003b44:	ffffe097          	auipc	ra,0xffffe
    80003b48:	f6c080e7          	jalr	-148(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    output->sem_signal();
    80003b4c:	0304b503          	ld	a0,48(s1)
    80003b50:	ffffe097          	auipc	ra,0xffffe
    80003b54:	f60080e7          	jalr	-160(ra) # 80001ab0 <_ZN9Semaphore10sem_signalEv>
    return temp;
}
    80003b58:	00090513          	mv	a0,s2
    80003b5c:	01813083          	ld	ra,24(sp)
    80003b60:	01013403          	ld	s0,16(sp)
    80003b64:	00813483          	ld	s1,8(sp)
    80003b68:	00013903          	ld	s2,0(sp)
    80003b6c:	02010113          	addi	sp,sp,32
    80003b70:	00008067          	ret

0000000080003b74 <_Z13userMainTestsv>:
//// TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"
#endif

void userMainTests() {
    80003b74:	fe010113          	addi	sp,sp,-32
    80003b78:	00113c23          	sd	ra,24(sp)
    80003b7c:	00813823          	sd	s0,16(sp)
    80003b80:	00913423          	sd	s1,8(sp)
    80003b84:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80003b88:	00006517          	auipc	a0,0x6
    80003b8c:	61850513          	addi	a0,a0,1560 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80003b90:	ffffe097          	auipc	ra,0xffffe
    80003b94:	044080e7          	jalr	68(ra) # 80001bd4 <_Z11printStringPKc>
    int test = getc() - '0';
    80003b98:	ffffe097          	auipc	ra,0xffffe
    80003b9c:	b7c080e7          	jalr	-1156(ra) # 80001714 <_Z4getcv>
    80003ba0:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80003ba4:	ffffe097          	auipc	ra,0xffffe
    80003ba8:	b70080e7          	jalr	-1168(ra) # 80001714 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80003bac:	00700793          	li	a5,7
    80003bb0:	1097e263          	bltu	a5,s1,80003cb4 <_Z13userMainTestsv+0x140>
    80003bb4:	00249493          	slli	s1,s1,0x2
    80003bb8:	00007717          	auipc	a4,0x7
    80003bbc:	84070713          	addi	a4,a4,-1984 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    80003bc0:	00e484b3          	add	s1,s1,a4
    80003bc4:	0004a783          	lw	a5,0(s1)
    80003bc8:	00e787b3          	add	a5,a5,a4
    80003bcc:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80003bd0:	00002097          	auipc	ra,0x2
    80003bd4:	be8080e7          	jalr	-1048(ra) # 800057b8 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80003bd8:	00006517          	auipc	a0,0x6
    80003bdc:	5e850513          	addi	a0,a0,1512 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80003be0:	ffffe097          	auipc	ra,0xffffe
    80003be4:	ff4080e7          	jalr	-12(ra) # 80001bd4 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80003be8:	01813083          	ld	ra,24(sp)
    80003bec:	01013403          	ld	s0,16(sp)
    80003bf0:	00813483          	ld	s1,8(sp)
    80003bf4:	02010113          	addi	sp,sp,32
    80003bf8:	00008067          	ret
            Threads_CPP_API_test();
    80003bfc:	00001097          	auipc	ra,0x1
    80003c00:	a9c080e7          	jalr	-1380(ra) # 80004698 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80003c04:	00006517          	auipc	a0,0x6
    80003c08:	5fc50513          	addi	a0,a0,1532 # 8000a200 <CONSOLE_STATUS+0x1f0>
    80003c0c:	ffffe097          	auipc	ra,0xffffe
    80003c10:	fc8080e7          	jalr	-56(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c14:	fd5ff06f          	j	80003be8 <_Z13userMainTestsv+0x74>
            producerConsumer_C_API();
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	2d4080e7          	jalr	724(ra) # 80003eec <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80003c20:	00006517          	auipc	a0,0x6
    80003c24:	62050513          	addi	a0,a0,1568 # 8000a240 <CONSOLE_STATUS+0x230>
    80003c28:	ffffe097          	auipc	ra,0xffffe
    80003c2c:	fac080e7          	jalr	-84(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c30:	fb9ff06f          	j	80003be8 <_Z13userMainTestsv+0x74>
            producerConsumer_CPP_Sync_API();
    80003c34:	00002097          	auipc	ra,0x2
    80003c38:	ec8080e7          	jalr	-312(ra) # 80005afc <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80003c3c:	00006517          	auipc	a0,0x6
    80003c40:	65450513          	addi	a0,a0,1620 # 8000a290 <CONSOLE_STATUS+0x280>
    80003c44:	ffffe097          	auipc	ra,0xffffe
    80003c48:	f90080e7          	jalr	-112(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c4c:	f9dff06f          	j	80003be8 <_Z13userMainTestsv+0x74>
            testSleeping();
    80003c50:	00003097          	auipc	ra,0x3
    80003c54:	98c080e7          	jalr	-1652(ra) # 800065dc <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80003c58:	00006517          	auipc	a0,0x6
    80003c5c:	69050513          	addi	a0,a0,1680 # 8000a2e8 <CONSOLE_STATUS+0x2d8>
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	f74080e7          	jalr	-140(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c68:	f81ff06f          	j	80003be8 <_Z13userMainTestsv+0x74>
            testConsumerProducer();
    80003c6c:	00001097          	auipc	ra,0x1
    80003c70:	eec080e7          	jalr	-276(ra) # 80004b58 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80003c74:	00006517          	auipc	a0,0x6
    80003c78:	6a450513          	addi	a0,a0,1700 # 8000a318 <CONSOLE_STATUS+0x308>
    80003c7c:	ffffe097          	auipc	ra,0xffffe
    80003c80:	f58080e7          	jalr	-168(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003c84:	f65ff06f          	j	80003be8 <_Z13userMainTestsv+0x74>
            System_Mode_test();
    80003c88:	00003097          	auipc	ra,0x3
    80003c8c:	ec8080e7          	jalr	-312(ra) # 80006b50 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80003c90:	00006517          	auipc	a0,0x6
    80003c94:	6c850513          	addi	a0,a0,1736 # 8000a358 <CONSOLE_STATUS+0x348>
    80003c98:	ffffe097          	auipc	ra,0xffffe
    80003c9c:	f3c080e7          	jalr	-196(ra) # 80001bd4 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80003ca0:	00006517          	auipc	a0,0x6
    80003ca4:	6d850513          	addi	a0,a0,1752 # 8000a378 <CONSOLE_STATUS+0x368>
    80003ca8:	ffffe097          	auipc	ra,0xffffe
    80003cac:	f2c080e7          	jalr	-212(ra) # 80001bd4 <_Z11printStringPKc>
            break;
    80003cb0:	f39ff06f          	j	80003be8 <_Z13userMainTestsv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80003cb4:	00006517          	auipc	a0,0x6
    80003cb8:	71c50513          	addi	a0,a0,1820 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80003cbc:	ffffe097          	auipc	ra,0xffffe
    80003cc0:	f18080e7          	jalr	-232(ra) # 80001bd4 <_Z11printStringPKc>
    80003cc4:	f25ff06f          	j	80003be8 <_Z13userMainTestsv+0x74>

0000000080003cc8 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003cc8:	fe010113          	addi	sp,sp,-32
    80003ccc:	00113c23          	sd	ra,24(sp)
    80003cd0:	00813823          	sd	s0,16(sp)
    80003cd4:	00913423          	sd	s1,8(sp)
    80003cd8:	01213023          	sd	s2,0(sp)
    80003cdc:	02010413          	addi	s0,sp,32
    80003ce0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003ce4:	00000913          	li	s2,0
    80003ce8:	00c0006f          	j	80003cf4 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003cec:	ffffd097          	auipc	ra,0xffffd
    80003cf0:	7f4080e7          	jalr	2036(ra) # 800014e0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003cf4:	ffffe097          	auipc	ra,0xffffe
    80003cf8:	a20080e7          	jalr	-1504(ra) # 80001714 <_Z4getcv>
    80003cfc:	0005059b          	sext.w	a1,a0
    80003d00:	01b00793          	li	a5,27
    80003d04:	02f58a63          	beq	a1,a5,80003d38 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003d08:	0084b503          	ld	a0,8(s1)
    80003d0c:	00003097          	auipc	ra,0x3
    80003d10:	fdc080e7          	jalr	-36(ra) # 80006ce8 <_ZN6Buffer3putEi>
        i++;
    80003d14:	0019071b          	addiw	a4,s2,1
    80003d18:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003d1c:	0004a683          	lw	a3,0(s1)
    80003d20:	0026979b          	slliw	a5,a3,0x2
    80003d24:	00d787bb          	addw	a5,a5,a3
    80003d28:	0017979b          	slliw	a5,a5,0x1
    80003d2c:	02f767bb          	remw	a5,a4,a5
    80003d30:	fc0792e3          	bnez	a5,80003cf4 <_ZL16producerKeyboardPv+0x2c>
    80003d34:	fb9ff06f          	j	80003cec <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003d38:	00100793          	li	a5,1
    80003d3c:	00009717          	auipc	a4,0x9
    80003d40:	f6f72223          	sw	a5,-156(a4) # 8000cca0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003d44:	02100593          	li	a1,33
    80003d48:	0084b503          	ld	a0,8(s1)
    80003d4c:	00003097          	auipc	ra,0x3
    80003d50:	f9c080e7          	jalr	-100(ra) # 80006ce8 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003d54:	0104b503          	ld	a0,16(s1)
    80003d58:	ffffe097          	auipc	ra,0xffffe
    80003d5c:	904080e7          	jalr	-1788(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80003d60:	01813083          	ld	ra,24(sp)
    80003d64:	01013403          	ld	s0,16(sp)
    80003d68:	00813483          	ld	s1,8(sp)
    80003d6c:	00013903          	ld	s2,0(sp)
    80003d70:	02010113          	addi	sp,sp,32
    80003d74:	00008067          	ret

0000000080003d78 <_ZL8producerPv>:

static void producer(void *arg) {
    80003d78:	fe010113          	addi	sp,sp,-32
    80003d7c:	00113c23          	sd	ra,24(sp)
    80003d80:	00813823          	sd	s0,16(sp)
    80003d84:	00913423          	sd	s1,8(sp)
    80003d88:	01213023          	sd	s2,0(sp)
    80003d8c:	02010413          	addi	s0,sp,32
    80003d90:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003d94:	00000913          	li	s2,0
    80003d98:	00c0006f          	j	80003da4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003d9c:	ffffd097          	auipc	ra,0xffffd
    80003da0:	744080e7          	jalr	1860(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003da4:	00009797          	auipc	a5,0x9
    80003da8:	efc7a783          	lw	a5,-260(a5) # 8000cca0 <_ZL9threadEnd>
    80003dac:	02079e63          	bnez	a5,80003de8 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003db0:	0004a583          	lw	a1,0(s1)
    80003db4:	0305859b          	addiw	a1,a1,48
    80003db8:	0084b503          	ld	a0,8(s1)
    80003dbc:	00003097          	auipc	ra,0x3
    80003dc0:	f2c080e7          	jalr	-212(ra) # 80006ce8 <_ZN6Buffer3putEi>
        i++;
    80003dc4:	0019071b          	addiw	a4,s2,1
    80003dc8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003dcc:	0004a683          	lw	a3,0(s1)
    80003dd0:	0026979b          	slliw	a5,a3,0x2
    80003dd4:	00d787bb          	addw	a5,a5,a3
    80003dd8:	0017979b          	slliw	a5,a5,0x1
    80003ddc:	02f767bb          	remw	a5,a4,a5
    80003de0:	fc0792e3          	bnez	a5,80003da4 <_ZL8producerPv+0x2c>
    80003de4:	fb9ff06f          	j	80003d9c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003de8:	0104b503          	ld	a0,16(s1)
    80003dec:	ffffe097          	auipc	ra,0xffffe
    80003df0:	870080e7          	jalr	-1936(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80003df4:	01813083          	ld	ra,24(sp)
    80003df8:	01013403          	ld	s0,16(sp)
    80003dfc:	00813483          	ld	s1,8(sp)
    80003e00:	00013903          	ld	s2,0(sp)
    80003e04:	02010113          	addi	sp,sp,32
    80003e08:	00008067          	ret

0000000080003e0c <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003e0c:	fd010113          	addi	sp,sp,-48
    80003e10:	02113423          	sd	ra,40(sp)
    80003e14:	02813023          	sd	s0,32(sp)
    80003e18:	00913c23          	sd	s1,24(sp)
    80003e1c:	01213823          	sd	s2,16(sp)
    80003e20:	01313423          	sd	s3,8(sp)
    80003e24:	03010413          	addi	s0,sp,48
    80003e28:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003e2c:	00000993          	li	s3,0
    80003e30:	01c0006f          	j	80003e4c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003e34:	ffffd097          	auipc	ra,0xffffd
    80003e38:	6ac080e7          	jalr	1708(ra) # 800014e0 <_Z15thread_dispatchv>
    80003e3c:	0500006f          	j	80003e8c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003e40:	00a00513          	li	a0,10
    80003e44:	ffffe097          	auipc	ra,0xffffe
    80003e48:	92c080e7          	jalr	-1748(ra) # 80001770 <_Z4putcc>
    while (!threadEnd) {
    80003e4c:	00009797          	auipc	a5,0x9
    80003e50:	e547a783          	lw	a5,-428(a5) # 8000cca0 <_ZL9threadEnd>
    80003e54:	06079063          	bnez	a5,80003eb4 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003e58:	00893503          	ld	a0,8(s2)
    80003e5c:	00003097          	auipc	ra,0x3
    80003e60:	f1c080e7          	jalr	-228(ra) # 80006d78 <_ZN6Buffer3getEv>
        i++;
    80003e64:	0019849b          	addiw	s1,s3,1
    80003e68:	0004899b          	sext.w	s3,s1
        putc(key);
    80003e6c:	0ff57513          	andi	a0,a0,255
    80003e70:	ffffe097          	auipc	ra,0xffffe
    80003e74:	900080e7          	jalr	-1792(ra) # 80001770 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003e78:	00092703          	lw	a4,0(s2)
    80003e7c:	0027179b          	slliw	a5,a4,0x2
    80003e80:	00e787bb          	addw	a5,a5,a4
    80003e84:	02f4e7bb          	remw	a5,s1,a5
    80003e88:	fa0786e3          	beqz	a5,80003e34 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003e8c:	05000793          	li	a5,80
    80003e90:	02f4e4bb          	remw	s1,s1,a5
    80003e94:	fa049ce3          	bnez	s1,80003e4c <_ZL8consumerPv+0x40>
    80003e98:	fa9ff06f          	j	80003e40 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003e9c:	00893503          	ld	a0,8(s2)
    80003ea0:	00003097          	auipc	ra,0x3
    80003ea4:	ed8080e7          	jalr	-296(ra) # 80006d78 <_ZN6Buffer3getEv>
        putc(key);
    80003ea8:	0ff57513          	andi	a0,a0,255
    80003eac:	ffffe097          	auipc	ra,0xffffe
    80003eb0:	8c4080e7          	jalr	-1852(ra) # 80001770 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003eb4:	00893503          	ld	a0,8(s2)
    80003eb8:	00003097          	auipc	ra,0x3
    80003ebc:	f4c080e7          	jalr	-180(ra) # 80006e04 <_ZN6Buffer6getCntEv>
    80003ec0:	fca04ee3          	bgtz	a0,80003e9c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003ec4:	01093503          	ld	a0,16(s2)
    80003ec8:	ffffd097          	auipc	ra,0xffffd
    80003ecc:	794080e7          	jalr	1940(ra) # 8000165c <_Z10sem_signalP3Sem>
}
    80003ed0:	02813083          	ld	ra,40(sp)
    80003ed4:	02013403          	ld	s0,32(sp)
    80003ed8:	01813483          	ld	s1,24(sp)
    80003edc:	01013903          	ld	s2,16(sp)
    80003ee0:	00813983          	ld	s3,8(sp)
    80003ee4:	03010113          	addi	sp,sp,48
    80003ee8:	00008067          	ret

0000000080003eec <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003eec:	f9010113          	addi	sp,sp,-112
    80003ef0:	06113423          	sd	ra,104(sp)
    80003ef4:	06813023          	sd	s0,96(sp)
    80003ef8:	04913c23          	sd	s1,88(sp)
    80003efc:	05213823          	sd	s2,80(sp)
    80003f00:	05313423          	sd	s3,72(sp)
    80003f04:	05413023          	sd	s4,64(sp)
    80003f08:	03513c23          	sd	s5,56(sp)
    80003f0c:	03613823          	sd	s6,48(sp)
    80003f10:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003f14:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003f18:	00006517          	auipc	a0,0x6
    80003f1c:	50050513          	addi	a0,a0,1280 # 8000a418 <CONSOLE_STATUS+0x408>
    80003f20:	ffffe097          	auipc	ra,0xffffe
    80003f24:	cb4080e7          	jalr	-844(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80003f28:	01e00593          	li	a1,30
    80003f2c:	fa040493          	addi	s1,s0,-96
    80003f30:	00048513          	mv	a0,s1
    80003f34:	ffffe097          	auipc	ra,0xffffe
    80003f38:	db0080e7          	jalr	-592(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003f3c:	00048513          	mv	a0,s1
    80003f40:	ffffe097          	auipc	ra,0xffffe
    80003f44:	e7c080e7          	jalr	-388(ra) # 80001dbc <_Z11stringToIntPKc>
    80003f48:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003f4c:	00006517          	auipc	a0,0x6
    80003f50:	4ec50513          	addi	a0,a0,1260 # 8000a438 <CONSOLE_STATUS+0x428>
    80003f54:	ffffe097          	auipc	ra,0xffffe
    80003f58:	c80080e7          	jalr	-896(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80003f5c:	01e00593          	li	a1,30
    80003f60:	00048513          	mv	a0,s1
    80003f64:	ffffe097          	auipc	ra,0xffffe
    80003f68:	d80080e7          	jalr	-640(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80003f6c:	00048513          	mv	a0,s1
    80003f70:	ffffe097          	auipc	ra,0xffffe
    80003f74:	e4c080e7          	jalr	-436(ra) # 80001dbc <_Z11stringToIntPKc>
    80003f78:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003f7c:	00006517          	auipc	a0,0x6
    80003f80:	4dc50513          	addi	a0,a0,1244 # 8000a458 <CONSOLE_STATUS+0x448>
    80003f84:	ffffe097          	auipc	ra,0xffffe
    80003f88:	c50080e7          	jalr	-944(ra) # 80001bd4 <_Z11printStringPKc>
    80003f8c:	00000613          	li	a2,0
    80003f90:	00a00593          	li	a1,10
    80003f94:	00090513          	mv	a0,s2
    80003f98:	ffffe097          	auipc	ra,0xffffe
    80003f9c:	e74080e7          	jalr	-396(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003fa0:	00006517          	auipc	a0,0x6
    80003fa4:	4d050513          	addi	a0,a0,1232 # 8000a470 <CONSOLE_STATUS+0x460>
    80003fa8:	ffffe097          	auipc	ra,0xffffe
    80003fac:	c2c080e7          	jalr	-980(ra) # 80001bd4 <_Z11printStringPKc>
    80003fb0:	00000613          	li	a2,0
    80003fb4:	00a00593          	li	a1,10
    80003fb8:	00048513          	mv	a0,s1
    80003fbc:	ffffe097          	auipc	ra,0xffffe
    80003fc0:	e50080e7          	jalr	-432(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80003fc4:	00006517          	auipc	a0,0x6
    80003fc8:	4c450513          	addi	a0,a0,1220 # 8000a488 <CONSOLE_STATUS+0x478>
    80003fcc:	ffffe097          	auipc	ra,0xffffe
    80003fd0:	c08080e7          	jalr	-1016(ra) # 80001bd4 <_Z11printStringPKc>
    if(threadNum > n) {
    80003fd4:	0324c463          	blt	s1,s2,80003ffc <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003fd8:	03205c63          	blez	s2,80004010 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003fdc:	03800513          	li	a0,56
    80003fe0:	ffffe097          	auipc	ra,0xffffe
    80003fe4:	708080e7          	jalr	1800(ra) # 800026e8 <_Znwm>
    80003fe8:	00050a13          	mv	s4,a0
    80003fec:	00048593          	mv	a1,s1
    80003ff0:	00003097          	auipc	ra,0x3
    80003ff4:	c5c080e7          	jalr	-932(ra) # 80006c4c <_ZN6BufferC1Ei>
    80003ff8:	0300006f          	j	80004028 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003ffc:	00006517          	auipc	a0,0x6
    80004000:	49450513          	addi	a0,a0,1172 # 8000a490 <CONSOLE_STATUS+0x480>
    80004004:	ffffe097          	auipc	ra,0xffffe
    80004008:	bd0080e7          	jalr	-1072(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    8000400c:	0140006f          	j	80004020 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004010:	00006517          	auipc	a0,0x6
    80004014:	4c050513          	addi	a0,a0,1216 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80004018:	ffffe097          	auipc	ra,0xffffe
    8000401c:	bbc080e7          	jalr	-1092(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004020:	000b0113          	mv	sp,s6
    80004024:	1500006f          	j	80004174 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80004028:	00000593          	li	a1,0
    8000402c:	00009517          	auipc	a0,0x9
    80004030:	c7c50513          	addi	a0,a0,-900 # 8000cca8 <_ZL10waitForAll>
    80004034:	ffffd097          	auipc	ra,0xffffd
    80004038:	4ec080e7          	jalr	1260(ra) # 80001520 <_Z8sem_openPP3Semj>
    thread_t threads[threadNum];
    8000403c:	00391793          	slli	a5,s2,0x3
    80004040:	00f78793          	addi	a5,a5,15
    80004044:	ff07f793          	andi	a5,a5,-16
    80004048:	40f10133          	sub	sp,sp,a5
    8000404c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80004050:	0019071b          	addiw	a4,s2,1
    80004054:	00171793          	slli	a5,a4,0x1
    80004058:	00e787b3          	add	a5,a5,a4
    8000405c:	00379793          	slli	a5,a5,0x3
    80004060:	00f78793          	addi	a5,a5,15
    80004064:	ff07f793          	andi	a5,a5,-16
    80004068:	40f10133          	sub	sp,sp,a5
    8000406c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80004070:	00191613          	slli	a2,s2,0x1
    80004074:	012607b3          	add	a5,a2,s2
    80004078:	00379793          	slli	a5,a5,0x3
    8000407c:	00f987b3          	add	a5,s3,a5
    80004080:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004084:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80004088:	00009717          	auipc	a4,0x9
    8000408c:	c2073703          	ld	a4,-992(a4) # 8000cca8 <_ZL10waitForAll>
    80004090:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80004094:	00078613          	mv	a2,a5
    80004098:	00000597          	auipc	a1,0x0
    8000409c:	d7458593          	addi	a1,a1,-652 # 80003e0c <_ZL8consumerPv>
    800040a0:	f9840513          	addi	a0,s0,-104
    800040a4:	ffffd097          	auipc	ra,0xffffd
    800040a8:	330080e7          	jalr	816(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800040ac:	00000493          	li	s1,0
    800040b0:	0280006f          	j	800040d8 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800040b4:	00000597          	auipc	a1,0x0
    800040b8:	c1458593          	addi	a1,a1,-1004 # 80003cc8 <_ZL16producerKeyboardPv>
                      data + i);
    800040bc:	00179613          	slli	a2,a5,0x1
    800040c0:	00f60633          	add	a2,a2,a5
    800040c4:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800040c8:	00c98633          	add	a2,s3,a2
    800040cc:	ffffd097          	auipc	ra,0xffffd
    800040d0:	308080e7          	jalr	776(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800040d4:	0014849b          	addiw	s1,s1,1
    800040d8:	0524d263          	bge	s1,s2,8000411c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800040dc:	00149793          	slli	a5,s1,0x1
    800040e0:	009787b3          	add	a5,a5,s1
    800040e4:	00379793          	slli	a5,a5,0x3
    800040e8:	00f987b3          	add	a5,s3,a5
    800040ec:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800040f0:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800040f4:	00009717          	auipc	a4,0x9
    800040f8:	bb473703          	ld	a4,-1100(a4) # 8000cca8 <_ZL10waitForAll>
    800040fc:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80004100:	00048793          	mv	a5,s1
    80004104:	00349513          	slli	a0,s1,0x3
    80004108:	00aa8533          	add	a0,s5,a0
    8000410c:	fa9054e3          	blez	s1,800040b4 <_Z22producerConsumer_C_APIv+0x1c8>
    80004110:	00000597          	auipc	a1,0x0
    80004114:	c6858593          	addi	a1,a1,-920 # 80003d78 <_ZL8producerPv>
    80004118:	fa5ff06f          	j	800040bc <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000411c:	ffffd097          	auipc	ra,0xffffd
    80004120:	3c4080e7          	jalr	964(ra) # 800014e0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80004124:	00000493          	li	s1,0
    80004128:	00994e63          	blt	s2,s1,80004144 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000412c:	00009517          	auipc	a0,0x9
    80004130:	b7c53503          	ld	a0,-1156(a0) # 8000cca8 <_ZL10waitForAll>
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	4c0080e7          	jalr	1216(ra) # 800015f4 <_Z8sem_waitP3Sem>
    for (int i = 0; i <= threadNum; i++) {
    8000413c:	0014849b          	addiw	s1,s1,1
    80004140:	fe9ff06f          	j	80004128 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80004144:	00009517          	auipc	a0,0x9
    80004148:	b6453503          	ld	a0,-1180(a0) # 8000cca8 <_ZL10waitForAll>
    8000414c:	ffffd097          	auipc	ra,0xffffd
    80004150:	440080e7          	jalr	1088(ra) # 8000158c <_Z9sem_closeP3Sem>
    delete buffer;
    80004154:	000a0e63          	beqz	s4,80004170 <_Z22producerConsumer_C_APIv+0x284>
    80004158:	000a0513          	mv	a0,s4
    8000415c:	00003097          	auipc	ra,0x3
    80004160:	d30080e7          	jalr	-720(ra) # 80006e8c <_ZN6BufferD1Ev>
    80004164:	000a0513          	mv	a0,s4
    80004168:	ffffe097          	auipc	ra,0xffffe
    8000416c:	5d0080e7          	jalr	1488(ra) # 80002738 <_ZdlPv>
    80004170:	000b0113          	mv	sp,s6

}
    80004174:	f9040113          	addi	sp,s0,-112
    80004178:	06813083          	ld	ra,104(sp)
    8000417c:	06013403          	ld	s0,96(sp)
    80004180:	05813483          	ld	s1,88(sp)
    80004184:	05013903          	ld	s2,80(sp)
    80004188:	04813983          	ld	s3,72(sp)
    8000418c:	04013a03          	ld	s4,64(sp)
    80004190:	03813a83          	ld	s5,56(sp)
    80004194:	03013b03          	ld	s6,48(sp)
    80004198:	07010113          	addi	sp,sp,112
    8000419c:	00008067          	ret
    800041a0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800041a4:	000a0513          	mv	a0,s4
    800041a8:	ffffe097          	auipc	ra,0xffffe
    800041ac:	590080e7          	jalr	1424(ra) # 80002738 <_ZdlPv>
    800041b0:	00048513          	mv	a0,s1
    800041b4:	0000a097          	auipc	ra,0xa
    800041b8:	c04080e7          	jalr	-1020(ra) # 8000ddb8 <_Unwind_Resume>

00000000800041bc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800041bc:	fe010113          	addi	sp,sp,-32
    800041c0:	00113c23          	sd	ra,24(sp)
    800041c4:	00813823          	sd	s0,16(sp)
    800041c8:	00913423          	sd	s1,8(sp)
    800041cc:	01213023          	sd	s2,0(sp)
    800041d0:	02010413          	addi	s0,sp,32
    800041d4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800041d8:	00100793          	li	a5,1
    800041dc:	02a7f863          	bgeu	a5,a0,8000420c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800041e0:	00a00793          	li	a5,10
    800041e4:	02f577b3          	remu	a5,a0,a5
    800041e8:	02078e63          	beqz	a5,80004224 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800041ec:	fff48513          	addi	a0,s1,-1
    800041f0:	00000097          	auipc	ra,0x0
    800041f4:	fcc080e7          	jalr	-52(ra) # 800041bc <_ZL9fibonaccim>
    800041f8:	00050913          	mv	s2,a0
    800041fc:	ffe48513          	addi	a0,s1,-2
    80004200:	00000097          	auipc	ra,0x0
    80004204:	fbc080e7          	jalr	-68(ra) # 800041bc <_ZL9fibonaccim>
    80004208:	00a90533          	add	a0,s2,a0
}
    8000420c:	01813083          	ld	ra,24(sp)
    80004210:	01013403          	ld	s0,16(sp)
    80004214:	00813483          	ld	s1,8(sp)
    80004218:	00013903          	ld	s2,0(sp)
    8000421c:	02010113          	addi	sp,sp,32
    80004220:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004224:	ffffd097          	auipc	ra,0xffffd
    80004228:	2bc080e7          	jalr	700(ra) # 800014e0 <_Z15thread_dispatchv>
    8000422c:	fc1ff06f          	j	800041ec <_ZL9fibonaccim+0x30>

0000000080004230 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80004230:	fe010113          	addi	sp,sp,-32
    80004234:	00113c23          	sd	ra,24(sp)
    80004238:	00813823          	sd	s0,16(sp)
    8000423c:	00913423          	sd	s1,8(sp)
    80004240:	01213023          	sd	s2,0(sp)
    80004244:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004248:	00000913          	li	s2,0
    8000424c:	0380006f          	j	80004284 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80004250:	ffffd097          	auipc	ra,0xffffd
    80004254:	290080e7          	jalr	656(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004258:	00148493          	addi	s1,s1,1
    8000425c:	000027b7          	lui	a5,0x2
    80004260:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004264:	0097ee63          	bltu	a5,s1,80004280 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004268:	00000713          	li	a4,0
    8000426c:	000077b7          	lui	a5,0x7
    80004270:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004274:	fce7eee3          	bltu	a5,a4,80004250 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80004278:	00170713          	addi	a4,a4,1
    8000427c:	ff1ff06f          	j	8000426c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004280:	00190913          	addi	s2,s2,1
    80004284:	00900793          	li	a5,9
    80004288:	0527e063          	bltu	a5,s2,800042c8 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000428c:	00006517          	auipc	a0,0x6
    80004290:	27450513          	addi	a0,a0,628 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80004294:	ffffe097          	auipc	ra,0xffffe
    80004298:	940080e7          	jalr	-1728(ra) # 80001bd4 <_Z11printStringPKc>
    8000429c:	00000613          	li	a2,0
    800042a0:	00a00593          	li	a1,10
    800042a4:	0009051b          	sext.w	a0,s2
    800042a8:	ffffe097          	auipc	ra,0xffffe
    800042ac:	b64080e7          	jalr	-1180(ra) # 80001e0c <_Z8printIntiii>
    800042b0:	00006517          	auipc	a0,0x6
    800042b4:	03050513          	addi	a0,a0,48 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	91c080e7          	jalr	-1764(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800042c0:	00000493          	li	s1,0
    800042c4:	f99ff06f          	j	8000425c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800042c8:	00006517          	auipc	a0,0x6
    800042cc:	24050513          	addi	a0,a0,576 # 8000a508 <CONSOLE_STATUS+0x4f8>
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	904080e7          	jalr	-1788(ra) # 80001bd4 <_Z11printStringPKc>
    finishedA = true;
    800042d8:	00100793          	li	a5,1
    800042dc:	00009717          	auipc	a4,0x9
    800042e0:	9cf70a23          	sb	a5,-1580(a4) # 8000ccb0 <_ZL9finishedA>
}
    800042e4:	01813083          	ld	ra,24(sp)
    800042e8:	01013403          	ld	s0,16(sp)
    800042ec:	00813483          	ld	s1,8(sp)
    800042f0:	00013903          	ld	s2,0(sp)
    800042f4:	02010113          	addi	sp,sp,32
    800042f8:	00008067          	ret

00000000800042fc <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800042fc:	fe010113          	addi	sp,sp,-32
    80004300:	00113c23          	sd	ra,24(sp)
    80004304:	00813823          	sd	s0,16(sp)
    80004308:	00913423          	sd	s1,8(sp)
    8000430c:	01213023          	sd	s2,0(sp)
    80004310:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004314:	00000913          	li	s2,0
    80004318:	0380006f          	j	80004350 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000431c:	ffffd097          	auipc	ra,0xffffd
    80004320:	1c4080e7          	jalr	452(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004324:	00148493          	addi	s1,s1,1
    80004328:	000027b7          	lui	a5,0x2
    8000432c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004330:	0097ee63          	bltu	a5,s1,8000434c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004334:	00000713          	li	a4,0
    80004338:	000077b7          	lui	a5,0x7
    8000433c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004340:	fce7eee3          	bltu	a5,a4,8000431c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80004344:	00170713          	addi	a4,a4,1
    80004348:	ff1ff06f          	j	80004338 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000434c:	00190913          	addi	s2,s2,1
    80004350:	00f00793          	li	a5,15
    80004354:	0527e063          	bltu	a5,s2,80004394 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004358:	00006517          	auipc	a0,0x6
    8000435c:	1c050513          	addi	a0,a0,448 # 8000a518 <CONSOLE_STATUS+0x508>
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	874080e7          	jalr	-1932(ra) # 80001bd4 <_Z11printStringPKc>
    80004368:	00000613          	li	a2,0
    8000436c:	00a00593          	li	a1,10
    80004370:	0009051b          	sext.w	a0,s2
    80004374:	ffffe097          	auipc	ra,0xffffe
    80004378:	a98080e7          	jalr	-1384(ra) # 80001e0c <_Z8printIntiii>
    8000437c:	00006517          	auipc	a0,0x6
    80004380:	f6450513          	addi	a0,a0,-156 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004384:	ffffe097          	auipc	ra,0xffffe
    80004388:	850080e7          	jalr	-1968(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000438c:	00000493          	li	s1,0
    80004390:	f99ff06f          	j	80004328 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004394:	00006517          	auipc	a0,0x6
    80004398:	18c50513          	addi	a0,a0,396 # 8000a520 <CONSOLE_STATUS+0x510>
    8000439c:	ffffe097          	auipc	ra,0xffffe
    800043a0:	838080e7          	jalr	-1992(ra) # 80001bd4 <_Z11printStringPKc>
    finishedB = true;
    800043a4:	00100793          	li	a5,1
    800043a8:	00009717          	auipc	a4,0x9
    800043ac:	90f704a3          	sb	a5,-1783(a4) # 8000ccb1 <_ZL9finishedB>
    thread_dispatch();
    800043b0:	ffffd097          	auipc	ra,0xffffd
    800043b4:	130080e7          	jalr	304(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800043b8:	01813083          	ld	ra,24(sp)
    800043bc:	01013403          	ld	s0,16(sp)
    800043c0:	00813483          	ld	s1,8(sp)
    800043c4:	00013903          	ld	s2,0(sp)
    800043c8:	02010113          	addi	sp,sp,32
    800043cc:	00008067          	ret

00000000800043d0 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800043d0:	fe010113          	addi	sp,sp,-32
    800043d4:	00113c23          	sd	ra,24(sp)
    800043d8:	00813823          	sd	s0,16(sp)
    800043dc:	00913423          	sd	s1,8(sp)
    800043e0:	01213023          	sd	s2,0(sp)
    800043e4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800043e8:	00000493          	li	s1,0
    800043ec:	0400006f          	j	8000442c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800043f0:	00006517          	auipc	a0,0x6
    800043f4:	14050513          	addi	a0,a0,320 # 8000a530 <CONSOLE_STATUS+0x520>
    800043f8:	ffffd097          	auipc	ra,0xffffd
    800043fc:	7dc080e7          	jalr	2012(ra) # 80001bd4 <_Z11printStringPKc>
    80004400:	00000613          	li	a2,0
    80004404:	00a00593          	li	a1,10
    80004408:	00048513          	mv	a0,s1
    8000440c:	ffffe097          	auipc	ra,0xffffe
    80004410:	a00080e7          	jalr	-1536(ra) # 80001e0c <_Z8printIntiii>
    80004414:	00006517          	auipc	a0,0x6
    80004418:	ecc50513          	addi	a0,a0,-308 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000441c:	ffffd097          	auipc	ra,0xffffd
    80004420:	7b8080e7          	jalr	1976(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004424:	0014849b          	addiw	s1,s1,1
    80004428:	0ff4f493          	andi	s1,s1,255
    8000442c:	00200793          	li	a5,2
    80004430:	fc97f0e3          	bgeu	a5,s1,800043f0 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004434:	00006517          	auipc	a0,0x6
    80004438:	10450513          	addi	a0,a0,260 # 8000a538 <CONSOLE_STATUS+0x528>
    8000443c:	ffffd097          	auipc	ra,0xffffd
    80004440:	798080e7          	jalr	1944(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004444:	00700313          	li	t1,7
    thread_dispatch();
    80004448:	ffffd097          	auipc	ra,0xffffd
    8000444c:	098080e7          	jalr	152(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004450:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004454:	00006517          	auipc	a0,0x6
    80004458:	0f450513          	addi	a0,a0,244 # 8000a548 <CONSOLE_STATUS+0x538>
    8000445c:	ffffd097          	auipc	ra,0xffffd
    80004460:	778080e7          	jalr	1912(ra) # 80001bd4 <_Z11printStringPKc>
    80004464:	00000613          	li	a2,0
    80004468:	00a00593          	li	a1,10
    8000446c:	0009051b          	sext.w	a0,s2
    80004470:	ffffe097          	auipc	ra,0xffffe
    80004474:	99c080e7          	jalr	-1636(ra) # 80001e0c <_Z8printIntiii>
    80004478:	00006517          	auipc	a0,0x6
    8000447c:	e6850513          	addi	a0,a0,-408 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004480:	ffffd097          	auipc	ra,0xffffd
    80004484:	754080e7          	jalr	1876(ra) # 80001bd4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004488:	00c00513          	li	a0,12
    8000448c:	00000097          	auipc	ra,0x0
    80004490:	d30080e7          	jalr	-720(ra) # 800041bc <_ZL9fibonaccim>
    80004494:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004498:	00006517          	auipc	a0,0x6
    8000449c:	0b850513          	addi	a0,a0,184 # 8000a550 <CONSOLE_STATUS+0x540>
    800044a0:	ffffd097          	auipc	ra,0xffffd
    800044a4:	734080e7          	jalr	1844(ra) # 80001bd4 <_Z11printStringPKc>
    800044a8:	00000613          	li	a2,0
    800044ac:	00a00593          	li	a1,10
    800044b0:	0009051b          	sext.w	a0,s2
    800044b4:	ffffe097          	auipc	ra,0xffffe
    800044b8:	958080e7          	jalr	-1704(ra) # 80001e0c <_Z8printIntiii>
    800044bc:	00006517          	auipc	a0,0x6
    800044c0:	e2450513          	addi	a0,a0,-476 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800044c4:	ffffd097          	auipc	ra,0xffffd
    800044c8:	710080e7          	jalr	1808(ra) # 80001bd4 <_Z11printStringPKc>
    800044cc:	0400006f          	j	8000450c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800044d0:	00006517          	auipc	a0,0x6
    800044d4:	06050513          	addi	a0,a0,96 # 8000a530 <CONSOLE_STATUS+0x520>
    800044d8:	ffffd097          	auipc	ra,0xffffd
    800044dc:	6fc080e7          	jalr	1788(ra) # 80001bd4 <_Z11printStringPKc>
    800044e0:	00000613          	li	a2,0
    800044e4:	00a00593          	li	a1,10
    800044e8:	00048513          	mv	a0,s1
    800044ec:	ffffe097          	auipc	ra,0xffffe
    800044f0:	920080e7          	jalr	-1760(ra) # 80001e0c <_Z8printIntiii>
    800044f4:	00006517          	auipc	a0,0x6
    800044f8:	dec50513          	addi	a0,a0,-532 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800044fc:	ffffd097          	auipc	ra,0xffffd
    80004500:	6d8080e7          	jalr	1752(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004504:	0014849b          	addiw	s1,s1,1
    80004508:	0ff4f493          	andi	s1,s1,255
    8000450c:	00500793          	li	a5,5
    80004510:	fc97f0e3          	bgeu	a5,s1,800044d0 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004514:	00006517          	auipc	a0,0x6
    80004518:	ff450513          	addi	a0,a0,-12 # 8000a508 <CONSOLE_STATUS+0x4f8>
    8000451c:	ffffd097          	auipc	ra,0xffffd
    80004520:	6b8080e7          	jalr	1720(ra) # 80001bd4 <_Z11printStringPKc>
    finishedC = true;
    80004524:	00100793          	li	a5,1
    80004528:	00008717          	auipc	a4,0x8
    8000452c:	78f70523          	sb	a5,1930(a4) # 8000ccb2 <_ZL9finishedC>
    thread_dispatch();
    80004530:	ffffd097          	auipc	ra,0xffffd
    80004534:	fb0080e7          	jalr	-80(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80004538:	01813083          	ld	ra,24(sp)
    8000453c:	01013403          	ld	s0,16(sp)
    80004540:	00813483          	ld	s1,8(sp)
    80004544:	00013903          	ld	s2,0(sp)
    80004548:	02010113          	addi	sp,sp,32
    8000454c:	00008067          	ret

0000000080004550 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004550:	fe010113          	addi	sp,sp,-32
    80004554:	00113c23          	sd	ra,24(sp)
    80004558:	00813823          	sd	s0,16(sp)
    8000455c:	00913423          	sd	s1,8(sp)
    80004560:	01213023          	sd	s2,0(sp)
    80004564:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004568:	00a00493          	li	s1,10
    8000456c:	0400006f          	j	800045ac <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004570:	00006517          	auipc	a0,0x6
    80004574:	ff050513          	addi	a0,a0,-16 # 8000a560 <CONSOLE_STATUS+0x550>
    80004578:	ffffd097          	auipc	ra,0xffffd
    8000457c:	65c080e7          	jalr	1628(ra) # 80001bd4 <_Z11printStringPKc>
    80004580:	00000613          	li	a2,0
    80004584:	00a00593          	li	a1,10
    80004588:	00048513          	mv	a0,s1
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	880080e7          	jalr	-1920(ra) # 80001e0c <_Z8printIntiii>
    80004594:	00006517          	auipc	a0,0x6
    80004598:	d4c50513          	addi	a0,a0,-692 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000459c:	ffffd097          	auipc	ra,0xffffd
    800045a0:	638080e7          	jalr	1592(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800045a4:	0014849b          	addiw	s1,s1,1
    800045a8:	0ff4f493          	andi	s1,s1,255
    800045ac:	00c00793          	li	a5,12
    800045b0:	fc97f0e3          	bgeu	a5,s1,80004570 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800045b4:	00006517          	auipc	a0,0x6
    800045b8:	fb450513          	addi	a0,a0,-76 # 8000a568 <CONSOLE_STATUS+0x558>
    800045bc:	ffffd097          	auipc	ra,0xffffd
    800045c0:	618080e7          	jalr	1560(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800045c4:	00500313          	li	t1,5
    thread_dispatch();
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	f18080e7          	jalr	-232(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800045d0:	01000513          	li	a0,16
    800045d4:	00000097          	auipc	ra,0x0
    800045d8:	be8080e7          	jalr	-1048(ra) # 800041bc <_ZL9fibonaccim>
    800045dc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800045e0:	00006517          	auipc	a0,0x6
    800045e4:	f9850513          	addi	a0,a0,-104 # 8000a578 <CONSOLE_STATUS+0x568>
    800045e8:	ffffd097          	auipc	ra,0xffffd
    800045ec:	5ec080e7          	jalr	1516(ra) # 80001bd4 <_Z11printStringPKc>
    800045f0:	00000613          	li	a2,0
    800045f4:	00a00593          	li	a1,10
    800045f8:	0009051b          	sext.w	a0,s2
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	810080e7          	jalr	-2032(ra) # 80001e0c <_Z8printIntiii>
    80004604:	00006517          	auipc	a0,0x6
    80004608:	cdc50513          	addi	a0,a0,-804 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000460c:	ffffd097          	auipc	ra,0xffffd
    80004610:	5c8080e7          	jalr	1480(ra) # 80001bd4 <_Z11printStringPKc>
    80004614:	0400006f          	j	80004654 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004618:	00006517          	auipc	a0,0x6
    8000461c:	f4850513          	addi	a0,a0,-184 # 8000a560 <CONSOLE_STATUS+0x550>
    80004620:	ffffd097          	auipc	ra,0xffffd
    80004624:	5b4080e7          	jalr	1460(ra) # 80001bd4 <_Z11printStringPKc>
    80004628:	00000613          	li	a2,0
    8000462c:	00a00593          	li	a1,10
    80004630:	00048513          	mv	a0,s1
    80004634:	ffffd097          	auipc	ra,0xffffd
    80004638:	7d8080e7          	jalr	2008(ra) # 80001e0c <_Z8printIntiii>
    8000463c:	00006517          	auipc	a0,0x6
    80004640:	ca450513          	addi	a0,a0,-860 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004644:	ffffd097          	auipc	ra,0xffffd
    80004648:	590080e7          	jalr	1424(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000464c:	0014849b          	addiw	s1,s1,1
    80004650:	0ff4f493          	andi	s1,s1,255
    80004654:	00f00793          	li	a5,15
    80004658:	fc97f0e3          	bgeu	a5,s1,80004618 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    8000465c:	00006517          	auipc	a0,0x6
    80004660:	f2c50513          	addi	a0,a0,-212 # 8000a588 <CONSOLE_STATUS+0x578>
    80004664:	ffffd097          	auipc	ra,0xffffd
    80004668:	570080e7          	jalr	1392(ra) # 80001bd4 <_Z11printStringPKc>
    finishedD = true;
    8000466c:	00100793          	li	a5,1
    80004670:	00008717          	auipc	a4,0x8
    80004674:	64f701a3          	sb	a5,1603(a4) # 8000ccb3 <_ZL9finishedD>
    thread_dispatch();
    80004678:	ffffd097          	auipc	ra,0xffffd
    8000467c:	e68080e7          	jalr	-408(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80004680:	01813083          	ld	ra,24(sp)
    80004684:	01013403          	ld	s0,16(sp)
    80004688:	00813483          	ld	s1,8(sp)
    8000468c:	00013903          	ld	s2,0(sp)
    80004690:	02010113          	addi	sp,sp,32
    80004694:	00008067          	ret

0000000080004698 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004698:	fc010113          	addi	sp,sp,-64
    8000469c:	02113c23          	sd	ra,56(sp)
    800046a0:	02813823          	sd	s0,48(sp)
    800046a4:	02913423          	sd	s1,40(sp)
    800046a8:	03213023          	sd	s2,32(sp)
    800046ac:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800046b0:	02000513          	li	a0,32
    800046b4:	ffffe097          	auipc	ra,0xffffe
    800046b8:	034080e7          	jalr	52(ra) # 800026e8 <_Znwm>
    800046bc:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800046c0:	ffffe097          	auipc	ra,0xffffe
    800046c4:	178080e7          	jalr	376(ra) # 80002838 <_ZN6ThreadC1Ev>
    800046c8:	00008797          	auipc	a5,0x8
    800046cc:	31078793          	addi	a5,a5,784 # 8000c9d8 <_ZTV7WorkerA+0x10>
    800046d0:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800046d4:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800046d8:	00006517          	auipc	a0,0x6
    800046dc:	ec050513          	addi	a0,a0,-320 # 8000a598 <CONSOLE_STATUS+0x588>
    800046e0:	ffffd097          	auipc	ra,0xffffd
    800046e4:	4f4080e7          	jalr	1268(ra) # 80001bd4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800046e8:	02000513          	li	a0,32
    800046ec:	ffffe097          	auipc	ra,0xffffe
    800046f0:	ffc080e7          	jalr	-4(ra) # 800026e8 <_Znwm>
    800046f4:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	140080e7          	jalr	320(ra) # 80002838 <_ZN6ThreadC1Ev>
    80004700:	00008797          	auipc	a5,0x8
    80004704:	30078793          	addi	a5,a5,768 # 8000ca00 <_ZTV7WorkerB+0x10>
    80004708:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000470c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004710:	00006517          	auipc	a0,0x6
    80004714:	ea050513          	addi	a0,a0,-352 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    80004718:	ffffd097          	auipc	ra,0xffffd
    8000471c:	4bc080e7          	jalr	1212(ra) # 80001bd4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004720:	02000513          	li	a0,32
    80004724:	ffffe097          	auipc	ra,0xffffe
    80004728:	fc4080e7          	jalr	-60(ra) # 800026e8 <_Znwm>
    8000472c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004730:	ffffe097          	auipc	ra,0xffffe
    80004734:	108080e7          	jalr	264(ra) # 80002838 <_ZN6ThreadC1Ev>
    80004738:	00008797          	auipc	a5,0x8
    8000473c:	2f078793          	addi	a5,a5,752 # 8000ca28 <_ZTV7WorkerC+0x10>
    80004740:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004744:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004748:	00006517          	auipc	a0,0x6
    8000474c:	e8050513          	addi	a0,a0,-384 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    80004750:	ffffd097          	auipc	ra,0xffffd
    80004754:	484080e7          	jalr	1156(ra) # 80001bd4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004758:	02000513          	li	a0,32
    8000475c:	ffffe097          	auipc	ra,0xffffe
    80004760:	f8c080e7          	jalr	-116(ra) # 800026e8 <_Znwm>
    80004764:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004768:	ffffe097          	auipc	ra,0xffffe
    8000476c:	0d0080e7          	jalr	208(ra) # 80002838 <_ZN6ThreadC1Ev>
    80004770:	00008797          	auipc	a5,0x8
    80004774:	2e078793          	addi	a5,a5,736 # 8000ca50 <_ZTV7WorkerD+0x10>
    80004778:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000477c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004780:	00006517          	auipc	a0,0x6
    80004784:	e6050513          	addi	a0,a0,-416 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    80004788:	ffffd097          	auipc	ra,0xffffd
    8000478c:	44c080e7          	jalr	1100(ra) # 80001bd4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004790:	00000493          	li	s1,0
    80004794:	00300793          	li	a5,3
    80004798:	0297c663          	blt	a5,s1,800047c4 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    8000479c:	00349793          	slli	a5,s1,0x3
    800047a0:	fe040713          	addi	a4,s0,-32
    800047a4:	00f707b3          	add	a5,a4,a5
    800047a8:	fe07b503          	ld	a0,-32(a5)
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	0c4080e7          	jalr	196(ra) # 80002870 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800047b4:	0014849b          	addiw	s1,s1,1
    800047b8:	fddff06f          	j	80004794 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800047bc:	ffffe097          	auipc	ra,0xffffe
    800047c0:	108080e7          	jalr	264(ra) # 800028c4 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800047c4:	00008797          	auipc	a5,0x8
    800047c8:	4ec7c783          	lbu	a5,1260(a5) # 8000ccb0 <_ZL9finishedA>
    800047cc:	fe0788e3          	beqz	a5,800047bc <_Z20Threads_CPP_API_testv+0x124>
    800047d0:	00008797          	auipc	a5,0x8
    800047d4:	4e17c783          	lbu	a5,1249(a5) # 8000ccb1 <_ZL9finishedB>
    800047d8:	fe0782e3          	beqz	a5,800047bc <_Z20Threads_CPP_API_testv+0x124>
    800047dc:	00008797          	auipc	a5,0x8
    800047e0:	4d67c783          	lbu	a5,1238(a5) # 8000ccb2 <_ZL9finishedC>
    800047e4:	fc078ce3          	beqz	a5,800047bc <_Z20Threads_CPP_API_testv+0x124>
    800047e8:	00008797          	auipc	a5,0x8
    800047ec:	4cb7c783          	lbu	a5,1227(a5) # 8000ccb3 <_ZL9finishedD>
    800047f0:	fc0786e3          	beqz	a5,800047bc <_Z20Threads_CPP_API_testv+0x124>
    800047f4:	fc040493          	addi	s1,s0,-64
    800047f8:	0080006f          	j	80004800 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    800047fc:	00848493          	addi	s1,s1,8
    80004800:	fe040793          	addi	a5,s0,-32
    80004804:	08f48663          	beq	s1,a5,80004890 <_Z20Threads_CPP_API_testv+0x1f8>
    80004808:	0004b503          	ld	a0,0(s1)
    8000480c:	fe0508e3          	beqz	a0,800047fc <_Z20Threads_CPP_API_testv+0x164>
    80004810:	00053783          	ld	a5,0(a0)
    80004814:	0087b783          	ld	a5,8(a5)
    80004818:	000780e7          	jalr	a5
    8000481c:	fe1ff06f          	j	800047fc <_Z20Threads_CPP_API_testv+0x164>
    80004820:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004824:	00048513          	mv	a0,s1
    80004828:	ffffe097          	auipc	ra,0xffffe
    8000482c:	f10080e7          	jalr	-240(ra) # 80002738 <_ZdlPv>
    80004830:	00090513          	mv	a0,s2
    80004834:	00009097          	auipc	ra,0x9
    80004838:	584080e7          	jalr	1412(ra) # 8000ddb8 <_Unwind_Resume>
    8000483c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004840:	00048513          	mv	a0,s1
    80004844:	ffffe097          	auipc	ra,0xffffe
    80004848:	ef4080e7          	jalr	-268(ra) # 80002738 <_ZdlPv>
    8000484c:	00090513          	mv	a0,s2
    80004850:	00009097          	auipc	ra,0x9
    80004854:	568080e7          	jalr	1384(ra) # 8000ddb8 <_Unwind_Resume>
    80004858:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    8000485c:	00048513          	mv	a0,s1
    80004860:	ffffe097          	auipc	ra,0xffffe
    80004864:	ed8080e7          	jalr	-296(ra) # 80002738 <_ZdlPv>
    80004868:	00090513          	mv	a0,s2
    8000486c:	00009097          	auipc	ra,0x9
    80004870:	54c080e7          	jalr	1356(ra) # 8000ddb8 <_Unwind_Resume>
    80004874:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004878:	00048513          	mv	a0,s1
    8000487c:	ffffe097          	auipc	ra,0xffffe
    80004880:	ebc080e7          	jalr	-324(ra) # 80002738 <_ZdlPv>
    80004884:	00090513          	mv	a0,s2
    80004888:	00009097          	auipc	ra,0x9
    8000488c:	530080e7          	jalr	1328(ra) # 8000ddb8 <_Unwind_Resume>
}
    80004890:	03813083          	ld	ra,56(sp)
    80004894:	03013403          	ld	s0,48(sp)
    80004898:	02813483          	ld	s1,40(sp)
    8000489c:	02013903          	ld	s2,32(sp)
    800048a0:	04010113          	addi	sp,sp,64
    800048a4:	00008067          	ret

00000000800048a8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800048a8:	ff010113          	addi	sp,sp,-16
    800048ac:	00113423          	sd	ra,8(sp)
    800048b0:	00813023          	sd	s0,0(sp)
    800048b4:	01010413          	addi	s0,sp,16
    800048b8:	00008797          	auipc	a5,0x8
    800048bc:	12078793          	addi	a5,a5,288 # 8000c9d8 <_ZTV7WorkerA+0x10>
    800048c0:	00f53023          	sd	a5,0(a0)
    800048c4:	ffffe097          	auipc	ra,0xffffe
    800048c8:	d90080e7          	jalr	-624(ra) # 80002654 <_ZN6ThreadD1Ev>
    800048cc:	00813083          	ld	ra,8(sp)
    800048d0:	00013403          	ld	s0,0(sp)
    800048d4:	01010113          	addi	sp,sp,16
    800048d8:	00008067          	ret

00000000800048dc <_ZN7WorkerAD0Ev>:
    800048dc:	fe010113          	addi	sp,sp,-32
    800048e0:	00113c23          	sd	ra,24(sp)
    800048e4:	00813823          	sd	s0,16(sp)
    800048e8:	00913423          	sd	s1,8(sp)
    800048ec:	02010413          	addi	s0,sp,32
    800048f0:	00050493          	mv	s1,a0
    800048f4:	00008797          	auipc	a5,0x8
    800048f8:	0e478793          	addi	a5,a5,228 # 8000c9d8 <_ZTV7WorkerA+0x10>
    800048fc:	00f53023          	sd	a5,0(a0)
    80004900:	ffffe097          	auipc	ra,0xffffe
    80004904:	d54080e7          	jalr	-684(ra) # 80002654 <_ZN6ThreadD1Ev>
    80004908:	00048513          	mv	a0,s1
    8000490c:	ffffe097          	auipc	ra,0xffffe
    80004910:	e2c080e7          	jalr	-468(ra) # 80002738 <_ZdlPv>
    80004914:	01813083          	ld	ra,24(sp)
    80004918:	01013403          	ld	s0,16(sp)
    8000491c:	00813483          	ld	s1,8(sp)
    80004920:	02010113          	addi	sp,sp,32
    80004924:	00008067          	ret

0000000080004928 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004928:	ff010113          	addi	sp,sp,-16
    8000492c:	00113423          	sd	ra,8(sp)
    80004930:	00813023          	sd	s0,0(sp)
    80004934:	01010413          	addi	s0,sp,16
    80004938:	00008797          	auipc	a5,0x8
    8000493c:	0c878793          	addi	a5,a5,200 # 8000ca00 <_ZTV7WorkerB+0x10>
    80004940:	00f53023          	sd	a5,0(a0)
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	d10080e7          	jalr	-752(ra) # 80002654 <_ZN6ThreadD1Ev>
    8000494c:	00813083          	ld	ra,8(sp)
    80004950:	00013403          	ld	s0,0(sp)
    80004954:	01010113          	addi	sp,sp,16
    80004958:	00008067          	ret

000000008000495c <_ZN7WorkerBD0Ev>:
    8000495c:	fe010113          	addi	sp,sp,-32
    80004960:	00113c23          	sd	ra,24(sp)
    80004964:	00813823          	sd	s0,16(sp)
    80004968:	00913423          	sd	s1,8(sp)
    8000496c:	02010413          	addi	s0,sp,32
    80004970:	00050493          	mv	s1,a0
    80004974:	00008797          	auipc	a5,0x8
    80004978:	08c78793          	addi	a5,a5,140 # 8000ca00 <_ZTV7WorkerB+0x10>
    8000497c:	00f53023          	sd	a5,0(a0)
    80004980:	ffffe097          	auipc	ra,0xffffe
    80004984:	cd4080e7          	jalr	-812(ra) # 80002654 <_ZN6ThreadD1Ev>
    80004988:	00048513          	mv	a0,s1
    8000498c:	ffffe097          	auipc	ra,0xffffe
    80004990:	dac080e7          	jalr	-596(ra) # 80002738 <_ZdlPv>
    80004994:	01813083          	ld	ra,24(sp)
    80004998:	01013403          	ld	s0,16(sp)
    8000499c:	00813483          	ld	s1,8(sp)
    800049a0:	02010113          	addi	sp,sp,32
    800049a4:	00008067          	ret

00000000800049a8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800049a8:	ff010113          	addi	sp,sp,-16
    800049ac:	00113423          	sd	ra,8(sp)
    800049b0:	00813023          	sd	s0,0(sp)
    800049b4:	01010413          	addi	s0,sp,16
    800049b8:	00008797          	auipc	a5,0x8
    800049bc:	07078793          	addi	a5,a5,112 # 8000ca28 <_ZTV7WorkerC+0x10>
    800049c0:	00f53023          	sd	a5,0(a0)
    800049c4:	ffffe097          	auipc	ra,0xffffe
    800049c8:	c90080e7          	jalr	-880(ra) # 80002654 <_ZN6ThreadD1Ev>
    800049cc:	00813083          	ld	ra,8(sp)
    800049d0:	00013403          	ld	s0,0(sp)
    800049d4:	01010113          	addi	sp,sp,16
    800049d8:	00008067          	ret

00000000800049dc <_ZN7WorkerCD0Ev>:
    800049dc:	fe010113          	addi	sp,sp,-32
    800049e0:	00113c23          	sd	ra,24(sp)
    800049e4:	00813823          	sd	s0,16(sp)
    800049e8:	00913423          	sd	s1,8(sp)
    800049ec:	02010413          	addi	s0,sp,32
    800049f0:	00050493          	mv	s1,a0
    800049f4:	00008797          	auipc	a5,0x8
    800049f8:	03478793          	addi	a5,a5,52 # 8000ca28 <_ZTV7WorkerC+0x10>
    800049fc:	00f53023          	sd	a5,0(a0)
    80004a00:	ffffe097          	auipc	ra,0xffffe
    80004a04:	c54080e7          	jalr	-940(ra) # 80002654 <_ZN6ThreadD1Ev>
    80004a08:	00048513          	mv	a0,s1
    80004a0c:	ffffe097          	auipc	ra,0xffffe
    80004a10:	d2c080e7          	jalr	-724(ra) # 80002738 <_ZdlPv>
    80004a14:	01813083          	ld	ra,24(sp)
    80004a18:	01013403          	ld	s0,16(sp)
    80004a1c:	00813483          	ld	s1,8(sp)
    80004a20:	02010113          	addi	sp,sp,32
    80004a24:	00008067          	ret

0000000080004a28 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004a28:	ff010113          	addi	sp,sp,-16
    80004a2c:	00113423          	sd	ra,8(sp)
    80004a30:	00813023          	sd	s0,0(sp)
    80004a34:	01010413          	addi	s0,sp,16
    80004a38:	00008797          	auipc	a5,0x8
    80004a3c:	01878793          	addi	a5,a5,24 # 8000ca50 <_ZTV7WorkerD+0x10>
    80004a40:	00f53023          	sd	a5,0(a0)
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	c10080e7          	jalr	-1008(ra) # 80002654 <_ZN6ThreadD1Ev>
    80004a4c:	00813083          	ld	ra,8(sp)
    80004a50:	00013403          	ld	s0,0(sp)
    80004a54:	01010113          	addi	sp,sp,16
    80004a58:	00008067          	ret

0000000080004a5c <_ZN7WorkerDD0Ev>:
    80004a5c:	fe010113          	addi	sp,sp,-32
    80004a60:	00113c23          	sd	ra,24(sp)
    80004a64:	00813823          	sd	s0,16(sp)
    80004a68:	00913423          	sd	s1,8(sp)
    80004a6c:	02010413          	addi	s0,sp,32
    80004a70:	00050493          	mv	s1,a0
    80004a74:	00008797          	auipc	a5,0x8
    80004a78:	fdc78793          	addi	a5,a5,-36 # 8000ca50 <_ZTV7WorkerD+0x10>
    80004a7c:	00f53023          	sd	a5,0(a0)
    80004a80:	ffffe097          	auipc	ra,0xffffe
    80004a84:	bd4080e7          	jalr	-1068(ra) # 80002654 <_ZN6ThreadD1Ev>
    80004a88:	00048513          	mv	a0,s1
    80004a8c:	ffffe097          	auipc	ra,0xffffe
    80004a90:	cac080e7          	jalr	-852(ra) # 80002738 <_ZdlPv>
    80004a94:	01813083          	ld	ra,24(sp)
    80004a98:	01013403          	ld	s0,16(sp)
    80004a9c:	00813483          	ld	s1,8(sp)
    80004aa0:	02010113          	addi	sp,sp,32
    80004aa4:	00008067          	ret

0000000080004aa8 <_ZN7WorkerA3runEv>:
    void run() override {
    80004aa8:	ff010113          	addi	sp,sp,-16
    80004aac:	00113423          	sd	ra,8(sp)
    80004ab0:	00813023          	sd	s0,0(sp)
    80004ab4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004ab8:	00000593          	li	a1,0
    80004abc:	fffff097          	auipc	ra,0xfffff
    80004ac0:	774080e7          	jalr	1908(ra) # 80004230 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004ac4:	00813083          	ld	ra,8(sp)
    80004ac8:	00013403          	ld	s0,0(sp)
    80004acc:	01010113          	addi	sp,sp,16
    80004ad0:	00008067          	ret

0000000080004ad4 <_ZN7WorkerB3runEv>:
    void run() override {
    80004ad4:	ff010113          	addi	sp,sp,-16
    80004ad8:	00113423          	sd	ra,8(sp)
    80004adc:	00813023          	sd	s0,0(sp)
    80004ae0:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004ae4:	00000593          	li	a1,0
    80004ae8:	00000097          	auipc	ra,0x0
    80004aec:	814080e7          	jalr	-2028(ra) # 800042fc <_ZN7WorkerB11workerBodyBEPv>
    }
    80004af0:	00813083          	ld	ra,8(sp)
    80004af4:	00013403          	ld	s0,0(sp)
    80004af8:	01010113          	addi	sp,sp,16
    80004afc:	00008067          	ret

0000000080004b00 <_ZN7WorkerC3runEv>:
    void run() override {
    80004b00:	ff010113          	addi	sp,sp,-16
    80004b04:	00113423          	sd	ra,8(sp)
    80004b08:	00813023          	sd	s0,0(sp)
    80004b0c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004b10:	00000593          	li	a1,0
    80004b14:	00000097          	auipc	ra,0x0
    80004b18:	8bc080e7          	jalr	-1860(ra) # 800043d0 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004b1c:	00813083          	ld	ra,8(sp)
    80004b20:	00013403          	ld	s0,0(sp)
    80004b24:	01010113          	addi	sp,sp,16
    80004b28:	00008067          	ret

0000000080004b2c <_ZN7WorkerD3runEv>:
    void run() override {
    80004b2c:	ff010113          	addi	sp,sp,-16
    80004b30:	00113423          	sd	ra,8(sp)
    80004b34:	00813023          	sd	s0,0(sp)
    80004b38:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004b3c:	00000593          	li	a1,0
    80004b40:	00000097          	auipc	ra,0x0
    80004b44:	a10080e7          	jalr	-1520(ra) # 80004550 <_ZN7WorkerD11workerBodyDEPv>
    }
    80004b48:	00813083          	ld	ra,8(sp)
    80004b4c:	00013403          	ld	s0,0(sp)
    80004b50:	01010113          	addi	sp,sp,16
    80004b54:	00008067          	ret

0000000080004b58 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004b58:	f8010113          	addi	sp,sp,-128
    80004b5c:	06113c23          	sd	ra,120(sp)
    80004b60:	06813823          	sd	s0,112(sp)
    80004b64:	06913423          	sd	s1,104(sp)
    80004b68:	07213023          	sd	s2,96(sp)
    80004b6c:	05313c23          	sd	s3,88(sp)
    80004b70:	05413823          	sd	s4,80(sp)
    80004b74:	05513423          	sd	s5,72(sp)
    80004b78:	05613023          	sd	s6,64(sp)
    80004b7c:	03713c23          	sd	s7,56(sp)
    80004b80:	03813823          	sd	s8,48(sp)
    80004b84:	03913423          	sd	s9,40(sp)
    80004b88:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004b8c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004b90:	00006517          	auipc	a0,0x6
    80004b94:	88850513          	addi	a0,a0,-1912 # 8000a418 <CONSOLE_STATUS+0x408>
    80004b98:	ffffd097          	auipc	ra,0xffffd
    80004b9c:	03c080e7          	jalr	60(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80004ba0:	01e00593          	li	a1,30
    80004ba4:	f8040493          	addi	s1,s0,-128
    80004ba8:	00048513          	mv	a0,s1
    80004bac:	ffffd097          	auipc	ra,0xffffd
    80004bb0:	138080e7          	jalr	312(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004bb4:	00048513          	mv	a0,s1
    80004bb8:	ffffd097          	auipc	ra,0xffffd
    80004bbc:	204080e7          	jalr	516(ra) # 80001dbc <_Z11stringToIntPKc>
    80004bc0:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004bc4:	00006517          	auipc	a0,0x6
    80004bc8:	87450513          	addi	a0,a0,-1932 # 8000a438 <CONSOLE_STATUS+0x428>
    80004bcc:	ffffd097          	auipc	ra,0xffffd
    80004bd0:	008080e7          	jalr	8(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80004bd4:	01e00593          	li	a1,30
    80004bd8:	00048513          	mv	a0,s1
    80004bdc:	ffffd097          	auipc	ra,0xffffd
    80004be0:	108080e7          	jalr	264(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80004be4:	00048513          	mv	a0,s1
    80004be8:	ffffd097          	auipc	ra,0xffffd
    80004bec:	1d4080e7          	jalr	468(ra) # 80001dbc <_Z11stringToIntPKc>
    80004bf0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004bf4:	00006517          	auipc	a0,0x6
    80004bf8:	86450513          	addi	a0,a0,-1948 # 8000a458 <CONSOLE_STATUS+0x448>
    80004bfc:	ffffd097          	auipc	ra,0xffffd
    80004c00:	fd8080e7          	jalr	-40(ra) # 80001bd4 <_Z11printStringPKc>
    printInt(threadNum);
    80004c04:	00000613          	li	a2,0
    80004c08:	00a00593          	li	a1,10
    80004c0c:	00098513          	mv	a0,s3
    80004c10:	ffffd097          	auipc	ra,0xffffd
    80004c14:	1fc080e7          	jalr	508(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004c18:	00006517          	auipc	a0,0x6
    80004c1c:	85850513          	addi	a0,a0,-1960 # 8000a470 <CONSOLE_STATUS+0x460>
    80004c20:	ffffd097          	auipc	ra,0xffffd
    80004c24:	fb4080e7          	jalr	-76(ra) # 80001bd4 <_Z11printStringPKc>
    printInt(n);
    80004c28:	00000613          	li	a2,0
    80004c2c:	00a00593          	li	a1,10
    80004c30:	00048513          	mv	a0,s1
    80004c34:	ffffd097          	auipc	ra,0xffffd
    80004c38:	1d8080e7          	jalr	472(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80004c3c:	00006517          	auipc	a0,0x6
    80004c40:	84c50513          	addi	a0,a0,-1972 # 8000a488 <CONSOLE_STATUS+0x478>
    80004c44:	ffffd097          	auipc	ra,0xffffd
    80004c48:	f90080e7          	jalr	-112(ra) # 80001bd4 <_Z11printStringPKc>
    if (threadNum > n) {
    80004c4c:	0334c463          	blt	s1,s3,80004c74 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004c50:	03305c63          	blez	s3,80004c88 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004c54:	03800513          	li	a0,56
    80004c58:	ffffe097          	auipc	ra,0xffffe
    80004c5c:	a90080e7          	jalr	-1392(ra) # 800026e8 <_Znwm>
    80004c60:	00050a93          	mv	s5,a0
    80004c64:	00048593          	mv	a1,s1
    80004c68:	00001097          	auipc	ra,0x1
    80004c6c:	4d8080e7          	jalr	1240(ra) # 80006140 <_ZN9BufferCPPC1Ei>
    80004c70:	0300006f          	j	80004ca0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004c74:	00006517          	auipc	a0,0x6
    80004c78:	81c50513          	addi	a0,a0,-2020 # 8000a490 <CONSOLE_STATUS+0x480>
    80004c7c:	ffffd097          	auipc	ra,0xffffd
    80004c80:	f58080e7          	jalr	-168(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004c84:	0140006f          	j	80004c98 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004c88:	00006517          	auipc	a0,0x6
    80004c8c:	84850513          	addi	a0,a0,-1976 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80004c90:	ffffd097          	auipc	ra,0xffffd
    80004c94:	f44080e7          	jalr	-188(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80004c98:	000c0113          	mv	sp,s8
    80004c9c:	2140006f          	j	80004eb0 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004ca0:	01000513          	li	a0,16
    80004ca4:	ffffe097          	auipc	ra,0xffffe
    80004ca8:	a44080e7          	jalr	-1468(ra) # 800026e8 <_Znwm>
    80004cac:	00050913          	mv	s2,a0
    80004cb0:	00000593          	li	a1,0
    80004cb4:	ffffe097          	auipc	ra,0xffffe
    80004cb8:	cb4080e7          	jalr	-844(ra) # 80002968 <_ZN9SemaphoreC1Ej>
    80004cbc:	00008797          	auipc	a5,0x8
    80004cc0:	0127b223          	sd	s2,4(a5) # 8000ccc0 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004cc4:	00399793          	slli	a5,s3,0x3
    80004cc8:	00f78793          	addi	a5,a5,15
    80004ccc:	ff07f793          	andi	a5,a5,-16
    80004cd0:	40f10133          	sub	sp,sp,a5
    80004cd4:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004cd8:	0019871b          	addiw	a4,s3,1
    80004cdc:	00171793          	slli	a5,a4,0x1
    80004ce0:	00e787b3          	add	a5,a5,a4
    80004ce4:	00379793          	slli	a5,a5,0x3
    80004ce8:	00f78793          	addi	a5,a5,15
    80004cec:	ff07f793          	andi	a5,a5,-16
    80004cf0:	40f10133          	sub	sp,sp,a5
    80004cf4:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004cf8:	00199493          	slli	s1,s3,0x1
    80004cfc:	013484b3          	add	s1,s1,s3
    80004d00:	00349493          	slli	s1,s1,0x3
    80004d04:	009b04b3          	add	s1,s6,s1
    80004d08:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004d0c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004d10:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004d14:	02800513          	li	a0,40
    80004d18:	ffffe097          	auipc	ra,0xffffe
    80004d1c:	9d0080e7          	jalr	-1584(ra) # 800026e8 <_Znwm>
    80004d20:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004d24:	ffffe097          	auipc	ra,0xffffe
    80004d28:	b14080e7          	jalr	-1260(ra) # 80002838 <_ZN6ThreadC1Ev>
    80004d2c:	00008797          	auipc	a5,0x8
    80004d30:	d9c78793          	addi	a5,a5,-612 # 8000cac8 <_ZTV8Consumer+0x10>
    80004d34:	00fbb023          	sd	a5,0(s7)
    80004d38:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004d3c:	000b8513          	mv	a0,s7
    80004d40:	ffffe097          	auipc	ra,0xffffe
    80004d44:	b30080e7          	jalr	-1232(ra) # 80002870 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004d48:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004d4c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004d50:	00008797          	auipc	a5,0x8
    80004d54:	f707b783          	ld	a5,-144(a5) # 8000ccc0 <_ZL10waitForAll>
    80004d58:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004d5c:	02800513          	li	a0,40
    80004d60:	ffffe097          	auipc	ra,0xffffe
    80004d64:	988080e7          	jalr	-1656(ra) # 800026e8 <_Znwm>
    80004d68:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004d6c:	ffffe097          	auipc	ra,0xffffe
    80004d70:	acc080e7          	jalr	-1332(ra) # 80002838 <_ZN6ThreadC1Ev>
    80004d74:	00008797          	auipc	a5,0x8
    80004d78:	d0478793          	addi	a5,a5,-764 # 8000ca78 <_ZTV16ProducerKeyborad+0x10>
    80004d7c:	00f4b023          	sd	a5,0(s1)
    80004d80:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004d84:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004d88:	00048513          	mv	a0,s1
    80004d8c:	ffffe097          	auipc	ra,0xffffe
    80004d90:	ae4080e7          	jalr	-1308(ra) # 80002870 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004d94:	00100913          	li	s2,1
    80004d98:	0300006f          	j	80004dc8 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004d9c:	00008797          	auipc	a5,0x8
    80004da0:	d0478793          	addi	a5,a5,-764 # 8000caa0 <_ZTV8Producer+0x10>
    80004da4:	00fcb023          	sd	a5,0(s9)
    80004da8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004dac:	00391793          	slli	a5,s2,0x3
    80004db0:	00fa07b3          	add	a5,s4,a5
    80004db4:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004db8:	000c8513          	mv	a0,s9
    80004dbc:	ffffe097          	auipc	ra,0xffffe
    80004dc0:	ab4080e7          	jalr	-1356(ra) # 80002870 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004dc4:	0019091b          	addiw	s2,s2,1
    80004dc8:	05395263          	bge	s2,s3,80004e0c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004dcc:	00191493          	slli	s1,s2,0x1
    80004dd0:	012484b3          	add	s1,s1,s2
    80004dd4:	00349493          	slli	s1,s1,0x3
    80004dd8:	009b04b3          	add	s1,s6,s1
    80004ddc:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004de0:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004de4:	00008797          	auipc	a5,0x8
    80004de8:	edc7b783          	ld	a5,-292(a5) # 8000ccc0 <_ZL10waitForAll>
    80004dec:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004df0:	02800513          	li	a0,40
    80004df4:	ffffe097          	auipc	ra,0xffffe
    80004df8:	8f4080e7          	jalr	-1804(ra) # 800026e8 <_Znwm>
    80004dfc:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004e00:	ffffe097          	auipc	ra,0xffffe
    80004e04:	a38080e7          	jalr	-1480(ra) # 80002838 <_ZN6ThreadC1Ev>
    80004e08:	f95ff06f          	j	80004d9c <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004e0c:	ffffe097          	auipc	ra,0xffffe
    80004e10:	ab8080e7          	jalr	-1352(ra) # 800028c4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004e14:	00000493          	li	s1,0
    80004e18:	0099ce63          	blt	s3,s1,80004e34 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004e1c:	00008517          	auipc	a0,0x8
    80004e20:	ea453503          	ld	a0,-348(a0) # 8000ccc0 <_ZL10waitForAll>
    80004e24:	ffffe097          	auipc	ra,0xffffe
    80004e28:	b7c080e7          	jalr	-1156(ra) # 800029a0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004e2c:	0014849b          	addiw	s1,s1,1
    80004e30:	fe9ff06f          	j	80004e18 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004e34:	00008517          	auipc	a0,0x8
    80004e38:	e8c53503          	ld	a0,-372(a0) # 8000ccc0 <_ZL10waitForAll>
    80004e3c:	00050863          	beqz	a0,80004e4c <_Z20testConsumerProducerv+0x2f4>
    80004e40:	00053783          	ld	a5,0(a0)
    80004e44:	0087b783          	ld	a5,8(a5)
    80004e48:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004e4c:	00000493          	li	s1,0
    80004e50:	0080006f          	j	80004e58 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004e54:	0014849b          	addiw	s1,s1,1
    80004e58:	0334d263          	bge	s1,s3,80004e7c <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004e5c:	00349793          	slli	a5,s1,0x3
    80004e60:	00fa07b3          	add	a5,s4,a5
    80004e64:	0007b503          	ld	a0,0(a5)
    80004e68:	fe0506e3          	beqz	a0,80004e54 <_Z20testConsumerProducerv+0x2fc>
    80004e6c:	00053783          	ld	a5,0(a0)
    80004e70:	0087b783          	ld	a5,8(a5)
    80004e74:	000780e7          	jalr	a5
    80004e78:	fddff06f          	j	80004e54 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004e7c:	000b8a63          	beqz	s7,80004e90 <_Z20testConsumerProducerv+0x338>
    80004e80:	000bb783          	ld	a5,0(s7)
    80004e84:	0087b783          	ld	a5,8(a5)
    80004e88:	000b8513          	mv	a0,s7
    80004e8c:	000780e7          	jalr	a5
    delete buffer;
    80004e90:	000a8e63          	beqz	s5,80004eac <_Z20testConsumerProducerv+0x354>
    80004e94:	000a8513          	mv	a0,s5
    80004e98:	00001097          	auipc	ra,0x1
    80004e9c:	5a0080e7          	jalr	1440(ra) # 80006438 <_ZN9BufferCPPD1Ev>
    80004ea0:	000a8513          	mv	a0,s5
    80004ea4:	ffffe097          	auipc	ra,0xffffe
    80004ea8:	894080e7          	jalr	-1900(ra) # 80002738 <_ZdlPv>
    80004eac:	000c0113          	mv	sp,s8
}
    80004eb0:	f8040113          	addi	sp,s0,-128
    80004eb4:	07813083          	ld	ra,120(sp)
    80004eb8:	07013403          	ld	s0,112(sp)
    80004ebc:	06813483          	ld	s1,104(sp)
    80004ec0:	06013903          	ld	s2,96(sp)
    80004ec4:	05813983          	ld	s3,88(sp)
    80004ec8:	05013a03          	ld	s4,80(sp)
    80004ecc:	04813a83          	ld	s5,72(sp)
    80004ed0:	04013b03          	ld	s6,64(sp)
    80004ed4:	03813b83          	ld	s7,56(sp)
    80004ed8:	03013c03          	ld	s8,48(sp)
    80004edc:	02813c83          	ld	s9,40(sp)
    80004ee0:	08010113          	addi	sp,sp,128
    80004ee4:	00008067          	ret
    80004ee8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004eec:	000a8513          	mv	a0,s5
    80004ef0:	ffffe097          	auipc	ra,0xffffe
    80004ef4:	848080e7          	jalr	-1976(ra) # 80002738 <_ZdlPv>
    80004ef8:	00048513          	mv	a0,s1
    80004efc:	00009097          	auipc	ra,0x9
    80004f00:	ebc080e7          	jalr	-324(ra) # 8000ddb8 <_Unwind_Resume>
    80004f04:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004f08:	00090513          	mv	a0,s2
    80004f0c:	ffffe097          	auipc	ra,0xffffe
    80004f10:	82c080e7          	jalr	-2004(ra) # 80002738 <_ZdlPv>
    80004f14:	00048513          	mv	a0,s1
    80004f18:	00009097          	auipc	ra,0x9
    80004f1c:	ea0080e7          	jalr	-352(ra) # 8000ddb8 <_Unwind_Resume>
    80004f20:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004f24:	000b8513          	mv	a0,s7
    80004f28:	ffffe097          	auipc	ra,0xffffe
    80004f2c:	810080e7          	jalr	-2032(ra) # 80002738 <_ZdlPv>
    80004f30:	00048513          	mv	a0,s1
    80004f34:	00009097          	auipc	ra,0x9
    80004f38:	e84080e7          	jalr	-380(ra) # 8000ddb8 <_Unwind_Resume>
    80004f3c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004f40:	00048513          	mv	a0,s1
    80004f44:	ffffd097          	auipc	ra,0xffffd
    80004f48:	7f4080e7          	jalr	2036(ra) # 80002738 <_ZdlPv>
    80004f4c:	00090513          	mv	a0,s2
    80004f50:	00009097          	auipc	ra,0x9
    80004f54:	e68080e7          	jalr	-408(ra) # 8000ddb8 <_Unwind_Resume>
    80004f58:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004f5c:	000c8513          	mv	a0,s9
    80004f60:	ffffd097          	auipc	ra,0xffffd
    80004f64:	7d8080e7          	jalr	2008(ra) # 80002738 <_ZdlPv>
    80004f68:	00048513          	mv	a0,s1
    80004f6c:	00009097          	auipc	ra,0x9
    80004f70:	e4c080e7          	jalr	-436(ra) # 8000ddb8 <_Unwind_Resume>

0000000080004f74 <_ZN8Consumer3runEv>:
    void run() override {
    80004f74:	fd010113          	addi	sp,sp,-48
    80004f78:	02113423          	sd	ra,40(sp)
    80004f7c:	02813023          	sd	s0,32(sp)
    80004f80:	00913c23          	sd	s1,24(sp)
    80004f84:	01213823          	sd	s2,16(sp)
    80004f88:	01313423          	sd	s3,8(sp)
    80004f8c:	03010413          	addi	s0,sp,48
    80004f90:	00050913          	mv	s2,a0
        int i = 0;
    80004f94:	00000993          	li	s3,0
    80004f98:	0100006f          	j	80004fa8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004f9c:	00a00513          	li	a0,10
    80004fa0:	ffffe097          	auipc	ra,0xffffe
    80004fa4:	aec080e7          	jalr	-1300(ra) # 80002a8c <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004fa8:	00008797          	auipc	a5,0x8
    80004fac:	d107a783          	lw	a5,-752(a5) # 8000ccb8 <_ZL9threadEnd>
    80004fb0:	04079a63          	bnez	a5,80005004 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004fb4:	02093783          	ld	a5,32(s2)
    80004fb8:	0087b503          	ld	a0,8(a5)
    80004fbc:	00001097          	auipc	ra,0x1
    80004fc0:	368080e7          	jalr	872(ra) # 80006324 <_ZN9BufferCPP3getEv>
            i++;
    80004fc4:	0019849b          	addiw	s1,s3,1
    80004fc8:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004fcc:	0ff57513          	andi	a0,a0,255
    80004fd0:	ffffe097          	auipc	ra,0xffffe
    80004fd4:	abc080e7          	jalr	-1348(ra) # 80002a8c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004fd8:	05000793          	li	a5,80
    80004fdc:	02f4e4bb          	remw	s1,s1,a5
    80004fe0:	fc0494e3          	bnez	s1,80004fa8 <_ZN8Consumer3runEv+0x34>
    80004fe4:	fb9ff06f          	j	80004f9c <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004fe8:	02093783          	ld	a5,32(s2)
    80004fec:	0087b503          	ld	a0,8(a5)
    80004ff0:	00001097          	auipc	ra,0x1
    80004ff4:	334080e7          	jalr	820(ra) # 80006324 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004ff8:	0ff57513          	andi	a0,a0,255
    80004ffc:	ffffe097          	auipc	ra,0xffffe
    80005000:	a90080e7          	jalr	-1392(ra) # 80002a8c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005004:	02093783          	ld	a5,32(s2)
    80005008:	0087b503          	ld	a0,8(a5)
    8000500c:	00001097          	auipc	ra,0x1
    80005010:	3a4080e7          	jalr	932(ra) # 800063b0 <_ZN9BufferCPP6getCntEv>
    80005014:	fca04ae3          	bgtz	a0,80004fe8 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005018:	02093783          	ld	a5,32(s2)
    8000501c:	0107b503          	ld	a0,16(a5)
    80005020:	ffffe097          	auipc	ra,0xffffe
    80005024:	9ac080e7          	jalr	-1620(ra) # 800029cc <_ZN9Semaphore6signalEv>
    }
    80005028:	02813083          	ld	ra,40(sp)
    8000502c:	02013403          	ld	s0,32(sp)
    80005030:	01813483          	ld	s1,24(sp)
    80005034:	01013903          	ld	s2,16(sp)
    80005038:	00813983          	ld	s3,8(sp)
    8000503c:	03010113          	addi	sp,sp,48
    80005040:	00008067          	ret

0000000080005044 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005044:	ff010113          	addi	sp,sp,-16
    80005048:	00113423          	sd	ra,8(sp)
    8000504c:	00813023          	sd	s0,0(sp)
    80005050:	01010413          	addi	s0,sp,16
    80005054:	00008797          	auipc	a5,0x8
    80005058:	a7478793          	addi	a5,a5,-1420 # 8000cac8 <_ZTV8Consumer+0x10>
    8000505c:	00f53023          	sd	a5,0(a0)
    80005060:	ffffd097          	auipc	ra,0xffffd
    80005064:	5f4080e7          	jalr	1524(ra) # 80002654 <_ZN6ThreadD1Ev>
    80005068:	00813083          	ld	ra,8(sp)
    8000506c:	00013403          	ld	s0,0(sp)
    80005070:	01010113          	addi	sp,sp,16
    80005074:	00008067          	ret

0000000080005078 <_ZN8ConsumerD0Ev>:
    80005078:	fe010113          	addi	sp,sp,-32
    8000507c:	00113c23          	sd	ra,24(sp)
    80005080:	00813823          	sd	s0,16(sp)
    80005084:	00913423          	sd	s1,8(sp)
    80005088:	02010413          	addi	s0,sp,32
    8000508c:	00050493          	mv	s1,a0
    80005090:	00008797          	auipc	a5,0x8
    80005094:	a3878793          	addi	a5,a5,-1480 # 8000cac8 <_ZTV8Consumer+0x10>
    80005098:	00f53023          	sd	a5,0(a0)
    8000509c:	ffffd097          	auipc	ra,0xffffd
    800050a0:	5b8080e7          	jalr	1464(ra) # 80002654 <_ZN6ThreadD1Ev>
    800050a4:	00048513          	mv	a0,s1
    800050a8:	ffffd097          	auipc	ra,0xffffd
    800050ac:	690080e7          	jalr	1680(ra) # 80002738 <_ZdlPv>
    800050b0:	01813083          	ld	ra,24(sp)
    800050b4:	01013403          	ld	s0,16(sp)
    800050b8:	00813483          	ld	s1,8(sp)
    800050bc:	02010113          	addi	sp,sp,32
    800050c0:	00008067          	ret

00000000800050c4 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800050c4:	ff010113          	addi	sp,sp,-16
    800050c8:	00113423          	sd	ra,8(sp)
    800050cc:	00813023          	sd	s0,0(sp)
    800050d0:	01010413          	addi	s0,sp,16
    800050d4:	00008797          	auipc	a5,0x8
    800050d8:	9a478793          	addi	a5,a5,-1628 # 8000ca78 <_ZTV16ProducerKeyborad+0x10>
    800050dc:	00f53023          	sd	a5,0(a0)
    800050e0:	ffffd097          	auipc	ra,0xffffd
    800050e4:	574080e7          	jalr	1396(ra) # 80002654 <_ZN6ThreadD1Ev>
    800050e8:	00813083          	ld	ra,8(sp)
    800050ec:	00013403          	ld	s0,0(sp)
    800050f0:	01010113          	addi	sp,sp,16
    800050f4:	00008067          	ret

00000000800050f8 <_ZN16ProducerKeyboradD0Ev>:
    800050f8:	fe010113          	addi	sp,sp,-32
    800050fc:	00113c23          	sd	ra,24(sp)
    80005100:	00813823          	sd	s0,16(sp)
    80005104:	00913423          	sd	s1,8(sp)
    80005108:	02010413          	addi	s0,sp,32
    8000510c:	00050493          	mv	s1,a0
    80005110:	00008797          	auipc	a5,0x8
    80005114:	96878793          	addi	a5,a5,-1688 # 8000ca78 <_ZTV16ProducerKeyborad+0x10>
    80005118:	00f53023          	sd	a5,0(a0)
    8000511c:	ffffd097          	auipc	ra,0xffffd
    80005120:	538080e7          	jalr	1336(ra) # 80002654 <_ZN6ThreadD1Ev>
    80005124:	00048513          	mv	a0,s1
    80005128:	ffffd097          	auipc	ra,0xffffd
    8000512c:	610080e7          	jalr	1552(ra) # 80002738 <_ZdlPv>
    80005130:	01813083          	ld	ra,24(sp)
    80005134:	01013403          	ld	s0,16(sp)
    80005138:	00813483          	ld	s1,8(sp)
    8000513c:	02010113          	addi	sp,sp,32
    80005140:	00008067          	ret

0000000080005144 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005144:	ff010113          	addi	sp,sp,-16
    80005148:	00113423          	sd	ra,8(sp)
    8000514c:	00813023          	sd	s0,0(sp)
    80005150:	01010413          	addi	s0,sp,16
    80005154:	00008797          	auipc	a5,0x8
    80005158:	94c78793          	addi	a5,a5,-1716 # 8000caa0 <_ZTV8Producer+0x10>
    8000515c:	00f53023          	sd	a5,0(a0)
    80005160:	ffffd097          	auipc	ra,0xffffd
    80005164:	4f4080e7          	jalr	1268(ra) # 80002654 <_ZN6ThreadD1Ev>
    80005168:	00813083          	ld	ra,8(sp)
    8000516c:	00013403          	ld	s0,0(sp)
    80005170:	01010113          	addi	sp,sp,16
    80005174:	00008067          	ret

0000000080005178 <_ZN8ProducerD0Ev>:
    80005178:	fe010113          	addi	sp,sp,-32
    8000517c:	00113c23          	sd	ra,24(sp)
    80005180:	00813823          	sd	s0,16(sp)
    80005184:	00913423          	sd	s1,8(sp)
    80005188:	02010413          	addi	s0,sp,32
    8000518c:	00050493          	mv	s1,a0
    80005190:	00008797          	auipc	a5,0x8
    80005194:	91078793          	addi	a5,a5,-1776 # 8000caa0 <_ZTV8Producer+0x10>
    80005198:	00f53023          	sd	a5,0(a0)
    8000519c:	ffffd097          	auipc	ra,0xffffd
    800051a0:	4b8080e7          	jalr	1208(ra) # 80002654 <_ZN6ThreadD1Ev>
    800051a4:	00048513          	mv	a0,s1
    800051a8:	ffffd097          	auipc	ra,0xffffd
    800051ac:	590080e7          	jalr	1424(ra) # 80002738 <_ZdlPv>
    800051b0:	01813083          	ld	ra,24(sp)
    800051b4:	01013403          	ld	s0,16(sp)
    800051b8:	00813483          	ld	s1,8(sp)
    800051bc:	02010113          	addi	sp,sp,32
    800051c0:	00008067          	ret

00000000800051c4 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800051c4:	fe010113          	addi	sp,sp,-32
    800051c8:	00113c23          	sd	ra,24(sp)
    800051cc:	00813823          	sd	s0,16(sp)
    800051d0:	00913423          	sd	s1,8(sp)
    800051d4:	02010413          	addi	s0,sp,32
    800051d8:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800051dc:	ffffc097          	auipc	ra,0xffffc
    800051e0:	538080e7          	jalr	1336(ra) # 80001714 <_Z4getcv>
    800051e4:	0005059b          	sext.w	a1,a0
    800051e8:	01b00793          	li	a5,27
    800051ec:	00f58c63          	beq	a1,a5,80005204 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800051f0:	0204b783          	ld	a5,32(s1)
    800051f4:	0087b503          	ld	a0,8(a5)
    800051f8:	00001097          	auipc	ra,0x1
    800051fc:	09c080e7          	jalr	156(ra) # 80006294 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80005200:	fddff06f          	j	800051dc <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005204:	00100793          	li	a5,1
    80005208:	00008717          	auipc	a4,0x8
    8000520c:	aaf72823          	sw	a5,-1360(a4) # 8000ccb8 <_ZL9threadEnd>
        td->buffer->put('!');
    80005210:	0204b783          	ld	a5,32(s1)
    80005214:	02100593          	li	a1,33
    80005218:	0087b503          	ld	a0,8(a5)
    8000521c:	00001097          	auipc	ra,0x1
    80005220:	078080e7          	jalr	120(ra) # 80006294 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005224:	0204b783          	ld	a5,32(s1)
    80005228:	0107b503          	ld	a0,16(a5)
    8000522c:	ffffd097          	auipc	ra,0xffffd
    80005230:	7a0080e7          	jalr	1952(ra) # 800029cc <_ZN9Semaphore6signalEv>
    }
    80005234:	01813083          	ld	ra,24(sp)
    80005238:	01013403          	ld	s0,16(sp)
    8000523c:	00813483          	ld	s1,8(sp)
    80005240:	02010113          	addi	sp,sp,32
    80005244:	00008067          	ret

0000000080005248 <_ZN8Producer3runEv>:
    void run() override {
    80005248:	fe010113          	addi	sp,sp,-32
    8000524c:	00113c23          	sd	ra,24(sp)
    80005250:	00813823          	sd	s0,16(sp)
    80005254:	00913423          	sd	s1,8(sp)
    80005258:	01213023          	sd	s2,0(sp)
    8000525c:	02010413          	addi	s0,sp,32
    80005260:	00050493          	mv	s1,a0
        int i = 0;
    80005264:	00000913          	li	s2,0
        while (!threadEnd) {
    80005268:	00008797          	auipc	a5,0x8
    8000526c:	a507a783          	lw	a5,-1456(a5) # 8000ccb8 <_ZL9threadEnd>
    80005270:	04079263          	bnez	a5,800052b4 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80005274:	0204b783          	ld	a5,32(s1)
    80005278:	0007a583          	lw	a1,0(a5)
    8000527c:	0305859b          	addiw	a1,a1,48
    80005280:	0087b503          	ld	a0,8(a5)
    80005284:	00001097          	auipc	ra,0x1
    80005288:	010080e7          	jalr	16(ra) # 80006294 <_ZN9BufferCPP3putEi>
            i++;
    8000528c:	0019071b          	addiw	a4,s2,1
    80005290:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80005294:	0204b783          	ld	a5,32(s1)
    80005298:	0007a783          	lw	a5,0(a5)
    8000529c:	00e787bb          	addw	a5,a5,a4
    800052a0:	00500513          	li	a0,5
    800052a4:	02a7e53b          	remw	a0,a5,a0
    800052a8:	ffffd097          	auipc	ra,0xffffd
    800052ac:	644080e7          	jalr	1604(ra) # 800028ec <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    800052b0:	fb9ff06f          	j	80005268 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    800052b4:	0204b783          	ld	a5,32(s1)
    800052b8:	0107b503          	ld	a0,16(a5)
    800052bc:	ffffd097          	auipc	ra,0xffffd
    800052c0:	710080e7          	jalr	1808(ra) # 800029cc <_ZN9Semaphore6signalEv>
    }
    800052c4:	01813083          	ld	ra,24(sp)
    800052c8:	01013403          	ld	s0,16(sp)
    800052cc:	00813483          	ld	s1,8(sp)
    800052d0:	00013903          	ld	s2,0(sp)
    800052d4:	02010113          	addi	sp,sp,32
    800052d8:	00008067          	ret

00000000800052dc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800052dc:	fe010113          	addi	sp,sp,-32
    800052e0:	00113c23          	sd	ra,24(sp)
    800052e4:	00813823          	sd	s0,16(sp)
    800052e8:	00913423          	sd	s1,8(sp)
    800052ec:	01213023          	sd	s2,0(sp)
    800052f0:	02010413          	addi	s0,sp,32
    800052f4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800052f8:	00100793          	li	a5,1
    800052fc:	02a7f863          	bgeu	a5,a0,8000532c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005300:	00a00793          	li	a5,10
    80005304:	02f577b3          	remu	a5,a0,a5
    80005308:	02078e63          	beqz	a5,80005344 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000530c:	fff48513          	addi	a0,s1,-1
    80005310:	00000097          	auipc	ra,0x0
    80005314:	fcc080e7          	jalr	-52(ra) # 800052dc <_ZL9fibonaccim>
    80005318:	00050913          	mv	s2,a0
    8000531c:	ffe48513          	addi	a0,s1,-2
    80005320:	00000097          	auipc	ra,0x0
    80005324:	fbc080e7          	jalr	-68(ra) # 800052dc <_ZL9fibonaccim>
    80005328:	00a90533          	add	a0,s2,a0
}
    8000532c:	01813083          	ld	ra,24(sp)
    80005330:	01013403          	ld	s0,16(sp)
    80005334:	00813483          	ld	s1,8(sp)
    80005338:	00013903          	ld	s2,0(sp)
    8000533c:	02010113          	addi	sp,sp,32
    80005340:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005344:	ffffc097          	auipc	ra,0xffffc
    80005348:	19c080e7          	jalr	412(ra) # 800014e0 <_Z15thread_dispatchv>
    8000534c:	fc1ff06f          	j	8000530c <_ZL9fibonaccim+0x30>

0000000080005350 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005350:	fe010113          	addi	sp,sp,-32
    80005354:	00113c23          	sd	ra,24(sp)
    80005358:	00813823          	sd	s0,16(sp)
    8000535c:	00913423          	sd	s1,8(sp)
    80005360:	01213023          	sd	s2,0(sp)
    80005364:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005368:	00a00493          	li	s1,10
    8000536c:	0400006f          	j	800053ac <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005370:	00005517          	auipc	a0,0x5
    80005374:	1f050513          	addi	a0,a0,496 # 8000a560 <CONSOLE_STATUS+0x550>
    80005378:	ffffd097          	auipc	ra,0xffffd
    8000537c:	85c080e7          	jalr	-1956(ra) # 80001bd4 <_Z11printStringPKc>
    80005380:	00000613          	li	a2,0
    80005384:	00a00593          	li	a1,10
    80005388:	00048513          	mv	a0,s1
    8000538c:	ffffd097          	auipc	ra,0xffffd
    80005390:	a80080e7          	jalr	-1408(ra) # 80001e0c <_Z8printIntiii>
    80005394:	00005517          	auipc	a0,0x5
    80005398:	f4c50513          	addi	a0,a0,-180 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000539c:	ffffd097          	auipc	ra,0xffffd
    800053a0:	838080e7          	jalr	-1992(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800053a4:	0014849b          	addiw	s1,s1,1
    800053a8:	0ff4f493          	andi	s1,s1,255
    800053ac:	00c00793          	li	a5,12
    800053b0:	fc97f0e3          	bgeu	a5,s1,80005370 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800053b4:	00005517          	auipc	a0,0x5
    800053b8:	1b450513          	addi	a0,a0,436 # 8000a568 <CONSOLE_STATUS+0x558>
    800053bc:	ffffd097          	auipc	ra,0xffffd
    800053c0:	818080e7          	jalr	-2024(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800053c4:	00500313          	li	t1,5
    thread_dispatch();
    800053c8:	ffffc097          	auipc	ra,0xffffc
    800053cc:	118080e7          	jalr	280(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800053d0:	01000513          	li	a0,16
    800053d4:	00000097          	auipc	ra,0x0
    800053d8:	f08080e7          	jalr	-248(ra) # 800052dc <_ZL9fibonaccim>
    800053dc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800053e0:	00005517          	auipc	a0,0x5
    800053e4:	19850513          	addi	a0,a0,408 # 8000a578 <CONSOLE_STATUS+0x568>
    800053e8:	ffffc097          	auipc	ra,0xffffc
    800053ec:	7ec080e7          	jalr	2028(ra) # 80001bd4 <_Z11printStringPKc>
    800053f0:	00000613          	li	a2,0
    800053f4:	00a00593          	li	a1,10
    800053f8:	0009051b          	sext.w	a0,s2
    800053fc:	ffffd097          	auipc	ra,0xffffd
    80005400:	a10080e7          	jalr	-1520(ra) # 80001e0c <_Z8printIntiii>
    80005404:	00005517          	auipc	a0,0x5
    80005408:	edc50513          	addi	a0,a0,-292 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000540c:	ffffc097          	auipc	ra,0xffffc
    80005410:	7c8080e7          	jalr	1992(ra) # 80001bd4 <_Z11printStringPKc>
    80005414:	0400006f          	j	80005454 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005418:	00005517          	auipc	a0,0x5
    8000541c:	14850513          	addi	a0,a0,328 # 8000a560 <CONSOLE_STATUS+0x550>
    80005420:	ffffc097          	auipc	ra,0xffffc
    80005424:	7b4080e7          	jalr	1972(ra) # 80001bd4 <_Z11printStringPKc>
    80005428:	00000613          	li	a2,0
    8000542c:	00a00593          	li	a1,10
    80005430:	00048513          	mv	a0,s1
    80005434:	ffffd097          	auipc	ra,0xffffd
    80005438:	9d8080e7          	jalr	-1576(ra) # 80001e0c <_Z8printIntiii>
    8000543c:	00005517          	auipc	a0,0x5
    80005440:	ea450513          	addi	a0,a0,-348 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005444:	ffffc097          	auipc	ra,0xffffc
    80005448:	790080e7          	jalr	1936(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000544c:	0014849b          	addiw	s1,s1,1
    80005450:	0ff4f493          	andi	s1,s1,255
    80005454:	00f00793          	li	a5,15
    80005458:	fc97f0e3          	bgeu	a5,s1,80005418 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000545c:	00005517          	auipc	a0,0x5
    80005460:	12c50513          	addi	a0,a0,300 # 8000a588 <CONSOLE_STATUS+0x578>
    80005464:	ffffc097          	auipc	ra,0xffffc
    80005468:	770080e7          	jalr	1904(ra) # 80001bd4 <_Z11printStringPKc>
    finishedD = true;
    8000546c:	00100793          	li	a5,1
    80005470:	00008717          	auipc	a4,0x8
    80005474:	84f70c23          	sb	a5,-1960(a4) # 8000ccc8 <_ZL9finishedD>
    thread_dispatch();
    80005478:	ffffc097          	auipc	ra,0xffffc
    8000547c:	068080e7          	jalr	104(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005480:	01813083          	ld	ra,24(sp)
    80005484:	01013403          	ld	s0,16(sp)
    80005488:	00813483          	ld	s1,8(sp)
    8000548c:	00013903          	ld	s2,0(sp)
    80005490:	02010113          	addi	sp,sp,32
    80005494:	00008067          	ret

0000000080005498 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005498:	fe010113          	addi	sp,sp,-32
    8000549c:	00113c23          	sd	ra,24(sp)
    800054a0:	00813823          	sd	s0,16(sp)
    800054a4:	00913423          	sd	s1,8(sp)
    800054a8:	01213023          	sd	s2,0(sp)
    800054ac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800054b0:	00000493          	li	s1,0
    800054b4:	0400006f          	j	800054f4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800054b8:	00005517          	auipc	a0,0x5
    800054bc:	07850513          	addi	a0,a0,120 # 8000a530 <CONSOLE_STATUS+0x520>
    800054c0:	ffffc097          	auipc	ra,0xffffc
    800054c4:	714080e7          	jalr	1812(ra) # 80001bd4 <_Z11printStringPKc>
    800054c8:	00000613          	li	a2,0
    800054cc:	00a00593          	li	a1,10
    800054d0:	00048513          	mv	a0,s1
    800054d4:	ffffd097          	auipc	ra,0xffffd
    800054d8:	938080e7          	jalr	-1736(ra) # 80001e0c <_Z8printIntiii>
    800054dc:	00005517          	auipc	a0,0x5
    800054e0:	e0450513          	addi	a0,a0,-508 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800054e4:	ffffc097          	auipc	ra,0xffffc
    800054e8:	6f0080e7          	jalr	1776(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800054ec:	0014849b          	addiw	s1,s1,1
    800054f0:	0ff4f493          	andi	s1,s1,255
    800054f4:	00200793          	li	a5,2
    800054f8:	fc97f0e3          	bgeu	a5,s1,800054b8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800054fc:	00005517          	auipc	a0,0x5
    80005500:	03c50513          	addi	a0,a0,60 # 8000a538 <CONSOLE_STATUS+0x528>
    80005504:	ffffc097          	auipc	ra,0xffffc
    80005508:	6d0080e7          	jalr	1744(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000550c:	00700313          	li	t1,7
    thread_dispatch();
    80005510:	ffffc097          	auipc	ra,0xffffc
    80005514:	fd0080e7          	jalr	-48(ra) # 800014e0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005518:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000551c:	00005517          	auipc	a0,0x5
    80005520:	02c50513          	addi	a0,a0,44 # 8000a548 <CONSOLE_STATUS+0x538>
    80005524:	ffffc097          	auipc	ra,0xffffc
    80005528:	6b0080e7          	jalr	1712(ra) # 80001bd4 <_Z11printStringPKc>
    8000552c:	00000613          	li	a2,0
    80005530:	00a00593          	li	a1,10
    80005534:	0009051b          	sext.w	a0,s2
    80005538:	ffffd097          	auipc	ra,0xffffd
    8000553c:	8d4080e7          	jalr	-1836(ra) # 80001e0c <_Z8printIntiii>
    80005540:	00005517          	auipc	a0,0x5
    80005544:	da050513          	addi	a0,a0,-608 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005548:	ffffc097          	auipc	ra,0xffffc
    8000554c:	68c080e7          	jalr	1676(ra) # 80001bd4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005550:	00c00513          	li	a0,12
    80005554:	00000097          	auipc	ra,0x0
    80005558:	d88080e7          	jalr	-632(ra) # 800052dc <_ZL9fibonaccim>
    8000555c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005560:	00005517          	auipc	a0,0x5
    80005564:	ff050513          	addi	a0,a0,-16 # 8000a550 <CONSOLE_STATUS+0x540>
    80005568:	ffffc097          	auipc	ra,0xffffc
    8000556c:	66c080e7          	jalr	1644(ra) # 80001bd4 <_Z11printStringPKc>
    80005570:	00000613          	li	a2,0
    80005574:	00a00593          	li	a1,10
    80005578:	0009051b          	sext.w	a0,s2
    8000557c:	ffffd097          	auipc	ra,0xffffd
    80005580:	890080e7          	jalr	-1904(ra) # 80001e0c <_Z8printIntiii>
    80005584:	00005517          	auipc	a0,0x5
    80005588:	d5c50513          	addi	a0,a0,-676 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000558c:	ffffc097          	auipc	ra,0xffffc
    80005590:	648080e7          	jalr	1608(ra) # 80001bd4 <_Z11printStringPKc>
    80005594:	0400006f          	j	800055d4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005598:	00005517          	auipc	a0,0x5
    8000559c:	f9850513          	addi	a0,a0,-104 # 8000a530 <CONSOLE_STATUS+0x520>
    800055a0:	ffffc097          	auipc	ra,0xffffc
    800055a4:	634080e7          	jalr	1588(ra) # 80001bd4 <_Z11printStringPKc>
    800055a8:	00000613          	li	a2,0
    800055ac:	00a00593          	li	a1,10
    800055b0:	00048513          	mv	a0,s1
    800055b4:	ffffd097          	auipc	ra,0xffffd
    800055b8:	858080e7          	jalr	-1960(ra) # 80001e0c <_Z8printIntiii>
    800055bc:	00005517          	auipc	a0,0x5
    800055c0:	d2450513          	addi	a0,a0,-732 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800055c4:	ffffc097          	auipc	ra,0xffffc
    800055c8:	610080e7          	jalr	1552(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800055cc:	0014849b          	addiw	s1,s1,1
    800055d0:	0ff4f493          	andi	s1,s1,255
    800055d4:	00500793          	li	a5,5
    800055d8:	fc97f0e3          	bgeu	a5,s1,80005598 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800055dc:	00005517          	auipc	a0,0x5
    800055e0:	f2c50513          	addi	a0,a0,-212 # 8000a508 <CONSOLE_STATUS+0x4f8>
    800055e4:	ffffc097          	auipc	ra,0xffffc
    800055e8:	5f0080e7          	jalr	1520(ra) # 80001bd4 <_Z11printStringPKc>
    finishedC = true;
    800055ec:	00100793          	li	a5,1
    800055f0:	00007717          	auipc	a4,0x7
    800055f4:	6cf70ca3          	sb	a5,1753(a4) # 8000ccc9 <_ZL9finishedC>
    thread_dispatch();
    800055f8:	ffffc097          	auipc	ra,0xffffc
    800055fc:	ee8080e7          	jalr	-280(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80005600:	01813083          	ld	ra,24(sp)
    80005604:	01013403          	ld	s0,16(sp)
    80005608:	00813483          	ld	s1,8(sp)
    8000560c:	00013903          	ld	s2,0(sp)
    80005610:	02010113          	addi	sp,sp,32
    80005614:	00008067          	ret

0000000080005618 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005618:	fe010113          	addi	sp,sp,-32
    8000561c:	00113c23          	sd	ra,24(sp)
    80005620:	00813823          	sd	s0,16(sp)
    80005624:	00913423          	sd	s1,8(sp)
    80005628:	01213023          	sd	s2,0(sp)
    8000562c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005630:	00000913          	li	s2,0
    80005634:	0380006f          	j	8000566c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005638:	ffffc097          	auipc	ra,0xffffc
    8000563c:	ea8080e7          	jalr	-344(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005640:	00148493          	addi	s1,s1,1
    80005644:	000027b7          	lui	a5,0x2
    80005648:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000564c:	0097ee63          	bltu	a5,s1,80005668 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005650:	00000713          	li	a4,0
    80005654:	000077b7          	lui	a5,0x7
    80005658:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000565c:	fce7eee3          	bltu	a5,a4,80005638 <_ZL11workerBodyBPv+0x20>
    80005660:	00170713          	addi	a4,a4,1
    80005664:	ff1ff06f          	j	80005654 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005668:	00190913          	addi	s2,s2,1
    8000566c:	00f00793          	li	a5,15
    80005670:	0527e063          	bltu	a5,s2,800056b0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005674:	00005517          	auipc	a0,0x5
    80005678:	ea450513          	addi	a0,a0,-348 # 8000a518 <CONSOLE_STATUS+0x508>
    8000567c:	ffffc097          	auipc	ra,0xffffc
    80005680:	558080e7          	jalr	1368(ra) # 80001bd4 <_Z11printStringPKc>
    80005684:	00000613          	li	a2,0
    80005688:	00a00593          	li	a1,10
    8000568c:	0009051b          	sext.w	a0,s2
    80005690:	ffffc097          	auipc	ra,0xffffc
    80005694:	77c080e7          	jalr	1916(ra) # 80001e0c <_Z8printIntiii>
    80005698:	00005517          	auipc	a0,0x5
    8000569c:	c4850513          	addi	a0,a0,-952 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800056a0:	ffffc097          	auipc	ra,0xffffc
    800056a4:	534080e7          	jalr	1332(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800056a8:	00000493          	li	s1,0
    800056ac:	f99ff06f          	j	80005644 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800056b0:	00005517          	auipc	a0,0x5
    800056b4:	e7050513          	addi	a0,a0,-400 # 8000a520 <CONSOLE_STATUS+0x510>
    800056b8:	ffffc097          	auipc	ra,0xffffc
    800056bc:	51c080e7          	jalr	1308(ra) # 80001bd4 <_Z11printStringPKc>
    finishedB = true;
    800056c0:	00100793          	li	a5,1
    800056c4:	00007717          	auipc	a4,0x7
    800056c8:	60f70323          	sb	a5,1542(a4) # 8000ccca <_ZL9finishedB>
    thread_dispatch();
    800056cc:	ffffc097          	auipc	ra,0xffffc
    800056d0:	e14080e7          	jalr	-492(ra) # 800014e0 <_Z15thread_dispatchv>
}
    800056d4:	01813083          	ld	ra,24(sp)
    800056d8:	01013403          	ld	s0,16(sp)
    800056dc:	00813483          	ld	s1,8(sp)
    800056e0:	00013903          	ld	s2,0(sp)
    800056e4:	02010113          	addi	sp,sp,32
    800056e8:	00008067          	ret

00000000800056ec <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800056ec:	fe010113          	addi	sp,sp,-32
    800056f0:	00113c23          	sd	ra,24(sp)
    800056f4:	00813823          	sd	s0,16(sp)
    800056f8:	00913423          	sd	s1,8(sp)
    800056fc:	01213023          	sd	s2,0(sp)
    80005700:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005704:	00000913          	li	s2,0
    80005708:	0380006f          	j	80005740 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000570c:	ffffc097          	auipc	ra,0xffffc
    80005710:	dd4080e7          	jalr	-556(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005714:	00148493          	addi	s1,s1,1
    80005718:	000027b7          	lui	a5,0x2
    8000571c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005720:	0097ee63          	bltu	a5,s1,8000573c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005724:	00000713          	li	a4,0
    80005728:	000077b7          	lui	a5,0x7
    8000572c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005730:	fce7eee3          	bltu	a5,a4,8000570c <_ZL11workerBodyAPv+0x20>
    80005734:	00170713          	addi	a4,a4,1
    80005738:	ff1ff06f          	j	80005728 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000573c:	00190913          	addi	s2,s2,1
    80005740:	00900793          	li	a5,9
    80005744:	0527e063          	bltu	a5,s2,80005784 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005748:	00005517          	auipc	a0,0x5
    8000574c:	db850513          	addi	a0,a0,-584 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80005750:	ffffc097          	auipc	ra,0xffffc
    80005754:	484080e7          	jalr	1156(ra) # 80001bd4 <_Z11printStringPKc>
    80005758:	00000613          	li	a2,0
    8000575c:	00a00593          	li	a1,10
    80005760:	0009051b          	sext.w	a0,s2
    80005764:	ffffc097          	auipc	ra,0xffffc
    80005768:	6a8080e7          	jalr	1704(ra) # 80001e0c <_Z8printIntiii>
    8000576c:	00005517          	auipc	a0,0x5
    80005770:	b7450513          	addi	a0,a0,-1164 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005774:	ffffc097          	auipc	ra,0xffffc
    80005778:	460080e7          	jalr	1120(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000577c:	00000493          	li	s1,0
    80005780:	f99ff06f          	j	80005718 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005784:	00005517          	auipc	a0,0x5
    80005788:	d8450513          	addi	a0,a0,-636 # 8000a508 <CONSOLE_STATUS+0x4f8>
    8000578c:	ffffc097          	auipc	ra,0xffffc
    80005790:	448080e7          	jalr	1096(ra) # 80001bd4 <_Z11printStringPKc>
    finishedA = true;
    80005794:	00100793          	li	a5,1
    80005798:	00007717          	auipc	a4,0x7
    8000579c:	52f709a3          	sb	a5,1331(a4) # 8000cccb <_ZL9finishedA>
}
    800057a0:	01813083          	ld	ra,24(sp)
    800057a4:	01013403          	ld	s0,16(sp)
    800057a8:	00813483          	ld	s1,8(sp)
    800057ac:	00013903          	ld	s2,0(sp)
    800057b0:	02010113          	addi	sp,sp,32
    800057b4:	00008067          	ret

00000000800057b8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800057b8:	fd010113          	addi	sp,sp,-48
    800057bc:	02113423          	sd	ra,40(sp)
    800057c0:	02813023          	sd	s0,32(sp)
    800057c4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800057c8:	00000613          	li	a2,0
    800057cc:	00000597          	auipc	a1,0x0
    800057d0:	f2058593          	addi	a1,a1,-224 # 800056ec <_ZL11workerBodyAPv>
    800057d4:	fd040513          	addi	a0,s0,-48
    800057d8:	ffffc097          	auipc	ra,0xffffc
    800057dc:	bfc080e7          	jalr	-1028(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800057e0:	00005517          	auipc	a0,0x5
    800057e4:	db850513          	addi	a0,a0,-584 # 8000a598 <CONSOLE_STATUS+0x588>
    800057e8:	ffffc097          	auipc	ra,0xffffc
    800057ec:	3ec080e7          	jalr	1004(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800057f0:	00000613          	li	a2,0
    800057f4:	00000597          	auipc	a1,0x0
    800057f8:	e2458593          	addi	a1,a1,-476 # 80005618 <_ZL11workerBodyBPv>
    800057fc:	fd840513          	addi	a0,s0,-40
    80005800:	ffffc097          	auipc	ra,0xffffc
    80005804:	bd4080e7          	jalr	-1068(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005808:	00005517          	auipc	a0,0x5
    8000580c:	da850513          	addi	a0,a0,-600 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    80005810:	ffffc097          	auipc	ra,0xffffc
    80005814:	3c4080e7          	jalr	964(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005818:	00000613          	li	a2,0
    8000581c:	00000597          	auipc	a1,0x0
    80005820:	c7c58593          	addi	a1,a1,-900 # 80005498 <_ZL11workerBodyCPv>
    80005824:	fe040513          	addi	a0,s0,-32
    80005828:	ffffc097          	auipc	ra,0xffffc
    8000582c:	bac080e7          	jalr	-1108(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005830:	00005517          	auipc	a0,0x5
    80005834:	d9850513          	addi	a0,a0,-616 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    80005838:	ffffc097          	auipc	ra,0xffffc
    8000583c:	39c080e7          	jalr	924(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005840:	00000613          	li	a2,0
    80005844:	00000597          	auipc	a1,0x0
    80005848:	b0c58593          	addi	a1,a1,-1268 # 80005350 <_ZL11workerBodyDPv>
    8000584c:	fe840513          	addi	a0,s0,-24
    80005850:	ffffc097          	auipc	ra,0xffffc
    80005854:	b84080e7          	jalr	-1148(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005858:	00005517          	auipc	a0,0x5
    8000585c:	d8850513          	addi	a0,a0,-632 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    80005860:	ffffc097          	auipc	ra,0xffffc
    80005864:	374080e7          	jalr	884(ra) # 80001bd4 <_Z11printStringPKc>
    80005868:	00c0006f          	j	80005874 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000586c:	ffffc097          	auipc	ra,0xffffc
    80005870:	c74080e7          	jalr	-908(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005874:	00007797          	auipc	a5,0x7
    80005878:	4577c783          	lbu	a5,1111(a5) # 8000cccb <_ZL9finishedA>
    8000587c:	fe0788e3          	beqz	a5,8000586c <_Z18Threads_C_API_testv+0xb4>
    80005880:	00007797          	auipc	a5,0x7
    80005884:	44a7c783          	lbu	a5,1098(a5) # 8000ccca <_ZL9finishedB>
    80005888:	fe0782e3          	beqz	a5,8000586c <_Z18Threads_C_API_testv+0xb4>
    8000588c:	00007797          	auipc	a5,0x7
    80005890:	43d7c783          	lbu	a5,1085(a5) # 8000ccc9 <_ZL9finishedC>
    80005894:	fc078ce3          	beqz	a5,8000586c <_Z18Threads_C_API_testv+0xb4>
    80005898:	00007797          	auipc	a5,0x7
    8000589c:	4307c783          	lbu	a5,1072(a5) # 8000ccc8 <_ZL9finishedD>
    800058a0:	fc0786e3          	beqz	a5,8000586c <_Z18Threads_C_API_testv+0xb4>
    }

}
    800058a4:	02813083          	ld	ra,40(sp)
    800058a8:	02013403          	ld	s0,32(sp)
    800058ac:	03010113          	addi	sp,sp,48
    800058b0:	00008067          	ret

00000000800058b4 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800058b4:	fd010113          	addi	sp,sp,-48
    800058b8:	02113423          	sd	ra,40(sp)
    800058bc:	02813023          	sd	s0,32(sp)
    800058c0:	00913c23          	sd	s1,24(sp)
    800058c4:	01213823          	sd	s2,16(sp)
    800058c8:	01313423          	sd	s3,8(sp)
    800058cc:	03010413          	addi	s0,sp,48
    800058d0:	00050993          	mv	s3,a0
    800058d4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800058d8:	00000913          	li	s2,0
    800058dc:	00c0006f          	j	800058e8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800058e0:	ffffd097          	auipc	ra,0xffffd
    800058e4:	fe4080e7          	jalr	-28(ra) # 800028c4 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800058e8:	ffffc097          	auipc	ra,0xffffc
    800058ec:	e2c080e7          	jalr	-468(ra) # 80001714 <_Z4getcv>
    800058f0:	0005059b          	sext.w	a1,a0
    800058f4:	01b00793          	li	a5,27
    800058f8:	02f58a63          	beq	a1,a5,8000592c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800058fc:	0084b503          	ld	a0,8(s1)
    80005900:	00001097          	auipc	ra,0x1
    80005904:	994080e7          	jalr	-1644(ra) # 80006294 <_ZN9BufferCPP3putEi>
        i++;
    80005908:	0019071b          	addiw	a4,s2,1
    8000590c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005910:	0004a683          	lw	a3,0(s1)
    80005914:	0026979b          	slliw	a5,a3,0x2
    80005918:	00d787bb          	addw	a5,a5,a3
    8000591c:	0017979b          	slliw	a5,a5,0x1
    80005920:	02f767bb          	remw	a5,a4,a5
    80005924:	fc0792e3          	bnez	a5,800058e8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005928:	fb9ff06f          	j	800058e0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    8000592c:	00100793          	li	a5,1
    80005930:	00007717          	auipc	a4,0x7
    80005934:	3af72023          	sw	a5,928(a4) # 8000ccd0 <_ZL9threadEnd>
    td->buffer->put('!');
    80005938:	0209b783          	ld	a5,32(s3)
    8000593c:	02100593          	li	a1,33
    80005940:	0087b503          	ld	a0,8(a5)
    80005944:	00001097          	auipc	ra,0x1
    80005948:	950080e7          	jalr	-1712(ra) # 80006294 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    8000594c:	0104b503          	ld	a0,16(s1)
    80005950:	ffffd097          	auipc	ra,0xffffd
    80005954:	07c080e7          	jalr	124(ra) # 800029cc <_ZN9Semaphore6signalEv>
}
    80005958:	02813083          	ld	ra,40(sp)
    8000595c:	02013403          	ld	s0,32(sp)
    80005960:	01813483          	ld	s1,24(sp)
    80005964:	01013903          	ld	s2,16(sp)
    80005968:	00813983          	ld	s3,8(sp)
    8000596c:	03010113          	addi	sp,sp,48
    80005970:	00008067          	ret

0000000080005974 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005974:	fe010113          	addi	sp,sp,-32
    80005978:	00113c23          	sd	ra,24(sp)
    8000597c:	00813823          	sd	s0,16(sp)
    80005980:	00913423          	sd	s1,8(sp)
    80005984:	01213023          	sd	s2,0(sp)
    80005988:	02010413          	addi	s0,sp,32
    8000598c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005990:	00000913          	li	s2,0
    80005994:	00c0006f          	j	800059a0 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005998:	ffffd097          	auipc	ra,0xffffd
    8000599c:	f2c080e7          	jalr	-212(ra) # 800028c4 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800059a0:	00007797          	auipc	a5,0x7
    800059a4:	3307a783          	lw	a5,816(a5) # 8000ccd0 <_ZL9threadEnd>
    800059a8:	02079e63          	bnez	a5,800059e4 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800059ac:	0004a583          	lw	a1,0(s1)
    800059b0:	0305859b          	addiw	a1,a1,48
    800059b4:	0084b503          	ld	a0,8(s1)
    800059b8:	00001097          	auipc	ra,0x1
    800059bc:	8dc080e7          	jalr	-1828(ra) # 80006294 <_ZN9BufferCPP3putEi>
        i++;
    800059c0:	0019071b          	addiw	a4,s2,1
    800059c4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800059c8:	0004a683          	lw	a3,0(s1)
    800059cc:	0026979b          	slliw	a5,a3,0x2
    800059d0:	00d787bb          	addw	a5,a5,a3
    800059d4:	0017979b          	slliw	a5,a5,0x1
    800059d8:	02f767bb          	remw	a5,a4,a5
    800059dc:	fc0792e3          	bnez	a5,800059a0 <_ZN12ProducerSync8producerEPv+0x2c>
    800059e0:	fb9ff06f          	j	80005998 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800059e4:	0104b503          	ld	a0,16(s1)
    800059e8:	ffffd097          	auipc	ra,0xffffd
    800059ec:	fe4080e7          	jalr	-28(ra) # 800029cc <_ZN9Semaphore6signalEv>
}
    800059f0:	01813083          	ld	ra,24(sp)
    800059f4:	01013403          	ld	s0,16(sp)
    800059f8:	00813483          	ld	s1,8(sp)
    800059fc:	00013903          	ld	s2,0(sp)
    80005a00:	02010113          	addi	sp,sp,32
    80005a04:	00008067          	ret

0000000080005a08 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005a08:	fd010113          	addi	sp,sp,-48
    80005a0c:	02113423          	sd	ra,40(sp)
    80005a10:	02813023          	sd	s0,32(sp)
    80005a14:	00913c23          	sd	s1,24(sp)
    80005a18:	01213823          	sd	s2,16(sp)
    80005a1c:	01313423          	sd	s3,8(sp)
    80005a20:	01413023          	sd	s4,0(sp)
    80005a24:	03010413          	addi	s0,sp,48
    80005a28:	00050993          	mv	s3,a0
    80005a2c:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005a30:	00000a13          	li	s4,0
    80005a34:	01c0006f          	j	80005a50 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005a38:	ffffd097          	auipc	ra,0xffffd
    80005a3c:	e8c080e7          	jalr	-372(ra) # 800028c4 <_ZN6Thread8dispatchEv>
    80005a40:	0500006f          	j	80005a90 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005a44:	00a00513          	li	a0,10
    80005a48:	ffffc097          	auipc	ra,0xffffc
    80005a4c:	d28080e7          	jalr	-728(ra) # 80001770 <_Z4putcc>
    while (!threadEnd) {
    80005a50:	00007797          	auipc	a5,0x7
    80005a54:	2807a783          	lw	a5,640(a5) # 8000ccd0 <_ZL9threadEnd>
    80005a58:	06079263          	bnez	a5,80005abc <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005a5c:	00893503          	ld	a0,8(s2)
    80005a60:	00001097          	auipc	ra,0x1
    80005a64:	8c4080e7          	jalr	-1852(ra) # 80006324 <_ZN9BufferCPP3getEv>
        i++;
    80005a68:	001a049b          	addiw	s1,s4,1
    80005a6c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005a70:	0ff57513          	andi	a0,a0,255
    80005a74:	ffffc097          	auipc	ra,0xffffc
    80005a78:	cfc080e7          	jalr	-772(ra) # 80001770 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005a7c:	00092703          	lw	a4,0(s2)
    80005a80:	0027179b          	slliw	a5,a4,0x2
    80005a84:	00e787bb          	addw	a5,a5,a4
    80005a88:	02f4e7bb          	remw	a5,s1,a5
    80005a8c:	fa0786e3          	beqz	a5,80005a38 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005a90:	05000793          	li	a5,80
    80005a94:	02f4e4bb          	remw	s1,s1,a5
    80005a98:	fa049ce3          	bnez	s1,80005a50 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005a9c:	fa9ff06f          	j	80005a44 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005aa0:	0209b783          	ld	a5,32(s3)
    80005aa4:	0087b503          	ld	a0,8(a5)
    80005aa8:	00001097          	auipc	ra,0x1
    80005aac:	87c080e7          	jalr	-1924(ra) # 80006324 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005ab0:	0ff57513          	andi	a0,a0,255
    80005ab4:	ffffd097          	auipc	ra,0xffffd
    80005ab8:	fd8080e7          	jalr	-40(ra) # 80002a8c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005abc:	0209b783          	ld	a5,32(s3)
    80005ac0:	0087b503          	ld	a0,8(a5)
    80005ac4:	00001097          	auipc	ra,0x1
    80005ac8:	8ec080e7          	jalr	-1812(ra) # 800063b0 <_ZN9BufferCPP6getCntEv>
    80005acc:	fca04ae3          	bgtz	a0,80005aa0 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005ad0:	01093503          	ld	a0,16(s2)
    80005ad4:	ffffd097          	auipc	ra,0xffffd
    80005ad8:	ef8080e7          	jalr	-264(ra) # 800029cc <_ZN9Semaphore6signalEv>
}
    80005adc:	02813083          	ld	ra,40(sp)
    80005ae0:	02013403          	ld	s0,32(sp)
    80005ae4:	01813483          	ld	s1,24(sp)
    80005ae8:	01013903          	ld	s2,16(sp)
    80005aec:	00813983          	ld	s3,8(sp)
    80005af0:	00013a03          	ld	s4,0(sp)
    80005af4:	03010113          	addi	sp,sp,48
    80005af8:	00008067          	ret

0000000080005afc <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005afc:	f8010113          	addi	sp,sp,-128
    80005b00:	06113c23          	sd	ra,120(sp)
    80005b04:	06813823          	sd	s0,112(sp)
    80005b08:	06913423          	sd	s1,104(sp)
    80005b0c:	07213023          	sd	s2,96(sp)
    80005b10:	05313c23          	sd	s3,88(sp)
    80005b14:	05413823          	sd	s4,80(sp)
    80005b18:	05513423          	sd	s5,72(sp)
    80005b1c:	05613023          	sd	s6,64(sp)
    80005b20:	03713c23          	sd	s7,56(sp)
    80005b24:	03813823          	sd	s8,48(sp)
    80005b28:	03913423          	sd	s9,40(sp)
    80005b2c:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005b30:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005b34:	00005517          	auipc	a0,0x5
    80005b38:	8e450513          	addi	a0,a0,-1820 # 8000a418 <CONSOLE_STATUS+0x408>
    80005b3c:	ffffc097          	auipc	ra,0xffffc
    80005b40:	098080e7          	jalr	152(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80005b44:	01e00593          	li	a1,30
    80005b48:	f8040493          	addi	s1,s0,-128
    80005b4c:	00048513          	mv	a0,s1
    80005b50:	ffffc097          	auipc	ra,0xffffc
    80005b54:	194080e7          	jalr	404(ra) # 80001ce4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005b58:	00048513          	mv	a0,s1
    80005b5c:	ffffc097          	auipc	ra,0xffffc
    80005b60:	260080e7          	jalr	608(ra) # 80001dbc <_Z11stringToIntPKc>
    80005b64:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005b68:	00005517          	auipc	a0,0x5
    80005b6c:	8d050513          	addi	a0,a0,-1840 # 8000a438 <CONSOLE_STATUS+0x428>
    80005b70:	ffffc097          	auipc	ra,0xffffc
    80005b74:	064080e7          	jalr	100(ra) # 80001bd4 <_Z11printStringPKc>
    getString(input, 30);
    80005b78:	01e00593          	li	a1,30
    80005b7c:	00048513          	mv	a0,s1
    80005b80:	ffffc097          	auipc	ra,0xffffc
    80005b84:	164080e7          	jalr	356(ra) # 80001ce4 <_Z9getStringPci>
    n = stringToInt(input);
    80005b88:	00048513          	mv	a0,s1
    80005b8c:	ffffc097          	auipc	ra,0xffffc
    80005b90:	230080e7          	jalr	560(ra) # 80001dbc <_Z11stringToIntPKc>
    80005b94:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005b98:	00005517          	auipc	a0,0x5
    80005b9c:	8c050513          	addi	a0,a0,-1856 # 8000a458 <CONSOLE_STATUS+0x448>
    80005ba0:	ffffc097          	auipc	ra,0xffffc
    80005ba4:	034080e7          	jalr	52(ra) # 80001bd4 <_Z11printStringPKc>
    80005ba8:	00000613          	li	a2,0
    80005bac:	00a00593          	li	a1,10
    80005bb0:	00090513          	mv	a0,s2
    80005bb4:	ffffc097          	auipc	ra,0xffffc
    80005bb8:	258080e7          	jalr	600(ra) # 80001e0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005bbc:	00005517          	auipc	a0,0x5
    80005bc0:	8b450513          	addi	a0,a0,-1868 # 8000a470 <CONSOLE_STATUS+0x460>
    80005bc4:	ffffc097          	auipc	ra,0xffffc
    80005bc8:	010080e7          	jalr	16(ra) # 80001bd4 <_Z11printStringPKc>
    80005bcc:	00000613          	li	a2,0
    80005bd0:	00a00593          	li	a1,10
    80005bd4:	00048513          	mv	a0,s1
    80005bd8:	ffffc097          	auipc	ra,0xffffc
    80005bdc:	234080e7          	jalr	564(ra) # 80001e0c <_Z8printIntiii>
    printString(".\n");
    80005be0:	00005517          	auipc	a0,0x5
    80005be4:	8a850513          	addi	a0,a0,-1880 # 8000a488 <CONSOLE_STATUS+0x478>
    80005be8:	ffffc097          	auipc	ra,0xffffc
    80005bec:	fec080e7          	jalr	-20(ra) # 80001bd4 <_Z11printStringPKc>
    if(threadNum > n) {
    80005bf0:	0324c463          	blt	s1,s2,80005c18 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005bf4:	03205c63          	blez	s2,80005c2c <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005bf8:	03800513          	li	a0,56
    80005bfc:	ffffd097          	auipc	ra,0xffffd
    80005c00:	aec080e7          	jalr	-1300(ra) # 800026e8 <_Znwm>
    80005c04:	00050a93          	mv	s5,a0
    80005c08:	00048593          	mv	a1,s1
    80005c0c:	00000097          	auipc	ra,0x0
    80005c10:	534080e7          	jalr	1332(ra) # 80006140 <_ZN9BufferCPPC1Ei>
    80005c14:	0300006f          	j	80005c44 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005c18:	00005517          	auipc	a0,0x5
    80005c1c:	87850513          	addi	a0,a0,-1928 # 8000a490 <CONSOLE_STATUS+0x480>
    80005c20:	ffffc097          	auipc	ra,0xffffc
    80005c24:	fb4080e7          	jalr	-76(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80005c28:	0140006f          	j	80005c3c <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005c2c:	00005517          	auipc	a0,0x5
    80005c30:	8a450513          	addi	a0,a0,-1884 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80005c34:	ffffc097          	auipc	ra,0xffffc
    80005c38:	fa0080e7          	jalr	-96(ra) # 80001bd4 <_Z11printStringPKc>
        return;
    80005c3c:	000b8113          	mv	sp,s7
    80005c40:	2380006f          	j	80005e78 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005c44:	01000513          	li	a0,16
    80005c48:	ffffd097          	auipc	ra,0xffffd
    80005c4c:	aa0080e7          	jalr	-1376(ra) # 800026e8 <_Znwm>
    80005c50:	00050493          	mv	s1,a0
    80005c54:	00000593          	li	a1,0
    80005c58:	ffffd097          	auipc	ra,0xffffd
    80005c5c:	d10080e7          	jalr	-752(ra) # 80002968 <_ZN9SemaphoreC1Ej>
    80005c60:	00007797          	auipc	a5,0x7
    80005c64:	0697bc23          	sd	s1,120(a5) # 8000ccd8 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005c68:	00391793          	slli	a5,s2,0x3
    80005c6c:	00f78793          	addi	a5,a5,15
    80005c70:	ff07f793          	andi	a5,a5,-16
    80005c74:	40f10133          	sub	sp,sp,a5
    80005c78:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005c7c:	0019071b          	addiw	a4,s2,1
    80005c80:	00171793          	slli	a5,a4,0x1
    80005c84:	00e787b3          	add	a5,a5,a4
    80005c88:	00379793          	slli	a5,a5,0x3
    80005c8c:	00f78793          	addi	a5,a5,15
    80005c90:	ff07f793          	andi	a5,a5,-16
    80005c94:	40f10133          	sub	sp,sp,a5
    80005c98:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005c9c:	00191c13          	slli	s8,s2,0x1
    80005ca0:	012c07b3          	add	a5,s8,s2
    80005ca4:	00379793          	slli	a5,a5,0x3
    80005ca8:	00fa07b3          	add	a5,s4,a5
    80005cac:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005cb0:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005cb4:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005cb8:	02800513          	li	a0,40
    80005cbc:	ffffd097          	auipc	ra,0xffffd
    80005cc0:	a2c080e7          	jalr	-1492(ra) # 800026e8 <_Znwm>
    80005cc4:	00050b13          	mv	s6,a0
    80005cc8:	012c0c33          	add	s8,s8,s2
    80005ccc:	003c1c13          	slli	s8,s8,0x3
    80005cd0:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005cd4:	ffffd097          	auipc	ra,0xffffd
    80005cd8:	b64080e7          	jalr	-1180(ra) # 80002838 <_ZN6ThreadC1Ev>
    80005cdc:	00007797          	auipc	a5,0x7
    80005ce0:	e6478793          	addi	a5,a5,-412 # 8000cb40 <_ZTV12ConsumerSync+0x10>
    80005ce4:	00fb3023          	sd	a5,0(s6)
    80005ce8:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005cec:	000b0513          	mv	a0,s6
    80005cf0:	ffffd097          	auipc	ra,0xffffd
    80005cf4:	b80080e7          	jalr	-1152(ra) # 80002870 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005cf8:	00000493          	li	s1,0
    80005cfc:	0380006f          	j	80005d34 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005d00:	00007797          	auipc	a5,0x7
    80005d04:	e1878793          	addi	a5,a5,-488 # 8000cb18 <_ZTV12ProducerSync+0x10>
    80005d08:	00fcb023          	sd	a5,0(s9)
    80005d0c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80005d10:	00349793          	slli	a5,s1,0x3
    80005d14:	00f987b3          	add	a5,s3,a5
    80005d18:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005d1c:	00349793          	slli	a5,s1,0x3
    80005d20:	00f987b3          	add	a5,s3,a5
    80005d24:	0007b503          	ld	a0,0(a5)
    80005d28:	ffffd097          	auipc	ra,0xffffd
    80005d2c:	b48080e7          	jalr	-1208(ra) # 80002870 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005d30:	0014849b          	addiw	s1,s1,1
    80005d34:	0b24d063          	bge	s1,s2,80005dd4 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005d38:	00149793          	slli	a5,s1,0x1
    80005d3c:	009787b3          	add	a5,a5,s1
    80005d40:	00379793          	slli	a5,a5,0x3
    80005d44:	00fa07b3          	add	a5,s4,a5
    80005d48:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005d4c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005d50:	00007717          	auipc	a4,0x7
    80005d54:	f8873703          	ld	a4,-120(a4) # 8000ccd8 <_ZL10waitForAll>
    80005d58:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005d5c:	02905863          	blez	s1,80005d8c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005d60:	02800513          	li	a0,40
    80005d64:	ffffd097          	auipc	ra,0xffffd
    80005d68:	984080e7          	jalr	-1660(ra) # 800026e8 <_Znwm>
    80005d6c:	00050c93          	mv	s9,a0
    80005d70:	00149c13          	slli	s8,s1,0x1
    80005d74:	009c0c33          	add	s8,s8,s1
    80005d78:	003c1c13          	slli	s8,s8,0x3
    80005d7c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005d80:	ffffd097          	auipc	ra,0xffffd
    80005d84:	ab8080e7          	jalr	-1352(ra) # 80002838 <_ZN6ThreadC1Ev>
    80005d88:	f79ff06f          	j	80005d00 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005d8c:	02800513          	li	a0,40
    80005d90:	ffffd097          	auipc	ra,0xffffd
    80005d94:	958080e7          	jalr	-1704(ra) # 800026e8 <_Znwm>
    80005d98:	00050c93          	mv	s9,a0
    80005d9c:	00149c13          	slli	s8,s1,0x1
    80005da0:	009c0c33          	add	s8,s8,s1
    80005da4:	003c1c13          	slli	s8,s8,0x3
    80005da8:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005dac:	ffffd097          	auipc	ra,0xffffd
    80005db0:	a8c080e7          	jalr	-1396(ra) # 80002838 <_ZN6ThreadC1Ev>
    80005db4:	00007797          	auipc	a5,0x7
    80005db8:	d3c78793          	addi	a5,a5,-708 # 8000caf0 <_ZTV16ProducerKeyboard+0x10>
    80005dbc:	00fcb023          	sd	a5,0(s9)
    80005dc0:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005dc4:	00349793          	slli	a5,s1,0x3
    80005dc8:	00f987b3          	add	a5,s3,a5
    80005dcc:	0197b023          	sd	s9,0(a5)
    80005dd0:	f4dff06f          	j	80005d1c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005dd4:	ffffd097          	auipc	ra,0xffffd
    80005dd8:	af0080e7          	jalr	-1296(ra) # 800028c4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005ddc:	00000493          	li	s1,0
    80005de0:	00994e63          	blt	s2,s1,80005dfc <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005de4:	00007517          	auipc	a0,0x7
    80005de8:	ef453503          	ld	a0,-268(a0) # 8000ccd8 <_ZL10waitForAll>
    80005dec:	ffffd097          	auipc	ra,0xffffd
    80005df0:	bb4080e7          	jalr	-1100(ra) # 800029a0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005df4:	0014849b          	addiw	s1,s1,1
    80005df8:	fe9ff06f          	j	80005de0 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005dfc:	00000493          	li	s1,0
    80005e00:	0080006f          	j	80005e08 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005e04:	0014849b          	addiw	s1,s1,1
    80005e08:	0324d263          	bge	s1,s2,80005e2c <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005e0c:	00349793          	slli	a5,s1,0x3
    80005e10:	00f987b3          	add	a5,s3,a5
    80005e14:	0007b503          	ld	a0,0(a5)
    80005e18:	fe0506e3          	beqz	a0,80005e04 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005e1c:	00053783          	ld	a5,0(a0)
    80005e20:	0087b783          	ld	a5,8(a5)
    80005e24:	000780e7          	jalr	a5
    80005e28:	fddff06f          	j	80005e04 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005e2c:	000b0a63          	beqz	s6,80005e40 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005e30:	000b3783          	ld	a5,0(s6)
    80005e34:	0087b783          	ld	a5,8(a5)
    80005e38:	000b0513          	mv	a0,s6
    80005e3c:	000780e7          	jalr	a5
    delete waitForAll;
    80005e40:	00007517          	auipc	a0,0x7
    80005e44:	e9853503          	ld	a0,-360(a0) # 8000ccd8 <_ZL10waitForAll>
    80005e48:	00050863          	beqz	a0,80005e58 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005e4c:	00053783          	ld	a5,0(a0)
    80005e50:	0087b783          	ld	a5,8(a5)
    80005e54:	000780e7          	jalr	a5
    delete buffer;
    80005e58:	000a8e63          	beqz	s5,80005e74 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005e5c:	000a8513          	mv	a0,s5
    80005e60:	00000097          	auipc	ra,0x0
    80005e64:	5d8080e7          	jalr	1496(ra) # 80006438 <_ZN9BufferCPPD1Ev>
    80005e68:	000a8513          	mv	a0,s5
    80005e6c:	ffffd097          	auipc	ra,0xffffd
    80005e70:	8cc080e7          	jalr	-1844(ra) # 80002738 <_ZdlPv>
    80005e74:	000b8113          	mv	sp,s7

}
    80005e78:	f8040113          	addi	sp,s0,-128
    80005e7c:	07813083          	ld	ra,120(sp)
    80005e80:	07013403          	ld	s0,112(sp)
    80005e84:	06813483          	ld	s1,104(sp)
    80005e88:	06013903          	ld	s2,96(sp)
    80005e8c:	05813983          	ld	s3,88(sp)
    80005e90:	05013a03          	ld	s4,80(sp)
    80005e94:	04813a83          	ld	s5,72(sp)
    80005e98:	04013b03          	ld	s6,64(sp)
    80005e9c:	03813b83          	ld	s7,56(sp)
    80005ea0:	03013c03          	ld	s8,48(sp)
    80005ea4:	02813c83          	ld	s9,40(sp)
    80005ea8:	08010113          	addi	sp,sp,128
    80005eac:	00008067          	ret
    80005eb0:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005eb4:	000a8513          	mv	a0,s5
    80005eb8:	ffffd097          	auipc	ra,0xffffd
    80005ebc:	880080e7          	jalr	-1920(ra) # 80002738 <_ZdlPv>
    80005ec0:	00048513          	mv	a0,s1
    80005ec4:	00008097          	auipc	ra,0x8
    80005ec8:	ef4080e7          	jalr	-268(ra) # 8000ddb8 <_Unwind_Resume>
    80005ecc:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005ed0:	00048513          	mv	a0,s1
    80005ed4:	ffffd097          	auipc	ra,0xffffd
    80005ed8:	864080e7          	jalr	-1948(ra) # 80002738 <_ZdlPv>
    80005edc:	00090513          	mv	a0,s2
    80005ee0:	00008097          	auipc	ra,0x8
    80005ee4:	ed8080e7          	jalr	-296(ra) # 8000ddb8 <_Unwind_Resume>
    80005ee8:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005eec:	000b0513          	mv	a0,s6
    80005ef0:	ffffd097          	auipc	ra,0xffffd
    80005ef4:	848080e7          	jalr	-1976(ra) # 80002738 <_ZdlPv>
    80005ef8:	00048513          	mv	a0,s1
    80005efc:	00008097          	auipc	ra,0x8
    80005f00:	ebc080e7          	jalr	-324(ra) # 8000ddb8 <_Unwind_Resume>
    80005f04:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005f08:	000c8513          	mv	a0,s9
    80005f0c:	ffffd097          	auipc	ra,0xffffd
    80005f10:	82c080e7          	jalr	-2004(ra) # 80002738 <_ZdlPv>
    80005f14:	00048513          	mv	a0,s1
    80005f18:	00008097          	auipc	ra,0x8
    80005f1c:	ea0080e7          	jalr	-352(ra) # 8000ddb8 <_Unwind_Resume>
    80005f20:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005f24:	000c8513          	mv	a0,s9
    80005f28:	ffffd097          	auipc	ra,0xffffd
    80005f2c:	810080e7          	jalr	-2032(ra) # 80002738 <_ZdlPv>
    80005f30:	00048513          	mv	a0,s1
    80005f34:	00008097          	auipc	ra,0x8
    80005f38:	e84080e7          	jalr	-380(ra) # 8000ddb8 <_Unwind_Resume>

0000000080005f3c <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005f3c:	ff010113          	addi	sp,sp,-16
    80005f40:	00113423          	sd	ra,8(sp)
    80005f44:	00813023          	sd	s0,0(sp)
    80005f48:	01010413          	addi	s0,sp,16
    80005f4c:	00007797          	auipc	a5,0x7
    80005f50:	bf478793          	addi	a5,a5,-1036 # 8000cb40 <_ZTV12ConsumerSync+0x10>
    80005f54:	00f53023          	sd	a5,0(a0)
    80005f58:	ffffc097          	auipc	ra,0xffffc
    80005f5c:	6fc080e7          	jalr	1788(ra) # 80002654 <_ZN6ThreadD1Ev>
    80005f60:	00813083          	ld	ra,8(sp)
    80005f64:	00013403          	ld	s0,0(sp)
    80005f68:	01010113          	addi	sp,sp,16
    80005f6c:	00008067          	ret

0000000080005f70 <_ZN12ConsumerSyncD0Ev>:
    80005f70:	fe010113          	addi	sp,sp,-32
    80005f74:	00113c23          	sd	ra,24(sp)
    80005f78:	00813823          	sd	s0,16(sp)
    80005f7c:	00913423          	sd	s1,8(sp)
    80005f80:	02010413          	addi	s0,sp,32
    80005f84:	00050493          	mv	s1,a0
    80005f88:	00007797          	auipc	a5,0x7
    80005f8c:	bb878793          	addi	a5,a5,-1096 # 8000cb40 <_ZTV12ConsumerSync+0x10>
    80005f90:	00f53023          	sd	a5,0(a0)
    80005f94:	ffffc097          	auipc	ra,0xffffc
    80005f98:	6c0080e7          	jalr	1728(ra) # 80002654 <_ZN6ThreadD1Ev>
    80005f9c:	00048513          	mv	a0,s1
    80005fa0:	ffffc097          	auipc	ra,0xffffc
    80005fa4:	798080e7          	jalr	1944(ra) # 80002738 <_ZdlPv>
    80005fa8:	01813083          	ld	ra,24(sp)
    80005fac:	01013403          	ld	s0,16(sp)
    80005fb0:	00813483          	ld	s1,8(sp)
    80005fb4:	02010113          	addi	sp,sp,32
    80005fb8:	00008067          	ret

0000000080005fbc <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005fbc:	ff010113          	addi	sp,sp,-16
    80005fc0:	00113423          	sd	ra,8(sp)
    80005fc4:	00813023          	sd	s0,0(sp)
    80005fc8:	01010413          	addi	s0,sp,16
    80005fcc:	00007797          	auipc	a5,0x7
    80005fd0:	b4c78793          	addi	a5,a5,-1204 # 8000cb18 <_ZTV12ProducerSync+0x10>
    80005fd4:	00f53023          	sd	a5,0(a0)
    80005fd8:	ffffc097          	auipc	ra,0xffffc
    80005fdc:	67c080e7          	jalr	1660(ra) # 80002654 <_ZN6ThreadD1Ev>
    80005fe0:	00813083          	ld	ra,8(sp)
    80005fe4:	00013403          	ld	s0,0(sp)
    80005fe8:	01010113          	addi	sp,sp,16
    80005fec:	00008067          	ret

0000000080005ff0 <_ZN12ProducerSyncD0Ev>:
    80005ff0:	fe010113          	addi	sp,sp,-32
    80005ff4:	00113c23          	sd	ra,24(sp)
    80005ff8:	00813823          	sd	s0,16(sp)
    80005ffc:	00913423          	sd	s1,8(sp)
    80006000:	02010413          	addi	s0,sp,32
    80006004:	00050493          	mv	s1,a0
    80006008:	00007797          	auipc	a5,0x7
    8000600c:	b1078793          	addi	a5,a5,-1264 # 8000cb18 <_ZTV12ProducerSync+0x10>
    80006010:	00f53023          	sd	a5,0(a0)
    80006014:	ffffc097          	auipc	ra,0xffffc
    80006018:	640080e7          	jalr	1600(ra) # 80002654 <_ZN6ThreadD1Ev>
    8000601c:	00048513          	mv	a0,s1
    80006020:	ffffc097          	auipc	ra,0xffffc
    80006024:	718080e7          	jalr	1816(ra) # 80002738 <_ZdlPv>
    80006028:	01813083          	ld	ra,24(sp)
    8000602c:	01013403          	ld	s0,16(sp)
    80006030:	00813483          	ld	s1,8(sp)
    80006034:	02010113          	addi	sp,sp,32
    80006038:	00008067          	ret

000000008000603c <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    8000603c:	ff010113          	addi	sp,sp,-16
    80006040:	00113423          	sd	ra,8(sp)
    80006044:	00813023          	sd	s0,0(sp)
    80006048:	01010413          	addi	s0,sp,16
    8000604c:	00007797          	auipc	a5,0x7
    80006050:	aa478793          	addi	a5,a5,-1372 # 8000caf0 <_ZTV16ProducerKeyboard+0x10>
    80006054:	00f53023          	sd	a5,0(a0)
    80006058:	ffffc097          	auipc	ra,0xffffc
    8000605c:	5fc080e7          	jalr	1532(ra) # 80002654 <_ZN6ThreadD1Ev>
    80006060:	00813083          	ld	ra,8(sp)
    80006064:	00013403          	ld	s0,0(sp)
    80006068:	01010113          	addi	sp,sp,16
    8000606c:	00008067          	ret

0000000080006070 <_ZN16ProducerKeyboardD0Ev>:
    80006070:	fe010113          	addi	sp,sp,-32
    80006074:	00113c23          	sd	ra,24(sp)
    80006078:	00813823          	sd	s0,16(sp)
    8000607c:	00913423          	sd	s1,8(sp)
    80006080:	02010413          	addi	s0,sp,32
    80006084:	00050493          	mv	s1,a0
    80006088:	00007797          	auipc	a5,0x7
    8000608c:	a6878793          	addi	a5,a5,-1432 # 8000caf0 <_ZTV16ProducerKeyboard+0x10>
    80006090:	00f53023          	sd	a5,0(a0)
    80006094:	ffffc097          	auipc	ra,0xffffc
    80006098:	5c0080e7          	jalr	1472(ra) # 80002654 <_ZN6ThreadD1Ev>
    8000609c:	00048513          	mv	a0,s1
    800060a0:	ffffc097          	auipc	ra,0xffffc
    800060a4:	698080e7          	jalr	1688(ra) # 80002738 <_ZdlPv>
    800060a8:	01813083          	ld	ra,24(sp)
    800060ac:	01013403          	ld	s0,16(sp)
    800060b0:	00813483          	ld	s1,8(sp)
    800060b4:	02010113          	addi	sp,sp,32
    800060b8:	00008067          	ret

00000000800060bc <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800060bc:	ff010113          	addi	sp,sp,-16
    800060c0:	00113423          	sd	ra,8(sp)
    800060c4:	00813023          	sd	s0,0(sp)
    800060c8:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800060cc:	02053583          	ld	a1,32(a0)
    800060d0:	fffff097          	auipc	ra,0xfffff
    800060d4:	7e4080e7          	jalr	2020(ra) # 800058b4 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800060d8:	00813083          	ld	ra,8(sp)
    800060dc:	00013403          	ld	s0,0(sp)
    800060e0:	01010113          	addi	sp,sp,16
    800060e4:	00008067          	ret

00000000800060e8 <_ZN12ProducerSync3runEv>:
    void run() override {
    800060e8:	ff010113          	addi	sp,sp,-16
    800060ec:	00113423          	sd	ra,8(sp)
    800060f0:	00813023          	sd	s0,0(sp)
    800060f4:	01010413          	addi	s0,sp,16
        producer(td);
    800060f8:	02053583          	ld	a1,32(a0)
    800060fc:	00000097          	auipc	ra,0x0
    80006100:	878080e7          	jalr	-1928(ra) # 80005974 <_ZN12ProducerSync8producerEPv>
    }
    80006104:	00813083          	ld	ra,8(sp)
    80006108:	00013403          	ld	s0,0(sp)
    8000610c:	01010113          	addi	sp,sp,16
    80006110:	00008067          	ret

0000000080006114 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80006114:	ff010113          	addi	sp,sp,-16
    80006118:	00113423          	sd	ra,8(sp)
    8000611c:	00813023          	sd	s0,0(sp)
    80006120:	01010413          	addi	s0,sp,16
        consumer(td);
    80006124:	02053583          	ld	a1,32(a0)
    80006128:	00000097          	auipc	ra,0x0
    8000612c:	8e0080e7          	jalr	-1824(ra) # 80005a08 <_ZN12ConsumerSync8consumerEPv>
    }
    80006130:	00813083          	ld	ra,8(sp)
    80006134:	00013403          	ld	s0,0(sp)
    80006138:	01010113          	addi	sp,sp,16
    8000613c:	00008067          	ret

0000000080006140 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006140:	fd010113          	addi	sp,sp,-48
    80006144:	02113423          	sd	ra,40(sp)
    80006148:	02813023          	sd	s0,32(sp)
    8000614c:	00913c23          	sd	s1,24(sp)
    80006150:	01213823          	sd	s2,16(sp)
    80006154:	01313423          	sd	s3,8(sp)
    80006158:	03010413          	addi	s0,sp,48
    8000615c:	00050493          	mv	s1,a0
    80006160:	00058913          	mv	s2,a1
    80006164:	0015879b          	addiw	a5,a1,1
    80006168:	0007851b          	sext.w	a0,a5
    8000616c:	00f4a023          	sw	a5,0(s1)
    80006170:	0004a823          	sw	zero,16(s1)
    80006174:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006178:	00251513          	slli	a0,a0,0x2
    8000617c:	ffffb097          	auipc	ra,0xffffb
    80006180:	0dc080e7          	jalr	220(ra) # 80001258 <_Z9mem_allocm>
    80006184:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006188:	01000513          	li	a0,16
    8000618c:	ffffc097          	auipc	ra,0xffffc
    80006190:	55c080e7          	jalr	1372(ra) # 800026e8 <_Znwm>
    80006194:	00050993          	mv	s3,a0
    80006198:	00000593          	li	a1,0
    8000619c:	ffffc097          	auipc	ra,0xffffc
    800061a0:	7cc080e7          	jalr	1996(ra) # 80002968 <_ZN9SemaphoreC1Ej>
    800061a4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800061a8:	01000513          	li	a0,16
    800061ac:	ffffc097          	auipc	ra,0xffffc
    800061b0:	53c080e7          	jalr	1340(ra) # 800026e8 <_Znwm>
    800061b4:	00050993          	mv	s3,a0
    800061b8:	00090593          	mv	a1,s2
    800061bc:	ffffc097          	auipc	ra,0xffffc
    800061c0:	7ac080e7          	jalr	1964(ra) # 80002968 <_ZN9SemaphoreC1Ej>
    800061c4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800061c8:	01000513          	li	a0,16
    800061cc:	ffffc097          	auipc	ra,0xffffc
    800061d0:	51c080e7          	jalr	1308(ra) # 800026e8 <_Znwm>
    800061d4:	00050913          	mv	s2,a0
    800061d8:	00100593          	li	a1,1
    800061dc:	ffffc097          	auipc	ra,0xffffc
    800061e0:	78c080e7          	jalr	1932(ra) # 80002968 <_ZN9SemaphoreC1Ej>
    800061e4:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800061e8:	01000513          	li	a0,16
    800061ec:	ffffc097          	auipc	ra,0xffffc
    800061f0:	4fc080e7          	jalr	1276(ra) # 800026e8 <_Znwm>
    800061f4:	00050913          	mv	s2,a0
    800061f8:	00100593          	li	a1,1
    800061fc:	ffffc097          	auipc	ra,0xffffc
    80006200:	76c080e7          	jalr	1900(ra) # 80002968 <_ZN9SemaphoreC1Ej>
    80006204:	0324b823          	sd	s2,48(s1)
}
    80006208:	02813083          	ld	ra,40(sp)
    8000620c:	02013403          	ld	s0,32(sp)
    80006210:	01813483          	ld	s1,24(sp)
    80006214:	01013903          	ld	s2,16(sp)
    80006218:	00813983          	ld	s3,8(sp)
    8000621c:	03010113          	addi	sp,sp,48
    80006220:	00008067          	ret
    80006224:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006228:	00098513          	mv	a0,s3
    8000622c:	ffffc097          	auipc	ra,0xffffc
    80006230:	50c080e7          	jalr	1292(ra) # 80002738 <_ZdlPv>
    80006234:	00048513          	mv	a0,s1
    80006238:	00008097          	auipc	ra,0x8
    8000623c:	b80080e7          	jalr	-1152(ra) # 8000ddb8 <_Unwind_Resume>
    80006240:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006244:	00098513          	mv	a0,s3
    80006248:	ffffc097          	auipc	ra,0xffffc
    8000624c:	4f0080e7          	jalr	1264(ra) # 80002738 <_ZdlPv>
    80006250:	00048513          	mv	a0,s1
    80006254:	00008097          	auipc	ra,0x8
    80006258:	b64080e7          	jalr	-1180(ra) # 8000ddb8 <_Unwind_Resume>
    8000625c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006260:	00090513          	mv	a0,s2
    80006264:	ffffc097          	auipc	ra,0xffffc
    80006268:	4d4080e7          	jalr	1236(ra) # 80002738 <_ZdlPv>
    8000626c:	00048513          	mv	a0,s1
    80006270:	00008097          	auipc	ra,0x8
    80006274:	b48080e7          	jalr	-1208(ra) # 8000ddb8 <_Unwind_Resume>
    80006278:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000627c:	00090513          	mv	a0,s2
    80006280:	ffffc097          	auipc	ra,0xffffc
    80006284:	4b8080e7          	jalr	1208(ra) # 80002738 <_ZdlPv>
    80006288:	00048513          	mv	a0,s1
    8000628c:	00008097          	auipc	ra,0x8
    80006290:	b2c080e7          	jalr	-1236(ra) # 8000ddb8 <_Unwind_Resume>

0000000080006294 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006294:	fe010113          	addi	sp,sp,-32
    80006298:	00113c23          	sd	ra,24(sp)
    8000629c:	00813823          	sd	s0,16(sp)
    800062a0:	00913423          	sd	s1,8(sp)
    800062a4:	01213023          	sd	s2,0(sp)
    800062a8:	02010413          	addi	s0,sp,32
    800062ac:	00050493          	mv	s1,a0
    800062b0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800062b4:	01853503          	ld	a0,24(a0)
    800062b8:	ffffc097          	auipc	ra,0xffffc
    800062bc:	6e8080e7          	jalr	1768(ra) # 800029a0 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800062c0:	0304b503          	ld	a0,48(s1)
    800062c4:	ffffc097          	auipc	ra,0xffffc
    800062c8:	6dc080e7          	jalr	1756(ra) # 800029a0 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800062cc:	0084b783          	ld	a5,8(s1)
    800062d0:	0144a703          	lw	a4,20(s1)
    800062d4:	00271713          	slli	a4,a4,0x2
    800062d8:	00e787b3          	add	a5,a5,a4
    800062dc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800062e0:	0144a783          	lw	a5,20(s1)
    800062e4:	0017879b          	addiw	a5,a5,1
    800062e8:	0004a703          	lw	a4,0(s1)
    800062ec:	02e7e7bb          	remw	a5,a5,a4
    800062f0:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800062f4:	0304b503          	ld	a0,48(s1)
    800062f8:	ffffc097          	auipc	ra,0xffffc
    800062fc:	6d4080e7          	jalr	1748(ra) # 800029cc <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006300:	0204b503          	ld	a0,32(s1)
    80006304:	ffffc097          	auipc	ra,0xffffc
    80006308:	6c8080e7          	jalr	1736(ra) # 800029cc <_ZN9Semaphore6signalEv>

}
    8000630c:	01813083          	ld	ra,24(sp)
    80006310:	01013403          	ld	s0,16(sp)
    80006314:	00813483          	ld	s1,8(sp)
    80006318:	00013903          	ld	s2,0(sp)
    8000631c:	02010113          	addi	sp,sp,32
    80006320:	00008067          	ret

0000000080006324 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006324:	fe010113          	addi	sp,sp,-32
    80006328:	00113c23          	sd	ra,24(sp)
    8000632c:	00813823          	sd	s0,16(sp)
    80006330:	00913423          	sd	s1,8(sp)
    80006334:	01213023          	sd	s2,0(sp)
    80006338:	02010413          	addi	s0,sp,32
    8000633c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006340:	02053503          	ld	a0,32(a0)
    80006344:	ffffc097          	auipc	ra,0xffffc
    80006348:	65c080e7          	jalr	1628(ra) # 800029a0 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000634c:	0284b503          	ld	a0,40(s1)
    80006350:	ffffc097          	auipc	ra,0xffffc
    80006354:	650080e7          	jalr	1616(ra) # 800029a0 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006358:	0084b703          	ld	a4,8(s1)
    8000635c:	0104a783          	lw	a5,16(s1)
    80006360:	00279693          	slli	a3,a5,0x2
    80006364:	00d70733          	add	a4,a4,a3
    80006368:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000636c:	0017879b          	addiw	a5,a5,1
    80006370:	0004a703          	lw	a4,0(s1)
    80006374:	02e7e7bb          	remw	a5,a5,a4
    80006378:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000637c:	0284b503          	ld	a0,40(s1)
    80006380:	ffffc097          	auipc	ra,0xffffc
    80006384:	64c080e7          	jalr	1612(ra) # 800029cc <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006388:	0184b503          	ld	a0,24(s1)
    8000638c:	ffffc097          	auipc	ra,0xffffc
    80006390:	640080e7          	jalr	1600(ra) # 800029cc <_ZN9Semaphore6signalEv>

    return ret;
}
    80006394:	00090513          	mv	a0,s2
    80006398:	01813083          	ld	ra,24(sp)
    8000639c:	01013403          	ld	s0,16(sp)
    800063a0:	00813483          	ld	s1,8(sp)
    800063a4:	00013903          	ld	s2,0(sp)
    800063a8:	02010113          	addi	sp,sp,32
    800063ac:	00008067          	ret

00000000800063b0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800063b0:	fe010113          	addi	sp,sp,-32
    800063b4:	00113c23          	sd	ra,24(sp)
    800063b8:	00813823          	sd	s0,16(sp)
    800063bc:	00913423          	sd	s1,8(sp)
    800063c0:	01213023          	sd	s2,0(sp)
    800063c4:	02010413          	addi	s0,sp,32
    800063c8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800063cc:	02853503          	ld	a0,40(a0)
    800063d0:	ffffc097          	auipc	ra,0xffffc
    800063d4:	5d0080e7          	jalr	1488(ra) # 800029a0 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800063d8:	0304b503          	ld	a0,48(s1)
    800063dc:	ffffc097          	auipc	ra,0xffffc
    800063e0:	5c4080e7          	jalr	1476(ra) # 800029a0 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800063e4:	0144a783          	lw	a5,20(s1)
    800063e8:	0104a903          	lw	s2,16(s1)
    800063ec:	0327ce63          	blt	a5,s2,80006428 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800063f0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800063f4:	0304b503          	ld	a0,48(s1)
    800063f8:	ffffc097          	auipc	ra,0xffffc
    800063fc:	5d4080e7          	jalr	1492(ra) # 800029cc <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006400:	0284b503          	ld	a0,40(s1)
    80006404:	ffffc097          	auipc	ra,0xffffc
    80006408:	5c8080e7          	jalr	1480(ra) # 800029cc <_ZN9Semaphore6signalEv>

    return ret;
}
    8000640c:	00090513          	mv	a0,s2
    80006410:	01813083          	ld	ra,24(sp)
    80006414:	01013403          	ld	s0,16(sp)
    80006418:	00813483          	ld	s1,8(sp)
    8000641c:	00013903          	ld	s2,0(sp)
    80006420:	02010113          	addi	sp,sp,32
    80006424:	00008067          	ret
        ret = cap - head + tail;
    80006428:	0004a703          	lw	a4,0(s1)
    8000642c:	4127093b          	subw	s2,a4,s2
    80006430:	00f9093b          	addw	s2,s2,a5
    80006434:	fc1ff06f          	j	800063f4 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006438 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006438:	fe010113          	addi	sp,sp,-32
    8000643c:	00113c23          	sd	ra,24(sp)
    80006440:	00813823          	sd	s0,16(sp)
    80006444:	00913423          	sd	s1,8(sp)
    80006448:	02010413          	addi	s0,sp,32
    8000644c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006450:	00a00513          	li	a0,10
    80006454:	ffffc097          	auipc	ra,0xffffc
    80006458:	638080e7          	jalr	1592(ra) # 80002a8c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    8000645c:	00004517          	auipc	a0,0x4
    80006460:	19c50513          	addi	a0,a0,412 # 8000a5f8 <CONSOLE_STATUS+0x5e8>
    80006464:	ffffb097          	auipc	ra,0xffffb
    80006468:	770080e7          	jalr	1904(ra) # 80001bd4 <_Z11printStringPKc>
    while (getCnt()) {
    8000646c:	00048513          	mv	a0,s1
    80006470:	00000097          	auipc	ra,0x0
    80006474:	f40080e7          	jalr	-192(ra) # 800063b0 <_ZN9BufferCPP6getCntEv>
    80006478:	02050c63          	beqz	a0,800064b0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000647c:	0084b783          	ld	a5,8(s1)
    80006480:	0104a703          	lw	a4,16(s1)
    80006484:	00271713          	slli	a4,a4,0x2
    80006488:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    8000648c:	0007c503          	lbu	a0,0(a5)
    80006490:	ffffc097          	auipc	ra,0xffffc
    80006494:	5fc080e7          	jalr	1532(ra) # 80002a8c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006498:	0104a783          	lw	a5,16(s1)
    8000649c:	0017879b          	addiw	a5,a5,1
    800064a0:	0004a703          	lw	a4,0(s1)
    800064a4:	02e7e7bb          	remw	a5,a5,a4
    800064a8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800064ac:	fc1ff06f          	j	8000646c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800064b0:	02100513          	li	a0,33
    800064b4:	ffffc097          	auipc	ra,0xffffc
    800064b8:	5d8080e7          	jalr	1496(ra) # 80002a8c <_ZN7Console4putcEc>
    Console::putc('\n');
    800064bc:	00a00513          	li	a0,10
    800064c0:	ffffc097          	auipc	ra,0xffffc
    800064c4:	5cc080e7          	jalr	1484(ra) # 80002a8c <_ZN7Console4putcEc>
    mem_free(buffer);
    800064c8:	0084b503          	ld	a0,8(s1)
    800064cc:	ffffb097          	auipc	ra,0xffffb
    800064d0:	df8080e7          	jalr	-520(ra) # 800012c4 <_Z8mem_freePv>
    delete itemAvailable;
    800064d4:	0204b503          	ld	a0,32(s1)
    800064d8:	00050863          	beqz	a0,800064e8 <_ZN9BufferCPPD1Ev+0xb0>
    800064dc:	00053783          	ld	a5,0(a0)
    800064e0:	0087b783          	ld	a5,8(a5)
    800064e4:	000780e7          	jalr	a5
    delete spaceAvailable;
    800064e8:	0184b503          	ld	a0,24(s1)
    800064ec:	00050863          	beqz	a0,800064fc <_ZN9BufferCPPD1Ev+0xc4>
    800064f0:	00053783          	ld	a5,0(a0)
    800064f4:	0087b783          	ld	a5,8(a5)
    800064f8:	000780e7          	jalr	a5
    delete mutexTail;
    800064fc:	0304b503          	ld	a0,48(s1)
    80006500:	00050863          	beqz	a0,80006510 <_ZN9BufferCPPD1Ev+0xd8>
    80006504:	00053783          	ld	a5,0(a0)
    80006508:	0087b783          	ld	a5,8(a5)
    8000650c:	000780e7          	jalr	a5
    delete mutexHead;
    80006510:	0284b503          	ld	a0,40(s1)
    80006514:	00050863          	beqz	a0,80006524 <_ZN9BufferCPPD1Ev+0xec>
    80006518:	00053783          	ld	a5,0(a0)
    8000651c:	0087b783          	ld	a5,8(a5)
    80006520:	000780e7          	jalr	a5
}
    80006524:	01813083          	ld	ra,24(sp)
    80006528:	01013403          	ld	s0,16(sp)
    8000652c:	00813483          	ld	s1,8(sp)
    80006530:	02010113          	addi	sp,sp,32
    80006534:	00008067          	ret

0000000080006538 <_ZL9sleepyRunPv>:

#include "../h/printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006538:	fe010113          	addi	sp,sp,-32
    8000653c:	00113c23          	sd	ra,24(sp)
    80006540:	00813823          	sd	s0,16(sp)
    80006544:	00913423          	sd	s1,8(sp)
    80006548:	01213023          	sd	s2,0(sp)
    8000654c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80006550:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006554:	00600493          	li	s1,6
    while (--i > 0) {
    80006558:	fff4849b          	addiw	s1,s1,-1
    8000655c:	04905463          	blez	s1,800065a4 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80006560:	00004517          	auipc	a0,0x4
    80006564:	0b050513          	addi	a0,a0,176 # 8000a610 <CONSOLE_STATUS+0x600>
    80006568:	ffffb097          	auipc	ra,0xffffb
    8000656c:	66c080e7          	jalr	1644(ra) # 80001bd4 <_Z11printStringPKc>
        printInt(sleep_time);
    80006570:	00000613          	li	a2,0
    80006574:	00a00593          	li	a1,10
    80006578:	0009051b          	sext.w	a0,s2
    8000657c:	ffffc097          	auipc	ra,0xffffc
    80006580:	890080e7          	jalr	-1904(ra) # 80001e0c <_Z8printIntiii>
        printString(" !\n");
    80006584:	00004517          	auipc	a0,0x4
    80006588:	09450513          	addi	a0,a0,148 # 8000a618 <CONSOLE_STATUS+0x608>
    8000658c:	ffffb097          	auipc	ra,0xffffb
    80006590:	648080e7          	jalr	1608(ra) # 80001bd4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006594:	00090513          	mv	a0,s2
    80006598:	ffffb097          	auipc	ra,0xffffb
    8000659c:	12c080e7          	jalr	300(ra) # 800016c4 <_Z10time_sleepm>
    while (--i > 0) {
    800065a0:	fb9ff06f          	j	80006558 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800065a4:	00a00793          	li	a5,10
    800065a8:	02f95933          	divu	s2,s2,a5
    800065ac:	fff90913          	addi	s2,s2,-1
    800065b0:	00006797          	auipc	a5,0x6
    800065b4:	73078793          	addi	a5,a5,1840 # 8000cce0 <_ZL8finished>
    800065b8:	01278933          	add	s2,a5,s2
    800065bc:	00100793          	li	a5,1
    800065c0:	00f90023          	sb	a5,0(s2)
}
    800065c4:	01813083          	ld	ra,24(sp)
    800065c8:	01013403          	ld	s0,16(sp)
    800065cc:	00813483          	ld	s1,8(sp)
    800065d0:	00013903          	ld	s2,0(sp)
    800065d4:	02010113          	addi	sp,sp,32
    800065d8:	00008067          	ret

00000000800065dc <_Z12testSleepingv>:

void testSleeping() {
    800065dc:	fc010113          	addi	sp,sp,-64
    800065e0:	02113c23          	sd	ra,56(sp)
    800065e4:	02813823          	sd	s0,48(sp)
    800065e8:	02913423          	sd	s1,40(sp)
    800065ec:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800065f0:	00a00793          	li	a5,10
    800065f4:	fcf43823          	sd	a5,-48(s0)
    800065f8:	01400793          	li	a5,20
    800065fc:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006600:	00000493          	li	s1,0
    80006604:	02c0006f          	j	80006630 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006608:	00349793          	slli	a5,s1,0x3
    8000660c:	fd040613          	addi	a2,s0,-48
    80006610:	00f60633          	add	a2,a2,a5
    80006614:	00000597          	auipc	a1,0x0
    80006618:	f2458593          	addi	a1,a1,-220 # 80006538 <_ZL9sleepyRunPv>
    8000661c:	fc040513          	addi	a0,s0,-64
    80006620:	00f50533          	add	a0,a0,a5
    80006624:	ffffb097          	auipc	ra,0xffffb
    80006628:	db0080e7          	jalr	-592(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    8000662c:	0014849b          	addiw	s1,s1,1
    80006630:	00100793          	li	a5,1
    80006634:	fc97dae3          	bge	a5,s1,80006608 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006638:	00006797          	auipc	a5,0x6
    8000663c:	6a87c783          	lbu	a5,1704(a5) # 8000cce0 <_ZL8finished>
    80006640:	fe078ce3          	beqz	a5,80006638 <_Z12testSleepingv+0x5c>
    80006644:	00006797          	auipc	a5,0x6
    80006648:	69d7c783          	lbu	a5,1693(a5) # 8000cce1 <_ZL8finished+0x1>
    8000664c:	fe0786e3          	beqz	a5,80006638 <_Z12testSleepingv+0x5c>
}
    80006650:	03813083          	ld	ra,56(sp)
    80006654:	03013403          	ld	s0,48(sp)
    80006658:	02813483          	ld	s1,40(sp)
    8000665c:	04010113          	addi	sp,sp,64
    80006660:	00008067          	ret

0000000080006664 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006664:	fe010113          	addi	sp,sp,-32
    80006668:	00113c23          	sd	ra,24(sp)
    8000666c:	00813823          	sd	s0,16(sp)
    80006670:	00913423          	sd	s1,8(sp)
    80006674:	01213023          	sd	s2,0(sp)
    80006678:	02010413          	addi	s0,sp,32
    8000667c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006680:	00100793          	li	a5,1
    80006684:	02a7f863          	bgeu	a5,a0,800066b4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006688:	00a00793          	li	a5,10
    8000668c:	02f577b3          	remu	a5,a0,a5
    80006690:	02078e63          	beqz	a5,800066cc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006694:	fff48513          	addi	a0,s1,-1
    80006698:	00000097          	auipc	ra,0x0
    8000669c:	fcc080e7          	jalr	-52(ra) # 80006664 <_ZL9fibonaccim>
    800066a0:	00050913          	mv	s2,a0
    800066a4:	ffe48513          	addi	a0,s1,-2
    800066a8:	00000097          	auipc	ra,0x0
    800066ac:	fbc080e7          	jalr	-68(ra) # 80006664 <_ZL9fibonaccim>
    800066b0:	00a90533          	add	a0,s2,a0
}
    800066b4:	01813083          	ld	ra,24(sp)
    800066b8:	01013403          	ld	s0,16(sp)
    800066bc:	00813483          	ld	s1,8(sp)
    800066c0:	00013903          	ld	s2,0(sp)
    800066c4:	02010113          	addi	sp,sp,32
    800066c8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800066cc:	ffffb097          	auipc	ra,0xffffb
    800066d0:	e14080e7          	jalr	-492(ra) # 800014e0 <_Z15thread_dispatchv>
    800066d4:	fc1ff06f          	j	80006694 <_ZL9fibonaccim+0x30>

00000000800066d8 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800066d8:	fe010113          	addi	sp,sp,-32
    800066dc:	00113c23          	sd	ra,24(sp)
    800066e0:	00813823          	sd	s0,16(sp)
    800066e4:	00913423          	sd	s1,8(sp)
    800066e8:	01213023          	sd	s2,0(sp)
    800066ec:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800066f0:	00a00493          	li	s1,10
    800066f4:	0400006f          	j	80006734 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800066f8:	00004517          	auipc	a0,0x4
    800066fc:	e6850513          	addi	a0,a0,-408 # 8000a560 <CONSOLE_STATUS+0x550>
    80006700:	ffffb097          	auipc	ra,0xffffb
    80006704:	4d4080e7          	jalr	1236(ra) # 80001bd4 <_Z11printStringPKc>
    80006708:	00000613          	li	a2,0
    8000670c:	00a00593          	li	a1,10
    80006710:	00048513          	mv	a0,s1
    80006714:	ffffb097          	auipc	ra,0xffffb
    80006718:	6f8080e7          	jalr	1784(ra) # 80001e0c <_Z8printIntiii>
    8000671c:	00004517          	auipc	a0,0x4
    80006720:	bc450513          	addi	a0,a0,-1084 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006724:	ffffb097          	auipc	ra,0xffffb
    80006728:	4b0080e7          	jalr	1200(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000672c:	0014849b          	addiw	s1,s1,1
    80006730:	0ff4f493          	andi	s1,s1,255
    80006734:	00c00793          	li	a5,12
    80006738:	fc97f0e3          	bgeu	a5,s1,800066f8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000673c:	00004517          	auipc	a0,0x4
    80006740:	e2c50513          	addi	a0,a0,-468 # 8000a568 <CONSOLE_STATUS+0x558>
    80006744:	ffffb097          	auipc	ra,0xffffb
    80006748:	490080e7          	jalr	1168(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000674c:	00500313          	li	t1,5
    thread_dispatch();
    80006750:	ffffb097          	auipc	ra,0xffffb
    80006754:	d90080e7          	jalr	-624(ra) # 800014e0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006758:	01000513          	li	a0,16
    8000675c:	00000097          	auipc	ra,0x0
    80006760:	f08080e7          	jalr	-248(ra) # 80006664 <_ZL9fibonaccim>
    80006764:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006768:	00004517          	auipc	a0,0x4
    8000676c:	e1050513          	addi	a0,a0,-496 # 8000a578 <CONSOLE_STATUS+0x568>
    80006770:	ffffb097          	auipc	ra,0xffffb
    80006774:	464080e7          	jalr	1124(ra) # 80001bd4 <_Z11printStringPKc>
    80006778:	00000613          	li	a2,0
    8000677c:	00a00593          	li	a1,10
    80006780:	0009051b          	sext.w	a0,s2
    80006784:	ffffb097          	auipc	ra,0xffffb
    80006788:	688080e7          	jalr	1672(ra) # 80001e0c <_Z8printIntiii>
    8000678c:	00004517          	auipc	a0,0x4
    80006790:	b5450513          	addi	a0,a0,-1196 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006794:	ffffb097          	auipc	ra,0xffffb
    80006798:	440080e7          	jalr	1088(ra) # 80001bd4 <_Z11printStringPKc>
    8000679c:	0400006f          	j	800067dc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800067a0:	00004517          	auipc	a0,0x4
    800067a4:	dc050513          	addi	a0,a0,-576 # 8000a560 <CONSOLE_STATUS+0x550>
    800067a8:	ffffb097          	auipc	ra,0xffffb
    800067ac:	42c080e7          	jalr	1068(ra) # 80001bd4 <_Z11printStringPKc>
    800067b0:	00000613          	li	a2,0
    800067b4:	00a00593          	li	a1,10
    800067b8:	00048513          	mv	a0,s1
    800067bc:	ffffb097          	auipc	ra,0xffffb
    800067c0:	650080e7          	jalr	1616(ra) # 80001e0c <_Z8printIntiii>
    800067c4:	00004517          	auipc	a0,0x4
    800067c8:	b1c50513          	addi	a0,a0,-1252 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800067cc:	ffffb097          	auipc	ra,0xffffb
    800067d0:	408080e7          	jalr	1032(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800067d4:	0014849b          	addiw	s1,s1,1
    800067d8:	0ff4f493          	andi	s1,s1,255
    800067dc:	00f00793          	li	a5,15
    800067e0:	fc97f0e3          	bgeu	a5,s1,800067a0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800067e4:	00004517          	auipc	a0,0x4
    800067e8:	da450513          	addi	a0,a0,-604 # 8000a588 <CONSOLE_STATUS+0x578>
    800067ec:	ffffb097          	auipc	ra,0xffffb
    800067f0:	3e8080e7          	jalr	1000(ra) # 80001bd4 <_Z11printStringPKc>
    finishedD = true;
    800067f4:	00100793          	li	a5,1
    800067f8:	00006717          	auipc	a4,0x6
    800067fc:	4ef70523          	sb	a5,1258(a4) # 8000cce2 <_ZL9finishedD>
    thread_dispatch();
    80006800:	ffffb097          	auipc	ra,0xffffb
    80006804:	ce0080e7          	jalr	-800(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80006808:	01813083          	ld	ra,24(sp)
    8000680c:	01013403          	ld	s0,16(sp)
    80006810:	00813483          	ld	s1,8(sp)
    80006814:	00013903          	ld	s2,0(sp)
    80006818:	02010113          	addi	sp,sp,32
    8000681c:	00008067          	ret

0000000080006820 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006820:	fe010113          	addi	sp,sp,-32
    80006824:	00113c23          	sd	ra,24(sp)
    80006828:	00813823          	sd	s0,16(sp)
    8000682c:	00913423          	sd	s1,8(sp)
    80006830:	01213023          	sd	s2,0(sp)
    80006834:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006838:	00000493          	li	s1,0
    8000683c:	0400006f          	j	8000687c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006840:	00004517          	auipc	a0,0x4
    80006844:	cf050513          	addi	a0,a0,-784 # 8000a530 <CONSOLE_STATUS+0x520>
    80006848:	ffffb097          	auipc	ra,0xffffb
    8000684c:	38c080e7          	jalr	908(ra) # 80001bd4 <_Z11printStringPKc>
    80006850:	00000613          	li	a2,0
    80006854:	00a00593          	li	a1,10
    80006858:	00048513          	mv	a0,s1
    8000685c:	ffffb097          	auipc	ra,0xffffb
    80006860:	5b0080e7          	jalr	1456(ra) # 80001e0c <_Z8printIntiii>
    80006864:	00004517          	auipc	a0,0x4
    80006868:	a7c50513          	addi	a0,a0,-1412 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	368080e7          	jalr	872(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006874:	0014849b          	addiw	s1,s1,1
    80006878:	0ff4f493          	andi	s1,s1,255
    8000687c:	00200793          	li	a5,2
    80006880:	fc97f0e3          	bgeu	a5,s1,80006840 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006884:	00004517          	auipc	a0,0x4
    80006888:	cb450513          	addi	a0,a0,-844 # 8000a538 <CONSOLE_STATUS+0x528>
    8000688c:	ffffb097          	auipc	ra,0xffffb
    80006890:	348080e7          	jalr	840(ra) # 80001bd4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006894:	00700313          	li	t1,7
    thread_dispatch();
    80006898:	ffffb097          	auipc	ra,0xffffb
    8000689c:	c48080e7          	jalr	-952(ra) # 800014e0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800068a0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800068a4:	00004517          	auipc	a0,0x4
    800068a8:	ca450513          	addi	a0,a0,-860 # 8000a548 <CONSOLE_STATUS+0x538>
    800068ac:	ffffb097          	auipc	ra,0xffffb
    800068b0:	328080e7          	jalr	808(ra) # 80001bd4 <_Z11printStringPKc>
    800068b4:	00000613          	li	a2,0
    800068b8:	00a00593          	li	a1,10
    800068bc:	0009051b          	sext.w	a0,s2
    800068c0:	ffffb097          	auipc	ra,0xffffb
    800068c4:	54c080e7          	jalr	1356(ra) # 80001e0c <_Z8printIntiii>
    800068c8:	00004517          	auipc	a0,0x4
    800068cc:	a1850513          	addi	a0,a0,-1512 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    800068d0:	ffffb097          	auipc	ra,0xffffb
    800068d4:	304080e7          	jalr	772(ra) # 80001bd4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800068d8:	00c00513          	li	a0,12
    800068dc:	00000097          	auipc	ra,0x0
    800068e0:	d88080e7          	jalr	-632(ra) # 80006664 <_ZL9fibonaccim>
    800068e4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800068e8:	00004517          	auipc	a0,0x4
    800068ec:	c6850513          	addi	a0,a0,-920 # 8000a550 <CONSOLE_STATUS+0x540>
    800068f0:	ffffb097          	auipc	ra,0xffffb
    800068f4:	2e4080e7          	jalr	740(ra) # 80001bd4 <_Z11printStringPKc>
    800068f8:	00000613          	li	a2,0
    800068fc:	00a00593          	li	a1,10
    80006900:	0009051b          	sext.w	a0,s2
    80006904:	ffffb097          	auipc	ra,0xffffb
    80006908:	508080e7          	jalr	1288(ra) # 80001e0c <_Z8printIntiii>
    8000690c:	00004517          	auipc	a0,0x4
    80006910:	9d450513          	addi	a0,a0,-1580 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	2c0080e7          	jalr	704(ra) # 80001bd4 <_Z11printStringPKc>
    8000691c:	0400006f          	j	8000695c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006920:	00004517          	auipc	a0,0x4
    80006924:	c1050513          	addi	a0,a0,-1008 # 8000a530 <CONSOLE_STATUS+0x520>
    80006928:	ffffb097          	auipc	ra,0xffffb
    8000692c:	2ac080e7          	jalr	684(ra) # 80001bd4 <_Z11printStringPKc>
    80006930:	00000613          	li	a2,0
    80006934:	00a00593          	li	a1,10
    80006938:	00048513          	mv	a0,s1
    8000693c:	ffffb097          	auipc	ra,0xffffb
    80006940:	4d0080e7          	jalr	1232(ra) # 80001e0c <_Z8printIntiii>
    80006944:	00004517          	auipc	a0,0x4
    80006948:	99c50513          	addi	a0,a0,-1636 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    8000694c:	ffffb097          	auipc	ra,0xffffb
    80006950:	288080e7          	jalr	648(ra) # 80001bd4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006954:	0014849b          	addiw	s1,s1,1
    80006958:	0ff4f493          	andi	s1,s1,255
    8000695c:	00500793          	li	a5,5
    80006960:	fc97f0e3          	bgeu	a5,s1,80006920 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006964:	00004517          	auipc	a0,0x4
    80006968:	ba450513          	addi	a0,a0,-1116 # 8000a508 <CONSOLE_STATUS+0x4f8>
    8000696c:	ffffb097          	auipc	ra,0xffffb
    80006970:	268080e7          	jalr	616(ra) # 80001bd4 <_Z11printStringPKc>
    finishedC = true;
    80006974:	00100793          	li	a5,1
    80006978:	00006717          	auipc	a4,0x6
    8000697c:	36f705a3          	sb	a5,875(a4) # 8000cce3 <_ZL9finishedC>
    thread_dispatch();
    80006980:	ffffb097          	auipc	ra,0xffffb
    80006984:	b60080e7          	jalr	-1184(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80006988:	01813083          	ld	ra,24(sp)
    8000698c:	01013403          	ld	s0,16(sp)
    80006990:	00813483          	ld	s1,8(sp)
    80006994:	00013903          	ld	s2,0(sp)
    80006998:	02010113          	addi	sp,sp,32
    8000699c:	00008067          	ret

00000000800069a0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800069a0:	fe010113          	addi	sp,sp,-32
    800069a4:	00113c23          	sd	ra,24(sp)
    800069a8:	00813823          	sd	s0,16(sp)
    800069ac:	00913423          	sd	s1,8(sp)
    800069b0:	01213023          	sd	s2,0(sp)
    800069b4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800069b8:	00000913          	li	s2,0
    800069bc:	0400006f          	j	800069fc <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800069c0:	ffffb097          	auipc	ra,0xffffb
    800069c4:	b20080e7          	jalr	-1248(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800069c8:	00148493          	addi	s1,s1,1
    800069cc:	000027b7          	lui	a5,0x2
    800069d0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800069d4:	0097ee63          	bltu	a5,s1,800069f0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800069d8:	00000713          	li	a4,0
    800069dc:	000077b7          	lui	a5,0x7
    800069e0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800069e4:	fce7eee3          	bltu	a5,a4,800069c0 <_ZL11workerBodyBPv+0x20>
    800069e8:	00170713          	addi	a4,a4,1
    800069ec:	ff1ff06f          	j	800069dc <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800069f0:	00a00793          	li	a5,10
    800069f4:	04f90663          	beq	s2,a5,80006a40 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800069f8:	00190913          	addi	s2,s2,1
    800069fc:	00f00793          	li	a5,15
    80006a00:	0527e463          	bltu	a5,s2,80006a48 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006a04:	00004517          	auipc	a0,0x4
    80006a08:	b1450513          	addi	a0,a0,-1260 # 8000a518 <CONSOLE_STATUS+0x508>
    80006a0c:	ffffb097          	auipc	ra,0xffffb
    80006a10:	1c8080e7          	jalr	456(ra) # 80001bd4 <_Z11printStringPKc>
    80006a14:	00000613          	li	a2,0
    80006a18:	00a00593          	li	a1,10
    80006a1c:	0009051b          	sext.w	a0,s2
    80006a20:	ffffb097          	auipc	ra,0xffffb
    80006a24:	3ec080e7          	jalr	1004(ra) # 80001e0c <_Z8printIntiii>
    80006a28:	00004517          	auipc	a0,0x4
    80006a2c:	8b850513          	addi	a0,a0,-1864 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006a30:	ffffb097          	auipc	ra,0xffffb
    80006a34:	1a4080e7          	jalr	420(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a38:	00000493          	li	s1,0
    80006a3c:	f91ff06f          	j	800069cc <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a40:	14102ff3          	csrr	t6,sepc
    80006a44:	fb5ff06f          	j	800069f8 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006a48:	00004517          	auipc	a0,0x4
    80006a4c:	ad850513          	addi	a0,a0,-1320 # 8000a520 <CONSOLE_STATUS+0x510>
    80006a50:	ffffb097          	auipc	ra,0xffffb
    80006a54:	184080e7          	jalr	388(ra) # 80001bd4 <_Z11printStringPKc>
    finishedB = true;
    80006a58:	00100793          	li	a5,1
    80006a5c:	00006717          	auipc	a4,0x6
    80006a60:	28f70423          	sb	a5,648(a4) # 8000cce4 <_ZL9finishedB>
    thread_dispatch();
    80006a64:	ffffb097          	auipc	ra,0xffffb
    80006a68:	a7c080e7          	jalr	-1412(ra) # 800014e0 <_Z15thread_dispatchv>
}
    80006a6c:	01813083          	ld	ra,24(sp)
    80006a70:	01013403          	ld	s0,16(sp)
    80006a74:	00813483          	ld	s1,8(sp)
    80006a78:	00013903          	ld	s2,0(sp)
    80006a7c:	02010113          	addi	sp,sp,32
    80006a80:	00008067          	ret

0000000080006a84 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006a84:	fe010113          	addi	sp,sp,-32
    80006a88:	00113c23          	sd	ra,24(sp)
    80006a8c:	00813823          	sd	s0,16(sp)
    80006a90:	00913423          	sd	s1,8(sp)
    80006a94:	01213023          	sd	s2,0(sp)
    80006a98:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006a9c:	00000913          	li	s2,0
    80006aa0:	0380006f          	j	80006ad8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006aa4:	ffffb097          	auipc	ra,0xffffb
    80006aa8:	a3c080e7          	jalr	-1476(ra) # 800014e0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006aac:	00148493          	addi	s1,s1,1
    80006ab0:	000027b7          	lui	a5,0x2
    80006ab4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006ab8:	0097ee63          	bltu	a5,s1,80006ad4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006abc:	00000713          	li	a4,0
    80006ac0:	000077b7          	lui	a5,0x7
    80006ac4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006ac8:	fce7eee3          	bltu	a5,a4,80006aa4 <_ZL11workerBodyAPv+0x20>
    80006acc:	00170713          	addi	a4,a4,1
    80006ad0:	ff1ff06f          	j	80006ac0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006ad4:	00190913          	addi	s2,s2,1
    80006ad8:	00900793          	li	a5,9
    80006adc:	0527e063          	bltu	a5,s2,80006b1c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006ae0:	00004517          	auipc	a0,0x4
    80006ae4:	a2050513          	addi	a0,a0,-1504 # 8000a500 <CONSOLE_STATUS+0x4f0>
    80006ae8:	ffffb097          	auipc	ra,0xffffb
    80006aec:	0ec080e7          	jalr	236(ra) # 80001bd4 <_Z11printStringPKc>
    80006af0:	00000613          	li	a2,0
    80006af4:	00a00593          	li	a1,10
    80006af8:	0009051b          	sext.w	a0,s2
    80006afc:	ffffb097          	auipc	ra,0xffffb
    80006b00:	310080e7          	jalr	784(ra) # 80001e0c <_Z8printIntiii>
    80006b04:	00003517          	auipc	a0,0x3
    80006b08:	7dc50513          	addi	a0,a0,2012 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80006b0c:	ffffb097          	auipc	ra,0xffffb
    80006b10:	0c8080e7          	jalr	200(ra) # 80001bd4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b14:	00000493          	li	s1,0
    80006b18:	f99ff06f          	j	80006ab0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006b1c:	00004517          	auipc	a0,0x4
    80006b20:	9ec50513          	addi	a0,a0,-1556 # 8000a508 <CONSOLE_STATUS+0x4f8>
    80006b24:	ffffb097          	auipc	ra,0xffffb
    80006b28:	0b0080e7          	jalr	176(ra) # 80001bd4 <_Z11printStringPKc>
    finishedA = true;
    80006b2c:	00100793          	li	a5,1
    80006b30:	00006717          	auipc	a4,0x6
    80006b34:	1af70aa3          	sb	a5,437(a4) # 8000cce5 <_ZL9finishedA>
}
    80006b38:	01813083          	ld	ra,24(sp)
    80006b3c:	01013403          	ld	s0,16(sp)
    80006b40:	00813483          	ld	s1,8(sp)
    80006b44:	00013903          	ld	s2,0(sp)
    80006b48:	02010113          	addi	sp,sp,32
    80006b4c:	00008067          	ret

0000000080006b50 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006b50:	fd010113          	addi	sp,sp,-48
    80006b54:	02113423          	sd	ra,40(sp)
    80006b58:	02813023          	sd	s0,32(sp)
    80006b5c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006b60:	00000613          	li	a2,0
    80006b64:	00000597          	auipc	a1,0x0
    80006b68:	f2058593          	addi	a1,a1,-224 # 80006a84 <_ZL11workerBodyAPv>
    80006b6c:	fd040513          	addi	a0,s0,-48
    80006b70:	ffffb097          	auipc	ra,0xffffb
    80006b74:	864080e7          	jalr	-1948(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006b78:	00004517          	auipc	a0,0x4
    80006b7c:	a2050513          	addi	a0,a0,-1504 # 8000a598 <CONSOLE_STATUS+0x588>
    80006b80:	ffffb097          	auipc	ra,0xffffb
    80006b84:	054080e7          	jalr	84(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006b88:	00000613          	li	a2,0
    80006b8c:	00000597          	auipc	a1,0x0
    80006b90:	e1458593          	addi	a1,a1,-492 # 800069a0 <_ZL11workerBodyBPv>
    80006b94:	fd840513          	addi	a0,s0,-40
    80006b98:	ffffb097          	auipc	ra,0xffffb
    80006b9c:	83c080e7          	jalr	-1988(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006ba0:	00004517          	auipc	a0,0x4
    80006ba4:	a1050513          	addi	a0,a0,-1520 # 8000a5b0 <CONSOLE_STATUS+0x5a0>
    80006ba8:	ffffb097          	auipc	ra,0xffffb
    80006bac:	02c080e7          	jalr	44(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006bb0:	00000613          	li	a2,0
    80006bb4:	00000597          	auipc	a1,0x0
    80006bb8:	c6c58593          	addi	a1,a1,-916 # 80006820 <_ZL11workerBodyCPv>
    80006bbc:	fe040513          	addi	a0,s0,-32
    80006bc0:	ffffb097          	auipc	ra,0xffffb
    80006bc4:	814080e7          	jalr	-2028(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006bc8:	00004517          	auipc	a0,0x4
    80006bcc:	a0050513          	addi	a0,a0,-1536 # 8000a5c8 <CONSOLE_STATUS+0x5b8>
    80006bd0:	ffffb097          	auipc	ra,0xffffb
    80006bd4:	004080e7          	jalr	4(ra) # 80001bd4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006bd8:	00000613          	li	a2,0
    80006bdc:	00000597          	auipc	a1,0x0
    80006be0:	afc58593          	addi	a1,a1,-1284 # 800066d8 <_ZL11workerBodyDPv>
    80006be4:	fe840513          	addi	a0,s0,-24
    80006be8:	ffffa097          	auipc	ra,0xffffa
    80006bec:	7ec080e7          	jalr	2028(ra) # 800013d4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80006bf0:	00004517          	auipc	a0,0x4
    80006bf4:	9f050513          	addi	a0,a0,-1552 # 8000a5e0 <CONSOLE_STATUS+0x5d0>
    80006bf8:	ffffb097          	auipc	ra,0xffffb
    80006bfc:	fdc080e7          	jalr	-36(ra) # 80001bd4 <_Z11printStringPKc>
    80006c00:	00c0006f          	j	80006c0c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c04:	ffffb097          	auipc	ra,0xffffb
    80006c08:	8dc080e7          	jalr	-1828(ra) # 800014e0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c0c:	00006797          	auipc	a5,0x6
    80006c10:	0d97c783          	lbu	a5,217(a5) # 8000cce5 <_ZL9finishedA>
    80006c14:	fe0788e3          	beqz	a5,80006c04 <_Z16System_Mode_testv+0xb4>
    80006c18:	00006797          	auipc	a5,0x6
    80006c1c:	0cc7c783          	lbu	a5,204(a5) # 8000cce4 <_ZL9finishedB>
    80006c20:	fe0782e3          	beqz	a5,80006c04 <_Z16System_Mode_testv+0xb4>
    80006c24:	00006797          	auipc	a5,0x6
    80006c28:	0bf7c783          	lbu	a5,191(a5) # 8000cce3 <_ZL9finishedC>
    80006c2c:	fc078ce3          	beqz	a5,80006c04 <_Z16System_Mode_testv+0xb4>
    80006c30:	00006797          	auipc	a5,0x6
    80006c34:	0b27c783          	lbu	a5,178(a5) # 8000cce2 <_ZL9finishedD>
    80006c38:	fc0786e3          	beqz	a5,80006c04 <_Z16System_Mode_testv+0xb4>
    }

}
    80006c3c:	02813083          	ld	ra,40(sp)
    80006c40:	02013403          	ld	s0,32(sp)
    80006c44:	03010113          	addi	sp,sp,48
    80006c48:	00008067          	ret

0000000080006c4c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c4c:	fe010113          	addi	sp,sp,-32
    80006c50:	00113c23          	sd	ra,24(sp)
    80006c54:	00813823          	sd	s0,16(sp)
    80006c58:	00913423          	sd	s1,8(sp)
    80006c5c:	01213023          	sd	s2,0(sp)
    80006c60:	02010413          	addi	s0,sp,32
    80006c64:	00050493          	mv	s1,a0
    80006c68:	00058913          	mv	s2,a1
    80006c6c:	0015879b          	addiw	a5,a1,1
    80006c70:	0007851b          	sext.w	a0,a5
    80006c74:	00f4a023          	sw	a5,0(s1)
    80006c78:	0004a823          	sw	zero,16(s1)
    80006c7c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006c80:	00251513          	slli	a0,a0,0x2
    80006c84:	ffffa097          	auipc	ra,0xffffa
    80006c88:	5d4080e7          	jalr	1492(ra) # 80001258 <_Z9mem_allocm>
    80006c8c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006c90:	00000593          	li	a1,0
    80006c94:	02048513          	addi	a0,s1,32
    80006c98:	ffffb097          	auipc	ra,0xffffb
    80006c9c:	888080e7          	jalr	-1912(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&spaceAvailable, _cap);
    80006ca0:	00090593          	mv	a1,s2
    80006ca4:	01848513          	addi	a0,s1,24
    80006ca8:	ffffb097          	auipc	ra,0xffffb
    80006cac:	878080e7          	jalr	-1928(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&mutexHead, 1);
    80006cb0:	00100593          	li	a1,1
    80006cb4:	02848513          	addi	a0,s1,40
    80006cb8:	ffffb097          	auipc	ra,0xffffb
    80006cbc:	868080e7          	jalr	-1944(ra) # 80001520 <_Z8sem_openPP3Semj>
    sem_open(&mutexTail, 1);
    80006cc0:	00100593          	li	a1,1
    80006cc4:	03048513          	addi	a0,s1,48
    80006cc8:	ffffb097          	auipc	ra,0xffffb
    80006ccc:	858080e7          	jalr	-1960(ra) # 80001520 <_Z8sem_openPP3Semj>
}
    80006cd0:	01813083          	ld	ra,24(sp)
    80006cd4:	01013403          	ld	s0,16(sp)
    80006cd8:	00813483          	ld	s1,8(sp)
    80006cdc:	00013903          	ld	s2,0(sp)
    80006ce0:	02010113          	addi	sp,sp,32
    80006ce4:	00008067          	ret

0000000080006ce8 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006ce8:	fe010113          	addi	sp,sp,-32
    80006cec:	00113c23          	sd	ra,24(sp)
    80006cf0:	00813823          	sd	s0,16(sp)
    80006cf4:	00913423          	sd	s1,8(sp)
    80006cf8:	01213023          	sd	s2,0(sp)
    80006cfc:	02010413          	addi	s0,sp,32
    80006d00:	00050493          	mv	s1,a0
    80006d04:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006d08:	01853503          	ld	a0,24(a0)
    80006d0c:	ffffb097          	auipc	ra,0xffffb
    80006d10:	8e8080e7          	jalr	-1816(ra) # 800015f4 <_Z8sem_waitP3Sem>

    sem_wait(mutexTail);
    80006d14:	0304b503          	ld	a0,48(s1)
    80006d18:	ffffb097          	auipc	ra,0xffffb
    80006d1c:	8dc080e7          	jalr	-1828(ra) # 800015f4 <_Z8sem_waitP3Sem>
    buffer[tail] = val;
    80006d20:	0084b783          	ld	a5,8(s1)
    80006d24:	0144a703          	lw	a4,20(s1)
    80006d28:	00271713          	slli	a4,a4,0x2
    80006d2c:	00e787b3          	add	a5,a5,a4
    80006d30:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d34:	0144a783          	lw	a5,20(s1)
    80006d38:	0017879b          	addiw	a5,a5,1
    80006d3c:	0004a703          	lw	a4,0(s1)
    80006d40:	02e7e7bb          	remw	a5,a5,a4
    80006d44:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006d48:	0304b503          	ld	a0,48(s1)
    80006d4c:	ffffb097          	auipc	ra,0xffffb
    80006d50:	910080e7          	jalr	-1776(ra) # 8000165c <_Z10sem_signalP3Sem>

    sem_signal(itemAvailable);
    80006d54:	0204b503          	ld	a0,32(s1)
    80006d58:	ffffb097          	auipc	ra,0xffffb
    80006d5c:	904080e7          	jalr	-1788(ra) # 8000165c <_Z10sem_signalP3Sem>

}
    80006d60:	01813083          	ld	ra,24(sp)
    80006d64:	01013403          	ld	s0,16(sp)
    80006d68:	00813483          	ld	s1,8(sp)
    80006d6c:	00013903          	ld	s2,0(sp)
    80006d70:	02010113          	addi	sp,sp,32
    80006d74:	00008067          	ret

0000000080006d78 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006d78:	fe010113          	addi	sp,sp,-32
    80006d7c:	00113c23          	sd	ra,24(sp)
    80006d80:	00813823          	sd	s0,16(sp)
    80006d84:	00913423          	sd	s1,8(sp)
    80006d88:	01213023          	sd	s2,0(sp)
    80006d8c:	02010413          	addi	s0,sp,32
    80006d90:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006d94:	02053503          	ld	a0,32(a0)
    80006d98:	ffffb097          	auipc	ra,0xffffb
    80006d9c:	85c080e7          	jalr	-1956(ra) # 800015f4 <_Z8sem_waitP3Sem>

    sem_wait(mutexHead);
    80006da0:	0284b503          	ld	a0,40(s1)
    80006da4:	ffffb097          	auipc	ra,0xffffb
    80006da8:	850080e7          	jalr	-1968(ra) # 800015f4 <_Z8sem_waitP3Sem>

    int ret = buffer[head];
    80006dac:	0084b703          	ld	a4,8(s1)
    80006db0:	0104a783          	lw	a5,16(s1)
    80006db4:	00279693          	slli	a3,a5,0x2
    80006db8:	00d70733          	add	a4,a4,a3
    80006dbc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006dc0:	0017879b          	addiw	a5,a5,1
    80006dc4:	0004a703          	lw	a4,0(s1)
    80006dc8:	02e7e7bb          	remw	a5,a5,a4
    80006dcc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006dd0:	0284b503          	ld	a0,40(s1)
    80006dd4:	ffffb097          	auipc	ra,0xffffb
    80006dd8:	888080e7          	jalr	-1912(ra) # 8000165c <_Z10sem_signalP3Sem>

    sem_signal(spaceAvailable);
    80006ddc:	0184b503          	ld	a0,24(s1)
    80006de0:	ffffb097          	auipc	ra,0xffffb
    80006de4:	87c080e7          	jalr	-1924(ra) # 8000165c <_Z10sem_signalP3Sem>

    return ret;
}
    80006de8:	00090513          	mv	a0,s2
    80006dec:	01813083          	ld	ra,24(sp)
    80006df0:	01013403          	ld	s0,16(sp)
    80006df4:	00813483          	ld	s1,8(sp)
    80006df8:	00013903          	ld	s2,0(sp)
    80006dfc:	02010113          	addi	sp,sp,32
    80006e00:	00008067          	ret

0000000080006e04 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006e04:	fe010113          	addi	sp,sp,-32
    80006e08:	00113c23          	sd	ra,24(sp)
    80006e0c:	00813823          	sd	s0,16(sp)
    80006e10:	00913423          	sd	s1,8(sp)
    80006e14:	01213023          	sd	s2,0(sp)
    80006e18:	02010413          	addi	s0,sp,32
    80006e1c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006e20:	02853503          	ld	a0,40(a0)
    80006e24:	ffffa097          	auipc	ra,0xffffa
    80006e28:	7d0080e7          	jalr	2000(ra) # 800015f4 <_Z8sem_waitP3Sem>
    sem_wait(mutexTail);
    80006e2c:	0304b503          	ld	a0,48(s1)
    80006e30:	ffffa097          	auipc	ra,0xffffa
    80006e34:	7c4080e7          	jalr	1988(ra) # 800015f4 <_Z8sem_waitP3Sem>

    if (tail >= head) {
    80006e38:	0144a783          	lw	a5,20(s1)
    80006e3c:	0104a903          	lw	s2,16(s1)
    80006e40:	0327ce63          	blt	a5,s2,80006e7c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e44:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006e48:	0304b503          	ld	a0,48(s1)
    80006e4c:	ffffb097          	auipc	ra,0xffffb
    80006e50:	810080e7          	jalr	-2032(ra) # 8000165c <_Z10sem_signalP3Sem>
    sem_signal(mutexHead);
    80006e54:	0284b503          	ld	a0,40(s1)
    80006e58:	ffffb097          	auipc	ra,0xffffb
    80006e5c:	804080e7          	jalr	-2044(ra) # 8000165c <_Z10sem_signalP3Sem>

    return ret;
}
    80006e60:	00090513          	mv	a0,s2
    80006e64:	01813083          	ld	ra,24(sp)
    80006e68:	01013403          	ld	s0,16(sp)
    80006e6c:	00813483          	ld	s1,8(sp)
    80006e70:	00013903          	ld	s2,0(sp)
    80006e74:	02010113          	addi	sp,sp,32
    80006e78:	00008067          	ret
        ret = cap - head + tail;
    80006e7c:	0004a703          	lw	a4,0(s1)
    80006e80:	4127093b          	subw	s2,a4,s2
    80006e84:	00f9093b          	addw	s2,s2,a5
    80006e88:	fc1ff06f          	j	80006e48 <_ZN6Buffer6getCntEv+0x44>

0000000080006e8c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006e8c:	fe010113          	addi	sp,sp,-32
    80006e90:	00113c23          	sd	ra,24(sp)
    80006e94:	00813823          	sd	s0,16(sp)
    80006e98:	00913423          	sd	s1,8(sp)
    80006e9c:	02010413          	addi	s0,sp,32
    80006ea0:	00050493          	mv	s1,a0
    putc('\n');
    80006ea4:	00a00513          	li	a0,10
    80006ea8:	ffffb097          	auipc	ra,0xffffb
    80006eac:	8c8080e7          	jalr	-1848(ra) # 80001770 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006eb0:	00003517          	auipc	a0,0x3
    80006eb4:	74850513          	addi	a0,a0,1864 # 8000a5f8 <CONSOLE_STATUS+0x5e8>
    80006eb8:	ffffb097          	auipc	ra,0xffffb
    80006ebc:	d1c080e7          	jalr	-740(ra) # 80001bd4 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006ec0:	00048513          	mv	a0,s1
    80006ec4:	00000097          	auipc	ra,0x0
    80006ec8:	f40080e7          	jalr	-192(ra) # 80006e04 <_ZN6Buffer6getCntEv>
    80006ecc:	02a05c63          	blez	a0,80006f04 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006ed0:	0084b783          	ld	a5,8(s1)
    80006ed4:	0104a703          	lw	a4,16(s1)
    80006ed8:	00271713          	slli	a4,a4,0x2
    80006edc:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006ee0:	0007c503          	lbu	a0,0(a5)
    80006ee4:	ffffb097          	auipc	ra,0xffffb
    80006ee8:	88c080e7          	jalr	-1908(ra) # 80001770 <_Z4putcc>
        head = (head + 1) % cap;
    80006eec:	0104a783          	lw	a5,16(s1)
    80006ef0:	0017879b          	addiw	a5,a5,1
    80006ef4:	0004a703          	lw	a4,0(s1)
    80006ef8:	02e7e7bb          	remw	a5,a5,a4
    80006efc:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006f00:	fc1ff06f          	j	80006ec0 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006f04:	02100513          	li	a0,33
    80006f08:	ffffb097          	auipc	ra,0xffffb
    80006f0c:	868080e7          	jalr	-1944(ra) # 80001770 <_Z4putcc>
    putc('\n');
    80006f10:	00a00513          	li	a0,10
    80006f14:	ffffb097          	auipc	ra,0xffffb
    80006f18:	85c080e7          	jalr	-1956(ra) # 80001770 <_Z4putcc>
    mem_free(buffer);
    80006f1c:	0084b503          	ld	a0,8(s1)
    80006f20:	ffffa097          	auipc	ra,0xffffa
    80006f24:	3a4080e7          	jalr	932(ra) # 800012c4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006f28:	0204b503          	ld	a0,32(s1)
    80006f2c:	ffffa097          	auipc	ra,0xffffa
    80006f30:	660080e7          	jalr	1632(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(spaceAvailable);
    80006f34:	0184b503          	ld	a0,24(s1)
    80006f38:	ffffa097          	auipc	ra,0xffffa
    80006f3c:	654080e7          	jalr	1620(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(mutexTail);
    80006f40:	0304b503          	ld	a0,48(s1)
    80006f44:	ffffa097          	auipc	ra,0xffffa
    80006f48:	648080e7          	jalr	1608(ra) # 8000158c <_Z9sem_closeP3Sem>
    sem_close(mutexHead);
    80006f4c:	0284b503          	ld	a0,40(s1)
    80006f50:	ffffa097          	auipc	ra,0xffffa
    80006f54:	63c080e7          	jalr	1596(ra) # 8000158c <_Z9sem_closeP3Sem>
}
    80006f58:	01813083          	ld	ra,24(sp)
    80006f5c:	01013403          	ld	s0,16(sp)
    80006f60:	00813483          	ld	s1,8(sp)
    80006f64:	02010113          	addi	sp,sp,32
    80006f68:	00008067          	ret

0000000080006f6c <start>:
    80006f6c:	ff010113          	addi	sp,sp,-16
    80006f70:	00813423          	sd	s0,8(sp)
    80006f74:	01010413          	addi	s0,sp,16
    80006f78:	300027f3          	csrr	a5,mstatus
    80006f7c:	ffffe737          	lui	a4,0xffffe
    80006f80:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff08af>
    80006f84:	00e7f7b3          	and	a5,a5,a4
    80006f88:	00001737          	lui	a4,0x1
    80006f8c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006f90:	00e7e7b3          	or	a5,a5,a4
    80006f94:	30079073          	csrw	mstatus,a5
    80006f98:	00000797          	auipc	a5,0x0
    80006f9c:	16078793          	addi	a5,a5,352 # 800070f8 <system_main>
    80006fa0:	34179073          	csrw	mepc,a5
    80006fa4:	00000793          	li	a5,0
    80006fa8:	18079073          	csrw	satp,a5
    80006fac:	000107b7          	lui	a5,0x10
    80006fb0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006fb4:	30279073          	csrw	medeleg,a5
    80006fb8:	30379073          	csrw	mideleg,a5
    80006fbc:	104027f3          	csrr	a5,sie
    80006fc0:	2227e793          	ori	a5,a5,546
    80006fc4:	10479073          	csrw	sie,a5
    80006fc8:	fff00793          	li	a5,-1
    80006fcc:	00a7d793          	srli	a5,a5,0xa
    80006fd0:	3b079073          	csrw	pmpaddr0,a5
    80006fd4:	00f00793          	li	a5,15
    80006fd8:	3a079073          	csrw	pmpcfg0,a5
    80006fdc:	f14027f3          	csrr	a5,mhartid
    80006fe0:	0200c737          	lui	a4,0x200c
    80006fe4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006fe8:	0007869b          	sext.w	a3,a5
    80006fec:	00269713          	slli	a4,a3,0x2
    80006ff0:	000f4637          	lui	a2,0xf4
    80006ff4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006ff8:	00d70733          	add	a4,a4,a3
    80006ffc:	0037979b          	slliw	a5,a5,0x3
    80007000:	020046b7          	lui	a3,0x2004
    80007004:	00d787b3          	add	a5,a5,a3
    80007008:	00c585b3          	add	a1,a1,a2
    8000700c:	00371693          	slli	a3,a4,0x3
    80007010:	00006717          	auipc	a4,0x6
    80007014:	ce070713          	addi	a4,a4,-800 # 8000ccf0 <timer_scratch>
    80007018:	00b7b023          	sd	a1,0(a5)
    8000701c:	00d70733          	add	a4,a4,a3
    80007020:	00f73c23          	sd	a5,24(a4)
    80007024:	02c73023          	sd	a2,32(a4)
    80007028:	34071073          	csrw	mscratch,a4
    8000702c:	00000797          	auipc	a5,0x0
    80007030:	6e478793          	addi	a5,a5,1764 # 80007710 <timervec>
    80007034:	30579073          	csrw	mtvec,a5
    80007038:	300027f3          	csrr	a5,mstatus
    8000703c:	0087e793          	ori	a5,a5,8
    80007040:	30079073          	csrw	mstatus,a5
    80007044:	304027f3          	csrr	a5,mie
    80007048:	0807e793          	ori	a5,a5,128
    8000704c:	30479073          	csrw	mie,a5
    80007050:	f14027f3          	csrr	a5,mhartid
    80007054:	0007879b          	sext.w	a5,a5
    80007058:	00078213          	mv	tp,a5
    8000705c:	30200073          	mret
    80007060:	00813403          	ld	s0,8(sp)
    80007064:	01010113          	addi	sp,sp,16
    80007068:	00008067          	ret

000000008000706c <timerinit>:
    8000706c:	ff010113          	addi	sp,sp,-16
    80007070:	00813423          	sd	s0,8(sp)
    80007074:	01010413          	addi	s0,sp,16
    80007078:	f14027f3          	csrr	a5,mhartid
    8000707c:	0200c737          	lui	a4,0x200c
    80007080:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007084:	0007869b          	sext.w	a3,a5
    80007088:	00269713          	slli	a4,a3,0x2
    8000708c:	000f4637          	lui	a2,0xf4
    80007090:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007094:	00d70733          	add	a4,a4,a3
    80007098:	0037979b          	slliw	a5,a5,0x3
    8000709c:	020046b7          	lui	a3,0x2004
    800070a0:	00d787b3          	add	a5,a5,a3
    800070a4:	00c585b3          	add	a1,a1,a2
    800070a8:	00371693          	slli	a3,a4,0x3
    800070ac:	00006717          	auipc	a4,0x6
    800070b0:	c4470713          	addi	a4,a4,-956 # 8000ccf0 <timer_scratch>
    800070b4:	00b7b023          	sd	a1,0(a5)
    800070b8:	00d70733          	add	a4,a4,a3
    800070bc:	00f73c23          	sd	a5,24(a4)
    800070c0:	02c73023          	sd	a2,32(a4)
    800070c4:	34071073          	csrw	mscratch,a4
    800070c8:	00000797          	auipc	a5,0x0
    800070cc:	64878793          	addi	a5,a5,1608 # 80007710 <timervec>
    800070d0:	30579073          	csrw	mtvec,a5
    800070d4:	300027f3          	csrr	a5,mstatus
    800070d8:	0087e793          	ori	a5,a5,8
    800070dc:	30079073          	csrw	mstatus,a5
    800070e0:	304027f3          	csrr	a5,mie
    800070e4:	0807e793          	ori	a5,a5,128
    800070e8:	30479073          	csrw	mie,a5
    800070ec:	00813403          	ld	s0,8(sp)
    800070f0:	01010113          	addi	sp,sp,16
    800070f4:	00008067          	ret

00000000800070f8 <system_main>:
    800070f8:	fe010113          	addi	sp,sp,-32
    800070fc:	00813823          	sd	s0,16(sp)
    80007100:	00913423          	sd	s1,8(sp)
    80007104:	00113c23          	sd	ra,24(sp)
    80007108:	02010413          	addi	s0,sp,32
    8000710c:	00000097          	auipc	ra,0x0
    80007110:	0c4080e7          	jalr	196(ra) # 800071d0 <cpuid>
    80007114:	00006497          	auipc	s1,0x6
    80007118:	acc48493          	addi	s1,s1,-1332 # 8000cbe0 <started>
    8000711c:	02050263          	beqz	a0,80007140 <system_main+0x48>
    80007120:	0004a783          	lw	a5,0(s1)
    80007124:	0007879b          	sext.w	a5,a5
    80007128:	fe078ce3          	beqz	a5,80007120 <system_main+0x28>
    8000712c:	0ff0000f          	fence
    80007130:	00003517          	auipc	a0,0x3
    80007134:	52050513          	addi	a0,a0,1312 # 8000a650 <CONSOLE_STATUS+0x640>
    80007138:	00001097          	auipc	ra,0x1
    8000713c:	a74080e7          	jalr	-1420(ra) # 80007bac <panic>
    80007140:	00001097          	auipc	ra,0x1
    80007144:	9c8080e7          	jalr	-1592(ra) # 80007b08 <consoleinit>
    80007148:	00001097          	auipc	ra,0x1
    8000714c:	154080e7          	jalr	340(ra) # 8000829c <printfinit>
    80007150:	00003517          	auipc	a0,0x3
    80007154:	19050513          	addi	a0,a0,400 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80007158:	00001097          	auipc	ra,0x1
    8000715c:	ab0080e7          	jalr	-1360(ra) # 80007c08 <__printf>
    80007160:	00003517          	auipc	a0,0x3
    80007164:	4c050513          	addi	a0,a0,1216 # 8000a620 <CONSOLE_STATUS+0x610>
    80007168:	00001097          	auipc	ra,0x1
    8000716c:	aa0080e7          	jalr	-1376(ra) # 80007c08 <__printf>
    80007170:	00003517          	auipc	a0,0x3
    80007174:	17050513          	addi	a0,a0,368 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80007178:	00001097          	auipc	ra,0x1
    8000717c:	a90080e7          	jalr	-1392(ra) # 80007c08 <__printf>
    80007180:	00001097          	auipc	ra,0x1
    80007184:	4a8080e7          	jalr	1192(ra) # 80008628 <kinit>
    80007188:	00000097          	auipc	ra,0x0
    8000718c:	148080e7          	jalr	328(ra) # 800072d0 <trapinit>
    80007190:	00000097          	auipc	ra,0x0
    80007194:	16c080e7          	jalr	364(ra) # 800072fc <trapinithart>
    80007198:	00000097          	auipc	ra,0x0
    8000719c:	5b8080e7          	jalr	1464(ra) # 80007750 <plicinit>
    800071a0:	00000097          	auipc	ra,0x0
    800071a4:	5d8080e7          	jalr	1496(ra) # 80007778 <plicinithart>
    800071a8:	00000097          	auipc	ra,0x0
    800071ac:	078080e7          	jalr	120(ra) # 80007220 <userinit>
    800071b0:	0ff0000f          	fence
    800071b4:	00100793          	li	a5,1
    800071b8:	00003517          	auipc	a0,0x3
    800071bc:	48050513          	addi	a0,a0,1152 # 8000a638 <CONSOLE_STATUS+0x628>
    800071c0:	00f4a023          	sw	a5,0(s1)
    800071c4:	00001097          	auipc	ra,0x1
    800071c8:	a44080e7          	jalr	-1468(ra) # 80007c08 <__printf>
    800071cc:	0000006f          	j	800071cc <system_main+0xd4>

00000000800071d0 <cpuid>:
    800071d0:	ff010113          	addi	sp,sp,-16
    800071d4:	00813423          	sd	s0,8(sp)
    800071d8:	01010413          	addi	s0,sp,16
    800071dc:	00020513          	mv	a0,tp
    800071e0:	00813403          	ld	s0,8(sp)
    800071e4:	0005051b          	sext.w	a0,a0
    800071e8:	01010113          	addi	sp,sp,16
    800071ec:	00008067          	ret

00000000800071f0 <mycpu>:
    800071f0:	ff010113          	addi	sp,sp,-16
    800071f4:	00813423          	sd	s0,8(sp)
    800071f8:	01010413          	addi	s0,sp,16
    800071fc:	00020793          	mv	a5,tp
    80007200:	00813403          	ld	s0,8(sp)
    80007204:	0007879b          	sext.w	a5,a5
    80007208:	00779793          	slli	a5,a5,0x7
    8000720c:	00007517          	auipc	a0,0x7
    80007210:	b1450513          	addi	a0,a0,-1260 # 8000dd20 <cpus>
    80007214:	00f50533          	add	a0,a0,a5
    80007218:	01010113          	addi	sp,sp,16
    8000721c:	00008067          	ret

0000000080007220 <userinit>:
    80007220:	ff010113          	addi	sp,sp,-16
    80007224:	00813423          	sd	s0,8(sp)
    80007228:	01010413          	addi	s0,sp,16
    8000722c:	00813403          	ld	s0,8(sp)
    80007230:	01010113          	addi	sp,sp,16
    80007234:	ffffb317          	auipc	t1,0xffffb
    80007238:	2ec30067          	jr	748(t1) # 80002520 <main>

000000008000723c <either_copyout>:
    8000723c:	ff010113          	addi	sp,sp,-16
    80007240:	00813023          	sd	s0,0(sp)
    80007244:	00113423          	sd	ra,8(sp)
    80007248:	01010413          	addi	s0,sp,16
    8000724c:	02051663          	bnez	a0,80007278 <either_copyout+0x3c>
    80007250:	00058513          	mv	a0,a1
    80007254:	00060593          	mv	a1,a2
    80007258:	0006861b          	sext.w	a2,a3
    8000725c:	00002097          	auipc	ra,0x2
    80007260:	c58080e7          	jalr	-936(ra) # 80008eb4 <__memmove>
    80007264:	00813083          	ld	ra,8(sp)
    80007268:	00013403          	ld	s0,0(sp)
    8000726c:	00000513          	li	a0,0
    80007270:	01010113          	addi	sp,sp,16
    80007274:	00008067          	ret
    80007278:	00003517          	auipc	a0,0x3
    8000727c:	40050513          	addi	a0,a0,1024 # 8000a678 <CONSOLE_STATUS+0x668>
    80007280:	00001097          	auipc	ra,0x1
    80007284:	92c080e7          	jalr	-1748(ra) # 80007bac <panic>

0000000080007288 <either_copyin>:
    80007288:	ff010113          	addi	sp,sp,-16
    8000728c:	00813023          	sd	s0,0(sp)
    80007290:	00113423          	sd	ra,8(sp)
    80007294:	01010413          	addi	s0,sp,16
    80007298:	02059463          	bnez	a1,800072c0 <either_copyin+0x38>
    8000729c:	00060593          	mv	a1,a2
    800072a0:	0006861b          	sext.w	a2,a3
    800072a4:	00002097          	auipc	ra,0x2
    800072a8:	c10080e7          	jalr	-1008(ra) # 80008eb4 <__memmove>
    800072ac:	00813083          	ld	ra,8(sp)
    800072b0:	00013403          	ld	s0,0(sp)
    800072b4:	00000513          	li	a0,0
    800072b8:	01010113          	addi	sp,sp,16
    800072bc:	00008067          	ret
    800072c0:	00003517          	auipc	a0,0x3
    800072c4:	3e050513          	addi	a0,a0,992 # 8000a6a0 <CONSOLE_STATUS+0x690>
    800072c8:	00001097          	auipc	ra,0x1
    800072cc:	8e4080e7          	jalr	-1820(ra) # 80007bac <panic>

00000000800072d0 <trapinit>:
    800072d0:	ff010113          	addi	sp,sp,-16
    800072d4:	00813423          	sd	s0,8(sp)
    800072d8:	01010413          	addi	s0,sp,16
    800072dc:	00813403          	ld	s0,8(sp)
    800072e0:	00003597          	auipc	a1,0x3
    800072e4:	3e858593          	addi	a1,a1,1000 # 8000a6c8 <CONSOLE_STATUS+0x6b8>
    800072e8:	00007517          	auipc	a0,0x7
    800072ec:	ab850513          	addi	a0,a0,-1352 # 8000dda0 <tickslock>
    800072f0:	01010113          	addi	sp,sp,16
    800072f4:	00001317          	auipc	t1,0x1
    800072f8:	5c430067          	jr	1476(t1) # 800088b8 <initlock>

00000000800072fc <trapinithart>:
    800072fc:	ff010113          	addi	sp,sp,-16
    80007300:	00813423          	sd	s0,8(sp)
    80007304:	01010413          	addi	s0,sp,16
    80007308:	00000797          	auipc	a5,0x0
    8000730c:	2f878793          	addi	a5,a5,760 # 80007600 <kernelvec>
    80007310:	10579073          	csrw	stvec,a5
    80007314:	00813403          	ld	s0,8(sp)
    80007318:	01010113          	addi	sp,sp,16
    8000731c:	00008067          	ret

0000000080007320 <usertrap>:
    80007320:	ff010113          	addi	sp,sp,-16
    80007324:	00813423          	sd	s0,8(sp)
    80007328:	01010413          	addi	s0,sp,16
    8000732c:	00813403          	ld	s0,8(sp)
    80007330:	01010113          	addi	sp,sp,16
    80007334:	00008067          	ret

0000000080007338 <usertrapret>:
    80007338:	ff010113          	addi	sp,sp,-16
    8000733c:	00813423          	sd	s0,8(sp)
    80007340:	01010413          	addi	s0,sp,16
    80007344:	00813403          	ld	s0,8(sp)
    80007348:	01010113          	addi	sp,sp,16
    8000734c:	00008067          	ret

0000000080007350 <kerneltrap>:
    80007350:	fe010113          	addi	sp,sp,-32
    80007354:	00813823          	sd	s0,16(sp)
    80007358:	00113c23          	sd	ra,24(sp)
    8000735c:	00913423          	sd	s1,8(sp)
    80007360:	02010413          	addi	s0,sp,32
    80007364:	142025f3          	csrr	a1,scause
    80007368:	100027f3          	csrr	a5,sstatus
    8000736c:	0027f793          	andi	a5,a5,2
    80007370:	10079c63          	bnez	a5,80007488 <kerneltrap+0x138>
    80007374:	142027f3          	csrr	a5,scause
    80007378:	0207ce63          	bltz	a5,800073b4 <kerneltrap+0x64>
    8000737c:	00003517          	auipc	a0,0x3
    80007380:	39450513          	addi	a0,a0,916 # 8000a710 <CONSOLE_STATUS+0x700>
    80007384:	00001097          	auipc	ra,0x1
    80007388:	884080e7          	jalr	-1916(ra) # 80007c08 <__printf>
    8000738c:	141025f3          	csrr	a1,sepc
    80007390:	14302673          	csrr	a2,stval
    80007394:	00003517          	auipc	a0,0x3
    80007398:	38c50513          	addi	a0,a0,908 # 8000a720 <CONSOLE_STATUS+0x710>
    8000739c:	00001097          	auipc	ra,0x1
    800073a0:	86c080e7          	jalr	-1940(ra) # 80007c08 <__printf>
    800073a4:	00003517          	auipc	a0,0x3
    800073a8:	39450513          	addi	a0,a0,916 # 8000a738 <CONSOLE_STATUS+0x728>
    800073ac:	00001097          	auipc	ra,0x1
    800073b0:	800080e7          	jalr	-2048(ra) # 80007bac <panic>
    800073b4:	0ff7f713          	andi	a4,a5,255
    800073b8:	00900693          	li	a3,9
    800073bc:	04d70063          	beq	a4,a3,800073fc <kerneltrap+0xac>
    800073c0:	fff00713          	li	a4,-1
    800073c4:	03f71713          	slli	a4,a4,0x3f
    800073c8:	00170713          	addi	a4,a4,1
    800073cc:	fae798e3          	bne	a5,a4,8000737c <kerneltrap+0x2c>
    800073d0:	00000097          	auipc	ra,0x0
    800073d4:	e00080e7          	jalr	-512(ra) # 800071d0 <cpuid>
    800073d8:	06050663          	beqz	a0,80007444 <kerneltrap+0xf4>
    800073dc:	144027f3          	csrr	a5,sip
    800073e0:	ffd7f793          	andi	a5,a5,-3
    800073e4:	14479073          	csrw	sip,a5
    800073e8:	01813083          	ld	ra,24(sp)
    800073ec:	01013403          	ld	s0,16(sp)
    800073f0:	00813483          	ld	s1,8(sp)
    800073f4:	02010113          	addi	sp,sp,32
    800073f8:	00008067          	ret
    800073fc:	00000097          	auipc	ra,0x0
    80007400:	3c8080e7          	jalr	968(ra) # 800077c4 <plic_claim>
    80007404:	00a00793          	li	a5,10
    80007408:	00050493          	mv	s1,a0
    8000740c:	06f50863          	beq	a0,a5,8000747c <kerneltrap+0x12c>
    80007410:	fc050ce3          	beqz	a0,800073e8 <kerneltrap+0x98>
    80007414:	00050593          	mv	a1,a0
    80007418:	00003517          	auipc	a0,0x3
    8000741c:	2d850513          	addi	a0,a0,728 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    80007420:	00000097          	auipc	ra,0x0
    80007424:	7e8080e7          	jalr	2024(ra) # 80007c08 <__printf>
    80007428:	01013403          	ld	s0,16(sp)
    8000742c:	01813083          	ld	ra,24(sp)
    80007430:	00048513          	mv	a0,s1
    80007434:	00813483          	ld	s1,8(sp)
    80007438:	02010113          	addi	sp,sp,32
    8000743c:	00000317          	auipc	t1,0x0
    80007440:	3c030067          	jr	960(t1) # 800077fc <plic_complete>
    80007444:	00007517          	auipc	a0,0x7
    80007448:	95c50513          	addi	a0,a0,-1700 # 8000dda0 <tickslock>
    8000744c:	00001097          	auipc	ra,0x1
    80007450:	490080e7          	jalr	1168(ra) # 800088dc <acquire>
    80007454:	00005717          	auipc	a4,0x5
    80007458:	79070713          	addi	a4,a4,1936 # 8000cbe4 <ticks>
    8000745c:	00072783          	lw	a5,0(a4)
    80007460:	00007517          	auipc	a0,0x7
    80007464:	94050513          	addi	a0,a0,-1728 # 8000dda0 <tickslock>
    80007468:	0017879b          	addiw	a5,a5,1
    8000746c:	00f72023          	sw	a5,0(a4)
    80007470:	00001097          	auipc	ra,0x1
    80007474:	538080e7          	jalr	1336(ra) # 800089a8 <release>
    80007478:	f65ff06f          	j	800073dc <kerneltrap+0x8c>
    8000747c:	00001097          	auipc	ra,0x1
    80007480:	094080e7          	jalr	148(ra) # 80008510 <uartintr>
    80007484:	fa5ff06f          	j	80007428 <kerneltrap+0xd8>
    80007488:	00003517          	auipc	a0,0x3
    8000748c:	24850513          	addi	a0,a0,584 # 8000a6d0 <CONSOLE_STATUS+0x6c0>
    80007490:	00000097          	auipc	ra,0x0
    80007494:	71c080e7          	jalr	1820(ra) # 80007bac <panic>

0000000080007498 <clockintr>:
    80007498:	fe010113          	addi	sp,sp,-32
    8000749c:	00813823          	sd	s0,16(sp)
    800074a0:	00913423          	sd	s1,8(sp)
    800074a4:	00113c23          	sd	ra,24(sp)
    800074a8:	02010413          	addi	s0,sp,32
    800074ac:	00007497          	auipc	s1,0x7
    800074b0:	8f448493          	addi	s1,s1,-1804 # 8000dda0 <tickslock>
    800074b4:	00048513          	mv	a0,s1
    800074b8:	00001097          	auipc	ra,0x1
    800074bc:	424080e7          	jalr	1060(ra) # 800088dc <acquire>
    800074c0:	00005717          	auipc	a4,0x5
    800074c4:	72470713          	addi	a4,a4,1828 # 8000cbe4 <ticks>
    800074c8:	00072783          	lw	a5,0(a4)
    800074cc:	01013403          	ld	s0,16(sp)
    800074d0:	01813083          	ld	ra,24(sp)
    800074d4:	00048513          	mv	a0,s1
    800074d8:	0017879b          	addiw	a5,a5,1
    800074dc:	00813483          	ld	s1,8(sp)
    800074e0:	00f72023          	sw	a5,0(a4)
    800074e4:	02010113          	addi	sp,sp,32
    800074e8:	00001317          	auipc	t1,0x1
    800074ec:	4c030067          	jr	1216(t1) # 800089a8 <release>

00000000800074f0 <devintr>:
    800074f0:	142027f3          	csrr	a5,scause
    800074f4:	00000513          	li	a0,0
    800074f8:	0007c463          	bltz	a5,80007500 <devintr+0x10>
    800074fc:	00008067          	ret
    80007500:	fe010113          	addi	sp,sp,-32
    80007504:	00813823          	sd	s0,16(sp)
    80007508:	00113c23          	sd	ra,24(sp)
    8000750c:	00913423          	sd	s1,8(sp)
    80007510:	02010413          	addi	s0,sp,32
    80007514:	0ff7f713          	andi	a4,a5,255
    80007518:	00900693          	li	a3,9
    8000751c:	04d70c63          	beq	a4,a3,80007574 <devintr+0x84>
    80007520:	fff00713          	li	a4,-1
    80007524:	03f71713          	slli	a4,a4,0x3f
    80007528:	00170713          	addi	a4,a4,1
    8000752c:	00e78c63          	beq	a5,a4,80007544 <devintr+0x54>
    80007530:	01813083          	ld	ra,24(sp)
    80007534:	01013403          	ld	s0,16(sp)
    80007538:	00813483          	ld	s1,8(sp)
    8000753c:	02010113          	addi	sp,sp,32
    80007540:	00008067          	ret
    80007544:	00000097          	auipc	ra,0x0
    80007548:	c8c080e7          	jalr	-884(ra) # 800071d0 <cpuid>
    8000754c:	06050663          	beqz	a0,800075b8 <devintr+0xc8>
    80007550:	144027f3          	csrr	a5,sip
    80007554:	ffd7f793          	andi	a5,a5,-3
    80007558:	14479073          	csrw	sip,a5
    8000755c:	01813083          	ld	ra,24(sp)
    80007560:	01013403          	ld	s0,16(sp)
    80007564:	00813483          	ld	s1,8(sp)
    80007568:	00200513          	li	a0,2
    8000756c:	02010113          	addi	sp,sp,32
    80007570:	00008067          	ret
    80007574:	00000097          	auipc	ra,0x0
    80007578:	250080e7          	jalr	592(ra) # 800077c4 <plic_claim>
    8000757c:	00a00793          	li	a5,10
    80007580:	00050493          	mv	s1,a0
    80007584:	06f50663          	beq	a0,a5,800075f0 <devintr+0x100>
    80007588:	00100513          	li	a0,1
    8000758c:	fa0482e3          	beqz	s1,80007530 <devintr+0x40>
    80007590:	00048593          	mv	a1,s1
    80007594:	00003517          	auipc	a0,0x3
    80007598:	15c50513          	addi	a0,a0,348 # 8000a6f0 <CONSOLE_STATUS+0x6e0>
    8000759c:	00000097          	auipc	ra,0x0
    800075a0:	66c080e7          	jalr	1644(ra) # 80007c08 <__printf>
    800075a4:	00048513          	mv	a0,s1
    800075a8:	00000097          	auipc	ra,0x0
    800075ac:	254080e7          	jalr	596(ra) # 800077fc <plic_complete>
    800075b0:	00100513          	li	a0,1
    800075b4:	f7dff06f          	j	80007530 <devintr+0x40>
    800075b8:	00006517          	auipc	a0,0x6
    800075bc:	7e850513          	addi	a0,a0,2024 # 8000dda0 <tickslock>
    800075c0:	00001097          	auipc	ra,0x1
    800075c4:	31c080e7          	jalr	796(ra) # 800088dc <acquire>
    800075c8:	00005717          	auipc	a4,0x5
    800075cc:	61c70713          	addi	a4,a4,1564 # 8000cbe4 <ticks>
    800075d0:	00072783          	lw	a5,0(a4)
    800075d4:	00006517          	auipc	a0,0x6
    800075d8:	7cc50513          	addi	a0,a0,1996 # 8000dda0 <tickslock>
    800075dc:	0017879b          	addiw	a5,a5,1
    800075e0:	00f72023          	sw	a5,0(a4)
    800075e4:	00001097          	auipc	ra,0x1
    800075e8:	3c4080e7          	jalr	964(ra) # 800089a8 <release>
    800075ec:	f65ff06f          	j	80007550 <devintr+0x60>
    800075f0:	00001097          	auipc	ra,0x1
    800075f4:	f20080e7          	jalr	-224(ra) # 80008510 <uartintr>
    800075f8:	fadff06f          	j	800075a4 <devintr+0xb4>
    800075fc:	0000                	unimp
	...

0000000080007600 <kernelvec>:
    80007600:	f0010113          	addi	sp,sp,-256
    80007604:	00113023          	sd	ra,0(sp)
    80007608:	00213423          	sd	sp,8(sp)
    8000760c:	00313823          	sd	gp,16(sp)
    80007610:	00413c23          	sd	tp,24(sp)
    80007614:	02513023          	sd	t0,32(sp)
    80007618:	02613423          	sd	t1,40(sp)
    8000761c:	02713823          	sd	t2,48(sp)
    80007620:	02813c23          	sd	s0,56(sp)
    80007624:	04913023          	sd	s1,64(sp)
    80007628:	04a13423          	sd	a0,72(sp)
    8000762c:	04b13823          	sd	a1,80(sp)
    80007630:	04c13c23          	sd	a2,88(sp)
    80007634:	06d13023          	sd	a3,96(sp)
    80007638:	06e13423          	sd	a4,104(sp)
    8000763c:	06f13823          	sd	a5,112(sp)
    80007640:	07013c23          	sd	a6,120(sp)
    80007644:	09113023          	sd	a7,128(sp)
    80007648:	09213423          	sd	s2,136(sp)
    8000764c:	09313823          	sd	s3,144(sp)
    80007650:	09413c23          	sd	s4,152(sp)
    80007654:	0b513023          	sd	s5,160(sp)
    80007658:	0b613423          	sd	s6,168(sp)
    8000765c:	0b713823          	sd	s7,176(sp)
    80007660:	0b813c23          	sd	s8,184(sp)
    80007664:	0d913023          	sd	s9,192(sp)
    80007668:	0da13423          	sd	s10,200(sp)
    8000766c:	0db13823          	sd	s11,208(sp)
    80007670:	0dc13c23          	sd	t3,216(sp)
    80007674:	0fd13023          	sd	t4,224(sp)
    80007678:	0fe13423          	sd	t5,232(sp)
    8000767c:	0ff13823          	sd	t6,240(sp)
    80007680:	cd1ff0ef          	jal	ra,80007350 <kerneltrap>
    80007684:	00013083          	ld	ra,0(sp)
    80007688:	00813103          	ld	sp,8(sp)
    8000768c:	01013183          	ld	gp,16(sp)
    80007690:	02013283          	ld	t0,32(sp)
    80007694:	02813303          	ld	t1,40(sp)
    80007698:	03013383          	ld	t2,48(sp)
    8000769c:	03813403          	ld	s0,56(sp)
    800076a0:	04013483          	ld	s1,64(sp)
    800076a4:	04813503          	ld	a0,72(sp)
    800076a8:	05013583          	ld	a1,80(sp)
    800076ac:	05813603          	ld	a2,88(sp)
    800076b0:	06013683          	ld	a3,96(sp)
    800076b4:	06813703          	ld	a4,104(sp)
    800076b8:	07013783          	ld	a5,112(sp)
    800076bc:	07813803          	ld	a6,120(sp)
    800076c0:	08013883          	ld	a7,128(sp)
    800076c4:	08813903          	ld	s2,136(sp)
    800076c8:	09013983          	ld	s3,144(sp)
    800076cc:	09813a03          	ld	s4,152(sp)
    800076d0:	0a013a83          	ld	s5,160(sp)
    800076d4:	0a813b03          	ld	s6,168(sp)
    800076d8:	0b013b83          	ld	s7,176(sp)
    800076dc:	0b813c03          	ld	s8,184(sp)
    800076e0:	0c013c83          	ld	s9,192(sp)
    800076e4:	0c813d03          	ld	s10,200(sp)
    800076e8:	0d013d83          	ld	s11,208(sp)
    800076ec:	0d813e03          	ld	t3,216(sp)
    800076f0:	0e013e83          	ld	t4,224(sp)
    800076f4:	0e813f03          	ld	t5,232(sp)
    800076f8:	0f013f83          	ld	t6,240(sp)
    800076fc:	10010113          	addi	sp,sp,256
    80007700:	10200073          	sret
    80007704:	00000013          	nop
    80007708:	00000013          	nop
    8000770c:	00000013          	nop

0000000080007710 <timervec>:
    80007710:	34051573          	csrrw	a0,mscratch,a0
    80007714:	00b53023          	sd	a1,0(a0)
    80007718:	00c53423          	sd	a2,8(a0)
    8000771c:	00d53823          	sd	a3,16(a0)
    80007720:	01853583          	ld	a1,24(a0)
    80007724:	02053603          	ld	a2,32(a0)
    80007728:	0005b683          	ld	a3,0(a1)
    8000772c:	00c686b3          	add	a3,a3,a2
    80007730:	00d5b023          	sd	a3,0(a1)
    80007734:	00200593          	li	a1,2
    80007738:	14459073          	csrw	sip,a1
    8000773c:	01053683          	ld	a3,16(a0)
    80007740:	00853603          	ld	a2,8(a0)
    80007744:	00053583          	ld	a1,0(a0)
    80007748:	34051573          	csrrw	a0,mscratch,a0
    8000774c:	30200073          	mret

0000000080007750 <plicinit>:
    80007750:	ff010113          	addi	sp,sp,-16
    80007754:	00813423          	sd	s0,8(sp)
    80007758:	01010413          	addi	s0,sp,16
    8000775c:	00813403          	ld	s0,8(sp)
    80007760:	0c0007b7          	lui	a5,0xc000
    80007764:	00100713          	li	a4,1
    80007768:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000776c:	00e7a223          	sw	a4,4(a5)
    80007770:	01010113          	addi	sp,sp,16
    80007774:	00008067          	ret

0000000080007778 <plicinithart>:
    80007778:	ff010113          	addi	sp,sp,-16
    8000777c:	00813023          	sd	s0,0(sp)
    80007780:	00113423          	sd	ra,8(sp)
    80007784:	01010413          	addi	s0,sp,16
    80007788:	00000097          	auipc	ra,0x0
    8000778c:	a48080e7          	jalr	-1464(ra) # 800071d0 <cpuid>
    80007790:	0085171b          	slliw	a4,a0,0x8
    80007794:	0c0027b7          	lui	a5,0xc002
    80007798:	00e787b3          	add	a5,a5,a4
    8000779c:	40200713          	li	a4,1026
    800077a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800077a4:	00813083          	ld	ra,8(sp)
    800077a8:	00013403          	ld	s0,0(sp)
    800077ac:	00d5151b          	slliw	a0,a0,0xd
    800077b0:	0c2017b7          	lui	a5,0xc201
    800077b4:	00a78533          	add	a0,a5,a0
    800077b8:	00052023          	sw	zero,0(a0)
    800077bc:	01010113          	addi	sp,sp,16
    800077c0:	00008067          	ret

00000000800077c4 <plic_claim>:
    800077c4:	ff010113          	addi	sp,sp,-16
    800077c8:	00813023          	sd	s0,0(sp)
    800077cc:	00113423          	sd	ra,8(sp)
    800077d0:	01010413          	addi	s0,sp,16
    800077d4:	00000097          	auipc	ra,0x0
    800077d8:	9fc080e7          	jalr	-1540(ra) # 800071d0 <cpuid>
    800077dc:	00813083          	ld	ra,8(sp)
    800077e0:	00013403          	ld	s0,0(sp)
    800077e4:	00d5151b          	slliw	a0,a0,0xd
    800077e8:	0c2017b7          	lui	a5,0xc201
    800077ec:	00a78533          	add	a0,a5,a0
    800077f0:	00452503          	lw	a0,4(a0)
    800077f4:	01010113          	addi	sp,sp,16
    800077f8:	00008067          	ret

00000000800077fc <plic_complete>:
    800077fc:	fe010113          	addi	sp,sp,-32
    80007800:	00813823          	sd	s0,16(sp)
    80007804:	00913423          	sd	s1,8(sp)
    80007808:	00113c23          	sd	ra,24(sp)
    8000780c:	02010413          	addi	s0,sp,32
    80007810:	00050493          	mv	s1,a0
    80007814:	00000097          	auipc	ra,0x0
    80007818:	9bc080e7          	jalr	-1604(ra) # 800071d0 <cpuid>
    8000781c:	01813083          	ld	ra,24(sp)
    80007820:	01013403          	ld	s0,16(sp)
    80007824:	00d5179b          	slliw	a5,a0,0xd
    80007828:	0c201737          	lui	a4,0xc201
    8000782c:	00f707b3          	add	a5,a4,a5
    80007830:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007834:	00813483          	ld	s1,8(sp)
    80007838:	02010113          	addi	sp,sp,32
    8000783c:	00008067          	ret

0000000080007840 <consolewrite>:
    80007840:	fb010113          	addi	sp,sp,-80
    80007844:	04813023          	sd	s0,64(sp)
    80007848:	04113423          	sd	ra,72(sp)
    8000784c:	02913c23          	sd	s1,56(sp)
    80007850:	03213823          	sd	s2,48(sp)
    80007854:	03313423          	sd	s3,40(sp)
    80007858:	03413023          	sd	s4,32(sp)
    8000785c:	01513c23          	sd	s5,24(sp)
    80007860:	05010413          	addi	s0,sp,80
    80007864:	06c05c63          	blez	a2,800078dc <consolewrite+0x9c>
    80007868:	00060993          	mv	s3,a2
    8000786c:	00050a13          	mv	s4,a0
    80007870:	00058493          	mv	s1,a1
    80007874:	00000913          	li	s2,0
    80007878:	fff00a93          	li	s5,-1
    8000787c:	01c0006f          	j	80007898 <consolewrite+0x58>
    80007880:	fbf44503          	lbu	a0,-65(s0)
    80007884:	0019091b          	addiw	s2,s2,1
    80007888:	00148493          	addi	s1,s1,1
    8000788c:	00001097          	auipc	ra,0x1
    80007890:	a9c080e7          	jalr	-1380(ra) # 80008328 <uartputc>
    80007894:	03298063          	beq	s3,s2,800078b4 <consolewrite+0x74>
    80007898:	00048613          	mv	a2,s1
    8000789c:	00100693          	li	a3,1
    800078a0:	000a0593          	mv	a1,s4
    800078a4:	fbf40513          	addi	a0,s0,-65
    800078a8:	00000097          	auipc	ra,0x0
    800078ac:	9e0080e7          	jalr	-1568(ra) # 80007288 <either_copyin>
    800078b0:	fd5518e3          	bne	a0,s5,80007880 <consolewrite+0x40>
    800078b4:	04813083          	ld	ra,72(sp)
    800078b8:	04013403          	ld	s0,64(sp)
    800078bc:	03813483          	ld	s1,56(sp)
    800078c0:	02813983          	ld	s3,40(sp)
    800078c4:	02013a03          	ld	s4,32(sp)
    800078c8:	01813a83          	ld	s5,24(sp)
    800078cc:	00090513          	mv	a0,s2
    800078d0:	03013903          	ld	s2,48(sp)
    800078d4:	05010113          	addi	sp,sp,80
    800078d8:	00008067          	ret
    800078dc:	00000913          	li	s2,0
    800078e0:	fd5ff06f          	j	800078b4 <consolewrite+0x74>

00000000800078e4 <consoleread>:
    800078e4:	f9010113          	addi	sp,sp,-112
    800078e8:	06813023          	sd	s0,96(sp)
    800078ec:	04913c23          	sd	s1,88(sp)
    800078f0:	05213823          	sd	s2,80(sp)
    800078f4:	05313423          	sd	s3,72(sp)
    800078f8:	05413023          	sd	s4,64(sp)
    800078fc:	03513c23          	sd	s5,56(sp)
    80007900:	03613823          	sd	s6,48(sp)
    80007904:	03713423          	sd	s7,40(sp)
    80007908:	03813023          	sd	s8,32(sp)
    8000790c:	06113423          	sd	ra,104(sp)
    80007910:	01913c23          	sd	s9,24(sp)
    80007914:	07010413          	addi	s0,sp,112
    80007918:	00060b93          	mv	s7,a2
    8000791c:	00050913          	mv	s2,a0
    80007920:	00058c13          	mv	s8,a1
    80007924:	00060b1b          	sext.w	s6,a2
    80007928:	00006497          	auipc	s1,0x6
    8000792c:	4a048493          	addi	s1,s1,1184 # 8000ddc8 <cons>
    80007930:	00400993          	li	s3,4
    80007934:	fff00a13          	li	s4,-1
    80007938:	00a00a93          	li	s5,10
    8000793c:	05705e63          	blez	s7,80007998 <consoleread+0xb4>
    80007940:	09c4a703          	lw	a4,156(s1)
    80007944:	0984a783          	lw	a5,152(s1)
    80007948:	0007071b          	sext.w	a4,a4
    8000794c:	08e78463          	beq	a5,a4,800079d4 <consoleread+0xf0>
    80007950:	07f7f713          	andi	a4,a5,127
    80007954:	00e48733          	add	a4,s1,a4
    80007958:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000795c:	0017869b          	addiw	a3,a5,1
    80007960:	08d4ac23          	sw	a3,152(s1)
    80007964:	00070c9b          	sext.w	s9,a4
    80007968:	0b370663          	beq	a4,s3,80007a14 <consoleread+0x130>
    8000796c:	00100693          	li	a3,1
    80007970:	f9f40613          	addi	a2,s0,-97
    80007974:	000c0593          	mv	a1,s8
    80007978:	00090513          	mv	a0,s2
    8000797c:	f8e40fa3          	sb	a4,-97(s0)
    80007980:	00000097          	auipc	ra,0x0
    80007984:	8bc080e7          	jalr	-1860(ra) # 8000723c <either_copyout>
    80007988:	01450863          	beq	a0,s4,80007998 <consoleread+0xb4>
    8000798c:	001c0c13          	addi	s8,s8,1
    80007990:	fffb8b9b          	addiw	s7,s7,-1
    80007994:	fb5c94e3          	bne	s9,s5,8000793c <consoleread+0x58>
    80007998:	000b851b          	sext.w	a0,s7
    8000799c:	06813083          	ld	ra,104(sp)
    800079a0:	06013403          	ld	s0,96(sp)
    800079a4:	05813483          	ld	s1,88(sp)
    800079a8:	05013903          	ld	s2,80(sp)
    800079ac:	04813983          	ld	s3,72(sp)
    800079b0:	04013a03          	ld	s4,64(sp)
    800079b4:	03813a83          	ld	s5,56(sp)
    800079b8:	02813b83          	ld	s7,40(sp)
    800079bc:	02013c03          	ld	s8,32(sp)
    800079c0:	01813c83          	ld	s9,24(sp)
    800079c4:	40ab053b          	subw	a0,s6,a0
    800079c8:	03013b03          	ld	s6,48(sp)
    800079cc:	07010113          	addi	sp,sp,112
    800079d0:	00008067          	ret
    800079d4:	00001097          	auipc	ra,0x1
    800079d8:	1d8080e7          	jalr	472(ra) # 80008bac <push_on>
    800079dc:	0984a703          	lw	a4,152(s1)
    800079e0:	09c4a783          	lw	a5,156(s1)
    800079e4:	0007879b          	sext.w	a5,a5
    800079e8:	fef70ce3          	beq	a4,a5,800079e0 <consoleread+0xfc>
    800079ec:	00001097          	auipc	ra,0x1
    800079f0:	234080e7          	jalr	564(ra) # 80008c20 <pop_on>
    800079f4:	0984a783          	lw	a5,152(s1)
    800079f8:	07f7f713          	andi	a4,a5,127
    800079fc:	00e48733          	add	a4,s1,a4
    80007a00:	01874703          	lbu	a4,24(a4)
    80007a04:	0017869b          	addiw	a3,a5,1
    80007a08:	08d4ac23          	sw	a3,152(s1)
    80007a0c:	00070c9b          	sext.w	s9,a4
    80007a10:	f5371ee3          	bne	a4,s3,8000796c <consoleread+0x88>
    80007a14:	000b851b          	sext.w	a0,s7
    80007a18:	f96bf2e3          	bgeu	s7,s6,8000799c <consoleread+0xb8>
    80007a1c:	08f4ac23          	sw	a5,152(s1)
    80007a20:	f7dff06f          	j	8000799c <consoleread+0xb8>

0000000080007a24 <consputc>:
    80007a24:	10000793          	li	a5,256
    80007a28:	00f50663          	beq	a0,a5,80007a34 <consputc+0x10>
    80007a2c:	00001317          	auipc	t1,0x1
    80007a30:	9f430067          	jr	-1548(t1) # 80008420 <uartputc_sync>
    80007a34:	ff010113          	addi	sp,sp,-16
    80007a38:	00113423          	sd	ra,8(sp)
    80007a3c:	00813023          	sd	s0,0(sp)
    80007a40:	01010413          	addi	s0,sp,16
    80007a44:	00800513          	li	a0,8
    80007a48:	00001097          	auipc	ra,0x1
    80007a4c:	9d8080e7          	jalr	-1576(ra) # 80008420 <uartputc_sync>
    80007a50:	02000513          	li	a0,32
    80007a54:	00001097          	auipc	ra,0x1
    80007a58:	9cc080e7          	jalr	-1588(ra) # 80008420 <uartputc_sync>
    80007a5c:	00013403          	ld	s0,0(sp)
    80007a60:	00813083          	ld	ra,8(sp)
    80007a64:	00800513          	li	a0,8
    80007a68:	01010113          	addi	sp,sp,16
    80007a6c:	00001317          	auipc	t1,0x1
    80007a70:	9b430067          	jr	-1612(t1) # 80008420 <uartputc_sync>

0000000080007a74 <consoleintr>:
    80007a74:	fe010113          	addi	sp,sp,-32
    80007a78:	00813823          	sd	s0,16(sp)
    80007a7c:	00913423          	sd	s1,8(sp)
    80007a80:	01213023          	sd	s2,0(sp)
    80007a84:	00113c23          	sd	ra,24(sp)
    80007a88:	02010413          	addi	s0,sp,32
    80007a8c:	00006917          	auipc	s2,0x6
    80007a90:	33c90913          	addi	s2,s2,828 # 8000ddc8 <cons>
    80007a94:	00050493          	mv	s1,a0
    80007a98:	00090513          	mv	a0,s2
    80007a9c:	00001097          	auipc	ra,0x1
    80007aa0:	e40080e7          	jalr	-448(ra) # 800088dc <acquire>
    80007aa4:	02048c63          	beqz	s1,80007adc <consoleintr+0x68>
    80007aa8:	0a092783          	lw	a5,160(s2)
    80007aac:	09892703          	lw	a4,152(s2)
    80007ab0:	07f00693          	li	a3,127
    80007ab4:	40e7873b          	subw	a4,a5,a4
    80007ab8:	02e6e263          	bltu	a3,a4,80007adc <consoleintr+0x68>
    80007abc:	00d00713          	li	a4,13
    80007ac0:	04e48063          	beq	s1,a4,80007b00 <consoleintr+0x8c>
    80007ac4:	07f7f713          	andi	a4,a5,127
    80007ac8:	00e90733          	add	a4,s2,a4
    80007acc:	0017879b          	addiw	a5,a5,1
    80007ad0:	0af92023          	sw	a5,160(s2)
    80007ad4:	00970c23          	sb	s1,24(a4)
    80007ad8:	08f92e23          	sw	a5,156(s2)
    80007adc:	01013403          	ld	s0,16(sp)
    80007ae0:	01813083          	ld	ra,24(sp)
    80007ae4:	00813483          	ld	s1,8(sp)
    80007ae8:	00013903          	ld	s2,0(sp)
    80007aec:	00006517          	auipc	a0,0x6
    80007af0:	2dc50513          	addi	a0,a0,732 # 8000ddc8 <cons>
    80007af4:	02010113          	addi	sp,sp,32
    80007af8:	00001317          	auipc	t1,0x1
    80007afc:	eb030067          	jr	-336(t1) # 800089a8 <release>
    80007b00:	00a00493          	li	s1,10
    80007b04:	fc1ff06f          	j	80007ac4 <consoleintr+0x50>

0000000080007b08 <consoleinit>:
    80007b08:	fe010113          	addi	sp,sp,-32
    80007b0c:	00113c23          	sd	ra,24(sp)
    80007b10:	00813823          	sd	s0,16(sp)
    80007b14:	00913423          	sd	s1,8(sp)
    80007b18:	02010413          	addi	s0,sp,32
    80007b1c:	00006497          	auipc	s1,0x6
    80007b20:	2ac48493          	addi	s1,s1,684 # 8000ddc8 <cons>
    80007b24:	00048513          	mv	a0,s1
    80007b28:	00003597          	auipc	a1,0x3
    80007b2c:	c2058593          	addi	a1,a1,-992 # 8000a748 <CONSOLE_STATUS+0x738>
    80007b30:	00001097          	auipc	ra,0x1
    80007b34:	d88080e7          	jalr	-632(ra) # 800088b8 <initlock>
    80007b38:	00000097          	auipc	ra,0x0
    80007b3c:	7ac080e7          	jalr	1964(ra) # 800082e4 <uartinit>
    80007b40:	01813083          	ld	ra,24(sp)
    80007b44:	01013403          	ld	s0,16(sp)
    80007b48:	00000797          	auipc	a5,0x0
    80007b4c:	d9c78793          	addi	a5,a5,-612 # 800078e4 <consoleread>
    80007b50:	0af4bc23          	sd	a5,184(s1)
    80007b54:	00000797          	auipc	a5,0x0
    80007b58:	cec78793          	addi	a5,a5,-788 # 80007840 <consolewrite>
    80007b5c:	0cf4b023          	sd	a5,192(s1)
    80007b60:	00813483          	ld	s1,8(sp)
    80007b64:	02010113          	addi	sp,sp,32
    80007b68:	00008067          	ret

0000000080007b6c <console_read>:
    80007b6c:	ff010113          	addi	sp,sp,-16
    80007b70:	00813423          	sd	s0,8(sp)
    80007b74:	01010413          	addi	s0,sp,16
    80007b78:	00813403          	ld	s0,8(sp)
    80007b7c:	00006317          	auipc	t1,0x6
    80007b80:	30433303          	ld	t1,772(t1) # 8000de80 <devsw+0x10>
    80007b84:	01010113          	addi	sp,sp,16
    80007b88:	00030067          	jr	t1

0000000080007b8c <console_write>:
    80007b8c:	ff010113          	addi	sp,sp,-16
    80007b90:	00813423          	sd	s0,8(sp)
    80007b94:	01010413          	addi	s0,sp,16
    80007b98:	00813403          	ld	s0,8(sp)
    80007b9c:	00006317          	auipc	t1,0x6
    80007ba0:	2ec33303          	ld	t1,748(t1) # 8000de88 <devsw+0x18>
    80007ba4:	01010113          	addi	sp,sp,16
    80007ba8:	00030067          	jr	t1

0000000080007bac <panic>:
    80007bac:	fe010113          	addi	sp,sp,-32
    80007bb0:	00113c23          	sd	ra,24(sp)
    80007bb4:	00813823          	sd	s0,16(sp)
    80007bb8:	00913423          	sd	s1,8(sp)
    80007bbc:	02010413          	addi	s0,sp,32
    80007bc0:	00050493          	mv	s1,a0
    80007bc4:	00003517          	auipc	a0,0x3
    80007bc8:	b8c50513          	addi	a0,a0,-1140 # 8000a750 <CONSOLE_STATUS+0x740>
    80007bcc:	00006797          	auipc	a5,0x6
    80007bd0:	3407ae23          	sw	zero,860(a5) # 8000df28 <pr+0x18>
    80007bd4:	00000097          	auipc	ra,0x0
    80007bd8:	034080e7          	jalr	52(ra) # 80007c08 <__printf>
    80007bdc:	00048513          	mv	a0,s1
    80007be0:	00000097          	auipc	ra,0x0
    80007be4:	028080e7          	jalr	40(ra) # 80007c08 <__printf>
    80007be8:	00002517          	auipc	a0,0x2
    80007bec:	6f850513          	addi	a0,a0,1784 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80007bf0:	00000097          	auipc	ra,0x0
    80007bf4:	018080e7          	jalr	24(ra) # 80007c08 <__printf>
    80007bf8:	00100793          	li	a5,1
    80007bfc:	00005717          	auipc	a4,0x5
    80007c00:	fef72623          	sw	a5,-20(a4) # 8000cbe8 <panicked>
    80007c04:	0000006f          	j	80007c04 <panic+0x58>

0000000080007c08 <__printf>:
    80007c08:	f3010113          	addi	sp,sp,-208
    80007c0c:	08813023          	sd	s0,128(sp)
    80007c10:	07313423          	sd	s3,104(sp)
    80007c14:	09010413          	addi	s0,sp,144
    80007c18:	05813023          	sd	s8,64(sp)
    80007c1c:	08113423          	sd	ra,136(sp)
    80007c20:	06913c23          	sd	s1,120(sp)
    80007c24:	07213823          	sd	s2,112(sp)
    80007c28:	07413023          	sd	s4,96(sp)
    80007c2c:	05513c23          	sd	s5,88(sp)
    80007c30:	05613823          	sd	s6,80(sp)
    80007c34:	05713423          	sd	s7,72(sp)
    80007c38:	03913c23          	sd	s9,56(sp)
    80007c3c:	03a13823          	sd	s10,48(sp)
    80007c40:	03b13423          	sd	s11,40(sp)
    80007c44:	00006317          	auipc	t1,0x6
    80007c48:	2cc30313          	addi	t1,t1,716 # 8000df10 <pr>
    80007c4c:	01832c03          	lw	s8,24(t1)
    80007c50:	00b43423          	sd	a1,8(s0)
    80007c54:	00c43823          	sd	a2,16(s0)
    80007c58:	00d43c23          	sd	a3,24(s0)
    80007c5c:	02e43023          	sd	a4,32(s0)
    80007c60:	02f43423          	sd	a5,40(s0)
    80007c64:	03043823          	sd	a6,48(s0)
    80007c68:	03143c23          	sd	a7,56(s0)
    80007c6c:	00050993          	mv	s3,a0
    80007c70:	4a0c1663          	bnez	s8,8000811c <__printf+0x514>
    80007c74:	60098c63          	beqz	s3,8000828c <__printf+0x684>
    80007c78:	0009c503          	lbu	a0,0(s3)
    80007c7c:	00840793          	addi	a5,s0,8
    80007c80:	f6f43c23          	sd	a5,-136(s0)
    80007c84:	00000493          	li	s1,0
    80007c88:	22050063          	beqz	a0,80007ea8 <__printf+0x2a0>
    80007c8c:	00002a37          	lui	s4,0x2
    80007c90:	00018ab7          	lui	s5,0x18
    80007c94:	000f4b37          	lui	s6,0xf4
    80007c98:	00989bb7          	lui	s7,0x989
    80007c9c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007ca0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007ca4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007ca8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007cac:	00148c9b          	addiw	s9,s1,1
    80007cb0:	02500793          	li	a5,37
    80007cb4:	01998933          	add	s2,s3,s9
    80007cb8:	38f51263          	bne	a0,a5,8000803c <__printf+0x434>
    80007cbc:	00094783          	lbu	a5,0(s2)
    80007cc0:	00078c9b          	sext.w	s9,a5
    80007cc4:	1e078263          	beqz	a5,80007ea8 <__printf+0x2a0>
    80007cc8:	0024849b          	addiw	s1,s1,2
    80007ccc:	07000713          	li	a4,112
    80007cd0:	00998933          	add	s2,s3,s1
    80007cd4:	38e78a63          	beq	a5,a4,80008068 <__printf+0x460>
    80007cd8:	20f76863          	bltu	a4,a5,80007ee8 <__printf+0x2e0>
    80007cdc:	42a78863          	beq	a5,a0,8000810c <__printf+0x504>
    80007ce0:	06400713          	li	a4,100
    80007ce4:	40e79663          	bne	a5,a4,800080f0 <__printf+0x4e8>
    80007ce8:	f7843783          	ld	a5,-136(s0)
    80007cec:	0007a603          	lw	a2,0(a5)
    80007cf0:	00878793          	addi	a5,a5,8
    80007cf4:	f6f43c23          	sd	a5,-136(s0)
    80007cf8:	42064a63          	bltz	a2,8000812c <__printf+0x524>
    80007cfc:	00a00713          	li	a4,10
    80007d00:	02e677bb          	remuw	a5,a2,a4
    80007d04:	00003d97          	auipc	s11,0x3
    80007d08:	a74d8d93          	addi	s11,s11,-1420 # 8000a778 <digits>
    80007d0c:	00900593          	li	a1,9
    80007d10:	0006051b          	sext.w	a0,a2
    80007d14:	00000c93          	li	s9,0
    80007d18:	02079793          	slli	a5,a5,0x20
    80007d1c:	0207d793          	srli	a5,a5,0x20
    80007d20:	00fd87b3          	add	a5,s11,a5
    80007d24:	0007c783          	lbu	a5,0(a5)
    80007d28:	02e656bb          	divuw	a3,a2,a4
    80007d2c:	f8f40023          	sb	a5,-128(s0)
    80007d30:	14c5d863          	bge	a1,a2,80007e80 <__printf+0x278>
    80007d34:	06300593          	li	a1,99
    80007d38:	00100c93          	li	s9,1
    80007d3c:	02e6f7bb          	remuw	a5,a3,a4
    80007d40:	02079793          	slli	a5,a5,0x20
    80007d44:	0207d793          	srli	a5,a5,0x20
    80007d48:	00fd87b3          	add	a5,s11,a5
    80007d4c:	0007c783          	lbu	a5,0(a5)
    80007d50:	02e6d73b          	divuw	a4,a3,a4
    80007d54:	f8f400a3          	sb	a5,-127(s0)
    80007d58:	12a5f463          	bgeu	a1,a0,80007e80 <__printf+0x278>
    80007d5c:	00a00693          	li	a3,10
    80007d60:	00900593          	li	a1,9
    80007d64:	02d777bb          	remuw	a5,a4,a3
    80007d68:	02079793          	slli	a5,a5,0x20
    80007d6c:	0207d793          	srli	a5,a5,0x20
    80007d70:	00fd87b3          	add	a5,s11,a5
    80007d74:	0007c503          	lbu	a0,0(a5)
    80007d78:	02d757bb          	divuw	a5,a4,a3
    80007d7c:	f8a40123          	sb	a0,-126(s0)
    80007d80:	48e5f263          	bgeu	a1,a4,80008204 <__printf+0x5fc>
    80007d84:	06300513          	li	a0,99
    80007d88:	02d7f5bb          	remuw	a1,a5,a3
    80007d8c:	02059593          	slli	a1,a1,0x20
    80007d90:	0205d593          	srli	a1,a1,0x20
    80007d94:	00bd85b3          	add	a1,s11,a1
    80007d98:	0005c583          	lbu	a1,0(a1)
    80007d9c:	02d7d7bb          	divuw	a5,a5,a3
    80007da0:	f8b401a3          	sb	a1,-125(s0)
    80007da4:	48e57263          	bgeu	a0,a4,80008228 <__printf+0x620>
    80007da8:	3e700513          	li	a0,999
    80007dac:	02d7f5bb          	remuw	a1,a5,a3
    80007db0:	02059593          	slli	a1,a1,0x20
    80007db4:	0205d593          	srli	a1,a1,0x20
    80007db8:	00bd85b3          	add	a1,s11,a1
    80007dbc:	0005c583          	lbu	a1,0(a1)
    80007dc0:	02d7d7bb          	divuw	a5,a5,a3
    80007dc4:	f8b40223          	sb	a1,-124(s0)
    80007dc8:	46e57663          	bgeu	a0,a4,80008234 <__printf+0x62c>
    80007dcc:	02d7f5bb          	remuw	a1,a5,a3
    80007dd0:	02059593          	slli	a1,a1,0x20
    80007dd4:	0205d593          	srli	a1,a1,0x20
    80007dd8:	00bd85b3          	add	a1,s11,a1
    80007ddc:	0005c583          	lbu	a1,0(a1)
    80007de0:	02d7d7bb          	divuw	a5,a5,a3
    80007de4:	f8b402a3          	sb	a1,-123(s0)
    80007de8:	46ea7863          	bgeu	s4,a4,80008258 <__printf+0x650>
    80007dec:	02d7f5bb          	remuw	a1,a5,a3
    80007df0:	02059593          	slli	a1,a1,0x20
    80007df4:	0205d593          	srli	a1,a1,0x20
    80007df8:	00bd85b3          	add	a1,s11,a1
    80007dfc:	0005c583          	lbu	a1,0(a1)
    80007e00:	02d7d7bb          	divuw	a5,a5,a3
    80007e04:	f8b40323          	sb	a1,-122(s0)
    80007e08:	3eeaf863          	bgeu	s5,a4,800081f8 <__printf+0x5f0>
    80007e0c:	02d7f5bb          	remuw	a1,a5,a3
    80007e10:	02059593          	slli	a1,a1,0x20
    80007e14:	0205d593          	srli	a1,a1,0x20
    80007e18:	00bd85b3          	add	a1,s11,a1
    80007e1c:	0005c583          	lbu	a1,0(a1)
    80007e20:	02d7d7bb          	divuw	a5,a5,a3
    80007e24:	f8b403a3          	sb	a1,-121(s0)
    80007e28:	42eb7e63          	bgeu	s6,a4,80008264 <__printf+0x65c>
    80007e2c:	02d7f5bb          	remuw	a1,a5,a3
    80007e30:	02059593          	slli	a1,a1,0x20
    80007e34:	0205d593          	srli	a1,a1,0x20
    80007e38:	00bd85b3          	add	a1,s11,a1
    80007e3c:	0005c583          	lbu	a1,0(a1)
    80007e40:	02d7d7bb          	divuw	a5,a5,a3
    80007e44:	f8b40423          	sb	a1,-120(s0)
    80007e48:	42ebfc63          	bgeu	s7,a4,80008280 <__printf+0x678>
    80007e4c:	02079793          	slli	a5,a5,0x20
    80007e50:	0207d793          	srli	a5,a5,0x20
    80007e54:	00fd8db3          	add	s11,s11,a5
    80007e58:	000dc703          	lbu	a4,0(s11)
    80007e5c:	00a00793          	li	a5,10
    80007e60:	00900c93          	li	s9,9
    80007e64:	f8e404a3          	sb	a4,-119(s0)
    80007e68:	00065c63          	bgez	a2,80007e80 <__printf+0x278>
    80007e6c:	f9040713          	addi	a4,s0,-112
    80007e70:	00f70733          	add	a4,a4,a5
    80007e74:	02d00693          	li	a3,45
    80007e78:	fed70823          	sb	a3,-16(a4)
    80007e7c:	00078c93          	mv	s9,a5
    80007e80:	f8040793          	addi	a5,s0,-128
    80007e84:	01978cb3          	add	s9,a5,s9
    80007e88:	f7f40d13          	addi	s10,s0,-129
    80007e8c:	000cc503          	lbu	a0,0(s9)
    80007e90:	fffc8c93          	addi	s9,s9,-1
    80007e94:	00000097          	auipc	ra,0x0
    80007e98:	b90080e7          	jalr	-1136(ra) # 80007a24 <consputc>
    80007e9c:	ffac98e3          	bne	s9,s10,80007e8c <__printf+0x284>
    80007ea0:	00094503          	lbu	a0,0(s2)
    80007ea4:	e00514e3          	bnez	a0,80007cac <__printf+0xa4>
    80007ea8:	1a0c1663          	bnez	s8,80008054 <__printf+0x44c>
    80007eac:	08813083          	ld	ra,136(sp)
    80007eb0:	08013403          	ld	s0,128(sp)
    80007eb4:	07813483          	ld	s1,120(sp)
    80007eb8:	07013903          	ld	s2,112(sp)
    80007ebc:	06813983          	ld	s3,104(sp)
    80007ec0:	06013a03          	ld	s4,96(sp)
    80007ec4:	05813a83          	ld	s5,88(sp)
    80007ec8:	05013b03          	ld	s6,80(sp)
    80007ecc:	04813b83          	ld	s7,72(sp)
    80007ed0:	04013c03          	ld	s8,64(sp)
    80007ed4:	03813c83          	ld	s9,56(sp)
    80007ed8:	03013d03          	ld	s10,48(sp)
    80007edc:	02813d83          	ld	s11,40(sp)
    80007ee0:	0d010113          	addi	sp,sp,208
    80007ee4:	00008067          	ret
    80007ee8:	07300713          	li	a4,115
    80007eec:	1ce78a63          	beq	a5,a4,800080c0 <__printf+0x4b8>
    80007ef0:	07800713          	li	a4,120
    80007ef4:	1ee79e63          	bne	a5,a4,800080f0 <__printf+0x4e8>
    80007ef8:	f7843783          	ld	a5,-136(s0)
    80007efc:	0007a703          	lw	a4,0(a5)
    80007f00:	00878793          	addi	a5,a5,8
    80007f04:	f6f43c23          	sd	a5,-136(s0)
    80007f08:	28074263          	bltz	a4,8000818c <__printf+0x584>
    80007f0c:	00003d97          	auipc	s11,0x3
    80007f10:	86cd8d93          	addi	s11,s11,-1940 # 8000a778 <digits>
    80007f14:	00f77793          	andi	a5,a4,15
    80007f18:	00fd87b3          	add	a5,s11,a5
    80007f1c:	0007c683          	lbu	a3,0(a5)
    80007f20:	00f00613          	li	a2,15
    80007f24:	0007079b          	sext.w	a5,a4
    80007f28:	f8d40023          	sb	a3,-128(s0)
    80007f2c:	0047559b          	srliw	a1,a4,0x4
    80007f30:	0047569b          	srliw	a3,a4,0x4
    80007f34:	00000c93          	li	s9,0
    80007f38:	0ee65063          	bge	a2,a4,80008018 <__printf+0x410>
    80007f3c:	00f6f693          	andi	a3,a3,15
    80007f40:	00dd86b3          	add	a3,s11,a3
    80007f44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007f48:	0087d79b          	srliw	a5,a5,0x8
    80007f4c:	00100c93          	li	s9,1
    80007f50:	f8d400a3          	sb	a3,-127(s0)
    80007f54:	0cb67263          	bgeu	a2,a1,80008018 <__printf+0x410>
    80007f58:	00f7f693          	andi	a3,a5,15
    80007f5c:	00dd86b3          	add	a3,s11,a3
    80007f60:	0006c583          	lbu	a1,0(a3)
    80007f64:	00f00613          	li	a2,15
    80007f68:	0047d69b          	srliw	a3,a5,0x4
    80007f6c:	f8b40123          	sb	a1,-126(s0)
    80007f70:	0047d593          	srli	a1,a5,0x4
    80007f74:	28f67e63          	bgeu	a2,a5,80008210 <__printf+0x608>
    80007f78:	00f6f693          	andi	a3,a3,15
    80007f7c:	00dd86b3          	add	a3,s11,a3
    80007f80:	0006c503          	lbu	a0,0(a3)
    80007f84:	0087d813          	srli	a6,a5,0x8
    80007f88:	0087d69b          	srliw	a3,a5,0x8
    80007f8c:	f8a401a3          	sb	a0,-125(s0)
    80007f90:	28b67663          	bgeu	a2,a1,8000821c <__printf+0x614>
    80007f94:	00f6f693          	andi	a3,a3,15
    80007f98:	00dd86b3          	add	a3,s11,a3
    80007f9c:	0006c583          	lbu	a1,0(a3)
    80007fa0:	00c7d513          	srli	a0,a5,0xc
    80007fa4:	00c7d69b          	srliw	a3,a5,0xc
    80007fa8:	f8b40223          	sb	a1,-124(s0)
    80007fac:	29067a63          	bgeu	a2,a6,80008240 <__printf+0x638>
    80007fb0:	00f6f693          	andi	a3,a3,15
    80007fb4:	00dd86b3          	add	a3,s11,a3
    80007fb8:	0006c583          	lbu	a1,0(a3)
    80007fbc:	0107d813          	srli	a6,a5,0x10
    80007fc0:	0107d69b          	srliw	a3,a5,0x10
    80007fc4:	f8b402a3          	sb	a1,-123(s0)
    80007fc8:	28a67263          	bgeu	a2,a0,8000824c <__printf+0x644>
    80007fcc:	00f6f693          	andi	a3,a3,15
    80007fd0:	00dd86b3          	add	a3,s11,a3
    80007fd4:	0006c683          	lbu	a3,0(a3)
    80007fd8:	0147d79b          	srliw	a5,a5,0x14
    80007fdc:	f8d40323          	sb	a3,-122(s0)
    80007fe0:	21067663          	bgeu	a2,a6,800081ec <__printf+0x5e4>
    80007fe4:	02079793          	slli	a5,a5,0x20
    80007fe8:	0207d793          	srli	a5,a5,0x20
    80007fec:	00fd8db3          	add	s11,s11,a5
    80007ff0:	000dc683          	lbu	a3,0(s11)
    80007ff4:	00800793          	li	a5,8
    80007ff8:	00700c93          	li	s9,7
    80007ffc:	f8d403a3          	sb	a3,-121(s0)
    80008000:	00075c63          	bgez	a4,80008018 <__printf+0x410>
    80008004:	f9040713          	addi	a4,s0,-112
    80008008:	00f70733          	add	a4,a4,a5
    8000800c:	02d00693          	li	a3,45
    80008010:	fed70823          	sb	a3,-16(a4)
    80008014:	00078c93          	mv	s9,a5
    80008018:	f8040793          	addi	a5,s0,-128
    8000801c:	01978cb3          	add	s9,a5,s9
    80008020:	f7f40d13          	addi	s10,s0,-129
    80008024:	000cc503          	lbu	a0,0(s9)
    80008028:	fffc8c93          	addi	s9,s9,-1
    8000802c:	00000097          	auipc	ra,0x0
    80008030:	9f8080e7          	jalr	-1544(ra) # 80007a24 <consputc>
    80008034:	ff9d18e3          	bne	s10,s9,80008024 <__printf+0x41c>
    80008038:	0100006f          	j	80008048 <__printf+0x440>
    8000803c:	00000097          	auipc	ra,0x0
    80008040:	9e8080e7          	jalr	-1560(ra) # 80007a24 <consputc>
    80008044:	000c8493          	mv	s1,s9
    80008048:	00094503          	lbu	a0,0(s2)
    8000804c:	c60510e3          	bnez	a0,80007cac <__printf+0xa4>
    80008050:	e40c0ee3          	beqz	s8,80007eac <__printf+0x2a4>
    80008054:	00006517          	auipc	a0,0x6
    80008058:	ebc50513          	addi	a0,a0,-324 # 8000df10 <pr>
    8000805c:	00001097          	auipc	ra,0x1
    80008060:	94c080e7          	jalr	-1716(ra) # 800089a8 <release>
    80008064:	e49ff06f          	j	80007eac <__printf+0x2a4>
    80008068:	f7843783          	ld	a5,-136(s0)
    8000806c:	03000513          	li	a0,48
    80008070:	01000d13          	li	s10,16
    80008074:	00878713          	addi	a4,a5,8
    80008078:	0007bc83          	ld	s9,0(a5)
    8000807c:	f6e43c23          	sd	a4,-136(s0)
    80008080:	00000097          	auipc	ra,0x0
    80008084:	9a4080e7          	jalr	-1628(ra) # 80007a24 <consputc>
    80008088:	07800513          	li	a0,120
    8000808c:	00000097          	auipc	ra,0x0
    80008090:	998080e7          	jalr	-1640(ra) # 80007a24 <consputc>
    80008094:	00002d97          	auipc	s11,0x2
    80008098:	6e4d8d93          	addi	s11,s11,1764 # 8000a778 <digits>
    8000809c:	03ccd793          	srli	a5,s9,0x3c
    800080a0:	00fd87b3          	add	a5,s11,a5
    800080a4:	0007c503          	lbu	a0,0(a5)
    800080a8:	fffd0d1b          	addiw	s10,s10,-1
    800080ac:	004c9c93          	slli	s9,s9,0x4
    800080b0:	00000097          	auipc	ra,0x0
    800080b4:	974080e7          	jalr	-1676(ra) # 80007a24 <consputc>
    800080b8:	fe0d12e3          	bnez	s10,8000809c <__printf+0x494>
    800080bc:	f8dff06f          	j	80008048 <__printf+0x440>
    800080c0:	f7843783          	ld	a5,-136(s0)
    800080c4:	0007bc83          	ld	s9,0(a5)
    800080c8:	00878793          	addi	a5,a5,8
    800080cc:	f6f43c23          	sd	a5,-136(s0)
    800080d0:	000c9a63          	bnez	s9,800080e4 <__printf+0x4dc>
    800080d4:	1080006f          	j	800081dc <__printf+0x5d4>
    800080d8:	001c8c93          	addi	s9,s9,1
    800080dc:	00000097          	auipc	ra,0x0
    800080e0:	948080e7          	jalr	-1720(ra) # 80007a24 <consputc>
    800080e4:	000cc503          	lbu	a0,0(s9)
    800080e8:	fe0518e3          	bnez	a0,800080d8 <__printf+0x4d0>
    800080ec:	f5dff06f          	j	80008048 <__printf+0x440>
    800080f0:	02500513          	li	a0,37
    800080f4:	00000097          	auipc	ra,0x0
    800080f8:	930080e7          	jalr	-1744(ra) # 80007a24 <consputc>
    800080fc:	000c8513          	mv	a0,s9
    80008100:	00000097          	auipc	ra,0x0
    80008104:	924080e7          	jalr	-1756(ra) # 80007a24 <consputc>
    80008108:	f41ff06f          	j	80008048 <__printf+0x440>
    8000810c:	02500513          	li	a0,37
    80008110:	00000097          	auipc	ra,0x0
    80008114:	914080e7          	jalr	-1772(ra) # 80007a24 <consputc>
    80008118:	f31ff06f          	j	80008048 <__printf+0x440>
    8000811c:	00030513          	mv	a0,t1
    80008120:	00000097          	auipc	ra,0x0
    80008124:	7bc080e7          	jalr	1980(ra) # 800088dc <acquire>
    80008128:	b4dff06f          	j	80007c74 <__printf+0x6c>
    8000812c:	40c0053b          	negw	a0,a2
    80008130:	00a00713          	li	a4,10
    80008134:	02e576bb          	remuw	a3,a0,a4
    80008138:	00002d97          	auipc	s11,0x2
    8000813c:	640d8d93          	addi	s11,s11,1600 # 8000a778 <digits>
    80008140:	ff700593          	li	a1,-9
    80008144:	02069693          	slli	a3,a3,0x20
    80008148:	0206d693          	srli	a3,a3,0x20
    8000814c:	00dd86b3          	add	a3,s11,a3
    80008150:	0006c683          	lbu	a3,0(a3)
    80008154:	02e557bb          	divuw	a5,a0,a4
    80008158:	f8d40023          	sb	a3,-128(s0)
    8000815c:	10b65e63          	bge	a2,a1,80008278 <__printf+0x670>
    80008160:	06300593          	li	a1,99
    80008164:	02e7f6bb          	remuw	a3,a5,a4
    80008168:	02069693          	slli	a3,a3,0x20
    8000816c:	0206d693          	srli	a3,a3,0x20
    80008170:	00dd86b3          	add	a3,s11,a3
    80008174:	0006c683          	lbu	a3,0(a3)
    80008178:	02e7d73b          	divuw	a4,a5,a4
    8000817c:	00200793          	li	a5,2
    80008180:	f8d400a3          	sb	a3,-127(s0)
    80008184:	bca5ece3          	bltu	a1,a0,80007d5c <__printf+0x154>
    80008188:	ce5ff06f          	j	80007e6c <__printf+0x264>
    8000818c:	40e007bb          	negw	a5,a4
    80008190:	00002d97          	auipc	s11,0x2
    80008194:	5e8d8d93          	addi	s11,s11,1512 # 8000a778 <digits>
    80008198:	00f7f693          	andi	a3,a5,15
    8000819c:	00dd86b3          	add	a3,s11,a3
    800081a0:	0006c583          	lbu	a1,0(a3)
    800081a4:	ff100613          	li	a2,-15
    800081a8:	0047d69b          	srliw	a3,a5,0x4
    800081ac:	f8b40023          	sb	a1,-128(s0)
    800081b0:	0047d59b          	srliw	a1,a5,0x4
    800081b4:	0ac75e63          	bge	a4,a2,80008270 <__printf+0x668>
    800081b8:	00f6f693          	andi	a3,a3,15
    800081bc:	00dd86b3          	add	a3,s11,a3
    800081c0:	0006c603          	lbu	a2,0(a3)
    800081c4:	00f00693          	li	a3,15
    800081c8:	0087d79b          	srliw	a5,a5,0x8
    800081cc:	f8c400a3          	sb	a2,-127(s0)
    800081d0:	d8b6e4e3          	bltu	a3,a1,80007f58 <__printf+0x350>
    800081d4:	00200793          	li	a5,2
    800081d8:	e2dff06f          	j	80008004 <__printf+0x3fc>
    800081dc:	00002c97          	auipc	s9,0x2
    800081e0:	57cc8c93          	addi	s9,s9,1404 # 8000a758 <CONSOLE_STATUS+0x748>
    800081e4:	02800513          	li	a0,40
    800081e8:	ef1ff06f          	j	800080d8 <__printf+0x4d0>
    800081ec:	00700793          	li	a5,7
    800081f0:	00600c93          	li	s9,6
    800081f4:	e0dff06f          	j	80008000 <__printf+0x3f8>
    800081f8:	00700793          	li	a5,7
    800081fc:	00600c93          	li	s9,6
    80008200:	c69ff06f          	j	80007e68 <__printf+0x260>
    80008204:	00300793          	li	a5,3
    80008208:	00200c93          	li	s9,2
    8000820c:	c5dff06f          	j	80007e68 <__printf+0x260>
    80008210:	00300793          	li	a5,3
    80008214:	00200c93          	li	s9,2
    80008218:	de9ff06f          	j	80008000 <__printf+0x3f8>
    8000821c:	00400793          	li	a5,4
    80008220:	00300c93          	li	s9,3
    80008224:	dddff06f          	j	80008000 <__printf+0x3f8>
    80008228:	00400793          	li	a5,4
    8000822c:	00300c93          	li	s9,3
    80008230:	c39ff06f          	j	80007e68 <__printf+0x260>
    80008234:	00500793          	li	a5,5
    80008238:	00400c93          	li	s9,4
    8000823c:	c2dff06f          	j	80007e68 <__printf+0x260>
    80008240:	00500793          	li	a5,5
    80008244:	00400c93          	li	s9,4
    80008248:	db9ff06f          	j	80008000 <__printf+0x3f8>
    8000824c:	00600793          	li	a5,6
    80008250:	00500c93          	li	s9,5
    80008254:	dadff06f          	j	80008000 <__printf+0x3f8>
    80008258:	00600793          	li	a5,6
    8000825c:	00500c93          	li	s9,5
    80008260:	c09ff06f          	j	80007e68 <__printf+0x260>
    80008264:	00800793          	li	a5,8
    80008268:	00700c93          	li	s9,7
    8000826c:	bfdff06f          	j	80007e68 <__printf+0x260>
    80008270:	00100793          	li	a5,1
    80008274:	d91ff06f          	j	80008004 <__printf+0x3fc>
    80008278:	00100793          	li	a5,1
    8000827c:	bf1ff06f          	j	80007e6c <__printf+0x264>
    80008280:	00900793          	li	a5,9
    80008284:	00800c93          	li	s9,8
    80008288:	be1ff06f          	j	80007e68 <__printf+0x260>
    8000828c:	00002517          	auipc	a0,0x2
    80008290:	4d450513          	addi	a0,a0,1236 # 8000a760 <CONSOLE_STATUS+0x750>
    80008294:	00000097          	auipc	ra,0x0
    80008298:	918080e7          	jalr	-1768(ra) # 80007bac <panic>

000000008000829c <printfinit>:
    8000829c:	fe010113          	addi	sp,sp,-32
    800082a0:	00813823          	sd	s0,16(sp)
    800082a4:	00913423          	sd	s1,8(sp)
    800082a8:	00113c23          	sd	ra,24(sp)
    800082ac:	02010413          	addi	s0,sp,32
    800082b0:	00006497          	auipc	s1,0x6
    800082b4:	c6048493          	addi	s1,s1,-928 # 8000df10 <pr>
    800082b8:	00048513          	mv	a0,s1
    800082bc:	00002597          	auipc	a1,0x2
    800082c0:	4b458593          	addi	a1,a1,1204 # 8000a770 <CONSOLE_STATUS+0x760>
    800082c4:	00000097          	auipc	ra,0x0
    800082c8:	5f4080e7          	jalr	1524(ra) # 800088b8 <initlock>
    800082cc:	01813083          	ld	ra,24(sp)
    800082d0:	01013403          	ld	s0,16(sp)
    800082d4:	0004ac23          	sw	zero,24(s1)
    800082d8:	00813483          	ld	s1,8(sp)
    800082dc:	02010113          	addi	sp,sp,32
    800082e0:	00008067          	ret

00000000800082e4 <uartinit>:
    800082e4:	ff010113          	addi	sp,sp,-16
    800082e8:	00813423          	sd	s0,8(sp)
    800082ec:	01010413          	addi	s0,sp,16
    800082f0:	100007b7          	lui	a5,0x10000
    800082f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800082f8:	f8000713          	li	a4,-128
    800082fc:	00e781a3          	sb	a4,3(a5)
    80008300:	00300713          	li	a4,3
    80008304:	00e78023          	sb	a4,0(a5)
    80008308:	000780a3          	sb	zero,1(a5)
    8000830c:	00e781a3          	sb	a4,3(a5)
    80008310:	00700693          	li	a3,7
    80008314:	00d78123          	sb	a3,2(a5)
    80008318:	00e780a3          	sb	a4,1(a5)
    8000831c:	00813403          	ld	s0,8(sp)
    80008320:	01010113          	addi	sp,sp,16
    80008324:	00008067          	ret

0000000080008328 <uartputc>:
    80008328:	00005797          	auipc	a5,0x5
    8000832c:	8c07a783          	lw	a5,-1856(a5) # 8000cbe8 <panicked>
    80008330:	00078463          	beqz	a5,80008338 <uartputc+0x10>
    80008334:	0000006f          	j	80008334 <uartputc+0xc>
    80008338:	fd010113          	addi	sp,sp,-48
    8000833c:	02813023          	sd	s0,32(sp)
    80008340:	00913c23          	sd	s1,24(sp)
    80008344:	01213823          	sd	s2,16(sp)
    80008348:	01313423          	sd	s3,8(sp)
    8000834c:	02113423          	sd	ra,40(sp)
    80008350:	03010413          	addi	s0,sp,48
    80008354:	00005917          	auipc	s2,0x5
    80008358:	89c90913          	addi	s2,s2,-1892 # 8000cbf0 <uart_tx_r>
    8000835c:	00093783          	ld	a5,0(s2)
    80008360:	00005497          	auipc	s1,0x5
    80008364:	89848493          	addi	s1,s1,-1896 # 8000cbf8 <uart_tx_w>
    80008368:	0004b703          	ld	a4,0(s1)
    8000836c:	02078693          	addi	a3,a5,32
    80008370:	00050993          	mv	s3,a0
    80008374:	02e69c63          	bne	a3,a4,800083ac <uartputc+0x84>
    80008378:	00001097          	auipc	ra,0x1
    8000837c:	834080e7          	jalr	-1996(ra) # 80008bac <push_on>
    80008380:	00093783          	ld	a5,0(s2)
    80008384:	0004b703          	ld	a4,0(s1)
    80008388:	02078793          	addi	a5,a5,32
    8000838c:	00e79463          	bne	a5,a4,80008394 <uartputc+0x6c>
    80008390:	0000006f          	j	80008390 <uartputc+0x68>
    80008394:	00001097          	auipc	ra,0x1
    80008398:	88c080e7          	jalr	-1908(ra) # 80008c20 <pop_on>
    8000839c:	00093783          	ld	a5,0(s2)
    800083a0:	0004b703          	ld	a4,0(s1)
    800083a4:	02078693          	addi	a3,a5,32
    800083a8:	fce688e3          	beq	a3,a4,80008378 <uartputc+0x50>
    800083ac:	01f77693          	andi	a3,a4,31
    800083b0:	00006597          	auipc	a1,0x6
    800083b4:	b8058593          	addi	a1,a1,-1152 # 8000df30 <uart_tx_buf>
    800083b8:	00d586b3          	add	a3,a1,a3
    800083bc:	00170713          	addi	a4,a4,1
    800083c0:	01368023          	sb	s3,0(a3)
    800083c4:	00e4b023          	sd	a4,0(s1)
    800083c8:	10000637          	lui	a2,0x10000
    800083cc:	02f71063          	bne	a4,a5,800083ec <uartputc+0xc4>
    800083d0:	0340006f          	j	80008404 <uartputc+0xdc>
    800083d4:	00074703          	lbu	a4,0(a4)
    800083d8:	00f93023          	sd	a5,0(s2)
    800083dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800083e0:	00093783          	ld	a5,0(s2)
    800083e4:	0004b703          	ld	a4,0(s1)
    800083e8:	00f70e63          	beq	a4,a5,80008404 <uartputc+0xdc>
    800083ec:	00564683          	lbu	a3,5(a2)
    800083f0:	01f7f713          	andi	a4,a5,31
    800083f4:	00e58733          	add	a4,a1,a4
    800083f8:	0206f693          	andi	a3,a3,32
    800083fc:	00178793          	addi	a5,a5,1
    80008400:	fc069ae3          	bnez	a3,800083d4 <uartputc+0xac>
    80008404:	02813083          	ld	ra,40(sp)
    80008408:	02013403          	ld	s0,32(sp)
    8000840c:	01813483          	ld	s1,24(sp)
    80008410:	01013903          	ld	s2,16(sp)
    80008414:	00813983          	ld	s3,8(sp)
    80008418:	03010113          	addi	sp,sp,48
    8000841c:	00008067          	ret

0000000080008420 <uartputc_sync>:
    80008420:	ff010113          	addi	sp,sp,-16
    80008424:	00813423          	sd	s0,8(sp)
    80008428:	01010413          	addi	s0,sp,16
    8000842c:	00004717          	auipc	a4,0x4
    80008430:	7bc72703          	lw	a4,1980(a4) # 8000cbe8 <panicked>
    80008434:	02071663          	bnez	a4,80008460 <uartputc_sync+0x40>
    80008438:	00050793          	mv	a5,a0
    8000843c:	100006b7          	lui	a3,0x10000
    80008440:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008444:	02077713          	andi	a4,a4,32
    80008448:	fe070ce3          	beqz	a4,80008440 <uartputc_sync+0x20>
    8000844c:	0ff7f793          	andi	a5,a5,255
    80008450:	00f68023          	sb	a5,0(a3)
    80008454:	00813403          	ld	s0,8(sp)
    80008458:	01010113          	addi	sp,sp,16
    8000845c:	00008067          	ret
    80008460:	0000006f          	j	80008460 <uartputc_sync+0x40>

0000000080008464 <uartstart>:
    80008464:	ff010113          	addi	sp,sp,-16
    80008468:	00813423          	sd	s0,8(sp)
    8000846c:	01010413          	addi	s0,sp,16
    80008470:	00004617          	auipc	a2,0x4
    80008474:	78060613          	addi	a2,a2,1920 # 8000cbf0 <uart_tx_r>
    80008478:	00004517          	auipc	a0,0x4
    8000847c:	78050513          	addi	a0,a0,1920 # 8000cbf8 <uart_tx_w>
    80008480:	00063783          	ld	a5,0(a2)
    80008484:	00053703          	ld	a4,0(a0)
    80008488:	04f70263          	beq	a4,a5,800084cc <uartstart+0x68>
    8000848c:	100005b7          	lui	a1,0x10000
    80008490:	00006817          	auipc	a6,0x6
    80008494:	aa080813          	addi	a6,a6,-1376 # 8000df30 <uart_tx_buf>
    80008498:	01c0006f          	j	800084b4 <uartstart+0x50>
    8000849c:	0006c703          	lbu	a4,0(a3)
    800084a0:	00f63023          	sd	a5,0(a2)
    800084a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800084a8:	00063783          	ld	a5,0(a2)
    800084ac:	00053703          	ld	a4,0(a0)
    800084b0:	00f70e63          	beq	a4,a5,800084cc <uartstart+0x68>
    800084b4:	01f7f713          	andi	a4,a5,31
    800084b8:	00e806b3          	add	a3,a6,a4
    800084bc:	0055c703          	lbu	a4,5(a1)
    800084c0:	00178793          	addi	a5,a5,1
    800084c4:	02077713          	andi	a4,a4,32
    800084c8:	fc071ae3          	bnez	a4,8000849c <uartstart+0x38>
    800084cc:	00813403          	ld	s0,8(sp)
    800084d0:	01010113          	addi	sp,sp,16
    800084d4:	00008067          	ret

00000000800084d8 <uartgetc>:
    800084d8:	ff010113          	addi	sp,sp,-16
    800084dc:	00813423          	sd	s0,8(sp)
    800084e0:	01010413          	addi	s0,sp,16
    800084e4:	10000737          	lui	a4,0x10000
    800084e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800084ec:	0017f793          	andi	a5,a5,1
    800084f0:	00078c63          	beqz	a5,80008508 <uartgetc+0x30>
    800084f4:	00074503          	lbu	a0,0(a4)
    800084f8:	0ff57513          	andi	a0,a0,255
    800084fc:	00813403          	ld	s0,8(sp)
    80008500:	01010113          	addi	sp,sp,16
    80008504:	00008067          	ret
    80008508:	fff00513          	li	a0,-1
    8000850c:	ff1ff06f          	j	800084fc <uartgetc+0x24>

0000000080008510 <uartintr>:
    80008510:	100007b7          	lui	a5,0x10000
    80008514:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008518:	0017f793          	andi	a5,a5,1
    8000851c:	0a078463          	beqz	a5,800085c4 <uartintr+0xb4>
    80008520:	fe010113          	addi	sp,sp,-32
    80008524:	00813823          	sd	s0,16(sp)
    80008528:	00913423          	sd	s1,8(sp)
    8000852c:	00113c23          	sd	ra,24(sp)
    80008530:	02010413          	addi	s0,sp,32
    80008534:	100004b7          	lui	s1,0x10000
    80008538:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000853c:	0ff57513          	andi	a0,a0,255
    80008540:	fffff097          	auipc	ra,0xfffff
    80008544:	534080e7          	jalr	1332(ra) # 80007a74 <consoleintr>
    80008548:	0054c783          	lbu	a5,5(s1)
    8000854c:	0017f793          	andi	a5,a5,1
    80008550:	fe0794e3          	bnez	a5,80008538 <uartintr+0x28>
    80008554:	00004617          	auipc	a2,0x4
    80008558:	69c60613          	addi	a2,a2,1692 # 8000cbf0 <uart_tx_r>
    8000855c:	00004517          	auipc	a0,0x4
    80008560:	69c50513          	addi	a0,a0,1692 # 8000cbf8 <uart_tx_w>
    80008564:	00063783          	ld	a5,0(a2)
    80008568:	00053703          	ld	a4,0(a0)
    8000856c:	04f70263          	beq	a4,a5,800085b0 <uartintr+0xa0>
    80008570:	100005b7          	lui	a1,0x10000
    80008574:	00006817          	auipc	a6,0x6
    80008578:	9bc80813          	addi	a6,a6,-1604 # 8000df30 <uart_tx_buf>
    8000857c:	01c0006f          	j	80008598 <uartintr+0x88>
    80008580:	0006c703          	lbu	a4,0(a3)
    80008584:	00f63023          	sd	a5,0(a2)
    80008588:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000858c:	00063783          	ld	a5,0(a2)
    80008590:	00053703          	ld	a4,0(a0)
    80008594:	00f70e63          	beq	a4,a5,800085b0 <uartintr+0xa0>
    80008598:	01f7f713          	andi	a4,a5,31
    8000859c:	00e806b3          	add	a3,a6,a4
    800085a0:	0055c703          	lbu	a4,5(a1)
    800085a4:	00178793          	addi	a5,a5,1
    800085a8:	02077713          	andi	a4,a4,32
    800085ac:	fc071ae3          	bnez	a4,80008580 <uartintr+0x70>
    800085b0:	01813083          	ld	ra,24(sp)
    800085b4:	01013403          	ld	s0,16(sp)
    800085b8:	00813483          	ld	s1,8(sp)
    800085bc:	02010113          	addi	sp,sp,32
    800085c0:	00008067          	ret
    800085c4:	00004617          	auipc	a2,0x4
    800085c8:	62c60613          	addi	a2,a2,1580 # 8000cbf0 <uart_tx_r>
    800085cc:	00004517          	auipc	a0,0x4
    800085d0:	62c50513          	addi	a0,a0,1580 # 8000cbf8 <uart_tx_w>
    800085d4:	00063783          	ld	a5,0(a2)
    800085d8:	00053703          	ld	a4,0(a0)
    800085dc:	04f70263          	beq	a4,a5,80008620 <uartintr+0x110>
    800085e0:	100005b7          	lui	a1,0x10000
    800085e4:	00006817          	auipc	a6,0x6
    800085e8:	94c80813          	addi	a6,a6,-1716 # 8000df30 <uart_tx_buf>
    800085ec:	01c0006f          	j	80008608 <uartintr+0xf8>
    800085f0:	0006c703          	lbu	a4,0(a3)
    800085f4:	00f63023          	sd	a5,0(a2)
    800085f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800085fc:	00063783          	ld	a5,0(a2)
    80008600:	00053703          	ld	a4,0(a0)
    80008604:	02f70063          	beq	a4,a5,80008624 <uartintr+0x114>
    80008608:	01f7f713          	andi	a4,a5,31
    8000860c:	00e806b3          	add	a3,a6,a4
    80008610:	0055c703          	lbu	a4,5(a1)
    80008614:	00178793          	addi	a5,a5,1
    80008618:	02077713          	andi	a4,a4,32
    8000861c:	fc071ae3          	bnez	a4,800085f0 <uartintr+0xe0>
    80008620:	00008067          	ret
    80008624:	00008067          	ret

0000000080008628 <kinit>:
    80008628:	fc010113          	addi	sp,sp,-64
    8000862c:	02913423          	sd	s1,40(sp)
    80008630:	fffff7b7          	lui	a5,0xfffff
    80008634:	00007497          	auipc	s1,0x7
    80008638:	91b48493          	addi	s1,s1,-1765 # 8000ef4f <end+0xfff>
    8000863c:	02813823          	sd	s0,48(sp)
    80008640:	01313c23          	sd	s3,24(sp)
    80008644:	00f4f4b3          	and	s1,s1,a5
    80008648:	02113c23          	sd	ra,56(sp)
    8000864c:	03213023          	sd	s2,32(sp)
    80008650:	01413823          	sd	s4,16(sp)
    80008654:	01513423          	sd	s5,8(sp)
    80008658:	04010413          	addi	s0,sp,64
    8000865c:	000017b7          	lui	a5,0x1
    80008660:	01100993          	li	s3,17
    80008664:	00f487b3          	add	a5,s1,a5
    80008668:	01b99993          	slli	s3,s3,0x1b
    8000866c:	06f9e063          	bltu	s3,a5,800086cc <kinit+0xa4>
    80008670:	00006a97          	auipc	s5,0x6
    80008674:	8e0a8a93          	addi	s5,s5,-1824 # 8000df50 <end>
    80008678:	0754ec63          	bltu	s1,s5,800086f0 <kinit+0xc8>
    8000867c:	0734fa63          	bgeu	s1,s3,800086f0 <kinit+0xc8>
    80008680:	00088a37          	lui	s4,0x88
    80008684:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008688:	00004917          	auipc	s2,0x4
    8000868c:	57890913          	addi	s2,s2,1400 # 8000cc00 <kmem>
    80008690:	00ca1a13          	slli	s4,s4,0xc
    80008694:	0140006f          	j	800086a8 <kinit+0x80>
    80008698:	000017b7          	lui	a5,0x1
    8000869c:	00f484b3          	add	s1,s1,a5
    800086a0:	0554e863          	bltu	s1,s5,800086f0 <kinit+0xc8>
    800086a4:	0534f663          	bgeu	s1,s3,800086f0 <kinit+0xc8>
    800086a8:	00001637          	lui	a2,0x1
    800086ac:	00100593          	li	a1,1
    800086b0:	00048513          	mv	a0,s1
    800086b4:	00000097          	auipc	ra,0x0
    800086b8:	5e4080e7          	jalr	1508(ra) # 80008c98 <__memset>
    800086bc:	00093783          	ld	a5,0(s2)
    800086c0:	00f4b023          	sd	a5,0(s1)
    800086c4:	00993023          	sd	s1,0(s2)
    800086c8:	fd4498e3          	bne	s1,s4,80008698 <kinit+0x70>
    800086cc:	03813083          	ld	ra,56(sp)
    800086d0:	03013403          	ld	s0,48(sp)
    800086d4:	02813483          	ld	s1,40(sp)
    800086d8:	02013903          	ld	s2,32(sp)
    800086dc:	01813983          	ld	s3,24(sp)
    800086e0:	01013a03          	ld	s4,16(sp)
    800086e4:	00813a83          	ld	s5,8(sp)
    800086e8:	04010113          	addi	sp,sp,64
    800086ec:	00008067          	ret
    800086f0:	00002517          	auipc	a0,0x2
    800086f4:	0a050513          	addi	a0,a0,160 # 8000a790 <digits+0x18>
    800086f8:	fffff097          	auipc	ra,0xfffff
    800086fc:	4b4080e7          	jalr	1204(ra) # 80007bac <panic>

0000000080008700 <freerange>:
    80008700:	fc010113          	addi	sp,sp,-64
    80008704:	000017b7          	lui	a5,0x1
    80008708:	02913423          	sd	s1,40(sp)
    8000870c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008710:	009504b3          	add	s1,a0,s1
    80008714:	fffff537          	lui	a0,0xfffff
    80008718:	02813823          	sd	s0,48(sp)
    8000871c:	02113c23          	sd	ra,56(sp)
    80008720:	03213023          	sd	s2,32(sp)
    80008724:	01313c23          	sd	s3,24(sp)
    80008728:	01413823          	sd	s4,16(sp)
    8000872c:	01513423          	sd	s5,8(sp)
    80008730:	01613023          	sd	s6,0(sp)
    80008734:	04010413          	addi	s0,sp,64
    80008738:	00a4f4b3          	and	s1,s1,a0
    8000873c:	00f487b3          	add	a5,s1,a5
    80008740:	06f5e463          	bltu	a1,a5,800087a8 <freerange+0xa8>
    80008744:	00006a97          	auipc	s5,0x6
    80008748:	80ca8a93          	addi	s5,s5,-2036 # 8000df50 <end>
    8000874c:	0954e263          	bltu	s1,s5,800087d0 <freerange+0xd0>
    80008750:	01100993          	li	s3,17
    80008754:	01b99993          	slli	s3,s3,0x1b
    80008758:	0734fc63          	bgeu	s1,s3,800087d0 <freerange+0xd0>
    8000875c:	00058a13          	mv	s4,a1
    80008760:	00004917          	auipc	s2,0x4
    80008764:	4a090913          	addi	s2,s2,1184 # 8000cc00 <kmem>
    80008768:	00002b37          	lui	s6,0x2
    8000876c:	0140006f          	j	80008780 <freerange+0x80>
    80008770:	000017b7          	lui	a5,0x1
    80008774:	00f484b3          	add	s1,s1,a5
    80008778:	0554ec63          	bltu	s1,s5,800087d0 <freerange+0xd0>
    8000877c:	0534fa63          	bgeu	s1,s3,800087d0 <freerange+0xd0>
    80008780:	00001637          	lui	a2,0x1
    80008784:	00100593          	li	a1,1
    80008788:	00048513          	mv	a0,s1
    8000878c:	00000097          	auipc	ra,0x0
    80008790:	50c080e7          	jalr	1292(ra) # 80008c98 <__memset>
    80008794:	00093703          	ld	a4,0(s2)
    80008798:	016487b3          	add	a5,s1,s6
    8000879c:	00e4b023          	sd	a4,0(s1)
    800087a0:	00993023          	sd	s1,0(s2)
    800087a4:	fcfa76e3          	bgeu	s4,a5,80008770 <freerange+0x70>
    800087a8:	03813083          	ld	ra,56(sp)
    800087ac:	03013403          	ld	s0,48(sp)
    800087b0:	02813483          	ld	s1,40(sp)
    800087b4:	02013903          	ld	s2,32(sp)
    800087b8:	01813983          	ld	s3,24(sp)
    800087bc:	01013a03          	ld	s4,16(sp)
    800087c0:	00813a83          	ld	s5,8(sp)
    800087c4:	00013b03          	ld	s6,0(sp)
    800087c8:	04010113          	addi	sp,sp,64
    800087cc:	00008067          	ret
    800087d0:	00002517          	auipc	a0,0x2
    800087d4:	fc050513          	addi	a0,a0,-64 # 8000a790 <digits+0x18>
    800087d8:	fffff097          	auipc	ra,0xfffff
    800087dc:	3d4080e7          	jalr	980(ra) # 80007bac <panic>

00000000800087e0 <kfree>:
    800087e0:	fe010113          	addi	sp,sp,-32
    800087e4:	00813823          	sd	s0,16(sp)
    800087e8:	00113c23          	sd	ra,24(sp)
    800087ec:	00913423          	sd	s1,8(sp)
    800087f0:	02010413          	addi	s0,sp,32
    800087f4:	03451793          	slli	a5,a0,0x34
    800087f8:	04079c63          	bnez	a5,80008850 <kfree+0x70>
    800087fc:	00005797          	auipc	a5,0x5
    80008800:	75478793          	addi	a5,a5,1876 # 8000df50 <end>
    80008804:	00050493          	mv	s1,a0
    80008808:	04f56463          	bltu	a0,a5,80008850 <kfree+0x70>
    8000880c:	01100793          	li	a5,17
    80008810:	01b79793          	slli	a5,a5,0x1b
    80008814:	02f57e63          	bgeu	a0,a5,80008850 <kfree+0x70>
    80008818:	00001637          	lui	a2,0x1
    8000881c:	00100593          	li	a1,1
    80008820:	00000097          	auipc	ra,0x0
    80008824:	478080e7          	jalr	1144(ra) # 80008c98 <__memset>
    80008828:	00004797          	auipc	a5,0x4
    8000882c:	3d878793          	addi	a5,a5,984 # 8000cc00 <kmem>
    80008830:	0007b703          	ld	a4,0(a5)
    80008834:	01813083          	ld	ra,24(sp)
    80008838:	01013403          	ld	s0,16(sp)
    8000883c:	00e4b023          	sd	a4,0(s1)
    80008840:	0097b023          	sd	s1,0(a5)
    80008844:	00813483          	ld	s1,8(sp)
    80008848:	02010113          	addi	sp,sp,32
    8000884c:	00008067          	ret
    80008850:	00002517          	auipc	a0,0x2
    80008854:	f4050513          	addi	a0,a0,-192 # 8000a790 <digits+0x18>
    80008858:	fffff097          	auipc	ra,0xfffff
    8000885c:	354080e7          	jalr	852(ra) # 80007bac <panic>

0000000080008860 <kalloc>:
    80008860:	fe010113          	addi	sp,sp,-32
    80008864:	00813823          	sd	s0,16(sp)
    80008868:	00913423          	sd	s1,8(sp)
    8000886c:	00113c23          	sd	ra,24(sp)
    80008870:	02010413          	addi	s0,sp,32
    80008874:	00004797          	auipc	a5,0x4
    80008878:	38c78793          	addi	a5,a5,908 # 8000cc00 <kmem>
    8000887c:	0007b483          	ld	s1,0(a5)
    80008880:	02048063          	beqz	s1,800088a0 <kalloc+0x40>
    80008884:	0004b703          	ld	a4,0(s1)
    80008888:	00001637          	lui	a2,0x1
    8000888c:	00500593          	li	a1,5
    80008890:	00048513          	mv	a0,s1
    80008894:	00e7b023          	sd	a4,0(a5)
    80008898:	00000097          	auipc	ra,0x0
    8000889c:	400080e7          	jalr	1024(ra) # 80008c98 <__memset>
    800088a0:	01813083          	ld	ra,24(sp)
    800088a4:	01013403          	ld	s0,16(sp)
    800088a8:	00048513          	mv	a0,s1
    800088ac:	00813483          	ld	s1,8(sp)
    800088b0:	02010113          	addi	sp,sp,32
    800088b4:	00008067          	ret

00000000800088b8 <initlock>:
    800088b8:	ff010113          	addi	sp,sp,-16
    800088bc:	00813423          	sd	s0,8(sp)
    800088c0:	01010413          	addi	s0,sp,16
    800088c4:	00813403          	ld	s0,8(sp)
    800088c8:	00b53423          	sd	a1,8(a0)
    800088cc:	00052023          	sw	zero,0(a0)
    800088d0:	00053823          	sd	zero,16(a0)
    800088d4:	01010113          	addi	sp,sp,16
    800088d8:	00008067          	ret

00000000800088dc <acquire>:
    800088dc:	fe010113          	addi	sp,sp,-32
    800088e0:	00813823          	sd	s0,16(sp)
    800088e4:	00913423          	sd	s1,8(sp)
    800088e8:	00113c23          	sd	ra,24(sp)
    800088ec:	01213023          	sd	s2,0(sp)
    800088f0:	02010413          	addi	s0,sp,32
    800088f4:	00050493          	mv	s1,a0
    800088f8:	10002973          	csrr	s2,sstatus
    800088fc:	100027f3          	csrr	a5,sstatus
    80008900:	ffd7f793          	andi	a5,a5,-3
    80008904:	10079073          	csrw	sstatus,a5
    80008908:	fffff097          	auipc	ra,0xfffff
    8000890c:	8e8080e7          	jalr	-1816(ra) # 800071f0 <mycpu>
    80008910:	07852783          	lw	a5,120(a0)
    80008914:	06078e63          	beqz	a5,80008990 <acquire+0xb4>
    80008918:	fffff097          	auipc	ra,0xfffff
    8000891c:	8d8080e7          	jalr	-1832(ra) # 800071f0 <mycpu>
    80008920:	07852783          	lw	a5,120(a0)
    80008924:	0004a703          	lw	a4,0(s1)
    80008928:	0017879b          	addiw	a5,a5,1
    8000892c:	06f52c23          	sw	a5,120(a0)
    80008930:	04071063          	bnez	a4,80008970 <acquire+0x94>
    80008934:	00100713          	li	a4,1
    80008938:	00070793          	mv	a5,a4
    8000893c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008940:	0007879b          	sext.w	a5,a5
    80008944:	fe079ae3          	bnez	a5,80008938 <acquire+0x5c>
    80008948:	0ff0000f          	fence
    8000894c:	fffff097          	auipc	ra,0xfffff
    80008950:	8a4080e7          	jalr	-1884(ra) # 800071f0 <mycpu>
    80008954:	01813083          	ld	ra,24(sp)
    80008958:	01013403          	ld	s0,16(sp)
    8000895c:	00a4b823          	sd	a0,16(s1)
    80008960:	00013903          	ld	s2,0(sp)
    80008964:	00813483          	ld	s1,8(sp)
    80008968:	02010113          	addi	sp,sp,32
    8000896c:	00008067          	ret
    80008970:	0104b903          	ld	s2,16(s1)
    80008974:	fffff097          	auipc	ra,0xfffff
    80008978:	87c080e7          	jalr	-1924(ra) # 800071f0 <mycpu>
    8000897c:	faa91ce3          	bne	s2,a0,80008934 <acquire+0x58>
    80008980:	00002517          	auipc	a0,0x2
    80008984:	e1850513          	addi	a0,a0,-488 # 8000a798 <digits+0x20>
    80008988:	fffff097          	auipc	ra,0xfffff
    8000898c:	224080e7          	jalr	548(ra) # 80007bac <panic>
    80008990:	00195913          	srli	s2,s2,0x1
    80008994:	fffff097          	auipc	ra,0xfffff
    80008998:	85c080e7          	jalr	-1956(ra) # 800071f0 <mycpu>
    8000899c:	00197913          	andi	s2,s2,1
    800089a0:	07252e23          	sw	s2,124(a0)
    800089a4:	f75ff06f          	j	80008918 <acquire+0x3c>

00000000800089a8 <release>:
    800089a8:	fe010113          	addi	sp,sp,-32
    800089ac:	00813823          	sd	s0,16(sp)
    800089b0:	00113c23          	sd	ra,24(sp)
    800089b4:	00913423          	sd	s1,8(sp)
    800089b8:	01213023          	sd	s2,0(sp)
    800089bc:	02010413          	addi	s0,sp,32
    800089c0:	00052783          	lw	a5,0(a0)
    800089c4:	00079a63          	bnez	a5,800089d8 <release+0x30>
    800089c8:	00002517          	auipc	a0,0x2
    800089cc:	dd850513          	addi	a0,a0,-552 # 8000a7a0 <digits+0x28>
    800089d0:	fffff097          	auipc	ra,0xfffff
    800089d4:	1dc080e7          	jalr	476(ra) # 80007bac <panic>
    800089d8:	01053903          	ld	s2,16(a0)
    800089dc:	00050493          	mv	s1,a0
    800089e0:	fffff097          	auipc	ra,0xfffff
    800089e4:	810080e7          	jalr	-2032(ra) # 800071f0 <mycpu>
    800089e8:	fea910e3          	bne	s2,a0,800089c8 <release+0x20>
    800089ec:	0004b823          	sd	zero,16(s1)
    800089f0:	0ff0000f          	fence
    800089f4:	0f50000f          	fence	iorw,ow
    800089f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800089fc:	ffffe097          	auipc	ra,0xffffe
    80008a00:	7f4080e7          	jalr	2036(ra) # 800071f0 <mycpu>
    80008a04:	100027f3          	csrr	a5,sstatus
    80008a08:	0027f793          	andi	a5,a5,2
    80008a0c:	04079a63          	bnez	a5,80008a60 <release+0xb8>
    80008a10:	07852783          	lw	a5,120(a0)
    80008a14:	02f05e63          	blez	a5,80008a50 <release+0xa8>
    80008a18:	fff7871b          	addiw	a4,a5,-1
    80008a1c:	06e52c23          	sw	a4,120(a0)
    80008a20:	00071c63          	bnez	a4,80008a38 <release+0x90>
    80008a24:	07c52783          	lw	a5,124(a0)
    80008a28:	00078863          	beqz	a5,80008a38 <release+0x90>
    80008a2c:	100027f3          	csrr	a5,sstatus
    80008a30:	0027e793          	ori	a5,a5,2
    80008a34:	10079073          	csrw	sstatus,a5
    80008a38:	01813083          	ld	ra,24(sp)
    80008a3c:	01013403          	ld	s0,16(sp)
    80008a40:	00813483          	ld	s1,8(sp)
    80008a44:	00013903          	ld	s2,0(sp)
    80008a48:	02010113          	addi	sp,sp,32
    80008a4c:	00008067          	ret
    80008a50:	00002517          	auipc	a0,0x2
    80008a54:	d7050513          	addi	a0,a0,-656 # 8000a7c0 <digits+0x48>
    80008a58:	fffff097          	auipc	ra,0xfffff
    80008a5c:	154080e7          	jalr	340(ra) # 80007bac <panic>
    80008a60:	00002517          	auipc	a0,0x2
    80008a64:	d4850513          	addi	a0,a0,-696 # 8000a7a8 <digits+0x30>
    80008a68:	fffff097          	auipc	ra,0xfffff
    80008a6c:	144080e7          	jalr	324(ra) # 80007bac <panic>

0000000080008a70 <holding>:
    80008a70:	00052783          	lw	a5,0(a0)
    80008a74:	00079663          	bnez	a5,80008a80 <holding+0x10>
    80008a78:	00000513          	li	a0,0
    80008a7c:	00008067          	ret
    80008a80:	fe010113          	addi	sp,sp,-32
    80008a84:	00813823          	sd	s0,16(sp)
    80008a88:	00913423          	sd	s1,8(sp)
    80008a8c:	00113c23          	sd	ra,24(sp)
    80008a90:	02010413          	addi	s0,sp,32
    80008a94:	01053483          	ld	s1,16(a0)
    80008a98:	ffffe097          	auipc	ra,0xffffe
    80008a9c:	758080e7          	jalr	1880(ra) # 800071f0 <mycpu>
    80008aa0:	01813083          	ld	ra,24(sp)
    80008aa4:	01013403          	ld	s0,16(sp)
    80008aa8:	40a48533          	sub	a0,s1,a0
    80008aac:	00153513          	seqz	a0,a0
    80008ab0:	00813483          	ld	s1,8(sp)
    80008ab4:	02010113          	addi	sp,sp,32
    80008ab8:	00008067          	ret

0000000080008abc <push_off>:
    80008abc:	fe010113          	addi	sp,sp,-32
    80008ac0:	00813823          	sd	s0,16(sp)
    80008ac4:	00113c23          	sd	ra,24(sp)
    80008ac8:	00913423          	sd	s1,8(sp)
    80008acc:	02010413          	addi	s0,sp,32
    80008ad0:	100024f3          	csrr	s1,sstatus
    80008ad4:	100027f3          	csrr	a5,sstatus
    80008ad8:	ffd7f793          	andi	a5,a5,-3
    80008adc:	10079073          	csrw	sstatus,a5
    80008ae0:	ffffe097          	auipc	ra,0xffffe
    80008ae4:	710080e7          	jalr	1808(ra) # 800071f0 <mycpu>
    80008ae8:	07852783          	lw	a5,120(a0)
    80008aec:	02078663          	beqz	a5,80008b18 <push_off+0x5c>
    80008af0:	ffffe097          	auipc	ra,0xffffe
    80008af4:	700080e7          	jalr	1792(ra) # 800071f0 <mycpu>
    80008af8:	07852783          	lw	a5,120(a0)
    80008afc:	01813083          	ld	ra,24(sp)
    80008b00:	01013403          	ld	s0,16(sp)
    80008b04:	0017879b          	addiw	a5,a5,1
    80008b08:	06f52c23          	sw	a5,120(a0)
    80008b0c:	00813483          	ld	s1,8(sp)
    80008b10:	02010113          	addi	sp,sp,32
    80008b14:	00008067          	ret
    80008b18:	0014d493          	srli	s1,s1,0x1
    80008b1c:	ffffe097          	auipc	ra,0xffffe
    80008b20:	6d4080e7          	jalr	1748(ra) # 800071f0 <mycpu>
    80008b24:	0014f493          	andi	s1,s1,1
    80008b28:	06952e23          	sw	s1,124(a0)
    80008b2c:	fc5ff06f          	j	80008af0 <push_off+0x34>

0000000080008b30 <pop_off>:
    80008b30:	ff010113          	addi	sp,sp,-16
    80008b34:	00813023          	sd	s0,0(sp)
    80008b38:	00113423          	sd	ra,8(sp)
    80008b3c:	01010413          	addi	s0,sp,16
    80008b40:	ffffe097          	auipc	ra,0xffffe
    80008b44:	6b0080e7          	jalr	1712(ra) # 800071f0 <mycpu>
    80008b48:	100027f3          	csrr	a5,sstatus
    80008b4c:	0027f793          	andi	a5,a5,2
    80008b50:	04079663          	bnez	a5,80008b9c <pop_off+0x6c>
    80008b54:	07852783          	lw	a5,120(a0)
    80008b58:	02f05a63          	blez	a5,80008b8c <pop_off+0x5c>
    80008b5c:	fff7871b          	addiw	a4,a5,-1
    80008b60:	06e52c23          	sw	a4,120(a0)
    80008b64:	00071c63          	bnez	a4,80008b7c <pop_off+0x4c>
    80008b68:	07c52783          	lw	a5,124(a0)
    80008b6c:	00078863          	beqz	a5,80008b7c <pop_off+0x4c>
    80008b70:	100027f3          	csrr	a5,sstatus
    80008b74:	0027e793          	ori	a5,a5,2
    80008b78:	10079073          	csrw	sstatus,a5
    80008b7c:	00813083          	ld	ra,8(sp)
    80008b80:	00013403          	ld	s0,0(sp)
    80008b84:	01010113          	addi	sp,sp,16
    80008b88:	00008067          	ret
    80008b8c:	00002517          	auipc	a0,0x2
    80008b90:	c3450513          	addi	a0,a0,-972 # 8000a7c0 <digits+0x48>
    80008b94:	fffff097          	auipc	ra,0xfffff
    80008b98:	018080e7          	jalr	24(ra) # 80007bac <panic>
    80008b9c:	00002517          	auipc	a0,0x2
    80008ba0:	c0c50513          	addi	a0,a0,-1012 # 8000a7a8 <digits+0x30>
    80008ba4:	fffff097          	auipc	ra,0xfffff
    80008ba8:	008080e7          	jalr	8(ra) # 80007bac <panic>

0000000080008bac <push_on>:
    80008bac:	fe010113          	addi	sp,sp,-32
    80008bb0:	00813823          	sd	s0,16(sp)
    80008bb4:	00113c23          	sd	ra,24(sp)
    80008bb8:	00913423          	sd	s1,8(sp)
    80008bbc:	02010413          	addi	s0,sp,32
    80008bc0:	100024f3          	csrr	s1,sstatus
    80008bc4:	100027f3          	csrr	a5,sstatus
    80008bc8:	0027e793          	ori	a5,a5,2
    80008bcc:	10079073          	csrw	sstatus,a5
    80008bd0:	ffffe097          	auipc	ra,0xffffe
    80008bd4:	620080e7          	jalr	1568(ra) # 800071f0 <mycpu>
    80008bd8:	07852783          	lw	a5,120(a0)
    80008bdc:	02078663          	beqz	a5,80008c08 <push_on+0x5c>
    80008be0:	ffffe097          	auipc	ra,0xffffe
    80008be4:	610080e7          	jalr	1552(ra) # 800071f0 <mycpu>
    80008be8:	07852783          	lw	a5,120(a0)
    80008bec:	01813083          	ld	ra,24(sp)
    80008bf0:	01013403          	ld	s0,16(sp)
    80008bf4:	0017879b          	addiw	a5,a5,1
    80008bf8:	06f52c23          	sw	a5,120(a0)
    80008bfc:	00813483          	ld	s1,8(sp)
    80008c00:	02010113          	addi	sp,sp,32
    80008c04:	00008067          	ret
    80008c08:	0014d493          	srli	s1,s1,0x1
    80008c0c:	ffffe097          	auipc	ra,0xffffe
    80008c10:	5e4080e7          	jalr	1508(ra) # 800071f0 <mycpu>
    80008c14:	0014f493          	andi	s1,s1,1
    80008c18:	06952e23          	sw	s1,124(a0)
    80008c1c:	fc5ff06f          	j	80008be0 <push_on+0x34>

0000000080008c20 <pop_on>:
    80008c20:	ff010113          	addi	sp,sp,-16
    80008c24:	00813023          	sd	s0,0(sp)
    80008c28:	00113423          	sd	ra,8(sp)
    80008c2c:	01010413          	addi	s0,sp,16
    80008c30:	ffffe097          	auipc	ra,0xffffe
    80008c34:	5c0080e7          	jalr	1472(ra) # 800071f0 <mycpu>
    80008c38:	100027f3          	csrr	a5,sstatus
    80008c3c:	0027f793          	andi	a5,a5,2
    80008c40:	04078463          	beqz	a5,80008c88 <pop_on+0x68>
    80008c44:	07852783          	lw	a5,120(a0)
    80008c48:	02f05863          	blez	a5,80008c78 <pop_on+0x58>
    80008c4c:	fff7879b          	addiw	a5,a5,-1
    80008c50:	06f52c23          	sw	a5,120(a0)
    80008c54:	07853783          	ld	a5,120(a0)
    80008c58:	00079863          	bnez	a5,80008c68 <pop_on+0x48>
    80008c5c:	100027f3          	csrr	a5,sstatus
    80008c60:	ffd7f793          	andi	a5,a5,-3
    80008c64:	10079073          	csrw	sstatus,a5
    80008c68:	00813083          	ld	ra,8(sp)
    80008c6c:	00013403          	ld	s0,0(sp)
    80008c70:	01010113          	addi	sp,sp,16
    80008c74:	00008067          	ret
    80008c78:	00002517          	auipc	a0,0x2
    80008c7c:	b7050513          	addi	a0,a0,-1168 # 8000a7e8 <digits+0x70>
    80008c80:	fffff097          	auipc	ra,0xfffff
    80008c84:	f2c080e7          	jalr	-212(ra) # 80007bac <panic>
    80008c88:	00002517          	auipc	a0,0x2
    80008c8c:	b4050513          	addi	a0,a0,-1216 # 8000a7c8 <digits+0x50>
    80008c90:	fffff097          	auipc	ra,0xfffff
    80008c94:	f1c080e7          	jalr	-228(ra) # 80007bac <panic>

0000000080008c98 <__memset>:
    80008c98:	ff010113          	addi	sp,sp,-16
    80008c9c:	00813423          	sd	s0,8(sp)
    80008ca0:	01010413          	addi	s0,sp,16
    80008ca4:	1a060e63          	beqz	a2,80008e60 <__memset+0x1c8>
    80008ca8:	40a007b3          	neg	a5,a0
    80008cac:	0077f793          	andi	a5,a5,7
    80008cb0:	00778693          	addi	a3,a5,7
    80008cb4:	00b00813          	li	a6,11
    80008cb8:	0ff5f593          	andi	a1,a1,255
    80008cbc:	fff6071b          	addiw	a4,a2,-1
    80008cc0:	1b06e663          	bltu	a3,a6,80008e6c <__memset+0x1d4>
    80008cc4:	1cd76463          	bltu	a4,a3,80008e8c <__memset+0x1f4>
    80008cc8:	1a078e63          	beqz	a5,80008e84 <__memset+0x1ec>
    80008ccc:	00b50023          	sb	a1,0(a0)
    80008cd0:	00100713          	li	a4,1
    80008cd4:	1ae78463          	beq	a5,a4,80008e7c <__memset+0x1e4>
    80008cd8:	00b500a3          	sb	a1,1(a0)
    80008cdc:	00200713          	li	a4,2
    80008ce0:	1ae78a63          	beq	a5,a4,80008e94 <__memset+0x1fc>
    80008ce4:	00b50123          	sb	a1,2(a0)
    80008ce8:	00300713          	li	a4,3
    80008cec:	18e78463          	beq	a5,a4,80008e74 <__memset+0x1dc>
    80008cf0:	00b501a3          	sb	a1,3(a0)
    80008cf4:	00400713          	li	a4,4
    80008cf8:	1ae78263          	beq	a5,a4,80008e9c <__memset+0x204>
    80008cfc:	00b50223          	sb	a1,4(a0)
    80008d00:	00500713          	li	a4,5
    80008d04:	1ae78063          	beq	a5,a4,80008ea4 <__memset+0x20c>
    80008d08:	00b502a3          	sb	a1,5(a0)
    80008d0c:	00700713          	li	a4,7
    80008d10:	18e79e63          	bne	a5,a4,80008eac <__memset+0x214>
    80008d14:	00b50323          	sb	a1,6(a0)
    80008d18:	00700e93          	li	t4,7
    80008d1c:	00859713          	slli	a4,a1,0x8
    80008d20:	00e5e733          	or	a4,a1,a4
    80008d24:	01059e13          	slli	t3,a1,0x10
    80008d28:	01c76e33          	or	t3,a4,t3
    80008d2c:	01859313          	slli	t1,a1,0x18
    80008d30:	006e6333          	or	t1,t3,t1
    80008d34:	02059893          	slli	a7,a1,0x20
    80008d38:	40f60e3b          	subw	t3,a2,a5
    80008d3c:	011368b3          	or	a7,t1,a7
    80008d40:	02859813          	slli	a6,a1,0x28
    80008d44:	0108e833          	or	a6,a7,a6
    80008d48:	03059693          	slli	a3,a1,0x30
    80008d4c:	003e589b          	srliw	a7,t3,0x3
    80008d50:	00d866b3          	or	a3,a6,a3
    80008d54:	03859713          	slli	a4,a1,0x38
    80008d58:	00389813          	slli	a6,a7,0x3
    80008d5c:	00f507b3          	add	a5,a0,a5
    80008d60:	00e6e733          	or	a4,a3,a4
    80008d64:	000e089b          	sext.w	a7,t3
    80008d68:	00f806b3          	add	a3,a6,a5
    80008d6c:	00e7b023          	sd	a4,0(a5)
    80008d70:	00878793          	addi	a5,a5,8
    80008d74:	fed79ce3          	bne	a5,a3,80008d6c <__memset+0xd4>
    80008d78:	ff8e7793          	andi	a5,t3,-8
    80008d7c:	0007871b          	sext.w	a4,a5
    80008d80:	01d787bb          	addw	a5,a5,t4
    80008d84:	0ce88e63          	beq	a7,a4,80008e60 <__memset+0x1c8>
    80008d88:	00f50733          	add	a4,a0,a5
    80008d8c:	00b70023          	sb	a1,0(a4)
    80008d90:	0017871b          	addiw	a4,a5,1
    80008d94:	0cc77663          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008d98:	00e50733          	add	a4,a0,a4
    80008d9c:	00b70023          	sb	a1,0(a4)
    80008da0:	0027871b          	addiw	a4,a5,2
    80008da4:	0ac77e63          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008da8:	00e50733          	add	a4,a0,a4
    80008dac:	00b70023          	sb	a1,0(a4)
    80008db0:	0037871b          	addiw	a4,a5,3
    80008db4:	0ac77663          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008db8:	00e50733          	add	a4,a0,a4
    80008dbc:	00b70023          	sb	a1,0(a4)
    80008dc0:	0047871b          	addiw	a4,a5,4
    80008dc4:	08c77e63          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008dc8:	00e50733          	add	a4,a0,a4
    80008dcc:	00b70023          	sb	a1,0(a4)
    80008dd0:	0057871b          	addiw	a4,a5,5
    80008dd4:	08c77663          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008dd8:	00e50733          	add	a4,a0,a4
    80008ddc:	00b70023          	sb	a1,0(a4)
    80008de0:	0067871b          	addiw	a4,a5,6
    80008de4:	06c77e63          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008de8:	00e50733          	add	a4,a0,a4
    80008dec:	00b70023          	sb	a1,0(a4)
    80008df0:	0077871b          	addiw	a4,a5,7
    80008df4:	06c77663          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008df8:	00e50733          	add	a4,a0,a4
    80008dfc:	00b70023          	sb	a1,0(a4)
    80008e00:	0087871b          	addiw	a4,a5,8
    80008e04:	04c77e63          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008e08:	00e50733          	add	a4,a0,a4
    80008e0c:	00b70023          	sb	a1,0(a4)
    80008e10:	0097871b          	addiw	a4,a5,9
    80008e14:	04c77663          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008e18:	00e50733          	add	a4,a0,a4
    80008e1c:	00b70023          	sb	a1,0(a4)
    80008e20:	00a7871b          	addiw	a4,a5,10
    80008e24:	02c77e63          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008e28:	00e50733          	add	a4,a0,a4
    80008e2c:	00b70023          	sb	a1,0(a4)
    80008e30:	00b7871b          	addiw	a4,a5,11
    80008e34:	02c77663          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008e38:	00e50733          	add	a4,a0,a4
    80008e3c:	00b70023          	sb	a1,0(a4)
    80008e40:	00c7871b          	addiw	a4,a5,12
    80008e44:	00c77e63          	bgeu	a4,a2,80008e60 <__memset+0x1c8>
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00b70023          	sb	a1,0(a4)
    80008e50:	00d7879b          	addiw	a5,a5,13
    80008e54:	00c7f663          	bgeu	a5,a2,80008e60 <__memset+0x1c8>
    80008e58:	00f507b3          	add	a5,a0,a5
    80008e5c:	00b78023          	sb	a1,0(a5)
    80008e60:	00813403          	ld	s0,8(sp)
    80008e64:	01010113          	addi	sp,sp,16
    80008e68:	00008067          	ret
    80008e6c:	00b00693          	li	a3,11
    80008e70:	e55ff06f          	j	80008cc4 <__memset+0x2c>
    80008e74:	00300e93          	li	t4,3
    80008e78:	ea5ff06f          	j	80008d1c <__memset+0x84>
    80008e7c:	00100e93          	li	t4,1
    80008e80:	e9dff06f          	j	80008d1c <__memset+0x84>
    80008e84:	00000e93          	li	t4,0
    80008e88:	e95ff06f          	j	80008d1c <__memset+0x84>
    80008e8c:	00000793          	li	a5,0
    80008e90:	ef9ff06f          	j	80008d88 <__memset+0xf0>
    80008e94:	00200e93          	li	t4,2
    80008e98:	e85ff06f          	j	80008d1c <__memset+0x84>
    80008e9c:	00400e93          	li	t4,4
    80008ea0:	e7dff06f          	j	80008d1c <__memset+0x84>
    80008ea4:	00500e93          	li	t4,5
    80008ea8:	e75ff06f          	j	80008d1c <__memset+0x84>
    80008eac:	00600e93          	li	t4,6
    80008eb0:	e6dff06f          	j	80008d1c <__memset+0x84>

0000000080008eb4 <__memmove>:
    80008eb4:	ff010113          	addi	sp,sp,-16
    80008eb8:	00813423          	sd	s0,8(sp)
    80008ebc:	01010413          	addi	s0,sp,16
    80008ec0:	0e060863          	beqz	a2,80008fb0 <__memmove+0xfc>
    80008ec4:	fff6069b          	addiw	a3,a2,-1
    80008ec8:	0006881b          	sext.w	a6,a3
    80008ecc:	0ea5e863          	bltu	a1,a0,80008fbc <__memmove+0x108>
    80008ed0:	00758713          	addi	a4,a1,7
    80008ed4:	00a5e7b3          	or	a5,a1,a0
    80008ed8:	40a70733          	sub	a4,a4,a0
    80008edc:	0077f793          	andi	a5,a5,7
    80008ee0:	00f73713          	sltiu	a4,a4,15
    80008ee4:	00174713          	xori	a4,a4,1
    80008ee8:	0017b793          	seqz	a5,a5
    80008eec:	00e7f7b3          	and	a5,a5,a4
    80008ef0:	10078863          	beqz	a5,80009000 <__memmove+0x14c>
    80008ef4:	00900793          	li	a5,9
    80008ef8:	1107f463          	bgeu	a5,a6,80009000 <__memmove+0x14c>
    80008efc:	0036581b          	srliw	a6,a2,0x3
    80008f00:	fff8081b          	addiw	a6,a6,-1
    80008f04:	02081813          	slli	a6,a6,0x20
    80008f08:	01d85893          	srli	a7,a6,0x1d
    80008f0c:	00858813          	addi	a6,a1,8
    80008f10:	00058793          	mv	a5,a1
    80008f14:	00050713          	mv	a4,a0
    80008f18:	01088833          	add	a6,a7,a6
    80008f1c:	0007b883          	ld	a7,0(a5)
    80008f20:	00878793          	addi	a5,a5,8
    80008f24:	00870713          	addi	a4,a4,8
    80008f28:	ff173c23          	sd	a7,-8(a4)
    80008f2c:	ff0798e3          	bne	a5,a6,80008f1c <__memmove+0x68>
    80008f30:	ff867713          	andi	a4,a2,-8
    80008f34:	02071793          	slli	a5,a4,0x20
    80008f38:	0207d793          	srli	a5,a5,0x20
    80008f3c:	00f585b3          	add	a1,a1,a5
    80008f40:	40e686bb          	subw	a3,a3,a4
    80008f44:	00f507b3          	add	a5,a0,a5
    80008f48:	06e60463          	beq	a2,a4,80008fb0 <__memmove+0xfc>
    80008f4c:	0005c703          	lbu	a4,0(a1)
    80008f50:	00e78023          	sb	a4,0(a5)
    80008f54:	04068e63          	beqz	a3,80008fb0 <__memmove+0xfc>
    80008f58:	0015c603          	lbu	a2,1(a1)
    80008f5c:	00100713          	li	a4,1
    80008f60:	00c780a3          	sb	a2,1(a5)
    80008f64:	04e68663          	beq	a3,a4,80008fb0 <__memmove+0xfc>
    80008f68:	0025c603          	lbu	a2,2(a1)
    80008f6c:	00200713          	li	a4,2
    80008f70:	00c78123          	sb	a2,2(a5)
    80008f74:	02e68e63          	beq	a3,a4,80008fb0 <__memmove+0xfc>
    80008f78:	0035c603          	lbu	a2,3(a1)
    80008f7c:	00300713          	li	a4,3
    80008f80:	00c781a3          	sb	a2,3(a5)
    80008f84:	02e68663          	beq	a3,a4,80008fb0 <__memmove+0xfc>
    80008f88:	0045c603          	lbu	a2,4(a1)
    80008f8c:	00400713          	li	a4,4
    80008f90:	00c78223          	sb	a2,4(a5)
    80008f94:	00e68e63          	beq	a3,a4,80008fb0 <__memmove+0xfc>
    80008f98:	0055c603          	lbu	a2,5(a1)
    80008f9c:	00500713          	li	a4,5
    80008fa0:	00c782a3          	sb	a2,5(a5)
    80008fa4:	00e68663          	beq	a3,a4,80008fb0 <__memmove+0xfc>
    80008fa8:	0065c703          	lbu	a4,6(a1)
    80008fac:	00e78323          	sb	a4,6(a5)
    80008fb0:	00813403          	ld	s0,8(sp)
    80008fb4:	01010113          	addi	sp,sp,16
    80008fb8:	00008067          	ret
    80008fbc:	02061713          	slli	a4,a2,0x20
    80008fc0:	02075713          	srli	a4,a4,0x20
    80008fc4:	00e587b3          	add	a5,a1,a4
    80008fc8:	f0f574e3          	bgeu	a0,a5,80008ed0 <__memmove+0x1c>
    80008fcc:	02069613          	slli	a2,a3,0x20
    80008fd0:	02065613          	srli	a2,a2,0x20
    80008fd4:	fff64613          	not	a2,a2
    80008fd8:	00e50733          	add	a4,a0,a4
    80008fdc:	00c78633          	add	a2,a5,a2
    80008fe0:	fff7c683          	lbu	a3,-1(a5)
    80008fe4:	fff78793          	addi	a5,a5,-1
    80008fe8:	fff70713          	addi	a4,a4,-1
    80008fec:	00d70023          	sb	a3,0(a4)
    80008ff0:	fec798e3          	bne	a5,a2,80008fe0 <__memmove+0x12c>
    80008ff4:	00813403          	ld	s0,8(sp)
    80008ff8:	01010113          	addi	sp,sp,16
    80008ffc:	00008067          	ret
    80009000:	02069713          	slli	a4,a3,0x20
    80009004:	02075713          	srli	a4,a4,0x20
    80009008:	00170713          	addi	a4,a4,1
    8000900c:	00e50733          	add	a4,a0,a4
    80009010:	00050793          	mv	a5,a0
    80009014:	0005c683          	lbu	a3,0(a1)
    80009018:	00178793          	addi	a5,a5,1
    8000901c:	00158593          	addi	a1,a1,1
    80009020:	fed78fa3          	sb	a3,-1(a5)
    80009024:	fee798e3          	bne	a5,a4,80009014 <__memmove+0x160>
    80009028:	f89ff06f          	j	80008fb0 <__memmove+0xfc>
	...
