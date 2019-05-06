package org.game.beatingpicture.util;

import java.awt.Color;
import java.awt.Font;
import java.util.Properties;

import com.google.code.kaptcha.BackgroundProducer;
import com.google.code.kaptcha.GimpyEngine;
import com.google.code.kaptcha.NoiseProducer;
import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultBackground;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.impl.DefaultNoise;
import com.google.code.kaptcha.impl.WaterRipple;
import com.google.code.kaptcha.text.TextProducer;
import com.google.code.kaptcha.text.WordRenderer;
import com.google.code.kaptcha.text.impl.DefaultTextCreator;
import com.google.code.kaptcha.text.impl.DefaultWordRenderer;
import com.google.code.kaptcha.util.ConfigHelper;

public class Config
{
  private Properties properties;
  private ConfigHelper helper;
  
  public Config(Properties properties)
  {
    this.properties = properties;
    this.helper = new ConfigHelper();
  }
  
  /**
   * 设置图片是否有边框
   * @return
   */
  public boolean isBorderDrawn()
  {
    String paramName = "kaptcha.border";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getBoolean(paramName, paramValue, true);
  }
  
  /**
   * 边框颜色   合法值： r,g,b (and optional alpha) 或者 white,black,blue.
   * @return
   */
  public Color getBorderColor()
  {
    String paramName = "kaptcha.border.color";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getColor(paramName, paramValue, Color.BLACK);
  }
  
  /**
   * 边框厚度  合法值：>0
   * @return
   */
  public int getBorderThickness()
  {
    String paramName = "kaptcha.border.thickness";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getPositiveInt(paramName, paramValue, 1);
  }
  
  /**
   * 文本集合，验证码值从此集合中获取
   * @return
   */
  public char[] getTextProducerCharString()
  {
    String paramName = "kaptcha.textproducer.char.string";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getChars(paramName, paramValue, "abcde2345678gfynmnpwx".toCharArray());
  }
  
  /**
   * 验证码长度
   * @return
   */
  public int getTextProducerCharLength()
  {
    String paramName = "kaptcha.textproducer.char.length";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getPositiveInt(paramName, paramValue, 5);
  }
  
  /**
   * 字体类型
   * @param fontSize 见Font中的定义
   * @return
   */
  public Font[] getTextProducerFonts(int fontSize)
  {
    String paramName = "kaptcha.textproducer.font.names";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getFonts(paramName, paramValue, fontSize, new Font[] { new Font("Arial", 1, fontSize), new Font("Courier", 1, fontSize) });
  }
  
  /**
   * 字体大小
   * @return
   */
  public int getTextProducerFontSize()
  {
    String paramName = "kaptcha.textproducer.font.size";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getPositiveInt(paramName, paramValue, 40);
  }
  
  /**
   * 字体颜色  rgb颜色或者Color中的值
   * @return
   */
  public Color getTextProducerFontColor()
  {
    String paramName = "kaptcha.textproducer.font.color";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getColor(paramName, paramValue, Color.BLACK);
  }
  
  /**
   * 干扰线的颜色
   * @return
   */
  public Color getNoiseColor()
  {
    String paramName = "kaptcha.noise.color";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getColor(paramName, paramValue, Color.BLACK);
  }
    
  /**
   * 背景颜色渐变色开始色  rgb或者Color中定义的
   * @return
   */
  public Color getBackgroundColorFrom()
  {
    String paramName = "kaptcha.background.clear.from";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getColor(paramName, paramValue, Color.LIGHT_GRAY);
  }
  
  /**
   * 背景颜色渐变色结束色   rgb或者Color中定义的
   * @return
   */
  public Color getBackgroundColorTo()
  {
    String paramName = "kaptcha.background.clear.to";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getColor(paramName, paramValue, Color.WHITE);
  }
  
  /**
   * 图片的宽度
   * @return
   */
  public int getWidth()
  {
    String paramName = "kaptcha.image.width";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getPositiveInt(paramName, paramValue, 200);
  }
  
  /**
   * 图片的高度
   * @return
   */
  public int getHeight()
  {
    String paramName = "kaptcha.image.height";
    String paramValue = this.properties.getProperty(paramName);
    return this.helper.getPositiveInt(paramName, paramValue, 50);
  }
  
  /**
   * 图片的session key
   * @return
   */
  public String getSessionKey()
  {
    return this.properties.getProperty("kaptcha.session.key", "KAPTCHA_SESSION_KEY");
  }
  
  public Properties getProperties()
  {
    return this.properties;
  }
  
  /**
   * 生成默认的图片生产者实现
   * @return
   */
  public Producer getProducerImpl()
  {
    String paramName = "kaptcha.producer.impl";
    String paramValue = this.properties.getProperty(paramName);
    Producer producer = (Producer)this.helper.getClassInstance(paramName, paramValue, new DefaultKaptcha(), new com.google.code.kaptcha.util.Config(properties));
    return producer;
  }
  
  /**
   * 生成默认的验证码文字生产者实现
   * @return
   */
  public TextProducer getTextProducerImpl()
  {
    String paramName = "kaptcha.textproducer.impl";
    String paramValue = this.properties.getProperty(paramName);
    TextProducer textProducer = (TextProducer)this.helper.getClassInstance(paramName, paramValue, new DefaultTextCreator(), new com.google.code.kaptcha.util.Config(properties));
    
    return textProducer;
  }
  
  /**
   * 文字干扰实现类，默认DefaultNoise，还可以选择com.google.code.kaptcha.impl.NoNoise没有干扰线的实现类
   * @return
   */
  public NoiseProducer getNoiseImpl()
  {
      String paramName = "kaptcha.noise.impl";
      String paramValue = this.properties.getProperty(paramName);
      NoiseProducer noiseProducer = (NoiseProducer)this.helper.getClassInstance(paramName, paramValue, new DefaultNoise(), new com.google.code.kaptcha.util.Config(properties));
      
      return noiseProducer;
  }
  
  /**
   * 图片样式的实现类，默认WaterRipple（水纹），还有下面2种可选
   * 鱼眼com.google.code.kaptcha.impl.FishEyeGimpy    阴影com.google.code.kaptcha.impl.ShadowGimpy
   * 
   * @return
   */
  public GimpyEngine getObscurificatorImpl()
  {
    String paramName = "kaptcha.obscurificator.impl";
    String paramValue = this.properties.getProperty(paramName);
    GimpyEngine gimpyEngine = (GimpyEngine)this.helper.getClassInstance(paramName, paramValue, new WaterRipple(), new com.google.code.kaptcha.util.Config(properties));
    return gimpyEngine;
  }
  
  /**
   * 文字渲染实现类，默认DefaultWordRenderer，也只有这一个默认的实现类
   * @return
   */
  public WordRenderer getWordRendererImpl()
  {
    String paramName = "kaptcha.word.impl";
    String paramValue = this.properties.getProperty(paramName);
    WordRenderer wordRenderer = (WordRenderer)this.helper.getClassInstance(paramName, paramValue, new DefaultWordRenderer(), new com.google.code.kaptcha.util.Config(properties));
    
    return wordRenderer;
  }
  
  /**
   * 背景图片实现类，默认DefaultBackground，也只有这一个默认实现类
   * @return
   */
  public BackgroundProducer getBackgroundImpl()
  {
    String paramName = "kaptcha.background.impl";
    String paramValue = this.properties.getProperty(paramName);
    BackgroundProducer backgroundProducer = (BackgroundProducer)this.helper.getClassInstance(paramName, paramValue, new DefaultBackground(), new com.google.code.kaptcha.util.Config(properties));
    
    return backgroundProducer;
  }
}