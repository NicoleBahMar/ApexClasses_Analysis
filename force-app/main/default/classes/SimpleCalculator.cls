public class SimpleCalculator {

    public Integer result;

    public void add(Integer num1, Integer num2) {
        this.result = num1 + num2;
        System.debug('Sum: ' + this.result);
    }

    public void subtract(Integer num1, Integer num2) {
        this.result = num1 - num2;
        System.debug('Difference: ' + this.result);
    }

    public Integer getResult() {
        return this.result;
    }
}