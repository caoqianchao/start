package org.cqc.web.jsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 账户余额查询 controller
 *
 * @author yz
 */
@Controller
@RequestMapping("/finance")
public class AccountBalanceQueryController {

    @RequestMapping(value = "querySystemAccount")
    public ModelAndView querySystem() {
        ModelAndView mv = new ModelAndView();
        return mv;
    }

    @RequestMapping(value = "mebBalance")
    public ModelAndView mebBalance(String merNo) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("merNo", merNo);
        mv.setViewName("balance/mebBalance");
        return mv;
    }

    @RequestMapping(value = "sysBalance")
    public ModelAndView sysBalance(String subject) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("balance/systemAccountBalance");
        return mv;
    }

    @RequestMapping(value = "bankBalanceDetail")
    public ModelAndView bankBalanceDetail(String beginTime) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("balance/bankBalanceDetail");
        return mv;

    }

}
