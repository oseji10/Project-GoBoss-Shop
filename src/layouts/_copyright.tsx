import cn from 'classnames';
import { useTranslation } from 'next-i18next';

export default function Copyright({ className }: { className?: string }) {
  const currentYear = new Date().getFullYear();
  const { t } = useTranslation('common');
  return (
    <div className={cn('tracking-[0.2px]', className)}>
      &copy; {t('text-copy-right')} {currentYear}. {' '}
      <a
        href="https://goboss.com.ng"
        target="_blank"
        rel="noopener noreferrer"
        className="hover:text-brand-dark"
      >
        GoBoss e-Commerce Platform. Key partner for CBN eNaira
      </a>
      .
    </div>
  );
}
