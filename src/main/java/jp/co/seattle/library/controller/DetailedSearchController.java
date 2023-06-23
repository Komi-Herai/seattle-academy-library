package jp.co.seattle.library.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jp.co.seattle.library.commonutil.BookUtil;
import jp.co.seattle.library.dto.BookInfo;
import jp.co.seattle.library.service.BooksService;

@Controller
public class DetailedSearchController {
	final static Logger logger = LoggerFactory.getLogger(AddBooksController.class);

	@Autowired
	private BooksService booksService;
	@Autowired
	private BookUtil bookUtil;

	@RequestMapping(value = "/detailedSearchBooks", method = RequestMethod.GET) // value＝actionで指定したパラメータ
	// RequestParamでname属性を取得
	public String login(Model model) {
		return "detailedSearch";
	}

	@Transactional
	@RequestMapping(value = "/searchResults", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String results(Model model, @RequestParam(name = "title") String title,
			@RequestParam(name = "author") String author,
			@RequestParam(name = "publisher") String publisher, @RequestParam(name = "publishDate") String publishDate,
			@RequestParam(name = "isbn") String isbn) {
		List<BookInfo> books = booksService.results(title, author, publisher, publishDate, isbn);
		if (!books.isEmpty()) {
			model.addAttribute("booklist", books);
			return "home";
		} else {
			model.addAttribute("errorMessage", "検索結果がありません");
			return "home";
		}
	}
}