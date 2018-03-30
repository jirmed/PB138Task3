package cz.muni.fi.pb138.spring2018.task3;


import java.io.File;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 * Task 3, XSL Transformations (XSLT)
 * 
 * Your task is to complete the recipes-to-html.xsl stylesheet
 * so that it defines a transformation from recipes.xml to recipes.html
 * so that its output is a) valid XHTML or HTML5 and 
 * b) has its content similar to provided recipes.html
 * c) any improvement of the recipes.css is welcome
 * 
 * For testing the transformation, you can either a) run this file or
 * b) use some other XSLT transformation engine such as xsltproc.
 * 
 * @author bar, tomp
 */
public class XSLTProcessor {
    public static void main(String[] args) 
            throws TransformerConfigurationException, TransformerException {
        
        TransformerFactory tf = TransformerFactory.newInstance();
        
        Transformer xsltProc = tf.newTransformer(
                new StreamSource(new File("recipes-to-html.xsl")));
        
        xsltProc.transform(
                new StreamSource(new File("recipes.xml")), 
                new StreamResult(new File("recipes.html")));
    }
}
