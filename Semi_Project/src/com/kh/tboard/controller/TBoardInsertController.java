package com.kh.tboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.tboard.model.service.TBoardService;
import com.kh.tboard.model.vo.Attachment;

import com.kh.tboard.model.vo.TBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TBoardInsertController
 */
@WebServlet("/insert.it")
public class TBoardInsertController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      
      
      if(ServletFileUpload.isMultipartContent(request)) {
         
         
         int maxSize = 1024 * 1024 * 10; 
         
   
         String savePath = request.getSession().getServletContext().getRealPath("/resources/itemImg_upfiles/");
         
         
         
         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
      
         
         String tTitle = multiRequest.getParameter("tTitle");
         int tPrice = Integer.parseInt(multiRequest.getParameter("tPrice"));
         int categoryNo = Integer.parseInt(multiRequest.getParameter("categoryNo"));
         String bookStatus = multiRequest.getParameter("bookStatus");
         String content = multiRequest.getParameter("content");
         String userNo = multiRequest.getParameter("userNo");
         String map = multiRequest.getParameter("map");
         
         
         
         
         TBoard tb = new TBoard();
         tb.settTitle(tTitle);
         tb.settPrice(tPrice);
         tb.setCategoryNo(categoryNo);
         tb.setBookStatus(bookStatus);
         tb.setContent(content);
         tb.setMemberNo(userNo);
         tb.setMap(map);
         
         ArrayList<Attachment> list = new ArrayList<>();
         
      
         for(int i = 1; i <= 3; i++) {
            
            // ????????? ?????? ????????? ??????
            String key = "file" + i;
            System.out.println(multiRequest.getOriginalFileName(key));
            
      
            if(multiRequest.getOriginalFileName(key) != null) { 
               
               
               Attachment at = new Attachment();
               at.setFileName(multiRequest.getOriginalFileName(key)); 
               at.setFilePath("resources/itemImg_upfiles/"); 
               at.setChangeName(multiRequest.getFilesystemName(key));
               at.setStatus("Y");
               // ????????????
               if(i == 1) {
                  // ???????????????
                  at.setFileLevel("1");
               }
               else if(i == 2) {
                  // ???????????????
                  at.setFileLevel("2");
               }
               else {
                  at.setFileLevel("3");
               }
               
               list.add(at);
            }
            else {
               
            }
            
         }
         // 4) Service ????????? ??????
         int result = new TBoardService().insertTBoard(tb, list);
         
         // 5) ????????? ?????? ????????? ??????
         if(result > 0) {
         
            request.getSession().setAttribute("alertMsg", "?????? ????????? ?????????????????????.");
            response.sendRedirect(request.getContextPath() + "/list.it?currentPage=1&category="+categoryNo);
            
         }
         else { // ?????? => ???????????????
            request.setAttribute("errorMsg", "?????? ????????? ?????????????????????.");
         }
      }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}