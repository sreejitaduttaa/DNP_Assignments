public class FinancialForecast {

    public static double calculateFutureValue(double presentValue, double rate, int years) {
        if (years == 0) {
            return presentValue;
        }
        return (1 + rate) * calculateFutureValue(presentValue, rate, years - 1);
    }

    public static void main(String[] args) {
        double presentValue = 10000.0;
        double annualGrowthRate = 0.08;
        int forecastYears = 5;

        double futureValue = calculateFutureValue(presentValue, annualGrowthRate, forecastYears);

        System.out.printf("Future value after %d years: %.2f\n", forecastYears, futureValue);
    }
}
