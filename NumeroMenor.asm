.data #Declaración de variables
    num1:   .word 8       # Declaración de primer número entero
    num2:   .word 3       # Declaración de segundo número entero
    num3:   .word 6       # Declaración de tercer número entero
    menor:  .word 0       # Variable para almacenar el resultado

.text
    main:
        # Cargar los números en registros
        lw $t0, num1       # Cargar el valor de num1 en $t0
        lw $t1, num2       # Cargar el valor de num2 en $t1
        lw $t2, num3       # Cargar el valor de num3 en $t2

        # Comparar num1 y num2 restandolos, almacenar el menor en $t3
        sub $t3, $t0, $t1  # $t3 = num1 - num2
        #Se verifica si $t3 es mayor o igual a cero
        bgez $t3, compare_num1_num3

        move $t3, $t0      # Si num1 < num2, $t3 = num1

    compare_num1_num3:
        # Comparar $t3 (menor de num1 y num2) con num3
        sub $t4, $t3, $t2  # $t4 = $t3 - num3
        #Se verifica si $t4 es mayor o igual a cero
        bgez $t4, store_result

        move $t3, $t2      # Si $t3 < num3, $t3 = num3

    store_result:
        # Almacenar el número menor en la variable 'menor'
        sw $t3, menor

        # Finalizar el programa
        li $v0, 10          # Cargar el código de salida (syscall 10)
        syscall