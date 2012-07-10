require 'spec_helper'

describe "Static pages" do
  
  subject{ page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading)     { 'Inside Sales Consulting' }
    let(:page_title)  { '' }
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Events page" do
    before { visit events_path }
    let(:heading)     { 'Our Events' }
    let(:page_title)  { 'Events' } 
    it_should_behave_like "all static pages"
  end
  
  describe "Services page" do
    before { visit services_path }
    let(:heading)     { 'Our Services' }
    let(:page_title)  { 'Services' } 
    it_should_behave_like "all static pages"
  end

  describe "Apps page" do
    before { visit apps_path }
    let(:heading)     { 'Our Apps' }
    let(:page_title)  { 'Apps' } 
    it_should_behave_like "all static pages"
  end
  
  describe "Contact page" do
    before { visit contact_path }
    let(:heading)     { 'Contact Us' }
    let(:page_title)  { 'Contact Us' } 
    it_should_behave_like "all static pages"
  end
  
  describe "About Us" do
    before { visit about_path }
    let(:heading)     { 'About Us' }
    let(:page_title)  { 'About Us' } 
    it_should_behave_like "all static pages"
  end
  
  
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "Our Events"
    page.should have_selector 'title', text: full_title('Our Events')
    click_link "Our Services"
    page.should have_selector 'title', text: full_title('Our Services')
    click_link "Our Apps"
    page.should have_selector 'title', text: full_title('Our Apps')
    click_link "Contact Us"
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link "Blog"
    page.should have_selector 'title', text: full_title('Blog')
    click_link "About Us"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "sales4startups"
    page.should have_selector 'title', text: full_title('')
  end
end
