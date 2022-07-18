function subscriptionCancelValidate(){

    if(!confirm("정말 구독 취소를 하시겠습니까?")){
        return false;
    }
    return true;
}