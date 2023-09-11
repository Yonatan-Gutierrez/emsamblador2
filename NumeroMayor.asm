.data  #Declaración de variables
    num1:   .word 9       # Declaración de primer numero entero
    num2:   .word 4       # Declaración de segundo numero entero
    num3:   .word 2       # Declaración de tercer numero entero
    mayor:  .word 0       # Variable para almacenar el resultado

.text
    main:
        # Cargar los números en registros
        lw $t0, num1       # Cargar el valor de num1 en $t0
        lw $t1, num2       # Cargar el valor de num2 en $t1
        lw $t2, num3       # Cargar el valor de num3 en $t2

        # Comparar num1 y num2 restandolos, almacenar el mayor en $t3
        sub $t3, $t0, $t1  # $t3 = num1 - num2
        #Se verifica si $t3 es mayor o igual a cero
        bgez $t3, compare_num1_num3

        move $t3, $t1      # Si num1 < num2, $t3 = num2

    compare_num1_num3:
        # Comparar $t3 (mayor de num1 y num2) con num3
        sub $t4, $t3, $t2  # $t4 = $t3 - num3
        bgez $t4, store_result

        move $t3, $t2      # Si $t3 < num3, $t3 = num3

    store_result:
        # Almacenar el número mayor en la variable 'mayor'
        sw $t3, mayor

        # Finalizar el programa
        li $v0, 10          # Cargar el código de salida (syscall 10)
        syscall