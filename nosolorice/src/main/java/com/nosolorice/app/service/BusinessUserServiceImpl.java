package com.nosolorice.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nosolorice.app.dao.BusinessUserDao;
import com.nosolorice.app.domain.businessUser.BusinessUser;

@Service("businessUserService")
public class BusinessUserServiceImpl implements BusinessUserService {

    private final BusinessUserDao businessUserDao;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public BusinessUserServiceImpl(BusinessUserDao businessUserDao, PasswordEncoder passwordEncoder) {
        this.businessUserDao = businessUserDao;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public boolean overlapBusinessIdCheck(String businessId) {
        return businessUserDao.overlapBusinessIdCheck(businessId);
    }

    @Override
    public void addBusinessUser(BusinessUser businessUser) {
        String encodedPassword = passwordEncoder.encode(businessUser.getPass());
        businessUser.setPass(encodedPassword);

        businessUserDao.addBusinessUser(businessUser);
    }
}
