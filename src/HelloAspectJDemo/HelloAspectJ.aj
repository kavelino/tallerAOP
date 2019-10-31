package HelloAspectJDemo;

public aspect HelloAspectJ {
	// Define a Pointcut is
    // collection of JoinPoint call sayHello of class HelloAspectJDemo.
	//Se declaro las variables startTime y estimatedTime
	long startTime;
	long estimatedTime;
	//Se renombre el pointcut como callGreeting y este llama a la funcion greeting()
    pointcut callGreeting(): call(* HelloAspectJDemo.greeting()); 
    //Antes de llamar al metodo callGreeting se realiza el siguiente advice
    before() : callGreeting() {
    	//Se toma el tiempo de inicio
    	startTime = System.currentTimeMillis();
    	//Se lo muestra por pantalla
        System.out.println("Inicio: " + startTime);
    } 
    //Despues de invocar al metodo se realiza la siguiente accion
    after() : callGreeting()  {
    	//Se toma el tiempo transcurrido y se resta del tiempo anterior
    	estimatedTime = System.currentTimeMillis() - startTime;
    	//Ahora se muestra por pantalla el tiempo de ejecucion de la funcion
        System.out.println("\nTiempo estimado: " + estimatedTime);
    }  
}
