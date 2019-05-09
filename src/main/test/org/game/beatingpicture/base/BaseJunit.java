package org.game.beatingpicture.base;

import org.game.beatingpicture.BeatingPictureApplication;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;


/**
 * 基础测试类
 * @author ymh
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = BeatingPictureApplication.class)
@WebAppConfiguration
public class BaseJunit {

}
