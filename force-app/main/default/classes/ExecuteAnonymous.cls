public with sharing class ExecuteAnonymous {
    public ExecuteAnonymous() {
        SimpleCalculator calc = new SimpleCalculator();

        calc.add(10, 5); 

        calc.subtract(20, 7);

        Integer finalResult = calc.getResult();
        System.debug('Final Result: ' + finalResult);

    }
}