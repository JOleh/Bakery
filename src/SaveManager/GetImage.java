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
        if(!ServletFileUpload.isMultipartContent(request)){
            return;
        }
        ServletFileUpload upload = new ServletFileUpload();
        try {
            FileItemIterator fileItemIterator = upload.getItemIterator(request);
            while(fileItemIterator.hasNext()){
                FileItemStream itemStream = fileItemIterator.next();
                if(itemStream.isFormField()){
                    System.out.println("шлак");
                }else{
                    String path = getServletContext().getRealPath("/");
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        //todo
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
