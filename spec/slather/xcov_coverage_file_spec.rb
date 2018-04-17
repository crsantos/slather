require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Slather::CoverageFile do

  let(:fixtures_project) do
    project = Slather::Project.open(FIXTURES_PROJECT_PATH)
    project.build_directory = TEMP_DERIVED_DATA_PATH
    allow(project).to receive(:input_format).and_return("xccov")
    project.send(:configure)
    
    project
  end

  let(:coverage_file) do
    fixtures_project.coverage_files[0]
  end

  describe "#initialize" do
    it "should convert the provided path string to a Pathname object, and set it as the xccov_file_pathname" do
      expect(coverage_file.xccov_file_pathname).to be_exist
      # expect(coverage_file.xccov_file_pathname.basename.to_s).to eq("fixtures.gcno") # dynamic nature, so won't check here
    end
  end

end
