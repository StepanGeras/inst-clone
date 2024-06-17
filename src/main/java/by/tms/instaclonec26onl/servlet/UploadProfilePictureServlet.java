package by.tms.instaclonec26onl.servlet;

import by.tms.instaclonec26onl.model.User;
import by.tms.instaclonec26onl.service.ImageUtil;
import by.tms.instaclonec26onl.service.UserService;
import lombok.SneakyThrows;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/uploadProfilePicture")
@MultipartConfig
public class UploadProfilePictureServlet extends HttpServlet {
    UserService userService = new UserService();

    @SneakyThrows
    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        User user = userService.getCurrentUser(req);
        Part photo = req.getPart("photo");

        byte[] postImgByte = ImageUtil.convertToByteArray(photo.getInputStream());
        userService.updateAvatar(postImgByte, user);

        res.sendRedirect("/profile");
    }
}

