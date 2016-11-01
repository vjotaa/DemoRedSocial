# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  username               :string(255)      default(""), not null
#  name                   :string(255)
#  last_name              :string(255)
#  bio                    :text(65535)
#  uid                    :string(255)
#  provider               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  cover_file_name        :string(255)
#  cover_content_type     :string(255)
#  cover_file_size        :integer
#  cover_updated_at       :datetime
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do

	it {should validate_presence_of :username}
	it {should validate_uniqueness_of :username}
	it {should validate_length_of(:username).is_at_least(6).is_at_most(12)}
	
	describe "#validate_username_regex" do
		let(:user){FactoryGirl.build(:user)}
		it "should not allow username with numbers at the beginning" do
			expect(user.valid?).to be_falsy
		end

		it "should not allow username with numbers at the beginning" do
			user.username = "7robot"
			expect(user.valid?).to be_falsy
		end

		it "should not contain special characters" do
			user.username = "robot*"
			expect(user.valid?).to be_falsy
		end
	end

end
