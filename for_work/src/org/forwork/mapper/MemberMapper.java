package org.forwork.mapper;

import org.forwork.domain.Member;

public interface MemberMapper {
	int insertMember(Member member);
	Member readMember(Member member);

}
