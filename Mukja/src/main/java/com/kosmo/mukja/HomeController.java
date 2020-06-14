package com.kosmo.mukja;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
      private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      return "index.tiles";
   }
   
   @RequestMapping(value="/Mypage.bbs", method = RequestMethod.GET)
   public String Mypage(String str) {
      return "/Member/MyPage.tiles";
   }
   
   
   
   /*----------------------------가게페이지------------------------------*/
   @RequestMapping(value="/Restaurants.bbs", method = RequestMethod.GET)
   public String resTaurants(String str) {   
      return "/Store/Restaurants.tiles";
   }
   @RequestMapping(value="/MenuList.bbs", method = RequestMethod.GET)
   public String MenuList(String str) {
      return "Store/Menu/List.tiles";
   }
   
   

}