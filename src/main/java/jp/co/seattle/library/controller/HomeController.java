package jp.co.seattle.library.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jp.co.seattle.library.dto.BookInfo;
import jp.co.seattle.library.service.BooksService;

/**
 * Handles requests for the application home page.
 */
@Controller // APIの入り口
public class HomeController {
	final static Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private BooksService booksService;

	/**
	 * Homeボタンからホーム画面に戻るページ
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String transitionHome(Model model) {
		//書籍の一覧情報を取得（タスク３）
		List<BookInfo> book = booksService.getBookList();
		if (!book.isEmpty()) {
			model.addAttribute("booklist", book);
			return "home";
		} else {
			model.addAttribute("errorMessage", "書籍データがありません");
			return "home";
		}

	}

	@RequestMapping(value = "/searchBooks", method = RequestMethod.GET)
	public String getSearch(Model model, @RequestParam(name = "search") String search) {
		List<BookInfo> books = booksService.getSearch(search);
		if (!books.isEmpty()) {
			model.addAttribute("booklist", books);
			return "home";
		} else {
			model.addAttribute("errorMessage", "検索結果がありません");
			return "home";
		}
	}
}