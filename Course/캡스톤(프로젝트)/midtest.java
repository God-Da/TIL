import java.util.Scanner;

public class FactorialCalculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int num1, num2;

        // 숫자 입력 받기
        while (true) {
            System.out.print("1~20 범위 내에서 첫 번째 숫자를 입력하세요: ");
            num1 = scanner.nextInt();
            if (num1 >= 1 && num1 <= 20) break;
            System.out.println("잘못된 입력입니다. 1~20 범위 내에서 입력해주세요.");
        }

        while (true) {
            System.out.print("1~20 범위 내에서 두 번째 숫자를 입력하세요: ");
            num2 = scanner.nextInt();
            if (num2 >= 1 && num2 <= 20) break;
            System.out.println("잘못된 입력입니다. 1~20 범위 내에서 입력해주세요.");
        }

        // 펙토리얼 계산 및 출력
        System.out.printf("첫 번째 펙토리얼: %d! = %s = %d\n", num1, factorialSteps(num1), factorial(num1));
        System.out.printf("두 번째 펙토리얼: %d! = %s = %d\n", num2, factorialSteps(num2), factorial(num2));
        System.out.printf("두 펙토리얼의 합 = %d\n", factorial(num1) + factorial(num2));
    }

    // 재귀적으로 펙토리얼 계산
    public static long factorial(int n) {
        if (n == 1) return 1;
        return n * factorial(n - 1);
    }

    // 펙토리얼 과정을 문자열로 반환
    public static String factorialSteps(int n) {
        StringBuilder steps = new StringBuilder();
        for (int i = n; i > 0; i--) {
            steps.append(i);
            if (i != 1) steps.append(" x ");
        }
        return steps.toString();
    }
}