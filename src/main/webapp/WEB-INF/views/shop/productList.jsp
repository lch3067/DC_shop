<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/setting.jsp"%>




<script type="text/javascript">
	function openCheckout(targetUrl) {
		
		const f = document.createElement('form');
		f.method = 'POST';
		f.action = '/ad_shop_detailAction.pd';
		
		let pd_id 			= document.getElementById("pd_id").value;
		let pd_name 		= document.getElementById("pd_name").value;
		let pd_price        = document.getElementById('pd_price').value;
		let pd_stock        = document.getElementById('pd_stock').value;
		let pd_brand        = document.getElementById('pd_brand').value;
		let pd_image_url    = document.getElementById('pd_image_url').value;
		let pd_shipping_fee = document.getElementById('pd_shipping_fee').value;
		let pd_discount_rate= document.getElementById('pd_discount_rate').value;
		let pd_status       = document.getElementById('pd_status').value;
		let pd_option       = document.getElementById('pd_option').value;
		let review_count    = document.getElementById('review_count').value;
		let review_score    = document.getElementById('review_score').value;

		console.log(pd_id + pd_name + pd_price + pd_stock + pd_brand + pd_image_url + pd_shipping_fee 
				+ pd_discount_rate + pd_status + pd_option + review_count + review_score);
		
		addHidden(f, 'pdId', pd_id);
	    addHidden(f, 'pdName', pd_name);
	    addHidden(f, 'pdPrice', pd_price);
	    addHidden(f, 'pdStock', pd_stock);
	    addHidden(f, 'pdBrand', pd_brand);
	    addHidden(f, 'pdImageUrl', pd_image_url);
	    addHidden(f, 'pdShippingFee', pd_shipping_fee);
	    addHidden(f, 'pdDiscountRate', pd_discount_rate);
	    addHidden(f, 'pdStatus', pd_status);
	    addHidden(f, 'pdOption', pd_option);
	    addHidden(f, 'reviewCount', review_count);
	    addHidden(f, 'reviewScore', review_score);
	    
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function addHidden(form, name, value){
  	  const i = document.createElement('input');
  	  i.type = 'hidden';
  	  i.name = name;
  	  i.value = value;
  	  form.appendChild(i);
  	}
</script>


<c:choose>
	<c:when test="${empty list}">
		<div
			class="w-full flex flex-col items-center justify-center py-16 bg-white rounded-xl border border-gray-200 text-center">
			<i class="ri-search-line text-3xl text-gray-400 mb-3"></i>
			<p class="text-gray-800 font-medium mb-1">상품이 없습니다.</p>
			<c:if test="${not empty keyword}">
				<p class="text-sm text-gray-500">
					검색어 "<span class="font-semibold">${keyword}</span>"에 해당하는 상품이 없습니다.
				</p>
			</c:if>
		</div>
	</c:when>

	<c:otherwise>
		<div
			class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6">
			<c:forEach var="dto" items="${list}">
				<div
					class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-md transition-shadow">

					<a href="#" onclick="return openCheckout()" style="text-decoration: none">
						
						<div class="aspect-square bg-gray-100 relative overflow-hidden">
							<img
								src="https://readdy.ai/api/search-image?query=Rachael%20Ray%20Nutrish%20natural%20dry%20dog%20food%20bag%20with%20wholesome%20ingredients%2C%20clean%20white%20background%2C%20professional%20product%20photography%2C%20premium%20pet%20nutrition&width=300&height=300&seq=2&orientation=squarish"
								alt="Rachael Ray Nutrish"
								class="w-full h-full object-cover object-top" />
						</div>
						<div class="p-4">
							<div class="text-sm text-gray-600 mb-1"></div>
							<h3 class="font-medium text-gray-900 mb-2">${dto.pd_name}</h3>
							<div class="text-lg font-bold text-gray-900 mb-2">${dto.pd_price}</div>
							<div class="flex items-center">
								<div class="flex items-center text-yellow-400 mr-2"
									aria-label="별점 ${dto.review_score}점">
									<c:forEach begin="1" end="${dto.review_score}">
										<i class="ri-star-fill text-sm"></i>
									</c:forEach>
									<c:forEach begin="1" end="${5 - dto.review_score}">
										<i class="ri-star-line text-sm"></i>
									</c:forEach>
								</div>
								<span class="text-sm text-gray-600">${dto.review_count}</span>
							</div>
						</div>
							<input type="hidden" id="pd_id"     value="${dto.pd_id}">
							<input type="hidden" id="pd_name"          value="${fn:escapeXml(dto.pd_name)}">
							<input type="hidden" id="pd_description"   value="${fn:escapeXml(dto.pd_description)}">
							<input type="hidden" id="pd_price"         value="${dto.pd_price}">
							<input type="hidden" id="pd_stock"         value="${dto.pd_stock}">
							<input type="hidden" id="pd_pet_category"  value="${dto.pd_pet_category}">
							<input type="hidden" id="pd_category"      value="${dto.pd_category}">
							<input type="hidden" id="pd_subcategory"   value="${dto.pd_subcategory}">
							<input type="hidden" id="pd_created"       value="${dto.pd_created}">
							<input type="hidden" id="pd_updated"       value="${dto.pd_updated}">
							<input type="hidden" id="pd_brand"         value="${fn:escapeXml(dto.pd_brand)}">
							<input type="hidden" id="pd_image_url"     value="${fn:escapeXml(dto.pd_image_url)}">
							<input type="hidden" id="pd_shipping_fee"  value="${dto.pd_shipping_fee}">
							<input type="hidden" id="pd_discount_rate" value="${dto.pd_discount_rate}">
							<input type="hidden" id="pd_status"        value="${fn:escapeXml(dto.pd_status)}">
							<input type="hidden" id="pd_option"        value="${fn:escapeXml(dto.pd_option)}">
							<input type="hidden" id="review_count"     value="${dto.review_count}">
							<input type="hidden" id="review_score"     value="${dto.review_score}">
							<input type="hidden" id="sortOrder"        value="${dto.sortOrder}">
					</a>
				</div>
			</c:forEach>
		</div>
	</c:otherwise>
</c:choose>