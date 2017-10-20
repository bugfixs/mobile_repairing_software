class CustomerDetail < ApplicationRecord
	validates :customer_name, presence: true
	validates :customer_no, presence: true
	validates :mobile_no, presence: true
	validates :serial_no, presence: true
	validates :repair_received, presence: true
	validates :repair_completed, presence: true
	validates :b2b_svc, presence: true
	validates :condition_code, presence: true
	validates :symptom_code, presence: true
	validates :defect_code, presence: true
	validates :repair_code, presence: true
end
