require 'spec_helper'

describe Redmine do

  context "versioning" do
  
    it "should have a version constant" do
      Redmine.constants.should include(:VERSION)
    end

    it "should have a version file" do
      version_file = File.join(REDMINE_RUBY_ROOT, 'VERSION')
      expect( File.exists?(version_file) ).to eq(true)
    end

    it "should have a version file with just one line and no newline" do
      version_file = File.join(REDMINE_RUBY_ROOT, 'VERSION')
      version_file_data = File.read(version_file)
      lines = version_file_data.split('\n')
      
      expect(lines.count).to eq(1)
      expect(version_file_data.index("\n")).to be_nil
      
    end

    it "the VERSION constant should always equal the contents of the VERSION file" do
      version_file_version = File.read(File.join(REDMINE_RUBY_ROOT, 'VERSION'))
      expect(Redmine::VERSION).to eq(version_file_version)
    end

  end


  context "resources" do

    

  end


end