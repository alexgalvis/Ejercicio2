import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ParallelTests {
    @Test
    void testParallel(){
        Results results =  Runner.path("classpath:petStore").outputCucumberJson(true).parallel(1);
        System.out.println("Report directory: " + results.getReportDir());
        generateReport(results.getReportDir());
    }
    public static void generateReport(String karateOutPutPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutPutPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "PruebaTecnica");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
