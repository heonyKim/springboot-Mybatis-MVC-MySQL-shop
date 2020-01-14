package com.example.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shop.model.Product;
import com.example.shop.model.Sale;
import com.example.shop.repository.SaleRepository;

@Service
public class SaleSvc {

	@Autowired
	private SaleRepository saleRep;
	
	public List<Sale> saleList() {
		return saleRep.findAll();
	}
	
	public List<Product> saleLoadProduct(String Num, String today) {
		return saleRep.findByProduct(Num, today);
	}
	
	public int saleInsert(Sale sale) {
		return saleRep.save(sale);
	}
	
	public int saleUpdate(Sale sale) {
		return saleRep.update(sale);
	}
}