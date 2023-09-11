.data
    n:      .word 10     # Número de términos de la serie Fibonacci
    resultado: .word 0   # Variable para almacenar el resultado
    i:      .word 0      # Contador para iterar a través de la serie

.text
    main:
        # Cargar n en $t0 (número de términos)
        lw $t0, n

        # Inicializar los primeros dos términos de la serie
        li $t1, 0           # Primer término: Fib(0) = 0
        li $t2, 1           # Segundo término: Fib(1) = 1

        # Imprimir los primeros dos términos de la serie
        move $a0, $t1       # Cargar el valor de $t1 para imprimir
        li $v0, 1           # Cargar el código de la llamada al sistema para imprimir int
        syscall

        move $a0, $t2       # Cargar el valor de $t2 para imprimir
        li $v0, 1           # Cargar el código de la llamada al sistema para imprimir int
        syscall

        # Comenzar a generar la serie
        li $t3, 2           # Iniciar el contador en 2 ya que tenemos los dos primeros términos

    loop:
        # Calcular el siguiente término de la serie: Fib(n) = Fib(n-1) + Fib(n-2)
        add $t4, $t1, $t2   # $t4 = $t1 + $t2

        # Imprimir el término actual
        move $a0, $t4       # Cargar el valor de $t4 para imprimir
        li $v0, 1           # Cargar el código de la llamada al sistema para imprimir int
        syscall

        # Actualizar los valores de $t1 y $t2 para el próximo cálculo
        move $t1, $t2       # $t1 = $t2
        move $t2, $t4       # $t2 = $t4

        # Incrementar el contador
        addi $t3, $t3, 1

        # Comprobar si hemos generado todos los términos hasta el número 10
        li $t5, 10
        bge $t3, $t5, done  # Si $t3 >= 10, hemos terminado
        j loop

    done:
        # Salir del programa
        li $v0, 10          # Cargar el código de salida (syscall 10)
        syscall