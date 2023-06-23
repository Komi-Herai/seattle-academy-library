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

	/**
	  * @favorite
	  * @param locale
	  * @param bookId
	  * @param model
	  * @return
	  */
	@Transactional
	@RequestMapping(value = "/favoriteBook", method = RequestMethod.GET)
	public String favoriteBook(Locale locale, @RequestParam("bookId") int bookId, Model model) {
		booksService.favoriteBooks(bookId);
		return "redirect:/home";
	}

	/**
	 * @favorite
	 * @param locale
	 * @param bookId
	 * @param model
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "/unfavoriteBook", method = RequestMethod.GET)
	public String unfavoriteBook(Locale locale, @RequestParam("bookId") int bookId, Model model) {
		booksService.unfavoriteBooks(bookId);
		return "redirect:/home";
	}

	//お気に入り一覧
	@RequestMapping(value = "/favoriteList", method = RequestMethod.GET)
	public String favoriteBooks(Model model) {
		List<BookInfo> bookList = booksService.favoriteBooksList();
		if (!bookList.isEmpty()) {
			model.addAttribute("booklist", bookList);
			return "favoriteBook";
		} else {
			model.addAttribute("errorMessage", "お気に入りの書籍はありません");
			return "favoriteBook";
		}
	}

	//ジャンル別表示
	@RequestMapping(value = "/genre", method = RequestMethod.POST)
	public String genre(Model model, @RequestParam(name = "genre") String genre) {
		List<BookInfo> books = booksService.getGenre(genre);
		if (!books.isEmpty()) {
			model.addAttribute("booklist", books);
			return "home";
		} else {
			model.addAttribute("errorMessage", "該当ジャンルの書籍がありません");
			return "home";
		}
	}

	//モーダルウィンドウ
	@RequestMapping(value = "/modalLogOut", method = RequestMethod.GET)
	public String first(Model model) {
		return "login";
	}

	//書籍一括削除
	@RequestMapping(value = "/checkDelete", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public String checkDelete(Locale locale,
			@RequestParam("bookId") int[] arr, Model model) {
		for (int i : arr) {
			booksService.checkDelete(i);
		}
		return "redirect:/home";
	}
}
