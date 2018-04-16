section .data
    width:   dq  0.0
    height:  dq  0.0
    iter:    dq  0
    yRate:   dq  10.0
    xRate:   dq  6.0
    x:       dq  0.0
    y:       dq  0.0
    x_1:     dq  0.0
    y_1:     dq  0.0
    x2:      dq  0.0
    y2:      dq  0.0
    a:       dq  0.85
    b:       dq  0.04
    c:       dq  -0.04
    d:       dq  0.85
    e:       dq  1.6
    a2:      dq  -0.15
    b2:      dq  0.28
    c2:      dq  0.26
    d2:      dq  0.24
    e2:      dq  0.44
    a3:      dq  0.0
    b3:      dq  0.0
    c3:      dq  0.0
    d3:      dq  0.16
    e3:      dq  0.0
    a4:      dq  0.2
    b4:      dq  -0.26
    c4:      dq  0.23
    d4:      dq  0.22
    e4:      dq  1.6
section .bss
    next:   resq 1
    pp1:    resq 1
    pp2:    resq 1
    pp3:    resq 1
    
section .text
global barnsley
extern glVertex2d
extern xOffset
extern p1
extern p2
extern p3

barnsley:
    push    rbp
    mov     rbp, rsp
    push    rbx
    mov     rax, 0x0d         
    mov     rbx, 0x0         
    int     0x80              
    mov     qword [next], rax
    movq    [width], XMM0
    movq    [height], XMM1
    mov     [iter], rdx
    
    mov     rax, 100
    sub     rax, [p1]
    mov     [pp1], rax
    sub     rax, [p2]
    mov     [pp2], rax
    sub     rax, [p3]
    mov     [pp3], rax
    
    fld     qword [height]
    fdiv    qword [yRate]
    fstp    qword [height]
    fld     qword [width]
    fdiv    qword [xRate]
    fstp    qword [width]
loop:
    dec     qword [iter]
    mov     rax, [next]       
    mov     rbx, 1103515245   
    mul     rbx               
    add     rax, 12345        
    mov     qword [next], rax 
    mov     rbx, 100          
    xor     rdx, rdx          
    div     rbx               
    mov     rax, rdx
    
    cmp     rax, [pp1]
    jge     fern2
    cmp     rax, [pp2]
    jge     fern4
    cmp     rax, [pp3]
    jge     fern3
    
fern:
    fld     qword [a]
    fmul    qword [x]
    fstp    qword [x_1]
    fld     qword [b]
    fmul    qword [y]
    fstp    qword [x2]
    fld     qword [x_1]
    fadd    qword [x2]
    fst     qword [x2]
    movq    XMM2, [x2]
    fmul    qword [width]
    fadd    qword [xOffset]
    fstp    qword [x2]
    movq    XMM0, [x2]
    
    fld     qword [c]
    fmul    qword [x]
    fstp    qword [y_1]
    fld     qword [d]
    fmul    qword [y]
    fstp    qword [y2]
    fld     qword [e]
    fadd    qword [y_1]
    fadd    qword [y2]
    fst     qword [y]

    movq    [x], XMM2
    fmul    qword [height]
    fstp    qword [y_1]
    movq    XMM1, qword [y_1]
    call    glVertex2d
    cmp     qword [iter], 0
    je      end
    jmp     loop
fern2:
    fld     qword [a2]
    fmul    qword [x]
    fstp    qword [x_1]
    fld     qword [b2]
    fmul    qword [y]
    fstp    qword [x2]
    fld     qword [x_1]
    fadd    qword [x2]
    fst     qword [x2]
    movq    XMM2, [x2]
    fmul    qword [width]
    fadd    qword [xOffset]
    fstp    qword [x2]
    movq    XMM0, [x2]
    
    fld     qword [c2]
    fmul    qword [x]
    fstp    qword [y_1]
    fld     qword [d2]
    fmul    qword [y]
    fstp    qword [y2]
    fld     qword [e2]
    fadd    qword [y_1]
    fadd    qword [y2]
    fst     qword [y]
    movq    [x], XMM2
    fmul    qword [height]
    fstp    qword [y_1]
    movq    XMM1, qword [y_1]
    call    glVertex2d
    cmp     qword [iter], 0
    je      end
    jmp     loop
fern3:
    fld     qword [a3]
    fmul    qword [x]
    fstp    qword [x_1]
    fld     qword [b3]
    fmul    qword [y]
    fstp    qword [x2]
    fld     qword [x_1]
    fadd    qword [x2]
    fst     qword [x2]
    movq    XMM2, [x2]
    fmul    qword [width]
    fadd    qword [xOffset]
    fstp    qword [x2]
    movq    XMM0, [x2]
    
    fld     qword [c3]
    fmul    qword [x]
    fstp    qword [y_1]
    fld     qword [d3]
    fmul    qword [y]
    fstp    qword [y2]
    fld     qword [e3]
    fadd    qword [y_1]
    fadd    qword [y2]
    fst     qword [y]
    movq    [x], XMM2
    fmul    qword [height]
    fstp    qword [y_1]
    movq     XMM1, qword [y_1]
    call    glVertex2d
    cmp     qword [iter], 0
    je      end
    jmp     loop
fern4:
    fld     qword [a4]
    fmul    qword [x]
    fstp    qword [x_1]
    fld     qword [b4]
    fmul    qword [y]
    fstp    qword [x2]
    fld     qword [x_1]
    fadd    qword [x2]
    fst     qword [x2]
    movq    XMM2, [x2]
    fmul    qword [width]
    fadd    qword [xOffset]
    fstp    qword [x2]
    movq    XMM0, [x2]
    
    fld     qword [c4]
    fmul    qword [x]
    fstp    qword [y_1]
    fld     qword [d4]
    fmul    qword [y]
    fstp    qword [y2]
    fld     qword [e4]
    fadd    qword [y_1]
    fadd    qword [y2]
    fst     qword [y]
    movq    [x], XMM2
    fmul    qword [height]
    fstp    qword [y_1]
    movq    XMM1, qword [y_1]
    call    glVertex2d
    cmp     qword [iter], 0
    je      end
    jmp     loop
end:
    pop     rbx
    mov     rsp, rbp
    pop     rbp
    ret

