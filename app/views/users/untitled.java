public static boolean unique(String s) {
	HashSet<Character> seen = new HashSet<Character>();
	for (int i = 0; i < s.length(); i++) {
		char c = s.charAt(i);
		if (seen.contains(c)) {
			return false;
		} else {
			seen.add(c);
		}
	}
	return true;
}

public static boolean perm(String s1, String s2) {
	int strlen1 = s1.length();
	int strlen2 = s2.length();
	if (strlen1 != strlen2) {
		return false;
	}
	HashMap<Character, Integer> set = new HashSet<Character, Integer>();
	for (int i = 0; i < strlen1; i++) {
		char c = s1.charAt(i);
		if (set.containsKey(c)) {
			set.put(c, set.get(c) + 1);
		} else {
			set.put(c, 1);
		}
	}
	for (int j = 0; j < strlen2; j++) {
		char c = s2.charAt(j);
		if (!set.containsKey(c)) {
			return false;
		} else if (set.get(c) == 1) {
			set.remove(c);
		} else {
			set.put(c, set.get(c) - 1);
		}
	}
	return true;
}

public static boolean rotation(String s1, String s2) {
	return s2.isSubstring(s1 + s1);
}