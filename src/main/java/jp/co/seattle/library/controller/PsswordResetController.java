package jp.co.seattle.library.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jp.co.seattle.library.service.UsersService;

public class PsswordResetController {
	@Controller
	public class newPasswordContoroller {
		final static Logger logger = LoggerFactory.getLogger(PsswordResetController.class);

		@Autowired
		private UsersService userService;

		@RequestMapping(value = "/newPassword", method = RequestMethod.POST)
		public String newPassword(Locale locale, @RequestParam("password") String password, Model model) {

			// パスワードを更新する
			UsersService.newPassword(password);

			// ログインに遷移する
			return "redirect:/login";
		}
	}

}
