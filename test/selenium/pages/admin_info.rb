#coding: utf-8

module QuickEdit
  module Test
    module Pages
      class AdminInfoPage < Page
        def initialize(driver, base_url, project)
          super(driver, base_url, project)

          find_element :css, "body[class~='controller-admin'][class~='action-info']"
        end

        def self.open(driver, base_url, project)
          driver.get "#{base_url}/admin/info"
          AdminInfoPage.new driver, base_url, project
        end

        def redmine_version
          strong_elements = find_elements(:css, "strong")
          ver_elements = strong_elements.select do |element|
            /Redmine (\d+\.\d+\.\d+)/ =~ element.text
          end

          /Redmine (\d+\.\d+\.\d+)/ =~ ver_elements.first.text
          version = Regexp.last_match(1)
          version
        end
      end
    end
  end
end

