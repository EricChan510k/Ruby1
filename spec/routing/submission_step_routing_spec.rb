require "spec_helper"

describe SubmissionStepController do
  describe "routing" do
    it "routes to #index" do
      get("/submission_step?type='project'").should route_to("submisson_step#agreement")
    end

    it "routes to #agreement" do
      get("/submission_step/agreement?type='project'?type='project'").should route_to("submisson_step#agreement")
    end

    it "routes to #categories" do
      get("/submission_step/categories").should route_to("submisson_step#categories")
    end

    it "routes to #information" do
      get("/submission_step/information").should route_to("submisson_step#information", :id => "1")
    end

    it "routes to #confirm" do
      get("/submission_step/confirm").should route_to("submisson_step#confirm", :id => "1")
    end
  end
end
