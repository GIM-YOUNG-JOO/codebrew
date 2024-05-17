package com.mycompany.codebrew.dto;





import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MyInfoChangeValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return Account.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Account account = (Account) target; //위에서 어자이너블한 클래스 트루라는 것을 확인했으므로 강제타입 변환 가능
		
		//이름 검사 
		String acName = account.getAcName();
		String acNamePattern = "[가-힣]{2,5}";
		if(acName == null || acName.equals("")) {
			errors.rejectValue("acName", null, "이름은 반드시 입력해야합니다.");
		} else if(acName.length() < 2 || acName.length() > 5) {
			errors.rejectValue("acName", null, "이름은 2자 이상 5자 이하로 입력해야합니다.");
		} else if(!Pattern.matches(acNamePattern, acName)) {
			errors.rejectValue("acName", null, "한글 이름을 2~5자 이내로 입력해주세요.");
		}

		//비밀번호 검사
		String acPassword = account.getAcPassword();
		String acPasswordPattern = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}";
		if(acPassword == null || acPassword.equals("")) {
			errors.rejectValue("acPassword", null, "비밀번호는 반드시 입력해야합니다.");
		} else if(acPassword.length() < 8 || acPassword.length() > 15) {
			errors.rejectValue("acPassword", null, "비밀번호는 8자 이상 15자 이하로 입력해야합니다.");
		} else if(!Pattern.matches(acPasswordPattern, acPassword)) {
			errors.rejectValue("acPassword", null, "비밀번호는 알파벳 대소문자 및 숫자를 포함해야합니다.");
		}
		
		//전화번호 검사
		String acTel = account.getAcTel();
		String acTelPattern = "(010|011)-\\d{3,4}-\\d{4}";
		if(acTel == null || acTel.equals("")) {
			errors.rejectValue("acTel", null, "전화번호는 반드시 입력해야합니다.");
		} else if(!Pattern.matches(acTelPattern, acTel)) {
			errors.rejectValue("acTel", null, "전화번호는 -를 포함해서 입력해주세요. (* 양식 -> 000-0000-0000)");
		}
		
		//이메일 검사
		String acEmail = account.getAcEmail();
		String acEmailPattern = "[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}";
		if(acEmail == null || acEmail.equals("")) {
			errors.rejectValue("acEmail", null, "이메일은 반드시 입력해야합니다.");
		} else if(!Pattern.matches(acEmailPattern, acEmail)) {
			errors.rejectValue("acEmail", null, "이메일 형식이 올바르지 않습니다.");
		}
		
	}
	
}
