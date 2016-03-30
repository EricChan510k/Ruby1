# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.all.each{|c| c.destroy} # FLUSH

puts ">>>>>>>>>>> Create categories"
pd = Category.find_or_create_by_name(:name=>"Product")
pd.update_attributes(:description=>"Start a Product", :kind=>0, :sort_id=>0)
puts "create product categories"

Category.find_or_create_by_name(:name=>"Accessories").update_attributes(:description=>"Accessories", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Accessories: Office").update_attributes(:description=>"Accessories: Office", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Accessories: Outdoor").update_attributes(:description=>"Accessories: Outdoor", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Bath: Accessories and Hardware").update_attributes(:description=>"Bath: Accessories and Hardware", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Bath: Cabinetry").update_attributes(:description=>"Bath: Cabinetry", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Bath: Fittings (faucets etc.)").update_attributes(:description=>"Bath: Fittings (faucets etc.)", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Bath: Fixtures (sinks, tubs, etc.)").update_attributes(:description=>"Bath: Fixtures (sinks, tubs, etc.)", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Architectural Products").update_attributes(:description=>"Architectural Products", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Carpet/Broadloom").update_attributes(:description=>"Flooring: Carpet/Broadloom", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Carpet/Modular").update_attributes(:description=>"Flooring: Carpet/Modular", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Carpet/Rugs").update_attributes(:description=>"Flooring: Carpet/Rugs", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Hard").update_attributes(:description=>"Flooring: Hard", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Healthcare").update_attributes(:description=>"Flooring: Healthcare", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Hospitality").update_attributes(:description=>"Flooring: Hospitality", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Flooring: Tile and Stone").update_attributes(:description=>"Flooring: Tile and Stone", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Constract/Case Goods").update_attributes(:description=>"Furniture: Contract/Case Goods", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Contract/Desking").update_attributes(:description=>"Furniture: Contract/Desking", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Contract/Systems").update_attributes(:description=>"Furniture: Contract/Systems", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Contract/Tables").update_attributes(:description=>"Furniture: Contract/Tables", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Education").update_attributes(:description=>"Furniture: Education", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Healthcare/Furniture and Seating").update_attributes(:description=>"Furniture: Healthcare/Furniture and Seating", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Outdoor/Lounge").update_attributes(:description=>"Furniture: Outdoor/Lounge", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Outdoor/Seating & Tables").update_attributes(:description=>"Furniture: Outdoor/Seating & Tables", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Partitions and Wall System").update_attributes(:description=>"Furniture: Partitions and Wall System", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Residential/Storage").update_attributes(:description=>"Furniture: Residential/Storage", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Residential/Dining Tables").update_attributes(:description=>"Furniture: Residential/Dining Tables", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Residential/Occasional Tables").update_attributes(:description=>"Furniture: Residential/Occasional Tables", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Furniture: Youth").update_attributes(:description=>"Furniture: Youth", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Green Innovation").update_attributes(:description=>"Green Innovation", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Hardware").update_attributes(:description=>"Hardware", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Kitchen: Appliances").update_attributes(:description=>"Kitchen: Appliances", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Kitchen: Cabinetry").update_attributes(:description=>"Kitchen: Cabinetry", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Kitchen: Fittings").update_attributes(:description=>"Kitchen: Fittings", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Kitchen: Fixtures").update_attributes(:description=>"Kitchen: Fixtures", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Lighting: Chandelier (multiple bulb)").update_attributes(:description=>"Lighting: Chandelier (multiple bulb)", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Lighting: Architectural").update_attributes(:description=>"Lighting: Architectural", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Lighting: Pendant (single bulb)").update_attributes(:description=>"Lighting: Pendant (single bulb)", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Lighting: Floor and Sconce").update_attributes(:description=>"Lighting: Floor and Sconce", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Lighting: Table").update_attributes(:description=>"Lighting: Table", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Materials and Surfaces (including paneling)").update_attributes(:description=>"Materials and Surfaces (including paneling)", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Contract/Conference").update_attributes(:description=>"Seating: Contract/Conference", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Contract/Guest").update_attributes(:description=>"Seating: Contract/Guest", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Contract/Lounge").update_attributes(:description=>"Seating: Contract/Lounge", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Contract/Task").update_attributes(:description=>"Seating: Contract/Task", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Residential/Accent").update_attributes(:description=>"Seating: Residential/Accent", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Residential/Lounge").update_attributes(:description=>"Seating: Residential/Lounge", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Seating: Residential/Sofa").update_attributes(:description=>"Seating: Residential/Sofa", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Technology").update_attributes(:description=>"Technology", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Textiles: Contract").update_attributes(:description=>"Textiles: Contract", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Textiles: Healthcare").update_attributes(:description=>"Textiles: Healthcare", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Textiles: Hospitality").update_attributes(:description=>"Textiles: Hospitality", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Textiles: Outdoor").update_attributes(:description=>"Textiles: Outdoor", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Textiles: Residential").update_attributes(:description=>"Textiles: Residential", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Wallcovering: Contract").update_attributes(:description=>"Wallcovering: Contract", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Wallcovering: Fabric").update_attributes(:description=>"Wallcovering: Fabric", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Wallcovering: Treatments (including Tile and Stone)").update_attributes(:description=>"Wallcovering: Treatments (including Tile and Stone)", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Wallcovering: Paper").update_attributes(:description=>"Wallcovering: Paper", :parent_id=>pd.id, :kind=>0, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Window Treatments").update_attributes(:description=>"Window Treatments", :parent_id=>pd.id, :kind=>0, :sort_id=>1)

pj = Category.find_or_create_by_name(:name=>"Project")
pj.update_attributes(:description=>"Project Type", :kind=>1, :sort_id=>1)
puts "create project categories"
Category.find_or_create_by_name(:name=>"Beauty/Spa/Fitness").update_attributes(:description=>"Beauty/Spa/Fitness",                                :parent_id=>pj.id, :kind=>1, :sort_id=>1)
Category.find_or_create_by_name(:name=>"Budget").update_attributes(:description=>"Budget",                                                        :parent_id=>pj.id, :kind=>1, :sort_id=>2)
Category.find_or_create_by_name(:name=>"Eco").update_attributes(:description=>"Eco",                                                              :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Education").update_attributes(:description=>"Education",                                                  :parent_id=>pj.id, :kind=>1, :sort_id=>4)
Category.find_or_create_by_name(:name=>"Exhibit/Installation").update_attributes(:description=>"Exhibit/Installation",                            :parent_id=>pj.id, :kind=>1, :sort_id=>5)
Category.find_or_create_by_name(:name=>"Healthcare").update_attributes(:description=>"Healthcare",                                                :parent_id=>pj.id, :kind=>1, :sort_id=>6)
Category.find_or_create_by_name(:name=>"Hospitality: Hotel").update_attributes(:description=>"Hospitality: Hotel", :parent_id=>pj.id, :kind=>1, :sort_id=>7)
Category.find_or_create_by_name(:name=>"Hospitality: Restaurant, Lounge, Bar").update_attributes(:description=>"Hospitality: Restaurant, Lounge, Bar", :parent_id=>pj.id, :kind=>1, :sort_id=>8)
Category.find_or_create_by_name(:name=>"Institutional (cultural, government, religious)").update_attributes(:description=>"Institutional (cultural, government, religious)", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Kitchen & Bath").update_attributes(:description=>"Kitchen & Bath", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Office: Large /> 50,000 SQ FT").update_attributes(:description=>"Office: Large /> 50,000 SQ FT", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Office: Mid-Size / 10-50,000 SQ FT").update_attributes(:description=>"Office: Mid-Size / 10-50,000 SQ FT", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Office: small /< 10,000 SQ FT").update_attributes(:description=>"Office: Small /< 10,000 SQ FT", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Public Spaces / Outdoor").update_attributes(:description=>"Public Spaces / Outdoor", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Residence: Apartment/Loft/Multi-Unit Dwelling").update_attributes(:description=>"Residence: Apartment/Loft/Multi-Unit Dwelling", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Residence: House/Townhouse").update_attributes(:description=>"Residence: House/Townhouse", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Retail").update_attributes(:description=>"Retail", :parent_id=>pj.id, :kind=>1, :sort_id=>3)
Category.find_or_create_by_name(:name=>"Showroom").update_attributes(:description=>"Showroom", :parent_id=>pj.id, :kind=>1, :sort_id=>3)

Option.find_or_create_by_option_name(:option_name=>"project_submission_agreement").update_attributes(:option_value=>"
        <p>Submit your project in the Best of Year 2013 competition.</p>
        <p>First some fine print (please read):</p>
        <ul>
         <li>Work must have been completed between September 2012 and August 2013.</li>
         <li>Due to the comprehensive nature of this competition, we will accept work that has been published previously and/or was part of another competition.</li>
         <li>There is no limit to the number of projects that may be entered to the competition.</li>
         <li>Please note: submissions may be reassigned to a different project category at the editors' discretion.</li>
         <li>Fees: $300 per entry/category for the first 4 entries. All additional entries are discounted at $250 per entry/category. (Each category is considered an entry &ndash; e.g. one project entered into two categories is $300 x 2 = $600.) You must submit all entries at the same time for the discount to apply.</li>
         <li>Best of Year: Project Design winners will be chosen by Editor in Chief Cindy Allen and a jury of design leaders and featured in the December issue of Interior Design.</li>
         <li>Finalists will be posted on this site in November.</li>
         <li>Winners will be announced live December 5, 2013, during a ceremony and celebration in New York City.</li>
        </ul>
        <p>Questions? Contact us at <a href=\"mailto:boyawards@interiordesign.net\">boyawards@interiordesign.net</a>.</p>")
Option.find_or_create_by_option_name(:option_name=>"product_submission_agreement").update_attributes(:option_value=>"
        <p>Submit your product in the Best of Year 2013 competition.</p>
        <p>First some fine print (please read):</p>
        <ul>
         <li>Products must have been manufactured and introduced to the market between September 2012 and August 2013.</li>
         <li>Due to the comprehensive nature of this competition, we *do* accept products that have been awarded and/or are part of another competition.</li>
         <li>There is no limit to the number of projects that may be entered to the competition.</li>
         <li>Please note: product categories may be renamed, consolidated, or eliminated and products may be reassigned at the editors' discretion.</li>
         <li>Fees: $300 per entry/category for the first 4 entries. All additional entries are discounted at $250 per entry/category. (Each category is considered an entry &ndash; e.g. one project entered into two categories is $300 x 2 = $600.) You must submit all entries at the same time for the discount to apply.</li>
         <li>Best of Year Product Design finalists will be selected by interior designers and architects via an online vote in September.</li>
         <li>Finalists will be posted on this site in November.</li>
         <li>Winners will be chosen by Editor in Chief Cindy Allen and a jury of design leaders, and announced live December 5, 2013 during a celebration in New York City. Winners will be featured in the December issue of Interior Design.</li>
        </ul>
        <p>Questions? Contact us at <a href=\"mailto:boyawards@interiordesign.net\">boyawards@interiordesign.net</a>.</p>")

Option.find_or_create_by_option_name(:option_name=>"twitter_link_url").update_attributes(:option_value=>"https://twitter.com/interior_design")
Option.find_or_create_by_option_name(:option_name=>"facebook_link_url").update_attributes(:option_value=>"http://www.facebook.com/InteriorDesignMagazine")
Option.find_or_create_by_option_name(:option_name=>"linkedin_link_url").update_attributes(:option_value=>"http://www.linkedin.com/company/interior-design-magazine")
Option.find_or_create_by_option_name(:option_name=>"tumblur_link_url").update_attributes(:option_value=>"http://interiordesignmagazine.tumblr.com/")
Option.find_or_create_by_option_name(:option_name=>"newsleter_link_url").update_attributes(:option_value=>"http://go.email.interiordesign.net/l/j/pgi/i/_/_/tgi/signup.htm")
