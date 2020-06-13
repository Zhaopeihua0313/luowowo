package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter@Getter
public class ThemeCatalog extends BaseDomain {
    private Long id;

    private String name;

    private List<Theme> theme = new ArrayList<>();
}