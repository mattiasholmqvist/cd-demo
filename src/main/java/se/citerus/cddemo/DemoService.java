package se.citerus.cddemo;

import com.yammer.dropwizard.Service;
import com.yammer.dropwizard.config.Bootstrap;
import com.yammer.dropwizard.config.Environment;

public class DemoService extends Service<DemoConfig> {
  @Override
  public void initialize(Bootstrap<DemoConfig> bootstrap) {

  }

  @Override
  public void run(DemoConfig configuration, Environment environment) throws Exception {
    environment.addResource(new HelloResource());
  }

  public static void main(String[] args) throws Exception {
    new DemoService().run(args);
  }

}
