package jp.co.seattle.library.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jp.co.seattle.library.commonutil.InquiriesUtil;
import jp.co.seattle.library.dto.InquiriesForm;

/**
 * Handles requests for the application home page.
 */
@Controller // APIの入り口
public class InquiriesController {
	final static Logger logger = LoggerFactory.getLogger(InquiriesController.class);

	@Autowired
	private InquiriesForm inquiriesForm;

	@RequestMapping(value = "/Inquiries", method = RequestMethod.GET) // value＝actionで指定したパラメータ
	// RequestParamでname属性を取得
	public String login(Model model) {

		return "Inquiries";
	}

	@Transactional
	@RequestMapping(value = "/check", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String check(Locale locale, @RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("contents") String contents, MultipartFile file, Model model,
			RedirectAttributes redirectAttributes) {
		logger.info("Welcome insertBooks.java! The client locale is {}.", locale);

		// パラメータで受け取った書籍情報をDtoに格納する。
		InquiriesForm inquiriesForm = new InquiriesForm();
		inquiriesForm.setName(name);
		inquiriesForm.setEmail(email);
		inquiriesForm.setContents(contents);

		List<String> errorList = InquiriesUtil.checkInquiries(inquiriesForm);
		// errorListに一つでもエラーメッセージが入っていたら登録しない
		if (errorList.size() > 0) {
			redirectAttributes.addFlashAttribute("inquiriesForm", inquiriesForm);
			redirectAttributes.addFlashAttribute("errorList", errorList);
			return "redirect:/Inquiries";
		}

		return "check"; // 成功時のページを返す   .
	}

	@RequestMapping(value = "/Inquiries", method = RequestMethod.POST, produces = "text/plain;charset=utf-8") // value＝actionで指定したパラメータ
	// RequestParamでname属性を取得
	public String back(Model model) {

		return "Inquiries";
	}
	
	@RequestMapping(value = "/sending", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String sending(Locale locale, @RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("contents") String contents, MultipartFile file, Model model,
			RedirectAttributes redirectAttributes) {
		logger.info("Welcome insertBooks.java! The client locale is {}.", locale);

		// パラメータで受け取った書籍情報をDtoに格納する。
		InquiriesForm inquiriesForm = new InquiriesForm();
		inquiriesForm.setName(name);
		inquiriesForm.setEmail(email);
		inquiriesForm.setContents(contents);

		return "sending"; // 成功時のページを返す   .
	}
}