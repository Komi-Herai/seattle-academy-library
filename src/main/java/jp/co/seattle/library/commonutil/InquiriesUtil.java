package jp.co.seattle.library.commonutil;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import jp.co.seattle.library.dto.InquiriesForm;

@Service
public class InquiriesUtil {
	final static Logger logger = LoggerFactory.getLogger(BookUtil.class);
	private static final String REQUIRED_ERROR = "未入力の必須項目があります";
	private static final String EMAIL_ERROR = "メールアドレスの桁数または半角数字が正しくありません";
	private static final String NAME_ERROR = "お名前は20文字以下で入力してください";

	public static List<String> checkInquiries(InquiriesForm InquiriesForm) {

		List<String> errorList = new ArrayList<>();
		// 必須チェック
		if (isEmptyInquiries(InquiriesForm)) {
			errorList.add(REQUIRED_ERROR);
		}
		if (!(isValidEmail(InquiriesForm.getEmail()))) {
			errorList.add(EMAIL_ERROR);
		}
		if (!(isValidName(InquiriesForm.getName()))) {
			errorList.add(NAME_ERROR);
		}
		return errorList;
	}

	private static boolean isEmptyInquiries(InquiriesForm InquiriesForm) {

		if (StringUtils.isEmpty(InquiriesForm.getName()) || StringUtils.isEmpty(InquiriesForm.getEmail())
				|| StringUtils.isEmpty(InquiriesForm.getContents())) {
			return true;
		} else {
			return false;
		}
	}

	private static boolean isValidEmail(String email) {

		if (!(email.isEmpty())) {
			if (((email.matches("^([a-zA-Z0-9])+([a-zA-Z0-9._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9._-]+)+$")) && (email.length() < 50))) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}

	private static boolean isValidName(String name) {
		
		if (!(name.isEmpty())) {
			if (((name.length() < 20))) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
}