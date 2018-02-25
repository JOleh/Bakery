package saveManager;

/*import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;*/

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/*@WebServlet(name = "GetImage")*/
public class GetImage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*ServletFileUpload upload = new ServletFileUpload();
        if(!ServletFileUpload.isMultipartContent(request)){
            return;
        }
        try {
            FileItemIterator fileItemIterator = upload.getItemIterator(request);
            while(fileItemIterator.hasNext()){
                FileItemStream itemStream = fileItemIterator.next();
                if(itemStream.isFormField()){

                }else{
                    String path = getServletContext().getRealPath("/");
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }*/
        //todo
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
