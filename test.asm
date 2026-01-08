assume cs:codesg
codesg segment
  start: 
         mov ax, 1
         mov bx, 2
         add ax, bx

         mov ax, 4c00H
         int 21H
codesg ends
end start
