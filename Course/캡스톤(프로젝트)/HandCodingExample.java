import java.util.Scanner;

public class HandCodingExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 사용자에게 입력 요청
        System.out.print("첫 번째 숫자를 입력하세요: ");
        int num1 = scanner.nextInt(); // 첫 번째 정수 입력

        System.out.print("두 번째 숫자를 입력하세요: ");
        int num2 = scanner.nextInt(); // 두 번째 정수 입력

        // 합 계산
        int sum = num1 + num2;

        // 포맷 지정하여 결과 출력
        System.out.printf("입력한 두 숫자 %d와 %d의 합은 %d입니다.%n", num1, num2, sum);

        scanner.close(); // 스캐너 닫기
    }
}