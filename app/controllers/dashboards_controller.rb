require 'create_section_report'
class DashboardsController < ApplicationController
  def show
    @dashboard = find_dashboard
    @sections = hash_of_sections
  end

  private

  def hash_of_sections
    sections_hash = Hash.new()
    @dashboard.sections.each{|section| sections_hash[section.name] = CreateSectionReport.new(@dashboard.line, section.query).create_section_report}
    sections_hash
  end

  def find_dashboard
    Dashboard.find(dashboard_params[:id])
  end

  def dashboard_params
    params.permit(:id)
  end
end
