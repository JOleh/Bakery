package SaveManager;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet(name = "GetImage")
public class GetImage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*response.setContentType("image/png");
        response.setHeader("Content-disposition", "attachment; filename=myname.png");
        File file = new File("/file.png");
        OutputStream out = response.getOutputStream();
        FileInputStream in = new FileInputStream(file);*/
        if(!ServletFileUpload.isMultipartContent(request)){
            System.out.println("no download");
            return;
        }
        //FileItemFactory itemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload();
        try {
            FileItemIterator fileItemIterator = upload.getItemIterator(request);
            while(fileItemIterator.hasNext()){
                FileItemStream itemStream = fileItemIterator.next();
                if(itemStream.isFormField()){
                    System.out.println("шлак");
                }else{
                    String path = getServletContext().getRealPath("/");
                    System.out.println("Maybe path   "+path);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
/*
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items){
                System.out.println("is it smth there&");
                String contentType = item.getContentType();
                if(!contentType.equals("image/png")){
                    System.out.println("only png");
                    continue;
                }
                System.out.println(item.getName());
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }*/


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
